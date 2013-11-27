package require PWI_Glyph 2.17.1

pw::Script loadTk

# Name and hide this stupid window.
wm title . "stupid window"
set img [image create photo rageFace -file [file join [file dirname [info script]] "RageFaceBlack.gif"]]
label .l -image $img
pack .l
# Uncomment this to hide the stupid window.
#wm iconify .

# Do not show hidden directories.
catch {tk_getSaveFile foo bar}
set ::tk::dialog::file::showHiddenVar 0
set ::tk::dialog::file::showHiddenBtn 1

set fileName [tk_getSaveFile -title "Enter facet file name." -defaultextension ".facet"]

if { $fileName == "" } {
  puts ""
  puts "You must provide a file name to continue"
  puts ""
  exit
}

# Check for extension, add one if necessary.
#if { [file extension $fileName] == "" } {
#  append fileName ".facet"
#}

# Get facet file directory name.
set baseName [file dirname $fileName]

# Derive geometry.params file location.
set geomFile [append baseName "/geometry.params"]

# TODO: check if this works, die cleanly if it doesn't.
set retValue [source [file join [file dirname [info script]] "/home/ehereth/Grid/dev/Glyph/GridCoordEnum/pwio.glf"]]

set facetFp [open $fileName w]
set geomFp [open $geomFile w]

puts $facetFp "FACET FILE V3.0  Boundary data in Xpatch format from Pointwise via Glyph script BlockToFacet.glf"

puts $facetFp "1\nGrid\n0, 0.00, 0.00, 0.00, 0.00"

puts "Beginning blockToFacet script..."
puts "Writing facet file: $fileName"
puts "Writing geometry file: $geomFile"

# Create a block selection mask.
set mask [pw::Display createSelectionMask -requireBlock {}];

# Create a block selection dialog.
if { [pw::Display selectEntities \
       -selectionmask $mask \
       -description "Select block(s) to export." \
     selected] } {

  puts "Selected $selected(Blocks) for export."

  set nTri 0
  set nQuad 0

  # NOTE: this is ALL boundary conditions in the Pointwise project; we will
  # determine which ones we actually need below.
  set bcNames [pw::BoundaryCondition getNames]
  set nBcs 0

  set domToBC [dict create]

  list geomParams

  # Loop over boundary conditions and determine which ones to export.
  foreach bcName $bcNames {
    set bc [pw::BoundaryCondition getByName $bcName]
    set bcId [$bc getId]
    set nRegs [$bc getRegisterCount]
    set regs [$bc getRegisters]

    # Loop over registers to determine BC to block associations.
    for {set iReg 0} {$iReg < $nRegs} {incr iReg} {
      set l [lindex $regs $iReg]

      # Search for occurrence of boundary condition in selected blocks.
      if { [lsearch $selected(Blocks) [lindex $l 0]] != -1 } {

        # Check for more than one connection type boundary condition, this is
        # currently unsupported and connection boundary conditions in excess of
        # one will be skipped completely.
        if { $bcId == 2147483647 && $bcName == "Unspecified" } {
          #puts "Here's a connection... ($iReg)\nbcId = $bcId, bcName = $bcName, register = $l"
          if { $nRegs != 1 } {
            puts ""
            puts "WARNING: more than one connection boundary condition NOT SUPPORTED"
            puts "         if this error does not make sense contact Ethan Hereth:"
            puts "         SimCenter room 205 or ethan-hereth@utc.edu or 423.425.5431"
            puts ""
            break
          }
        }

        incr nBcs

        # Since we are counting required boundary conditions as we go, save off
        # the following string to a list to be written to file later.
        lappend geomParams [format "%10d %10d %11d %11s %-s" $bcId 0 1 "1e-6" $bcName]
        set ents [$bc getEntities]

        foreach dom $ents {
          set dim [$dom getDimensions]
          if { [lindex $dim 1] == 1 } {
            # This is an unstructured domain.
            set nTri [expr {$nTri + [$dom getCellCount]}]
          } else {
            # This is a structured domain.
            set nQuad [expr {$nQuad + [$dom getCellCount]}]
          }

          dict append domToBC $dom $bcId
          lappend doms $dom
        }
        break
      }
    }
  }

  # Write geometry.params parameter file.
  puts $geomFp "Number of boundaries\n$nBcs"
  puts $geomFp "Boundary #   Layers     g_space     n_space             boundary name"
  puts $geomFp "---------- ---------- ----------- ----------- ---------------------------------"

  for {set iBc 0} {$iBc < $nBcs} {incr iBc} {
    puts $geomFp [lindex $geomParams $iBc]
  }
  close $geomFp

  # Begin the export process.
  pwio::beginIO $doms

  set coordCount [pwio::getCoordCount]

  # Write out number of nodes.
  puts $facetFp $coordCount

  # Write out coordinates.
  for {set iCoord 1} {$iCoord <= $coordCount} {incr iCoord} {
    set coord [pwio::getCoord $iCoord]
    set xyz [pw::Grid getXYZ $coord]

    puts $facetFp [format "%.15e% .15e %.15e" [lindex $xyz 0] [lindex $xyz 1] [lindex $xyz 2]]
  }

  # Write out number of 'blocks'.
  if { $nTri && $nQuad } {
    puts $facetFp "2"
  } else {
    puts $facetFp "1"
  }

  set nCell 0

  # Write out triangle block if there are triangles.
  if { $nTri } {
    puts $facetFp "Triangles\n$nTri 3"

    foreach dom $doms {

      # Check if this is a structured domain and skip it if it is.
      if { [lindex [$dom getDimensions] 1] != 1 } {
        continue
      }

      set cellCount [$dom getCellCount]

      for {set iCell 1} {$iCell <= $cellCount} {incr iCell} {
        incr nCell
        set cell [pwio::getEntityCell $dom $iCell]
        puts $facetFp [format "   %8d %8d %8d 0 %4d %d" [lindex $cell 0] [lindex $cell 1] [lindex $cell 2] [dict get $domToBC $dom] $nCell]
      }
    }
  }

  # Write out quadrilateral block if there are quadrilaterals.
  if { $nQuad } {
    puts $facetFp "Quadrilaterals\n$nQuad 4"

    foreach dom $doms {

      # Check if this is an unstructured domain and skip it if it is.
      if { [lindex [$dom getDimensions] 1] == 1 } {
        continue
      }

      set cellCount [$dom getCellCount]

      for {set iCell 1} {$iCell <= $cellCount} {incr iCell} {
        incr nCell
        set cell [pwio::getEntityCell $dom $iCell]
        puts $facetFp [format "   %8d %8d %8d %8d 0 %4d %d" [lindex $cell 0] [lindex $cell 1] [lindex $cell 2] [lindex $cell 3] [dict get $domToBC $dom] $nCell]
      }
    }
  }
} else {
  puts "ERROR: You must select at least one block."
}

close $facetFp

puts "Bye bye..."

# Kill the stupid little window that pops up with the file selector dialog for
# some reason.
destroy .

pwio::endIO
