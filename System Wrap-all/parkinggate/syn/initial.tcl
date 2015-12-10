source -echo -verbose ./setup/script/dc_setup.tcl
#######################################################################
# Design Compiler Reference Methodology Script for Top-Down Flow
# Script: dc.tcl
# Version: J-2014.09 (October 6, 2014)
# Copyright (C) 2007-2014 Synopsys, Inc. All rights reserved.
#######################################################################


set componentDesignNames {
i_ahb_DW_ahb
  i_apb_DW_apb
  i_i2c_DW_apb_i2c
  parking
}

#######################################################################
# Additional Variables
#######################################################################

# dc_shell setup variables for i_apb_DW_apb
set_app_var hdlin_vrlg_std 2001
set_app_var suppress_errors {DDB-74 DDB-95 EQN-10 HDL-176 HDL-395 HDL-410 LINT-2 LINT-28 LINT-29 LINT-3 LINT-30 LINT-31 LINT-32 LINT-33 LINT-45 OPT-915 SR-9 SYNDB-26 TIM-103 TIM-134 UID-348 VO-2 VO-4 ELAB-335 VER-61 VER-314 UCN-4 OPT-800 OPT-801 UIO-78 WL-40 UCN-1 TIM-175 LINT-1 ATTR-1}
set_app_var synlib_wait_for_design_license {DesignWare DC-Ultra-Opt DC-Ultra-Features}
set_app_var template_parameter_style %d
# dc_shell setup variables for i_ahb_DW_ahb
set_app_var hdlin_vrlg_std 2001
set_app_var suppress_errors {DDB-74 DDB-95 EQN-10 HDL-176 HDL-395 HDL-410 LINT-52 LINT-2 LINT-28 LINT-29 LINT-3 LINT-30 LINT-31 LINT-32 LINT-33 LINT-45 OPT-915 SR-9 SYNDB-26 TIM-103 TIM-134 UID-348 VO-2 VO-4 VER-61 VER-318 VER-314 UCN-4 UCN-1 OPT-800 OPT-801 UIO-78 WL-40 TIM-175 LINT-1 ATTR-1}
set_app_var synlib_wait_for_design_license {DesignWare DC-Ultra-Opt DC-Ultra-Features}
set_app_var template_parameter_style %d
# dc_shell setup variables for i_i2c_DW_apb_i2c
set_app_var hdlin_vrlg_std 2001
set_app_var suppress_errors {DDB-74 DDB-95 EQN-10 HDL-176 HDL-395 HDL-410 LINT-2 LINT-28 LINT-29 LINT-3 LINT-30 LINT-31 LINT-32 LINT-33 LINT-45 OPT-915 SR-9 SYNDB-26 TIM-103 TIM-134 UID-348 VO-2 VO-4 EQN-10 VER-936 VER-318 ELAB-349 LINT-0 OPT-800 OPT-801 UCN-4 EQN-10 UCN-1 VHDL-286 WL-40 TIM-175 LINT-1 ATTR-1}
set_app_var synlib_wait_for_design_license {DesignWare DC-Ultra-Opt DC-Ultra-Features}
set_app_var template_parameter_style %d

#######################################################################
# Setup for Formality verification
#######################################################################

set_svf ./initial/svf/parking.svf

set finalPhase initial

#######################################################################
# Setup SAIF Name Mapping Database
#
# Include an RTL SAIF for better power optimization and analysis.
#
# saif_map should be issued prior to RTL elaboration to create a name mapping
# database for better annotation.
######################################################################

# saif_map -start


#######################################################################
# Read in the RTL Design
#######################################################################
define_design_lib work -path ./lib/work

## Analyze and elaborate the design from source.
foreach dir {analyze elab} {
  foreach desName $componentDesignNames {
    set fileName [file join . $dir script ${desName}.tcl]
    source $fileName
  }
}


set topDesign [current_design]
set_attribute -type string $topDesign rt_design_name $DESIGN_NAME
redirect ./elab/script/.topDesignName {echo [get_attribute $topDesign name]}


link
write -format ddc -hierarchy -output ./elab/db/${DESIGN_NAME}.ddc
exec /project/linuxlab/synopsys/coreTools/linux/dware/bin/gen_synth_index.pl -r /project/linuxlab/synopsys/coreTools -t coreAssembler


#######################################################################
# Apply Logical Design Constraints
#######################################################################

set ::rtRefDes parking
read_sdc -version 1.9 -echo ./constrain/script/parking.sdc


#################################################################################
# Apply Operating Conditions
#################################################################################

# Set operating condition on top level
# Comment out if these are already set in your constraints file.

#set_operating_conditions -max <max_opcond> -min <min_opcond>


write -format ddc -hierarchy -output ./constrain/db/${DESIGN_NAME}.ddc
exec /project/linuxlab/synopsys/coreTools/linux/dware/bin/gen_synth_index.pl -r /project/linuxlab/synopsys/coreTools -t coreAssembler

#######################################################################
# Create Default Path Groups
#######################################################################

set ports_clock_root [get_ports [all_fanout -flat -clock_tree -level 0]] 

set inputs  [all_inputs]
set outputs [all_outputs]

if {[sizeof_collection $outputs]} {
  group_path -name REGOUT -to $outputs
}

set regin_collection [remove_from_collection $inputs $ports_clock_root] 

if {[sizeof_collection $regin_collection]} {
  group_path -name REGIN -from $regin_collection
}

if {[sizeof_collection $regin_collection] && [sizeof_collection $outputs]} {
  group_path -name FEEDTHROUGH -from $regin_collection -to $outputs
}


#######################################################################
# Power Optimization Section
#######################################################################

    ###################################################################
    # Apply Power Optimization Constraints
    ###################################################################

    # Include a SAIF file, if possible, for power optimization.  If a SAIF file
    # is not provided, the default toggle rate of 0.1 will be used for propagating
    # switching activity.

    # read_saif -auto_map_names -input ${DESIGN_NAME}.saif -instance < DESIGN_INSTANCE > -verbose



#######################################################################
# Apply Additional Optimization Constraints
#######################################################################


#######################################################################
# Compile the Design
#######################################################################

check_design -summary
if {[shell_is_in_exploration_mode]} {
  # Report all missing constraints
  report_missing_constraints > ${REPORTS_DIR}/${DESIGN_NAME}.missing_constraints.rpt
  # Report design mismatches that were circumvented
  report_design_mismatch > ${REPORTS_DIR}/${DESIGN_NAME}.design_mismatch.rpt
}

set ::saved_check_error_list {OPT-100 LINK-5 LINK-9 LNK-005}
check_error -reset
if {[info exists ::saved_check_error_list]} {
  set ::check_error_list $::saved_check_error_list
}
compile_ultra
if {[check_error]} {
  error "There were errors compiling the design. Please check logs"
}


#######################################################################
# Save Design after First Compile
#######################################################################

write -format ddc -hierarchy -output ${RESULTS_DIR}/${DESIGN_NAME}.ddc
file delete -force ./final
if {[string equal $finalPhase "initial"] || [string equal $finalPhase "dft"]} {
  exec ln -s  ./initial ./final
  file delete -force ./initial/.STATE
  redirect ./initial/.STATE {echo valid}
  redirect ./initial/.successor {echo ""}
} else {
  exec ln -s  ./qmap ./final
  file delete -force ./qmap/.STATE
  redirect ./qmap/.STATE {echo valid}
  redirect ./qmap/.successor {echo ""}
}
exec /project/linuxlab/synopsys/coreTools/linux/dware/bin/gen_synth_index.pl -r /project/linuxlab/synopsys/coreTools -t coreAssembler
  

#######################################################################
# Write Out Final Design and Reports
#######################################################################

change_names -hierarchy -rules verilog -log_changes /home/warehouse/shenkaijie/Documents/coreAssembler/design/parkinggate/syn/db/change_names.log

 

#################################################################################
# Write out Design
#################################################################################

# Write and close SVF file and make it available for immediate use
set_svf -off

write -format ddc -hierarchy -output ${RESULTS_DIR}/${DESIGN_NAME}.ddc
write -format verilog -hierarchy -output ${RESULTS_DIR}/${DESIGN_NAME}.v



#################################################################################
# Write out Design Data
#################################################################################

write_sdf ${RESULTS_DIR}/${DESIGN_NAME}.sdf

write_sdc -nosplit ${RESULTS_DIR}/${DESIGN_NAME}.sdc

# If SAIF is used, write out SAIF name mapping file for PrimeTime-PX
# saif_map -type ptpx -write_map ${RESULTS_DIR}/${DESIGN_NAME}.SAIF.namemap
saif_map -type ptpx -write_map ${RESULTS_DIR}/${DESIGN_NAME}.mapped.SAIF.namemap


#######################################################################
# Generate Final Reports
#######################################################################



# Use SAIF file for power analysis
# read_saif -auto_map_names -input ${DESIGN_NAME}.saif -instance < DESIGN_INSTANCE > -verbose


##############################################################################
#
# Script         : report_gen.tcl
# Design         : parking
#
# Generated On   : November 28, 2015
# coreTools Version: J-2015.03-SP1
#
# DC Version     : J-2014.09-SP5
# Target Library : lsi_10k
#
##############################################################################


  set rtReportBase parking
  set rtCurrentDesign [get_attribute [current_design] Name]
  set rtReportDir ./initial/report
  set rtScriptDir ./initial/script

  # 0. Generate top-level 'checker' reports.
  foreach check {setup checkdes latches loops ioreg throughpath notest} {
    if { [string equal $check no_test] } {
      set rtRptOut [file join $rtReportDir ${rtReportBase}_notest.rpt]
    } else {
      set rtRptOut [file join $rtReportDir ${rtReportBase}_${check}.rpt]
    }
    redirect $rtRptOut {
      source [file join $rtScriptDir report_$check.tcl]
    }
  }

  redirect [file join $rtReportDir ${rtReportBase}_path_group.rpt] {
    report_path_group -nosplit
  }

  # 1. Generate top-level detailed timing reports.
  set rtRptOut [file join $rtReportDir ${rtReportBase}_timing.rpt]
  redirect $rtRptOut {
    report_timing -net -max_paths 1 -nosplit
    set rtQpins [all_registers -clock_pins]
    set rtDpins [all_registers -data_pins]
    if { [sizeof_collection $rtQpins] && [sizeof_collection $rtDpins] } {
      group_path -name QtoD -from $rtQpins -to $rtDpins
      report_timing -group QtoD -path only -max_paths 25 -nosplit
#      report_timing -from $rtQpins -to $rtDpins -path only -max_paths 25 -nosplit 
      group_path -default -from $rtQpins -to $rtDpins
    }
  }
  unset rtQpins
  unset rtDpins
  # 1a.  Short endpoint report
  set rtRptOut [file join $rtReportDir ${rtReportBase}_short_endpoint.rpt]
  redirect $rtRptOut {source [file join $rtScriptDir report_short.tcl]}
  set rtRptOut [file join $rtReportDir ${rtReportBase}_long_endpoint.rpt]
  redirect $rtRptOut { source [file join $rtScriptDir report_long.tcl] }

  # Qor Report.
  set rtRptOut [file join $rtReportDir ${rtReportBase}_qor.rpt]
  redirect $rtRptOut {
    echo "RPT_INFO:Time Scale 1"
    echo ""
    echo "RPT_INFO:Time Units ns"
    echo ""
    report_qor -nosplit
  }

  # Report on cumulative CPU time.
  redirect /dev/null {
    set rtTmp [get_attribute [current_design] compile_tot_cpu_time]
    if {[string equal $rtTmp ""]} {
      set rtTmp 0
    }
  }
  redirect -append $rtRptOut {echo "tot_cpu_time = $rtTmp"}
  # Clock Reports.
  set rtRptOut [file join $rtReportDir ${rtReportBase}_clock.rpt]
  redirect $rtRptOut {
    echo "RPT_INFO:Time Scale 1"
    echo ""
    echo "RPT_INFO:Time Units ns"
    echo ""
    report_clock -nosplit
  }

  # 2. Generate area and reference reports for all designs in the compile
  #     frontier.  Generate a constraints report for the top-level design.
  # Area reports.
proc rt_parse_area_report {desName fileName nonCombo combo total} {

  upvar $nonCombo _nonCombo
  upvar $combo _combo
  upvar $total _total

  ## Read the data from the file.
  if { [catch {open $fileName r} f] } {
    return -code error "Could not open Area report for parsing.\n\t$f"
  }
  set contents [read $f]
  close $f

  ## Parse it.
  foreach i {Combinational Noncombinational {Total cell}} {
    if {![regexp -line "^$i area:(.*)$" $contents match value($i)] } {
      echo "Warning: Unable to parse area report for $desName.\n\tCound not find $i area"
    }
  }

  ## Add values to the arrays
  set _nonCombo($desName) $value(Noncombinational)
  set _combo($desName) $value(Combinational)
  set _total($desName) $value(Total cell)

  return
}

set rtAreaRpt [file join $rtReportDir ${rtReportBase}_area.rpt]
redirect $rtAreaRpt {
  echo "RPT_INFO:Area Scale 1"
  echo "RPT_INFO:Area Units libArea"
}
set rtTmpFile ./tmp.[pid]
redirect $rtTmpFile {report_area -hierarchy -nosplit}
array set rtNonCombo ""
array set rtCombo ""
array set rtTotal ""
rt_parse_area_report $rtCurrentDesign $rtTmpFile rtNonCombo rtCombo rtTotal
redirect -append $rtAreaRpt {exec cat $rtTmpFile}


# Create a reference report also.
set rtRefRpt [file join $rtReportDir ${rtReportBase}_reference.rpt]
file delete -force $rtRefRpt
redirect $rtRefRpt {report_reference -nosplit}

# Create a resource report also.
set rtResRpt [file join $rtReportDir ${rtReportBase}_resources.rpt]
file delete -force $rtResRpt
redirect $rtResRpt {report_resources -nosplit}

set nextCells [filter_collection [get_cells] is_hierarchical==true]
while {[sizeof_collection $nextCells]} {
  set currentCells $nextCells
  set nextCells ""
  foreach_in_collection cell $currentCells {
    set refName [get_attribute $cell ref_name]
    current_instance $cell
    set nextCells [add_to_collection $nextCells \
                     [filter_collection [get_cells] is_hierarchical==true]]
    redirect -append $rtRefRpt {report_reference -nosplit}
    redirect -append $rtResRpt {report_resources -nosplit}
  }
}

current_instance

# Annotate the area numbers back to the designs
foreach refName [array names rtNonCombo] {
  set_attribute [find design $refName] \
     reported_noncombinational_area $rtNonCombo($refName) -type float -quiet
}
foreach refName [array names rtCombo] {
  set_attribute [find design $refName] \
     reported_combinational_area $rtCombo($refName) -type float -quiet
}
foreach refName [array names rtTotal] {
  set_attribute [find design $refName] \
     reported_total_cell_area $rtTotal($refName) -type float -quiet
}

array unset rtNonCombo
array unset rtCombo
array unset rtTotal
file delete -force $rtTmpFile


  # Report constraints.
  set rtRptOut [file join $rtReportDir ${rtReportBase}_constraints.rpt]
  redirect $rtRptOut {report_constraint -all_violators -nosplit}

  # Report hierarchy
  set rtRptOut [file join $rtReportDir ${rtReportBase}_hierarchy.rpt]
  redirect $rtRptOut {
    report_hierarchy -nosplit -full
  }


  # Report register count
  set rtRptOut [file join $rtReportDir ${rtReportBase}_register_count.rpt]
  redirect $rtRptOut {echo "****************************************"}
  redirect -append $rtRptOut {echo "Report : register count"}
  redirect -append $rtRptOut {echo "Design : ${rtCurrentDesign}"}
  redirect -append $rtRptOut {echo "Version: $sh_product_version"}
  redirect -append $rtRptOut {echo "Date   : [date]"}
  redirect -append $rtRptOut {echo "****************************************"}
  redirect -append $rtRptOut {echo "\n"}
  redirect -append $rtRptOut {echo "The design ${rtCurrentDesign} contains [sizeof_collection [all_registers]] registers.\n"}
  set clks [get_clocks]
  foreach_in_collection i $clks {
    set thisclk [get_attribute $i Name]
    set numffs [sizeof_collection [all_registers -fall_clock $i -edge_triggered]]
    if {$numffs > 0} {
      redirect -append $rtRptOut {echo "There are ${numffs} negative edge flip-flops in clock domain '${thisclk}', as follows:"}
      redirect -append $rtRptOut {echo "****************************************"}
      set fflist [list [all_registers -fall_clock $i -cells -edge_triggered]]
      foreach_in_collection j $fflist {
        set ffname [get_attribute $j full_name]
        redirect -append $rtRptOut {echo "$ffname"}
      }
      redirect -append $rtRptOut {echo "\n"}
    }
    set numPosFlops [sizeof_collection [all_registers -rise_clock $i -edge_triggered]]
    if {$numPosFlops > 0} {
      redirect -append $rtRptOut {echo "There are ${numPosFlops} positive edge flip-flops in clock domain '${thisclk}', as follows:"}
      redirect -append $rtRptOut {echo "****************************************"}
      set fflist [list [all_registers -rise_clock $i -cells -edge_triggered]]
      foreach_in_collection j $fflist {
        set ffname [get_attribute $j full_name]
        redirect -append $rtRptOut {echo "$ffname"}
      }
      redirect -append $rtRptOut {echo "\n"}
    }
    set numLatches  [sizeof_collection [all_registers -clock $i -level_sensitive]]
    if {$numLatches > 0} {
      redirect -append $rtRptOut {echo "There are ${numLatches} latches in clock domain '${thisclk}', as follows:"}
      redirect -append $rtRptOut {echo "****************************************"}
      set fflist [list [all_registers -clock $i -cells -level_sensitive]]
      foreach_in_collection j $fflist {
        set ffname [get_attribute $j full_name]
        redirect -append $rtRptOut {echo "$ffname"}
      }
      redirect -append $rtRptOut {echo "\n"}
    } 
  }


    set rtRptOut [file join $rtReportDir ${rtReportBase}_power_domains.rpt]
    if {![string equal $::target_library "gtech.db"]} {
      redirect $rtRptOut {report_power_domain}
    }



# Generate HTML reports for coreTools.
set perlExec $::synopsys_root/$::sh_arch/bin/snpsperl
if {![file exists $perlExec]} {
  set perlExec [file join /project/linuxlab/synopsys/coreTools/linux/dware/bin snpsperl]
}
exec $perlExec /project/linuxlab/synopsys/coreTools/linux/dware/bin/gen_html_reports.pl -d ./initial/report -r /project/linuxlab/synopsys/coreTools




exit
