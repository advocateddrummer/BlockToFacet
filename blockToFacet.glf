# BlockToFacet.glf
# Author: Ethan Alan Hereth
# Contact: ethan-hereth@utc.edu

package require PWI_Glyph 2.17.1

pw::Script loadTk

proc stupidWindowImage {} {
  set logoData "
  R0lGODlhuQDQAPf/AAAAAAEBAQICAgMDAwQEBAUFBQYGBgcHBwgICAkJCQoKCgsLCwwMDA0NDQ4O
  Dg8PDxAQEBERERISEhMTExQUFBUVFRYWFhcXFxgYGBkZGRoaGhsbGxwcHB0dHR4eHh8fHyAgICEh
  ISIiIiMjIyQkJCUlJSYmJicnJygoKCkpKSoqKisrKywsLC0tLS4uLi8vLzAwMDExMTIyMjMzMzQ0
  NDU1NTY2Njc3Nzg4ODk5OTo6Ojs7Ozw8PD09PT4+Pj8/P0BAQEFBQUJCQkNDQ0REREVFRUZGRkdH
  R0hISElJSUpKSktLS0xMTE1NTU5OTk9PT1BQUFFRUVJSUlNTU1RUVFVVVVZWVldXV1hYWFlZWVpa
  WltbW1xcXF1dXV5eXl9fX2BgYGFhYWJiYmNjY2RkZGVlZWZmZmdnZ2hoaGlpaWpqamtra2xsbG1t
  bW5ubm9vb3BwcHFxcXJycnNzc3R0dHV1dXZ2dnd3d3h4eHl5eXp6ent7e3x8fH19fX5+fn9/f4CA
  gIGBgYKCgoODg4SEhIWFhYaGhoeHh4iIiImJiYqKiouLi4yMjI2NjY6Ojo+Pj5CQkJGRkZKSkpOT
  k5SUlJWVlZaWlpeXl5iYmJmZmZqampubm5ycnJ2dnZ6enp+fn6CgoKGhoaKioqOjo6SkpKWlpaam
  pqenp6ioqKmpqaqqqqurq6ysrK2tra6urq+vr7CwsLGxsbKysrOzs7S0tLW1tba2tre3t7i4uLm5
  ubq6uru7u7y8vL29vb6+vr+/v8DAwMHBwcLCwsPDw8TExMXFxcbGxsfHx8jIyMnJycrKysvLy8zM
  zM3Nzc7Ozs/Pz9DQ0NHR0dLS0tPT09TU1NXV1dbW1tfX19jY2NnZ2dra2tvb29zc3N3d3d7e3t/f
  3+Dg4OHh4eLi4uPj4+Tk5OXl5ebm5ufn5+jo6Onp6erq6uvr6+zs7O3t7e7u7u/v7/Dw8PHx8fLy
  8vPz8/T09PX19fb29vf39/j4+Pn5+fr6+vv7+/z8/P39/f7+/v///yH5BAAAAAAAIf8LSUNDUkdC
  RzEwMTL/AAAMSExpbm8CEAAAbW50clJHQiBYWVogB84AAgAJAAYAMQAAYWNzcE1TRlQAAAAASUVD
  IHNSR0IAAAAAAAAAAAAAAAEAAPbWAAEAAAAA0y1IUCAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
  AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAARY3BydAAAAVAAAAAzZGVzYwAAAYQAAABsd3RwdAAAAfAA
  AAAUYmtwdAAAAgQAAAAUclhZWgAAAhgAAAAUZ1hZWgAAAiwAAAAUYlhZWgAAAkAAAAAUZG1uZAAA
  AlQAAABwZG1kZAAAAsQAAACIdnVlZAAAA0wAAACGdmll/3cAAAPUAAAAJGx1bWkAAAP4AAAAFG1l
  YXMAAAQMAAAAJHRlY2gAAAQwAAAADHJUUkMAAAQ8AAAIDGdUUkMAAAQ8AAAIDGJUUkMAAAQ8AAAI
  DHRleHQAAAAAQ29weXJpZ2h0IChjKSAxOTk4IEhld2xldHQtUGFja2FyZCBDb21wYW55AABkZXNj
  AAAAAAAAABJzUkdCIElFQzYxOTY2LTIuMQAAAAAAAAAAAAAAEnNSR0IgSUVDNjE5NjYtMi4xAAAA
  AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABYWVogAAAAAAAA
  81EAAf8AAAABFsxYWVogAAAAAAAAAAAAAAAAAAAAAFhZWiAAAAAAAABvogAAOPUAAAOQWFlaIAAA
  AAAAAGKZAAC3hQAAGNpYWVogAAAAAAAAJKAAAA+EAAC2z2Rlc2MAAAAAAAAAFklFQyBodHRwOi8v
  d3d3LmllYy5jaAAAAAAAAAAAAAAAFklFQyBodHRwOi8vd3d3LmllYy5jaAAAAAAAAAAAAAAAAAAA
  AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABkZXNjAAAAAAAAAC5JRUMgNjE5NjYtMi4x
  IERlZmF1bHQgUkdCIGNvbG91ciBzcGFjZSAtIHNSR0L/AAAAAAAAAAAAAAAuSUVDIDYxOTY2LTIu
  MSBEZWZhdWx0IFJHQiBjb2xvdXIgc3BhY2UgLSBzUkdCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGRl
  c2MAAAAAAAAALFJlZmVyZW5jZSBWaWV3aW5nIENvbmRpdGlvbiBpbiBJRUM2MTk2Ni0yLjEAAAAA
  AAAAAAAAACxSZWZlcmVuY2UgVmlld2luZyBDb25kaXRpb24gaW4gSUVDNjE5NjYtMi4xAAAAAAAA
  AAAAAAAAAAAAAAAAAAAAAAAAAAB2aWV3AAAAAAATpP4AFF8uABDPFAAD7cwABBMLAANcngAAAAFY
  WVog/wAAAAAATAlWAFAAAABXH+dtZWFzAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAACjwAAAAJz
  aWcgAAAAAENSVCBjdXJ2AAAAAAAABAAAAAAFAAoADwAUABkAHgAjACgALQAyADcAOwBAAEUASgBP
  AFQAWQBeAGMAaABtAHIAdwB8AIEAhgCLAJAAlQCaAJ8ApACpAK4AsgC3ALwAwQDGAMsA0ADVANsA
  4ADlAOsA8AD2APsBAQEHAQ0BEwEZAR8BJQErATIBOAE+AUUBTAFSAVkBYAFnAW4BdQF8AYMBiwGS
  AZoBoQGpAbEBuQHBAckB0QHZAeEB6QHyAfoCAwIMAv8UAh0CJgIvAjgCQQJLAlQCXQJnAnECegKE
  Ao4CmAKiAqwCtgLBAssC1QLgAusC9QMAAwsDFgMhAy0DOANDA08DWgNmA3IDfgOKA5YDogOuA7oD
  xwPTA+AD7AP5BAYEEwQgBC0EOwRIBFUEYwRxBH4EjASaBKgEtgTEBNME4QTwBP4FDQUcBSsFOgVJ
  BVgFZwV3BYYFlgWmBbUFxQXVBeUF9gYGBhYGJwY3BkgGWQZqBnsGjAadBq8GwAbRBuMG9QcHBxkH
  Kwc9B08HYQd0B4YHmQesB78H0gflB/gICwgfCDIIRghaCG4IggiWCKoIvgjSCOcI+wkQCSUJOglP
  CWT/CXkJjwmkCboJzwnlCfsKEQonCj0KVApqCoEKmAquCsUK3ArzCwsLIgs5C1ELaQuAC5gLsAvI
  C+EL+QwSDCoMQwxcDHUMjgynDMAM2QzzDQ0NJg1ADVoNdA2ODakNww3eDfgOEw4uDkkOZA5/DpsO
  tg7SDu4PCQ8lD0EPXg96D5YPsw/PD+wQCRAmEEMQYRB+EJsQuRDXEPURExExEU8RbRGMEaoRyRHo
  EgcSJhJFEmQShBKjEsMS4xMDEyMTQxNjE4MTpBPFE+UUBhQnFEkUahSLFK0UzhTwFRIVNBVWFXgV
  mxW9FeAWAxYmFkkWbBaPFrIW1hb6Fx0XQRdlF4kX/64X0hf3GBsYQBhlGIoYrxjVGPoZIBlFGWsZ
  kRm3Gd0aBBoqGlEadxqeGsUa7BsUGzsbYxuKG7Ib2hwCHCocUhx7HKMczBz1HR4dRx1wHZkdwx3s
  HhYeQB5qHpQevh7pHxMfPh9pH5Qfvx/qIBUgQSBsIJggxCDwIRwhSCF1IaEhziH7IiciVSKCIq8i
  3SMKIzgjZiOUI8Ij8CQfJE0kfCSrJNolCSU4JWgllyXHJfcmJyZXJocmtyboJxgnSSd6J6sn3CgN
  KD8ocSiiKNQpBik4KWspnSnQKgIqNSpoKpsqzysCKzYraSudK9EsBSw5LG4soizXLQwtQS12Last
  4f8uFi5MLoIuty7uLyQvWi+RL8cv/jA1MGwwpDDbMRIxSjGCMbox8jIqMmMymzLUMw0zRjN/M7gz
  8TQrNGU0njTYNRM1TTWHNcI1/TY3NnI2rjbpNyQ3YDecN9c4FDhQOIw4yDkFOUI5fzm8Ofk6Njp0
  OrI67zstO2s7qjvoPCc8ZTykPOM9Ij1hPaE94D4gPmA+oD7gPyE/YT+iP+JAI0BkQKZA50EpQWpB
  rEHuQjBCckK1QvdDOkN9Q8BEA0RHRIpEzkUSRVVFmkXeRiJGZ0arRvBHNUd7R8BIBUhLSJFI10kd
  SWNJqUnwSjdKfUrESwxLU0uaS+JMKkxyTLpNAk3/Sk2TTdxOJU5uTrdPAE9JT5NP3VAnUHFQu1EG
  UVBRm1HmUjFSfFLHUxNTX1OqU/ZUQlSPVNtVKFV1VcJWD1ZcVqlW91dEV5JX4FgvWH1Yy1kaWWlZ
  uFoHWlZaplr1W0VblVvlXDVchlzWXSddeF3JXhpebF69Xw9fYV+zYAVgV2CqYPxhT2GiYfViSWKc
  YvBjQ2OXY+tkQGSUZOllPWWSZedmPWaSZuhnPWeTZ+loP2iWaOxpQ2maafFqSGqfavdrT2una/9s
  V2yvbQhtYG25bhJua27Ebx5veG/RcCtwhnDgcTpxlXHwcktypnMBc11zuHQUdHB0zHUodYV14XY+
  /3abdvh3VnezeBF4bnjMeSp5iXnnekZ6pXsEe2N7wnwhfIF84X1BfaF+AX5ifsJ/I3+Ef+WAR4Co
  gQqBa4HNgjCCkoL0g1eDuoQdhICE44VHhauGDoZyhteHO4efiASIaYjOiTOJmYn+imSKyoswi5aL
  /IxjjMqNMY2Yjf+OZo7OjzaPnpAGkG6Q1pE/kaiSEZJ6kuOTTZO2lCCUipT0lV+VyZY0lp+XCpd1
  l+CYTJi4mSSZkJn8mmia1ZtCm6+cHJyJnPedZJ3SnkCerp8dn4uf+qBpoNihR6G2oiailqMGo3aj
  5qRWpMelOKWpphqmi6b9p26n4KhSqMSpN6mpqv8cqo+rAqt1q+msXKzQrUStuK4trqGvFq+LsACw
  dbDqsWCx1rJLssKzOLOutCW0nLUTtYq2AbZ5tvC3aLfguFm40blKucK6O7q1uy67p7whvJu9Fb2P
  vgq+hL7/v3q/9cBwwOzBZ8Hjwl/C28NYw9TEUcTOxUvFyMZGxsPHQce/yD3IvMk6ybnKOMq3yzbL
  tsw1zLXNNc21zjbOts83z7jQOdC60TzRvtI/0sHTRNPG1EnUy9VO1dHWVdbY11zX4Nhk2OjZbNnx
  2nba+9uA3AXcit0Q3ZbeHN6i3ynfr+A24L3hROHM4lPi2+Nj4+vkc+T85YTmDeaW5x/nqegy6LxU
  6Ubp0Opb6uXrcOv77IbtEe2c7ijutO9A78zwWPDl8XLx//KM8xnzp/Q09ML1UPXe9m32+/eK+Bn4
  qPk4+cf6V/rn+3f8B/yY/Sn9uv5L/tz/bf//ACwAAAAAuQDQAAAI/gD/CRxIsKDBgwgTKlzIsKHD
  hxAjSpxIsaLFixgzatzIsaPHjyBDihxJsqTJkyhTqlzJsqXLlzBjypxJs6bNmyLr6awXT2e8nz11
  7huK8CfOoyXrqZPWSxUkPGSwWLEiRUqTJkmSHDmSpIkVLGLErHmDx1EoW9J0HTmEtC3HeueShcIj
  JQWFBwQA6N3Lt6/fvQQeYIAAQEo9t4gn7js3C0+TE3gDP6DgoUWNI1a+kD2kSJEjR5AgVcKEiVMl
  RXjWCMnb98S1xLAbtnNFJkWCBCmkvFGkqleybOHOqeu5T2G7wwSdYfiLJVzs5wX3XVOEI++JN7PO
  IZfYDk8KONv//ilirfeBlBEAeOgqDh12u15rlj84Uqkbe4r13uT9wr4eJgp8ncBJPbq0AAAEZDhz
  X3sw1RMOMLa4QkoomCiyBg4UQIDDH8DEk5ErDwAwQjLxXOPKFyHudYQzA11zxwkAYBDIOQy+FI8r
  50HwQAIE9LhXAkcEEoortvgmTTfDxbMgQ/uQAQABgXQjBQYp6kUAGc4VlA0eACYBTI0sqUNGlX/x
  RcBtk2HgQQo4JIHFG39Uoks27SxJ0DkzAOCBNIow1w5C+7hi4Aiq2AmmSNI0UeaTCTzgKASQQrpj
  j+T9iEENWAQySzfh/QMMYU1kU4NfKUiz0DVSAEBBJZ0e+lE2/n/A+GMKVqxRFieu6NILMMAQk8yv
  vURIISSHwPFFEjWMAEECeiXgwRF4kOJMOOq8AcADEjILWBPJNFRtYIe06qpG/hkIGA6hhCOuQ/vE
  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
  3uq13uvF3uzV3kYNCAA7"

  return [image create photo -format GIF -data $logoData]
}

puts "Beginning blockToFacet script..."

# Create a block selection mask.
set mask [pw::Display createSelectionMask -requireBlock {}];

#
# Use selected entity(ies) or prompt user for selection if nothing is selected
# at run time.
#
if { !([pw::Display getSelectedEntities -selectionmask $mask selected]) } {

  # Create a block selection dialog.
  if { !([pw::Display selectEntities \
         -selectionmask $mask \
         -description "Select block(s) to export." \
         selected]) } {

    puts "ERROR: You must select at least one block, exiting."
    exit
  }
}

set startTime [pwu::Time now]
set totalTime [pwu::Time set 0]

set blockString [expr { ([llength $selected(Blocks)] == 1) ? "block" : "blocks"}]
puts "    Selected [llength $selected(Blocks)] $blockString for export."

# NOTE: this is ALL boundary conditions in the Pointwise project; we will
# determine which ones we actually need below.
set bcNames [pw::BoundaryCondition getNames]
set nBcs 0
set nDoms 0

list geomParams

puts "Begin parsing boundary conditions."
set bcStartTime [pwu::Time now]
# Loop over boundary conditions and determine which ones to export.
foreach bcName $bcNames {
set bc [pw::BoundaryCondition getByName $bcName]
set bcId [$bc getId]
set nRegs [$bc getRegisterCount]
set regs [$bc getRegisters]

#puts "*********************************************************************"
#puts "For boundary $bcName with tag $bcId"
#puts "    the number of registers is $nRegs"
#puts "    the registers are $regs"
#puts "*********************************************************************"

# Check for unspecified boundary conditions; these will be skipped and the
# user will be warned. All boundary conditions that are to be exported MUST
# be specified. NOTE: the 'Unspecified' boundary comes up even if it is
# empty, hence the '$nRegs != 0' below to avoid printing the message
# unnecessarily.
  if { $bcName == "Unspecified" && $nRegs != 0 } {
  puts ""
  puts "*********************************************************************"
  puts "WARNING: Unspecified boundary condition(s) detected."
  puts "All Unspecified boundary conditions will be SKIPPED; these are"
  puts "likely connection boundaries and this is likely the desired behavior."
  puts "All boundaries required for exporting MUST be specified."
  puts "If this warning does not make sense, contact Ethan Hereth:"
  puts "SimCenter room 205 or ethan-hereth@utc.edu or 423.425.5431"
  puts "or Bruce Hilbert:"
  puts "SimCenter room 201 or bruce-hilbert@utc.edu or 423.425.5495"
  puts "*********************************************************************"
  puts ""
  continue
}

# Loop over registers to determine BC to block associations.
for {set iReg 0} {$iReg < $nRegs} {incr iReg} {
set l [lindex $regs $iReg]

# Search for occurrence of boundary condition in selected blocks.
  if { [lsearch $selected(Blocks) [lindex $l 0]] != -1 } {

  incr nBcs
  # Since we are counting required boundary conditions as we go, save off
  # the following string to a list to be written to file later.
  lappend geomParams [format "%10d %10d %11d %11s %-s" $bcId 0 1 "1e-6" $bcName]

  set ents [$bc getEntities]

  foreach dom $ents {
  incr nDoms

  # Create domain id to BC id map to be used while post processing the
  # facet file.
  dict set domToBC $nDoms $bcId

  lappend doms $dom
}
break
      }
    }
  }
  set bcTotalTime [pwu::Time elapsed $bcStartTime]
  puts "Parsing boundary conditions complete. ($bcTotalTime seconds)"
  puts ""

  # Check if the domains list has anything in it.
  if { ![info exists doms] } {
    puts "Error: No domains have been selected...  exiting."
    exit
  }

  # Do not time the file save dialog to make time reporting (insignificantly?)
  # more accurate.
  set totalTime [pwu::Time add $totalTime [pwu::Time elapsed $startTime]]

  # Name and hide this stupid window.
  wm title . "stupid window"
  set img [stupidWindowImage]
  label .l -image $img
  pack .l
  # Uncomment this to hide the stupid window.
  #wm iconify .

  # Do not show hidden directories.
  catch {tk_getSaveFile foo bar}
  set ::tk::dialog::file::showHiddenVar 0
  set ::tk::dialog::file::showHiddenBtn 1

  # Set up file type filter.
  set fileTypes {
    { {Facet Files} {.facet} }
    { {All Files}   * }
  }

  set fileName [tk_getSaveFile -title "Enter facet file name." -filetypes $fileTypes -defaultextension ".facet"]

  if { $fileName == "" } {
    puts ""
    puts "You must provide a file name to continue"
    puts ""
    exit
  }

  # Restart timer.
  set startTime [pwu::Time now]

  # Get facet file directory name.
  set baseName [file dirname $fileName]

  # Derive geometry.params file location.
  set geomFile [append baseName "/geometry.params"]

  puts "Begin facet file export."
  puts "    Writing facet file: $fileName"
  puts "    Writing geometry file: $geomFile"

  set geomFp [open $geomFile w]

  # Write geometry.params parameter file.
  puts $geomFp "Number of boundaries\n$nBcs"
  puts $geomFp "Boundary #   Layers     g_space     n_space             boundary name"
  puts $geomFp "---------- ---------- ----------- ----------- ---------------------------------"

  for {set iBc 0} {$iBc < $nBcs} {incr iBc} {
    puts $geomFp [lindex $geomParams $iBc]
  }
  close $geomFp

  # Create a (hopefully portable) temporary file.
  set tmpdir [pwd]
  if {[file exists "/tmp"]} { set tmpdir "/tmp"}
  catch {set tmpdir $::env(TMP)}
  catch {set tmpdir $::env(TEMP)}
  set tempFile [file join $tmpdir "blockToFacet.[pid]" ]
  puts "    (Writing to temporary file $tempFile)"

  set io [pw::Application begin GridExport $doms]

  $io initialize -type Xpatch $tempFile

  if { [$io verify] != 1 } {
    puts "Error: io verify failed... exiting"
    $io end
    exit
  }

  if { [$io canWrite] != 1 } {
    puts "Error: no data to export... exiting"
    $io end
    exit
  }

  # Export the Xpatch file.
  set writeStartTime [pwu::Time now]
  $io write
  set writeTotalTime [pwu::Time elapsed $writeStartTime]
  puts "Facet file export complete. ($writeTotalTime seconds)"
  puts ""

  if { [$io getDetails] != "" } {
    puts "Error: [$io getDetails]"
    $io end
    exit
  }

  $io end

# Post process temporary file.
puts "Beginning facet file post-processing."
puts "    Replacing $nDoms domains tags with $nBcs BC tags."
set writeStartTime [pwu::Time now]

set tempFp [open $tempFile "r"]
set facetFp [open $fileName "w"]

# Copy header information.
puts $facetFp [gets $tempFp]
puts $facetFp [gets $tempFp]
puts $facetFp [gets $tempFp]
puts $facetFp [gets $tempFp]

# Get number of coordinates.
set numPts [gets $tempFp]
puts $facetFp $numPts

# Write out the coordinates.
for {set iPt 0} {$iPt < $numPts} {incr iPt} {
  puts $facetFp [gets $tempFp]
}

# Get number of 'blocks'.
set nBlocks [gets $tempFp]
puts $facetFp $nBlocks

for {set iBlock 0} {$iBlock < $nBlocks} {incr iBlock} {
# Triangles or Quadrilaterals.
  puts $facetFp [gets $tempFp]

  # Get cell type and count.
  set tmp [split [gets $tempFp] " "]
  puts $facetFp $tmp

  set nElem [lindex $tmp 0]
  set elemType [lindex $tmp 1]

  if { $elemType == 3 } { # Triangles.
    set fmt "   %8d %8d %8d %2d  %04d %2d"
  } elseif { $elemType == 4 } { # Quadrilaterals.
    set fmt "   %8d %8d %8d %8d %2d  %04d %2d"
  } else { # Something else.
    puts "Error: invalid element type with $elemType edges detected...  exiting."
    exit
  }

  # Calculate index into cell array of domain id (to be replaced by BC id.)
  set index [expr {$elemType + 1}]

  # Write out connectivity, swapping domain id for BC id.
  for {set iConn 0} {$iConn < $nElem} {incr iConn} {
    set cell [gets $tempFp]
    #set cell [regsub -all {(^\s*\d+\s+\d+\s+\d+\s+\d+\s+0\s+)(\d+)(.$)} $cell [\1 [dict get $domToBC \2] \3]]

    # This is a working regex... looks like I might not need it...
    #set found [regexp {(^\s*\d+\s+\d+\s+\d+\s+\d+\s+0\s+)(\d+)(.*$)} $cell match first domId last]
    #puts "found = $found"
    #puts "matched line <<$match>>"
    #puts $first
    #puts "<<<$domId>>>"
    #puts $last
    #set domId [string trimleft $domId "0"]
    #puts "<<<$domId>>>"

    set domId [string trimleft [lindex $cell $index] "0"]
    lset cell $index [dict get $domToBC $domId]
    puts $facetFp [format $fmt {*}$cell]
  }
}

close $facetFp
close $tempFp

# Delete temporary file.
file delete $tempFile
set writeTotalTime [pwu::Time elapsed $writeStartTime]
puts "Post-processing complete. ($writeTotalTime seconds)"
puts ""

set totalTime [pwu::Time double [pwu::Time add $totalTime [pwu::Time elapsed $startTime]]]
puts "BlockToFacet export complete. ($totalTime seconds)"

exit
