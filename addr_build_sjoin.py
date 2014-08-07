#-------------------------------------------------------------------------------
# Name:        module2
# Purpose:
#
# Author:      eplack
#
# Created:     30-06-2014
# Copyright:   (c) eplack 2014
# Licence:     <your licence>
#-------------------------------------------------------------------------------

import arcpy
import os

# Set local variables

workspace = r"C:\LocalGIS\OSM\OSM-BaCo.gdb"
outWorkspace = r"C:\LocalGIS\OSM\OSM-SpatialJoin.gdb"

# join features setup (join addr. to bldg)
targetFeatures = os.path.join(workspace, "Building")
joinFeatures = os.path.join(workspace, "Address")

# output set up
outfc = os.path.join(outWorkspace, "Building_spjn")

# Create a new fieldmappings and add the two input feature classes.
fieldmappings = arcpy.FieldMappings()
fieldmappings.addTable(targetFeatures)
fieldmappings.addTable(joinFeatures)

arcpy.SpatialJoin_analysis(targetFeatures,joinFeatures,JOIN_ONE_TO_ONE,KEEP_COMMON,