BlockToFacet
============

A tool used to export ONLY boundary conditions from a CFD computational mesh generated in Pointwise.

This is a Pointwise Glyph script used to export only boundary conditions from an initialized or uninitialized block from a Pointwise project. The script will create an ASCII Xpatch facet file with all the boundary data from the selected block(s) including boundary conditions. As the Xpatch facet file does not contain boundary name information an additional file, always named geometry.params, is also generated containing the map from boundary tag to boundary name.

There are actually two versions of this script here; one (blockToFacet_orig.glf) depends on Pointwise's GridCoordEnum utility found at (https://github.com/pointwise/GridCoordEnum.git) and the other (blockToFacet.glf) does not. The original version is, unfortunately quite slow, so the second, recommended version was created to dramatically speed up the export process.

There is a little easter egg in this script for the users entertainment; this exists because I do not know how to program tcl/tk GUIs. Enjoy!

Comments/suggestions (hopefully constructive!) are welcomed. Thank you.
