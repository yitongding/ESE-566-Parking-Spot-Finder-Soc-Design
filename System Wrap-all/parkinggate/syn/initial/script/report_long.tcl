echo "RPT_INFO:Input Ports  "

echo "RPT_INFO:Port Group Interface ex_i_ahb_AHB_Master"
report_timing -from ex_i_ahb_AHB_Master_haddr -path only -nosplit -net
report_timing -from ex_i_ahb_AHB_Master_hburst -path only -nosplit -net
report_timing -from ex_i_ahb_AHB_Master_hbusreq -path only -nosplit -net
report_timing -from ex_i_ahb_AHB_Master_hlock -path only -nosplit -net
report_timing -from ex_i_ahb_AHB_Master_hprot -path only -nosplit -net
report_timing -from ex_i_ahb_AHB_Master_hsize -path only -nosplit -net
report_timing -from ex_i_ahb_AHB_Master_htrans -path only -nosplit -net
report_timing -from ex_i_ahb_AHB_Master_hwdata -path only -nosplit -net
report_timing -from ex_i_ahb_AHB_Master_hwrite -path only -nosplit -net
echo "RPT_INFO:Port Group Interface ex_i_ahb_AHB_Slave"
report_timing -from ex_i_ahb_AHB_Slave_hrdata -path only -nosplit -net
report_timing -from ex_i_ahb_AHB_Slave_hready_resp -path only -nosplit -net
report_timing -from ex_i_ahb_AHB_Slave_hresp -path only -nosplit -net
echo "RPT_INFO:Port Group Manually exported pins"
report_timing -from i_ahb_pause  -path only -nosplit -net
report_timing -from i_apb_pclk_en -path only -nosplit -net
report_timing -from i_i2c_ic_clk_in_a -path only -nosplit -net
report_timing -from i_i2c_ic_data_in_a -path only -nosplit -net


echo "RPT_INFO:Output Ports  "

echo "RPT_INFO:Port Group Interface ex_i_ahb_AHB_Master"
report_timing -to   ex_i_ahb_AHB_Master_hrdata -path only  -nosplit -net
report_timing -to   ex_i_ahb_AHB_Master_hready -path only  -nosplit -net
report_timing -to   ex_i_ahb_AHB_Master_hresp -path only  -nosplit -net
report_timing -to   ex_i_ahb_AHB_Master_hgrant -path only  -nosplit -net
echo "RPT_INFO:Port Group Interface ex_i_ahb_AHB_Slave"
report_timing -to   ex_i_ahb_AHB_Slave_haddr -path only  -nosplit -net
report_timing -to   ex_i_ahb_AHB_Slave_hburst -path only  -nosplit -net
report_timing -to   ex_i_ahb_AHB_Slave_hmastlock -path only  -nosplit -net
report_timing -to   ex_i_ahb_AHB_Slave_hprot -path only  -nosplit -net
report_timing -to   ex_i_ahb_AHB_Slave_hready -path only  -nosplit -net
report_timing -to   ex_i_ahb_AHB_Slave_hsel -path only  -nosplit -net
report_timing -to   ex_i_ahb_AHB_Slave_hsize -path only  -nosplit -net
report_timing -to   ex_i_ahb_AHB_Slave_htrans -path only  -nosplit -net
report_timing -to   ex_i_ahb_AHB_Slave_hwdata -path only  -nosplit -net
report_timing -to   ex_i_ahb_AHB_Slave_hwrite -path only  -nosplit -net
echo "RPT_INFO:Port Group Manually exported pins"
report_timing -to   i_i2c_ic_en  -path only  -nosplit -net
report_timing -to   i_i2c_ic_rd_req_intr -path only  -nosplit -net
report_timing -to   i_i2c_ic_gen_call_intr -path only  -nosplit -net
report_timing -to   i_i2c_ic_tx_empty_intr -path only  -nosplit -net
report_timing -to   i_i2c_ic_data_oe -path only  -nosplit -net
report_timing -to   i_i2c_ic_clk_oe -path only  -nosplit -net
report_timing -to   i_i2c_ic_activity_intr -path only  -nosplit -net
report_timing -to   i_i2c_debug_wr -path only  -nosplit -net
report_timing -to   i_i2c_ic_rx_done_intr -path only  -nosplit -net
report_timing -to   i_i2c_ic_rx_full_intr -path only  -nosplit -net
report_timing -to   i_i2c_ic_rx_over_intr -path only  -nosplit -net
report_timing -to   i_i2c_ic_rx_under_intr -path only  -nosplit -net
report_timing -to   i_i2c_ic_start_det_intr -path only  -nosplit -net
report_timing -to   i_i2c_ic_stop_det_intr -path only  -nosplit -net
report_timing -to   i_i2c_ic_tx_abrt_intr -path only  -nosplit -net
report_timing -to   i_i2c_ic_tx_over_intr -path only  -nosplit -net
report_timing -to   i_i2c_debug_data -path only  -nosplit -net
report_timing -to   i_ahb_ahbarbint -path only  -nosplit -net
report_timing -to   i_ahb_hmaster_data -path only  -nosplit -net
report_timing -to   i_ahb_hrdata_s0 -path only  -nosplit -net
report_timing -to   i_ahb_hready_resp_s0 -path only  -nosplit -net
report_timing -to   i_ahb_hresp_s0 -path only  -nosplit -net
report_timing -to   i_ahb_hsel_s0 -path only  -nosplit -net
report_timing -to   i_i2c_debug_addr -path only  -nosplit -net
report_timing -to   i_i2c_debug_addr_10bit -path only  -nosplit -net
report_timing -to   i_i2c_debug_slv_cstate -path only  -nosplit -net
report_timing -to   i_i2c_debug_hs -path only  -nosplit -net
report_timing -to   i_i2c_debug_master_act -path only  -nosplit -net
report_timing -to   i_i2c_debug_mst_cstate -path only  -nosplit -net
report_timing -to   i_i2c_debug_p_gen -path only  -nosplit -net
report_timing -to   i_i2c_debug_rd -path only  -nosplit -net
report_timing -to   i_i2c_debug_s_gen -path only  -nosplit -net
report_timing -to   i_i2c_debug_slave_act -path only  -nosplit -net


