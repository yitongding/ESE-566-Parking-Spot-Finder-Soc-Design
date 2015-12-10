# reuse-pragma startSub [::RCE::insert_copyright #] endSub
# Revision: $Id: //dwh/DW_ocb/DW_ahb/amba_dev/pkg/pkg_script/DW_ahb.elab.tcl#4 $
#  Abstract     :               Post-elaboration intent for DW_ahb
  set ahbLite    [get_configuration_parameter AHB_LITE]
  set ebten      [get_configuration_parameter EBTEN]
  set wten       [get_configuration_parameter AHB_WTEN]
  set wten_debug [get_configuration_parameter AHB_WTEN_DEBUG]
  set numSlaves  [get_configuration_parameter NUM_IAHB_SLAVES]
  set xDcdr      [get_configuration_parameter AHB_HAS_XDCDR]

  set maxPinFanOut [expr (3 * $numSlaves)]

  set_port_attribute [all_outputs] PinLoadCount $maxPinFanOut
  if {($xDcdr == 0)} {
    set_port_attribute hsel_s*       PinLoadCount 3
  }
  if {($ahbLite == 0)} {
    set_port_attribute hgrant_m*     PinLoadCount 3
    if {($ebten == 1)} {
      set_port_attribute ahbarbint   PinLoadCount 3
    }
    if {($wten == 1)} {
      set_port_attribute ahb_wt_mask* PinLoadCount 3
      set_port_attribute ahb_wt_aps   PinLoadCount 3
      if {($wten_debug == 1)} {
        set_port_attribute ahb_wt_count_m* PinLoadCount 3
      }
    }
  }
  set_port_attribute hmastlock     PinLoadCount 3
  set_port_attribute hmaster_data  PinLoadCount 3
  set_port_attribute hmaster       PinLoadCount 3
