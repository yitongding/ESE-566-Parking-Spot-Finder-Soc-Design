#################################################################################
# Design Compiler Reference Methodology Script for Top-Down Flow
# Script: dc.tcl
# Version: J-2014.09 (October 6, 2014)
# Copyright (C) 2007-2014 Synopsys, Inc. All rights reserved.
#################################################################################

set DESIGN_NAME parking

#######################################################################
# Setup Variables
#######################################################################

set ::bus_naming_style {%s[%d]}
set ::bus_dimension_separator_style {][}
set ::template_naming_style %s_%p
set ::template_parameter_style %s%d
set ::template_separator_style _
set ::hdl_naming_threshold 20
set ::hdlin_field_naming_style {}
set ::hdlin_vrlg_std 2005
set ::uniquify_naming_style %s_%d
set ::test_default_scan_style multiplexed_flip_flop
set ::alib_library_analysis_path ./
set ::alib_library_analysis_cache ./
set ::compile_seqmap_identify_shift_registers true



# The following variables are used by scripts in dc_scripts to direct the location
# of the output files

set REPORTS_DIR [file join . initial report]

set finalPhase initial

if {[string equal $finalPhase "qmap"]} {
  set RESULTS_DIR [file join . $finalPhase db]
} else {
  set RESULTS_DIR [file join . initial db]
}

file mkdir $REPORTS_DIR
file mkdir $RESULTS_DIR

#######################################################################
# Library Setup
#######################################################################

set MW_POWER_NET VDD 
set MW_GROUND_NET VSS 


set mw_site_name_mapping [list CORE unit Core unit core unit]

# The remainder of the setup below should only be performed in Design Compiler
if {[string equal $synopsys_program_name "dc_shell"] || 
    [string equal $synopsys_program_name "de_shell"]}  {

set ::dcSnpsRoot /project/linuxlab/synopsys/syncore
set ::target_library [list lsi_10k.db]
set ::link_library [list * lsi_10k.db]
set ::search_path [list . $::dcSnpsRoot/libraries/syn $::dcSnpsRoot/minpower/syn $::dcSnpsRoot/dw/syn_ver $::dcSnpsRoot/dw/sim_ver]


# Enable use of dw_foundation.sldb
if {[lsearch -exact $::synthetic_library dw_foundation.sldb] == -1} {
  lappend ::synthetic_library dw_foundation.sldb
}


## Make sure the synthetic_libraries are in link_library
foreach synLib $::synthetic_library {
  if { [lsearch -exact $::link_library $synLib] } {
    lappend ::link_library $synLib
  }
}


}

#######################################################################
# Library Modifications
#######################################################################

# Read in the target libraries before trying to modify
foreach rtLib $::target_library { read_db $rtLib }

source ./initial/script/dontUseLibCells.tcl

