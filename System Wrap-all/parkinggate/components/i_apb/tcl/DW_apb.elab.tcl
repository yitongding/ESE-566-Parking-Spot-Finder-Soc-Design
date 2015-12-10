# reuse-pragma startSub [::RCE::insert_copyright #] endSub 
# Revision: $Id: //dwh/DW_ocb/DW_apb/amba_dev/pkg/pkg_script/DW_apb.elab.tcl#4 $
#  Abstract     :               timing exceptions
#                               applied after elab phase

  set_multicycle_path -from {U_DW_apb_ahbsif/paddr_reg*} \
     -to {hrdata} -setup 2

  set_multicycle_path -from {U_DW_apb_ahbsif/paddr_reg*} \
     -to {hrdata} -hold 1

  set numSlaves [get_configuration_parameter NUM_APB_SLAVES]
  set maxPinFanOut [expr (3 * $numSlaves)]
  set_port_attribute [all_outputs] PinLoadCount $maxPinFanOut
  set_port_attribute psel_s*     PinLoadCount 3
  set_port_attribute hrdata      PinLoadCount 3
  set_port_attribute hready_resp PinLoadCount 3
  set_port_attribute hresp       PinLoadCount 3

  set_max_delay \
    -from [find_item -type port -filter {PortDirection==in} prdata_s*] \
    -to {hrdata} "=percent_of_period 100"

