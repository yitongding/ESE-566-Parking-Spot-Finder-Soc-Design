echo "RPT_INFO:Input Ports  "

echo "RPT_INFO:Port Group Interface ex_i_ahb_AHB_Master"
report_timing -from ex_i_ahb_AHB_Master_haddr -path short -nosplit
report_timing -from ex_i_ahb_AHB_Master_hburst -path short -nosplit
report_timing -from ex_i_ahb_AHB_Master_hbusreq -path short -nosplit
report_timing -from ex_i_ahb_AHB_Master_hlock -path short -nosplit
report_timing -from ex_i_ahb_AHB_Master_hprot -path short -nosplit
report_timing -from ex_i_ahb_AHB_Master_hsize -path short -nosplit
report_timing -from ex_i_ahb_AHB_Master_htrans -path short -nosplit
report_timing -from ex_i_ahb_AHB_Master_hwdata -path short -nosplit
report_timing -from ex_i_ahb_AHB_Master_hwrite -path short -nosplit
echo "RPT_INFO:Port Group Interface ex_i_ahb_AHB_Slave"
report_timing -from ex_i_ahb_AHB_Slave_hrdata -path short -nosplit
report_timing -from ex_i_ahb_AHB_Slave_hready_resp -path short -nosplit
report_timing -from ex_i_ahb_AHB_Slave_hresp -path short -nosplit
echo "RPT_INFO:Port Group Manually exported pins"
report_timing -from i_ahb_pause  -path short -nosplit
report_timing -from i_apb_pclk_en -path short -nosplit
report_timing -from i_i2c_ic_clk_in_a -path short -nosplit
report_timing -from i_i2c_ic_data_in_a -path short -nosplit


echo "RPT_INFO:Output Ports  "

echo "RPT_INFO:Port Group Interface ex_i_ahb_AHB_Master"
report_timing -to   ex_i_ahb_AHB_Master_hrdata -path short -nosplit
report_timing -to   ex_i_ahb_AHB_Master_hready -path short -nosplit
report_timing -to   ex_i_ahb_AHB_Master_hresp -path short -nosplit
report_timing -to   ex_i_ahb_AHB_Master_hgrant -path short -nosplit
echo "RPT_INFO:Port Group Interface ex_i_ahb_AHB_Slave"
report_timing -to   ex_i_ahb_AHB_Slave_haddr -path short -nosplit
report_timing -to   ex_i_ahb_AHB_Slave_hburst -path short -nosplit
report_timing -to   ex_i_ahb_AHB_Slave_hmastlock -path short -nosplit
report_timing -to   ex_i_ahb_AHB_Slave_hprot -path short -nosplit
report_timing -to   ex_i_ahb_AHB_Slave_hready -path short -nosplit
report_timing -to   ex_i_ahb_AHB_Slave_hsel -path short -nosplit
report_timing -to   ex_i_ahb_AHB_Slave_hsize -path short -nosplit
report_timing -to   ex_i_ahb_AHB_Slave_htrans -path short -nosplit
report_timing -to   ex_i_ahb_AHB_Slave_hwdata -path short -nosplit
report_timing -to   ex_i_ahb_AHB_Slave_hwrite -path short -nosplit
echo "RPT_INFO:Port Group Manually exported pins"
report_timing -to   i_i2c_ic_en  -path short -nosplit
report_timing -to   i_i2c_ic_rd_req_intr -path short -nosplit
report_timing -to   i_i2c_ic_gen_call_intr -path short -nosplit
report_timing -to   i_i2c_ic_tx_empty_intr -path short -nosplit
report_timing -to   i_i2c_ic_data_oe -path short -nosplit
report_timing -to   i_i2c_ic_clk_oe -path short -nosplit
report_timing -to   i_i2c_ic_activity_intr -path short -nosplit
report_timing -to   i_i2c_debug_wr -path short -nosplit
report_timing -to   i_i2c_ic_rx_done_intr -path short -nosplit
report_timing -to   i_i2c_ic_rx_full_intr -path short -nosplit
report_timing -to   i_i2c_ic_rx_over_intr -path short -nosplit
report_timing -to   i_i2c_ic_rx_under_intr -path short -nosplit
report_timing -to   i_i2c_ic_start_det_intr -path short -nosplit
report_timing -to   i_i2c_ic_stop_det_intr -path short -nosplit
report_timing -to   i_i2c_ic_tx_abrt_intr -path short -nosplit
report_timing -to   i_i2c_ic_tx_over_intr -path short -nosplit
report_timing -to   i_i2c_debug_data -path short -nosplit
report_timing -to   i_ahb_ahbarbint -path short -nosplit
report_timing -to   i_ahb_hmaster_data -path short -nosplit
report_timing -to   i_ahb_hrdata_s0 -path short -nosplit
report_timing -to   i_ahb_hready_resp_s0 -path short -nosplit
report_timing -to   i_ahb_hresp_s0 -path short -nosplit
report_timing -to   i_ahb_hsel_s0 -path short -nosplit
report_timing -to   i_i2c_debug_addr -path short -nosplit
report_timing -to   i_i2c_debug_addr_10bit -path short -nosplit
report_timing -to   i_i2c_debug_slv_cstate -path short -nosplit
report_timing -to   i_i2c_debug_hs -path short -nosplit
report_timing -to   i_i2c_debug_master_act -path short -nosplit
report_timing -to   i_i2c_debug_mst_cstate -path short -nosplit
report_timing -to   i_i2c_debug_p_gen -path short -nosplit
report_timing -to   i_i2c_debug_rd -path short -nosplit
report_timing -to   i_i2c_debug_s_gen -path short -nosplit
report_timing -to   i_i2c_debug_slave_act -path short -nosplit


