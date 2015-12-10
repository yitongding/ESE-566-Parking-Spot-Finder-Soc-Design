
current_design "[get_design_prefix]DW_apb_i2c"
suppress_message CMDS-39
set interruptType     [get_configuration_parameter IC_INTR_IO]
set interruptPolarity [get_configuration_parameter IC_INTR_POL]
set maxSpeedMode      [get_configuration_parameter IC_MAX_SPEED_MODE]
set ic_has_dma        [get_configuration_parameter IC_HAS_DMA]
set ic_slv_restart_det [get_configuration_parameter IC_SLV_RESTART_DET_EN]
set ic_dynamic_tar     [get_configuration_parameter I2C_DYNAMIC_TAR_UPDATE]
set ic_emptyfifo_hold  [get_configuration_parameter IC_EMPTYFIFO_HOLD_MASTER_EN]

if {$ic_has_dma == 1} {
  set_port_attribute dma_tx_ack    {MinInputDelay[pclk]}  {=percent_of_period 70 pclk}
  set_port_attribute dma_tx_ack    {MaxInputDelay[pclk]}  {=percent_of_period 70 pclk}
  set_port_attribute dma_rx_ack    {MinInputDelay[pclk]}  {=percent_of_period 70 pclk}
  set_port_attribute dma_rx_ack    {MaxInputDelay[pclk]}  {=percent_of_period 70 pclk}
  set_port_attribute dma_tx_req    {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
  set_port_attribute dma_tx_req    {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
  set_port_attribute dma_rx_req    {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
  set_port_attribute dma_rx_req    {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
  set_port_attribute dma_tx_single {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
  set_port_attribute dma_tx_single {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
  set_port_attribute dma_rx_single {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
  set_port_attribute dma_rx_single {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
}

#IC outputs pclk domain
if {$interruptType == 0} {
    if {$interruptPolarity == 0} {
	set_port_attribute ic_rx_over_intr_n   {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_rx_under_intr_n  {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_tx_over_intr_n   {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_tx_abrt_intr_n   {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_rx_done_intr_n   {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_rd_req_intr_n    {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_tx_empty_intr_n  {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_activity_intr_n  {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_stop_det_intr_n  {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
 if {$ic_slv_restart_det == 1} {
	set_port_attribute ic_restart_det_intr_n {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
 }
	set_port_attribute ic_start_det_intr_n {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_rx_full_intr_n   {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_gen_call_intr_n  {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
 if {($ic_dynamic_tar == 1) && ($ic_emptyfifo_hold ==1)} {
 set_port_attribute ic_mst_on_hold_intr_n {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
 }

	set_port_attribute ic_rx_over_intr_n   {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_rx_under_intr_n  {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_tx_over_intr_n   {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_tx_abrt_intr_n   {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_rx_done_intr_n   {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_rd_req_intr_n    {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_tx_empty_intr_n  {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_activity_intr_n  {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_stop_det_intr_n  {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
 if {$ic_slv_restart_det == 1} {
	set_port_attribute ic_restart_det_intr_n {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
 }
	set_port_attribute ic_start_det_intr_n {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_rx_full_intr_n   {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_gen_call_intr_n  {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
 if {($ic_dynamic_tar == 1) && ($ic_emptyfifo_hold ==1)} {
 set_port_attribute ic_mst_on_hold_intr_n {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
 }

    } else {
	set_port_attribute ic_rx_over_intr   {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_rx_under_intr  {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_tx_over_intr   {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_tx_abrt_intr   {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_rx_done_intr   {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_rd_req_intr    {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_tx_empty_intr  {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_activity_intr  {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_stop_det_intr  {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
 if {$ic_slv_restart_det == 1} {
	set_port_attribute ic_restart_det_intr {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
 }
	set_port_attribute ic_start_det_intr {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_rx_full_intr   {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_gen_call_intr  {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
 if {($ic_dynamic_tar == 1) && ($ic_emptyfifo_hold ==1)} {
 set_port_attribute ic_mst_on_hold_intr {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
 }

	set_port_attribute ic_rx_over_intr   {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_rx_under_intr  {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_tx_over_intr   {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_tx_abrt_intr   {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_rx_done_intr   {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_rd_req_intr    {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_tx_empty_intr  {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_activity_intr  {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_stop_det_intr  {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
 if {$ic_slv_restart_det == 1} {
	set_port_attribute ic_restart_det_intr {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
 }
	set_port_attribute ic_start_det_intr {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_rx_full_intr   {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_gen_call_intr  {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
 if {($ic_dynamic_tar == 1) && ($ic_emptyfifo_hold ==1)} {
 set_port_attribute ic_mst_on_hold_intr {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
 }

    }
} else {
    if {$interruptPolarity == 0} {
	set_port_attribute ic_intr_n {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_intr_n {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
    } else {
	set_port_attribute ic_intr {MinOutputDelay[pclk]} {=percent_of_period 30 pclk}
	set_port_attribute ic_intr {MaxOutputDelay[pclk]} {=percent_of_period 30 pclk}
    }
}

# optional output, only present in high speed mode
if {$maxSpeedMode == 3} {
    set_port_attribute ic_current_src_en {MinOutputDelay[ic_clk]} {=percent_of_period 30 ic_clk}
    set_port_attribute ic_current_src_en {MaxOutputDelay[ic_clk]} {=percent_of_period 30 ic_clk}
}

set_false_path -from ic_rst_n
set_false_path -from presetn

#
# Only have false paths when clocks are asynchronous.
#
set clockRelationship [get_configuration_parameter IC_CLK_TYPE]
if {$clockRelationship == 1} {
  set_false_path -from ic_clk -to pclk
  set_false_path -from pclk -to ic_clk
}
