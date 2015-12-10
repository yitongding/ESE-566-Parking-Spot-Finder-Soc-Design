
module parking ( HCLK_hclk, HRESETn_hresetn, PCLK_pclk, PRESETn_presetn, 
        ex_i_ahb_AHB_Master_haddr, ex_i_ahb_AHB_Master_hburst, 
        ex_i_ahb_AHB_Master_hbusreq, ex_i_ahb_AHB_Master_hlock, 
        ex_i_ahb_AHB_Master_hprot, ex_i_ahb_AHB_Master_hsize, 
        ex_i_ahb_AHB_Master_htrans, ex_i_ahb_AHB_Master_hwdata, 
        ex_i_ahb_AHB_Master_hwrite, ex_i_ahb_AHB_Master_hgrant, 
        ex_i_ahb_AHB_Master_hrdata, ex_i_ahb_AHB_Master_hready, 
        ex_i_ahb_AHB_Master_hresp, ex_i_ahb_AHB_Slave_hrdata, 
        ex_i_ahb_AHB_Slave_hready_resp, ex_i_ahb_AHB_Slave_hresp, 
        ex_i_ahb_AHB_Slave_haddr, ex_i_ahb_AHB_Slave_hburst, 
        ex_i_ahb_AHB_Slave_hmastlock, ex_i_ahb_AHB_Slave_hprot, 
        ex_i_ahb_AHB_Slave_hready, ex_i_ahb_AHB_Slave_hsel, 
        ex_i_ahb_AHB_Slave_hsize, ex_i_ahb_AHB_Slave_htrans, 
        ex_i_ahb_AHB_Slave_hwdata, ex_i_ahb_AHB_Slave_hwrite, i_ahb_pause, 
        i_apb_pclk_en, i_i2c_ic_clk, i_i2c_ic_clk_in_a, i_i2c_ic_data_in_a, 
        i_i2c_ic_rst_n, i_ahb_ahbarbint, i_ahb_hmaster_data, i_ahb_hrdata_s0, 
        i_ahb_hready_resp_s0, i_ahb_hresp_s0, i_ahb_hsel_s0, i_i2c_debug_addr, 
        i_i2c_debug_addr_10bit, i_i2c_debug_data, i_i2c_debug_hs, 
        i_i2c_debug_master_act, i_i2c_debug_mst_cstate, i_i2c_debug_p_gen, 
        i_i2c_debug_rd, i_i2c_debug_s_gen, i_i2c_debug_slave_act, 
        i_i2c_debug_slv_cstate, i_i2c_debug_wr, i_i2c_ic_activity_intr, 
        i_i2c_ic_clk_oe, i_i2c_ic_data_oe, i_i2c_ic_en, i_i2c_ic_gen_call_intr, 
        i_i2c_ic_rd_req_intr, i_i2c_ic_rx_done_intr, i_i2c_ic_rx_full_intr, 
        i_i2c_ic_rx_over_intr, i_i2c_ic_rx_under_intr, i_i2c_ic_start_det_intr, 
        i_i2c_ic_stop_det_intr, i_i2c_ic_tx_abrt_intr, i_i2c_ic_tx_empty_intr, 
        i_i2c_ic_tx_over_intr );
  input [31:0] ex_i_ahb_AHB_Master_haddr;
  input [2:0] ex_i_ahb_AHB_Master_hburst;
  input [3:0] ex_i_ahb_AHB_Master_hprot;
  input [2:0] ex_i_ahb_AHB_Master_hsize;
  input [1:0] ex_i_ahb_AHB_Master_htrans;
  input [31:0] ex_i_ahb_AHB_Master_hwdata;
  output [31:0] ex_i_ahb_AHB_Master_hrdata;
  output [1:0] ex_i_ahb_AHB_Master_hresp;
  input [31:0] ex_i_ahb_AHB_Slave_hrdata;
  input [1:0] ex_i_ahb_AHB_Slave_hresp;
  output [31:0] ex_i_ahb_AHB_Slave_haddr;
  output [2:0] ex_i_ahb_AHB_Slave_hburst;
  output [3:0] ex_i_ahb_AHB_Slave_hprot;
  output [2:0] ex_i_ahb_AHB_Slave_hsize;
  output [1:0] ex_i_ahb_AHB_Slave_htrans;
  output [31:0] ex_i_ahb_AHB_Slave_hwdata;
  output [3:0] i_ahb_hmaster_data;
  output [31:0] i_ahb_hrdata_s0;
  output [1:0] i_ahb_hresp_s0;
  output [4:0] i_i2c_debug_mst_cstate;
  output [3:0] i_i2c_debug_slv_cstate;
  input HCLK_hclk, HRESETn_hresetn, PCLK_pclk, PRESETn_presetn,
         ex_i_ahb_AHB_Master_hbusreq, ex_i_ahb_AHB_Master_hlock,
         ex_i_ahb_AHB_Master_hwrite, ex_i_ahb_AHB_Slave_hready_resp,
         i_ahb_pause, i_apb_pclk_en, i_i2c_ic_clk, i_i2c_ic_clk_in_a,
         i_i2c_ic_data_in_a, i_i2c_ic_rst_n;
  output ex_i_ahb_AHB_Master_hgrant, ex_i_ahb_AHB_Master_hready,
         ex_i_ahb_AHB_Slave_hmastlock, ex_i_ahb_AHB_Slave_hready,
         ex_i_ahb_AHB_Slave_hsel, ex_i_ahb_AHB_Slave_hwrite, i_ahb_ahbarbint,
         i_ahb_hready_resp_s0, i_ahb_hsel_s0, i_i2c_debug_addr,
         i_i2c_debug_addr_10bit, i_i2c_debug_data, i_i2c_debug_hs,
         i_i2c_debug_master_act, i_i2c_debug_p_gen, i_i2c_debug_rd,
         i_i2c_debug_s_gen, i_i2c_debug_slave_act, i_i2c_debug_wr,
         i_i2c_ic_activity_intr, i_i2c_ic_clk_oe, i_i2c_ic_data_oe,
         i_i2c_ic_en, i_i2c_ic_gen_call_intr, i_i2c_ic_rd_req_intr,
         i_i2c_ic_rx_done_intr, i_i2c_ic_rx_full_intr, i_i2c_ic_rx_over_intr,
         i_i2c_ic_rx_under_intr, i_i2c_ic_start_det_intr,
         i_i2c_ic_stop_det_intr, i_i2c_ic_tx_abrt_intr, i_i2c_ic_tx_empty_intr,
         i_i2c_ic_tx_over_intr;
  wire   n11184, i_apb_hready_resp, i_apb_penable, i_apb_pwrite,
         i_ahb_hresp_none_0_, i_ahb_hready_resp_none, i_ahb_hmaster_0_,
         i_apb_psel_en, i_apb_paddr_wr_0_, i_i2c_rx_full, i_i2c_rx_push_sync,
         i_i2c_abrt_in_rcve_trns, i_i2c_split_start_en, i_i2c_ack_det,
         i_i2c_ic_bus_idle, i_i2c_slv_addressed, i_i2c_slv_ack_det,
         i_i2c_p_det, i_i2c_sda_vld, i_i2c_sda_int, i_i2c_slv_rx_2addr,
         i_i2c_rx_addr_match, i_i2c_slv_rxbyte_rdy, i_i2c_rx_slv_read,
         i_i2c_mst_rxbyte_rdy, i_i2c_scl_int, i_i2c_slv_rx_ack_vld,
         i_i2c_mst_rx_bwen, i_i2c_rx_scl_hcnt_en, i_i2c_rx_scl_lcnt_en,
         i_i2c_mst_rx_data_scl, i_i2c_mst_rx_ack_vld, i_i2c_slv_tx_ack_vld,
         i_i2c_mst_tx_ack_vld, i_i2c_scl_p_setup_cmplt,
         i_i2c_scl_s_setup_cmplt, i_i2c_scl_s_hld_cmplt, i_i2c_scl_lcnt_cmplt,
         i_i2c_scl_p_setup_en, i_i2c_scl_s_setup_en, i_i2c_scl_hcnt_en,
         i_i2c_slv_tx_cmplt, i_i2c_slv_tx_ready_unconn, i_i2c_scl_hld_low_en,
         i_i2c_byte_wait_scl, i_i2c_slv_rx_aborted_sync, i_i2c_activity,
         i_i2c_slv_activity_sync, i_i2c_mst_activity_sync, i_i2c_tx_empty_ctrl,
         i_i2c_slv_fifo_filled_and_flushed, i_i2c_slv_rx_aborted,
         i_i2c_ic_ack_general_call_sync, i_i2c_ic_slave_en_sync,
         i_i2c_p_det_ifaddr_sync, i_i2c_ic_abort_sync, i_i2c_ic_enable_sync,
         i_i2c_ic_ack_general_call, i_i2c_p_det_ifaddr, i_i2c_ic_rstrt_en,
         i_i2c_ic_10bit_slv, i_i2c_set_tx_empty_en_flg,
         i_i2c_slv_clr_leftover_flg, i_i2c_rx_push_flg, i_i2c_tx_pop_flg,
         i_i2c_rx_gen_call_flg, i_i2c_s_det_flg, i_i2c_p_det_flg,
         i_i2c_ic_rd_req_flg, i_i2c_rx_done_flg, i_i2c_tx_abrt_flg,
         i_i2c_rx_addr_10bit, i_i2c_re_start_en, i_i2c_start_en,
         i_i2c_set_tx_empty_en, i_i2c_rx_push, i_i2c_tx_pop, i_i2c_rx_gen_call,
         i_i2c_s_det, i_i2c_p_det_intr, i_i2c_slv_activity, i_i2c_mst_activity,
         i_ahb_U_arb_csilt, i_ahb_U_arb_def_mst_0_, i_ahb_U_arb_ebten,
         i_ahb_U_dfltslv_N4, i_ahb_U_dfltslv_next_state,
         i_apb_U_DW_apb_ahbsif_N739, i_apb_U_DW_apb_ahbsif_use_saved_c,
         i_apb_U_DW_apb_ahbsif_piped_hwrite_c,
         i_apb_U_DW_apb_ahbsif_pipeline_c,
         i_apb_U_DW_apb_ahbsif_use_saved_data,
         i_apb_U_DW_apb_ahbsif_nextstate_1_, i_i2c_U_DW_apb_i2c_toggle_N29,
         i_i2c_U_DW_apb_i2c_toggle_N28, i_i2c_U_DW_apb_i2c_toggle_N27,
         i_i2c_U_DW_apb_i2c_toggle_rx_gen_call_r,
         i_i2c_U_DW_apb_i2c_toggle_tx_abrt,
         i_i2c_U_DW_apb_i2c_sync_tx_empty_sync_r,
         i_i2c_U_DW_apb_i2c_sync_ic_rstrt_en_sync_inv,
         i_i2c_U_DW_apb_i2c_sync_ic_10bit_slv_sync_inv,
         i_i2c_U_DW_apb_i2c_sync_tx_empty_int_inv,
         i_i2c_U_DW_apb_i2c_sync_ic_10bit_mst_sync_inv,
         i_i2c_U_DW_apb_i2c_sync_ic_master_sync_inv,
         i_i2c_U_DW_apb_i2c_intctl_N4,
         i_i2c_U_DW_apb_i2c_intctl_set_tx_empty_en_flg_sync_q,
         i_i2c_U_DW_apb_i2c_intctl_slv_clr_leftover_flg_sync_q,
         i_i2c_U_DW_apb_i2c_intctl_rx_gen_call_flg_sync_q,
         i_i2c_U_DW_apb_i2c_intctl_s_det_flg_sync_q,
         i_i2c_U_DW_apb_i2c_intctl_p_det_flg_sync_q,
         i_i2c_U_DW_apb_i2c_intctl_ic_rd_req_flg_sync_q,
         i_i2c_U_DW_apb_i2c_intctl_rx_done_flg_sync_q,
         i_i2c_U_DW_apb_i2c_intctl_tx_abrt_flg_sync_q,
         i_i2c_U_DW_apb_i2c_intctl_set_tx_empty_en_flg_sync,
         i_i2c_U_DW_apb_i2c_intctl_slv_clr_leftover_flg_sync,
         i_i2c_U_DW_apb_i2c_intctl_rx_gen_call_flg_sync,
         i_i2c_U_DW_apb_i2c_intctl_s_det_flg_sync,
         i_i2c_U_DW_apb_i2c_intctl_p_det_flg_sync,
         i_i2c_U_DW_apb_i2c_intctl_ic_rd_req_flg_sync,
         i_i2c_U_DW_apb_i2c_intctl_rx_done_flg_sync,
         i_i2c_U_DW_apb_i2c_intctl_tx_abrt_flg_sync,
         i_i2c_U_DW_apb_i2c_tx_shift_N395, i_i2c_U_DW_apb_i2c_tx_shift_N394,
         i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_ready_dly2,
         i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_ready_dly1,
         i_i2c_U_DW_apb_i2c_tx_shift_N280,
         i_i2c_U_DW_apb_i2c_tx_shift_stop_sda_gate_r,
         i_i2c_U_DW_apb_i2c_tx_shift_N271,
         i_i2c_U_DW_apb_i2c_tx_shift_start_sda_gate_r,
         i_i2c_U_DW_apb_i2c_tx_shift_slv_data_sda,
         i_i2c_U_DW_apb_i2c_tx_shift_data_sda,
         i_i2c_U_DW_apb_i2c_tx_shift_data_sda_prev_r,
         i_i2c_U_DW_apb_i2c_tx_shift_stop_sda,
         i_i2c_U_DW_apb_i2c_tx_shift_re_start_sda,
         i_i2c_U_DW_apb_i2c_tx_shift_re_start_sda_r,
         i_i2c_U_DW_apb_i2c_tx_shift_start_sda,
         i_i2c_U_DW_apb_i2c_tx_shift_byte_wait_en,
         i_i2c_U_DW_apb_i2c_tx_shift_mst_tx_bwen,
         i_i2c_U_DW_apb_i2c_tx_shift_data_scl_lcnt_en,
         i_i2c_U_DW_apb_i2c_tx_shift_re_scl_s_hld_en,
         i_i2c_U_DW_apb_i2c_tx_shift_st_scl_s_hld_en,
         i_i2c_U_DW_apb_i2c_tx_shift_N84,
         i_i2c_U_DW_apb_i2c_tx_shift_mst_slv_ack_ext_r,
         i_i2c_U_DW_apb_i2c_tx_shift_mst_slv_ack_ext,
         i_i2c_U_DW_apb_i2c_tx_shift_N73,
         i_i2c_U_DW_apb_i2c_tx_shift_ic_data_oe_early,
         i_i2c_U_DW_apb_i2c_tx_shift_scl_hld_low_en_r,
         i_i2c_U_DW_apb_i2c_tx_shift_stop_scl_lcnt_en,
         i_i2c_U_DW_apb_i2c_tx_shift_re_start_scl_lcnt_en,
         i_i2c_U_DW_apb_i2c_tx_shift_re_start_scl,
         i_i2c_U_DW_apb_i2c_tx_shift_stop_scl,
         i_i2c_U_DW_apb_i2c_tx_shift_data_scl,
         i_i2c_U_DW_apb_i2c_rx_shift_rx_slv_read_s,
         i_i2c_U_DW_apb_i2c_rx_shift_N29,
         i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_bit_count_3_,
         i_i2c_U_DW_apb_i2c_slvfsm_N284,
         i_i2c_U_DW_apb_i2c_slvfsm_ic_enable_sync_vld,
         i_i2c_U_DW_apb_i2c_slvfsm_slv_tx_flush, i_i2c_U_DW_apb_i2c_slvfsm_N39,
         i_i2c_U_DW_apb_i2c_slvfsm_N38, i_i2c_U_DW_apb_i2c_slvfsm_N37,
         i_i2c_U_DW_apb_i2c_slvfsm_N36, i_i2c_U_DW_apb_i2c_mstfsm_N457,
         i_i2c_U_DW_apb_i2c_mstfsm_mst_gen_ack_en_r,
         i_i2c_U_DW_apb_i2c_mstfsm_N399, i_i2c_U_DW_apb_i2c_mstfsm_N362,
         i_i2c_U_DW_apb_i2c_mstfsm_delay_stop_en,
         i_i2c_U_DW_apb_i2c_mstfsm_ic_abort_chk_win,
         i_i2c_U_DW_apb_i2c_mstfsm_abrt_in_idle,
         i_i2c_U_DW_apb_i2c_mstfsm_mst_tx_flush,
         i_i2c_U_DW_apb_i2c_mstfsm_byte_waiting_q,
         i_i2c_U_DW_apb_i2c_mstfsm_old_is_read, i_i2c_U_DW_apb_i2c_mstfsm_N71,
         i_i2c_U_DW_apb_i2c_mstfsm_N70, i_i2c_U_DW_apb_i2c_mstfsm_N69,
         i_i2c_U_DW_apb_i2c_mstfsm_N68, i_i2c_U_DW_apb_i2c_mstfsm_N67,
         i_i2c_U_DW_apb_i2c_mstfsm_addr_1byte_sent,
         i_i2c_U_DW_apb_i2c_mstfsm_addr_2byte_sent,
         i_i2c_U_DW_apb_i2c_rx_filter_N199,
         i_i2c_U_DW_apb_i2c_rx_filter_slv_arb_lost,
         i_i2c_U_DW_apb_i2c_rx_filter_mst_arb_lost,
         i_i2c_U_DW_apb_i2c_rx_filter_N165,
         i_i2c_U_DW_apb_i2c_rx_filter_sda_cnt_0_,
         i_i2c_U_DW_apb_i2c_rx_filter_sda_post_hold_done,
         i_i2c_U_DW_apb_i2c_rx_filter_N101, i_i2c_U_DW_apb_i2c_rx_filter_N100,
         i_i2c_U_DW_apb_i2c_rx_filter_N99, i_i2c_U_DW_apb_i2c_rx_filter_N98,
         i_i2c_U_DW_apb_i2c_rx_filter_N97, i_i2c_U_DW_apb_i2c_rx_filter_N96,
         i_i2c_U_DW_apb_i2c_rx_filter_N95, i_i2c_U_DW_apb_i2c_rx_filter_N94,
         i_i2c_U_DW_apb_i2c_rx_filter_sda_data_int,
         i_i2c_U_DW_apb_i2c_rx_filter_N64, i_i2c_U_DW_apb_i2c_rx_filter_N63,
         i_i2c_U_DW_apb_i2c_rx_filter_N62, i_i2c_U_DW_apb_i2c_rx_filter_N61,
         i_i2c_U_DW_apb_i2c_rx_filter_N60, i_i2c_U_DW_apb_i2c_rx_filter_N59,
         i_i2c_U_DW_apb_i2c_rx_filter_N58, i_i2c_U_DW_apb_i2c_rx_filter_N57,
         i_i2c_U_DW_apb_i2c_rx_filter_scl_clk_int,
         i_i2c_U_DW_apb_i2c_rx_filter_s_det_int,
         i_i2c_U_DW_apb_i2c_rx_filter_sda_int_q,
         i_i2c_U_DW_apb_i2c_rx_filter_scl_int_q,
         i_i2c_U_DW_apb_i2c_clk_gen_scl_int_d,
         i_i2c_U_DW_apb_i2c_clk_gen_scl_hcnt_cmplt_int,
         i_i2c_U_DW_apb_i2c_clk_gen_N13, i_i2c_U_DW_apb_i2c_clk_gen_count_en,
         i_i2c_U_DW_apb_i2c_regfile_fix_c,
         i_i2c_U_DW_apb_i2c_regfile_fifo_rst_n_int,
         i_i2c_U_DW_apb_i2c_regfile_N402,
         i_i2c_U_DW_apb_i2c_regfile_ic_con_pre_6_,
         i_i2c_U_DW_apb_i2c_regfile_slv_activity_r,
         i_i2c_U_DW_apb_i2c_regfile_mst_activity_r,
         i_i2c_U_DW_apb_i2c_regfile_activity_r,
         i_i2c_U_DW_apb_i2c_fifo_wrdc_tx_unconn_2_,
         i_i2c_U_DW_apb_i2c_fifo_rx_error_ir,
         i_i2c_U_DW_apb_i2c_fifo_tx_error_ir,
         i_i2c_U_DW_apb_i2c_fifo_rx_push_sync_dly,
         i_i2c_U_DW_apb_i2c_fifo_rx_pop_dly,
         i_i2c_U_DW_apb_i2c_fifo_tx_push_dly,
         i_i2c_U_DW_apb_i2c_fifo_rx_push_flg_sync_q,
         i_i2c_U_DW_apb_i2c_fifo_tx_pop_flg_sync_q,
         i_i2c_U_DW_apb_i2c_fifo_rx_push_flg_sync,
         i_i2c_U_DW_apb_i2c_fifo_tx_pop_flg_sync, i_ahb_U_arb_U_arbif_ebt,
         i_ahb_U_arb_U_arbif_N82, i_ahb_U_arb_U_arbif_nxt_state_1_,
         i_ahb_U_arb_U_arbif_r_hmaster_d_0_, i_ahb_U_arb_U_arbif_r_htrans_d_1_,
         i_ahb_U_arb_U_arbif_r_hsel_arb_d, i_ahb_U_arb_U_ebt_reg_set_ebt,
         i_ahb_U_arb_U_mask_r_mask_locked_1_, i_ahb_U_arb_U_mask_extend_ltip,
         i_ahb_U_arb_U_gctrl_r_hmaster_d_0_, i_ahb_U_arb_U_gctrl_wasinn,
         i_ahb_U_arb_U_gctrl_nxt_lock_sm_2_, i_ahb_U_arb_U_gctrl_ihlock,
         i_ahb_U_arb_U_gctrl_bus_hgrant_0_,
         i_i2c_U_DW_apb_i2c_sync_U_ic_enable_sync_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_sync_U_ic_abort_sync_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_sync_U_ic_gen_call_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_sync_U_ic_master_1_sync_N2,
         i_i2c_U_DW_apb_i2c_sync_U_ic_master_1_sync_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_sync_U_ic_10bit_mst_1_sync_N2,
         i_i2c_U_DW_apb_i2c_sync_U_ic_10bit_mst_1_sync_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_sync_U_tx_empty_sync_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_sync_U_ic_10bit_slv_1_sync_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_sync_U_ic_rstrt_en_1_sync_N2,
         i_i2c_U_DW_apb_i2c_sync_U_ic_rstrt_en_1_sync_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_sync_U_ic_slave_en_1_sync_N2,
         i_i2c_U_DW_apb_i2c_sync_U_ic_slave_en_1_sync_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_sync_U_p_det_ifaddr_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_flg_sync_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_intctl_U_rx_done_flg_sync_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_intctl_U_ic_rd_req_flg_sync_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_intctl_U_p_det_flg_sync_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_intctl_U_s_det_flg_sync_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_intctl_U_rx_gen_call_flg_sync_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_intctl_U_slv_clr_leftover_flg_sync_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_intctl_U_set_tx_empty_en_flg_sync_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_intctl_U_mst_activity_sync_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_intctl_U_slv_activity_sync_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_intctl_U_slv_rx_aborted_sync_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_intctl_U_slv_fifo_filled_and_flushed_sync_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_rx_filter_U_scl_sync_data_d_int_0_,
         i_i2c_U_DW_apb_i2c_rx_filter_U_sda_sync_data_d_int_0_,
         i_i2c_U_DW_apb_i2c_fifo_U_tx_pop_flg_sync_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_fifo_U_rx_push_flg_sync_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N46,
         i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N45,
         i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N43,
         i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N42,
         i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N40,
         i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N39,
         i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N38,
         i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N33,
         i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_almost_empty_n,
         i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_wr_addr_at_max,
         i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_empty_n,
         i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N46,
         i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N45,
         i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N43,
         i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N42,
         i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N40,
         i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N39,
         i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N38,
         i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N36,
         i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N33,
         i_i2c_U_DW_apb_i2c_rx_filter_U_scl_sync_U_SYNC_N2,
         i_i2c_U_DW_apb_i2c_rx_filter_U_scl_sync_U_SYNC_next_sample_syncm1_0_,
         i_i2c_U_DW_apb_i2c_rx_filter_U_sda_sync_U_SYNC_next_sample_syncm1_0_,
         n3795, n3796, n3797, n3798, n3799, n3800, n3801, n3802, n3803, n3804,
         n3805, n3806, n3807, n3808, n3809, n3810, n3811, n3812, n3813, n3814,
         n3815, n3816, n3817, n3818, n3819, n3820, n3821, n3822, n3823, n3824,
         n3825, n3826, n3827, n3828, n3829, n3830, n3831, n3832, n3833, n3834,
         n3835, n3836, n3837, n3838, n3839, n3840, n3841, n3842, n3843, n3844,
         n3845, n3846, n3847, n3848, n3849, n3850, n3851, n3852, n3853, n3854,
         n3855, n3856, n3857, n3858, n3859, n3860, n3861, n3862, n3863, n3864,
         n3865, n3866, n3867, n3868, n3869, n3870, n3871, n3872, n3873, n3874,
         n3875, n3876, n3877, n3878, n3879, n3880, n3881, n3882, n3883, n3884,
         n3885, n3886, n3887, n3888, n3889, n3890, n3891, n3892, n3893, n3894,
         n3895, n3896, n3897, n3898, n3899, n3900, n3901, n3902, n3903, n3904,
         n3905, n3906, n3907, n3908, n3909, n3910, n3911, n3912, n3913, n3914,
         n3915, n3916, n3917, n3918, n3919, n3920, n3921, n3922, n3923, n3924,
         n3925, n3926, n3927, n3928, n3929, n3933, n3934, n3935, n3936, n3937,
         n3938, n3939, n3940, n3941, n3942, n3943, n3944, n3945, n3946, n3947,
         n3948, n3949, n3950, n3951, n3952, n3953, n3954, n3955, n3956, n3957,
         n3958, n3963, n3964, n3965, n3966, n3968, n3970, n3971, n3972, n3973,
         n3974, n3975, n3976, n3977, n3978, n3979, n3980, n3981, n3982, n3983,
         n3984, n3985, n3986, n3987, n3988, n3989, n3990, n3991, n3992, n3993,
         n3994, n3995, n3996, n3997, n3998, n3999, n4000, n4001, n4002, n4003,
         n4004, n4005, n4006, n4007, n4008, n4009, n4010, n4011, n4012, n4013,
         n4014, n4015, n4016, n4017, n4018, n4019, n4020, n4021, n4022, n4023,
         n4024, n4025, n4026, n4027, n4028, n4029, n4030, n4031, n4032, n4033,
         n4034, n4035, n4036, n4037, n4038, n4039, n4040, n4041, n4042, n4043,
         n4044, n4045, n4046, n4047, n4048, n4049, n4050, n4051, n4052, n4053,
         n4054, n4055, n4056, n4057, n4058, n4059, n4060, n4061, n4062, n4063,
         n4064, n4065, n4066, n4067, n4068, n4069, n4070, n4071, n4072, n4073,
         n4074, n4075, n4076, n4077, n4078, n4079, n4080, n4081, n4082, n4083,
         n4084, n4085, n4086, n4087, n4088, n4089, n4090, n4091, n4092, n4093,
         n4094, n4095, n4096, n4097, n4098, n4099, n4100, n4101, n4102, n4103,
         n4104, n4105, n4106, n4107, n4108, n4109, n4110, n4111, n4112, n4113,
         n4114, n4115, n4116, n4117, n4118, n4119, n4120, n4121, n4122, n4123,
         n4124, n4125, n4126, n4127, n4128, n4129, n4130, n4131, n4132, n4133,
         n4134, n4135, n4136, n4137, n4138, n4139, n4140, n4141, n4142, n4143,
         n4144, n4145, n4146, n4147, n4148, n4149, n4150, n4151, n4152, n4153,
         n4154, n4155, n4156, n4157, n4158, n4159, n4160, n4161, n4162, n4163,
         n4164, n4165, n4166, n4167, n4168, n4169, n4170, n4171, n4172, n4173,
         n4174, n4175, n4176, n4177, n4178, n4179, n4180, n4181, n4182, n4183,
         n4184, n4185, n4186, n4187, n4188, n4189, n4190, n4191, n4192, n4193,
         n4194, n4195, n4196, n4197, n4198, n4199, n4200, n4201, n4202, n4203,
         n4204, n4205, n4206, n4207, n4208, n4209, n4210, n4211, n4212, n4213,
         n4214, n4215, n4216, n4217, n4218, n4219, n4220, n4221, n4222, n4223,
         n4224, n4225, n4226, n4227, n4228, n4229, n4230, n4231, n4232, n4233,
         n4234, n4235, n4236, n4237, n4238, n4239, n4240, n4241, n4242, n4243,
         n4244, n4245, n4246, n4247, n4248, n4249, n4250, n4251, n4252, n4253,
         n4254, n4256, n4257, n4258, n4259, n4260, n4261, n4262, n4263, n4264,
         n4265, n4266, n4267, n4268, n4269, n4270, n4271, n4272, n4273, n4274,
         n4275, n4276, n4277, n4278, n4279, n4280, n4281, n4282, n4283, n4284,
         n4285, n4286, n4287, n4288, n4289, n4290, n4291, n4292, n4293, n4294,
         n4295, n4296, n4297, n4298, n4299, n4300, n4301, n4302, n4303, n4304,
         n4305, n4306, n4307, n4308, n4309, n4310, n4311, n4312, n4313, n4314,
         n4315, n4316, n4317, n4318, n4319, n4320, n4321, n4322, n4323, n4324,
         n4325, n4326, n4327, n4328, n4329, n4330, n4331, n4332, n4333, n4334,
         n4335, n4336, n4337, n4338, n4339, n4340, n4341, n4342, n4343, n4344,
         n4345, n4346, n4347, n4348, n4349, n4350, n4351, n4352, n4353, n4354,
         n4355, n4356, n4357, n4358, n4359, n4360, n4361, n4362, n4363, n4364,
         n4365, n4366, n4367, n4368, n4369, n4370, n4371, n4372, n4373, n4374,
         n4375, n4376, n4377, n4378, n4379, n4380, n4381, n4382, n4383, n4384,
         n4385, n4386, n4387, n4388, n4390, n4391, n4392, n4393, n4394, n4395,
         n4396, n4397, n4398, n4399, n4400, n4403, n4404, n4405, n4406, n4407,
         n4408, n4409, n4410, n4412, n4414, n4415, n4416, n4417, n4418, n4419,
         n4420, n4421, n4422, n4423, n4424, n4425, n4426, n4427, n4428, n4429,
         n4430, n4431, n4432, n4433, n4434, n4435, n4436, n4437, n4438, n4439,
         n4440, n4441, n4442, n4443, n4444, n4445, n4446, n4447, n4448, n4449,
         n4450, n4451, n4452, n4453, n4454, n4455, n4457, n4463, n4464, n4465,
         n4471, n4472, n4473, n4474, n4475, n4476, n4477, n4478, n4479, n4480,
         n4481, n4482, n4483, n4484, n4485, n4486, n4487, n4488, n4489, n4490,
         n4491, n4492, n4493, n4494, n4495, n4496, n4497, n4498, n4499, n4500,
         n4501, n4502, n4503, n4504, n4505, n4506, n4507, n4535, n4539, n4540,
         n4541, n4542, n4543, n4544, n4545, n4546, n4547, n4548, n4549, n4550,
         n4551, n4552, n4553, n4554, n4555, n4556, n4557, n4558, n4559, n4560,
         n4561, n4562, n4563, n4564, n4565, n4566, n4567, n4568, n4569, n4570,
         n4571, n4572, n4573, n4574, n4575, n4576, n4577, n4578, n4579, n4580,
         n4581, n4582, n4583, n4584, n4585, n4586, n4587, n4588, n4589, n4590,
         n4591, n4592, n4593, n4594, n4595, n4596, n4597, n4598, n4599, n4600,
         n4601, n4602, n4603, n4604, n4605, n4606, n4607, n4608, n4609, n4610,
         n4611, n4612, n4613, n4614, n4615, n4616, n4617, n4618, n4619, n4620,
         n4621, n4622, n4623, n4624, n4625, n4626, n4627, n4628, n4629, n4630,
         n4631, n4647, n4651, n4652, n4653, n4654, n4655, n4656, n4657, n4658,
         n4659, n4660, n4661, n4662, n4663, n4664, n4667, n4668, n4684, n4746,
         n4760, n4763, n4765, n4766, n4767, n4769, n4770, n4771, n4772, n4773,
         n4774, n4775, n4776, n4777, n4778, n4779, n4782, n4783, n4785, n4786,
         n4788, n4789, n4791, n4792, n4795, n4796, n4798, n4799, n4800, n4802,
         n4803, n4805, n4806, n4807, n4808, n4809, n4810, n4811, n4812, n4813,
         n4814, n4815, n4816, n4817, n4818, n4819, n4820, n4821, n4822, n4823,
         n4825, n4850, n4851, n4852, n4853, n4854, n4855, n4856, n4857, n4858,
         n4859, n4860, n4861, n4862, n4863, n4864, n4865, n4866, n4868, n4869,
         n4870, n4871, n4880, n4881, n4882, n4883, n4884, n4885, n4886, n4887,
         n4888, n4889, n4890, n4891, n4892, n4893, n4894, n4895, n4896, n4897,
         n4898, n4899, n4900, n4901, n4902, n4903, n4904, n4905, n4906, n4907,
         n4908, n4909, n4910, n4911, n4912, n4913, n4914, n4915, n4916, n4917,
         n4918, n4919, n4920, n4921, n4922, n4923, n4924, n4925, n4926, n4927,
         n4928, n4929, n4930, n4931, n4932, n4933, n4934, n4935, n4936, n4937,
         n4938, n4939, n4940, n4941, n4942, n4943, n4944, n4945, n4946, n4947,
         n4948, n4949, n4950, n4951, n4952, n4953, n4954, n4955, n4956, n4958,
         n4959, n4960, n4961, n4962, n4963, n4964, n4965, n4966, n4967, n4968,
         n4969, n4970, n4971, n4972, n4973, n4974, n4975, n4976, n4977, n4978,
         n4980, n4981, n4982, n4983, n4984, n4985, n4986, n4987, n4988, n4989,
         n4990, n4991, n4992, n4993, n4994, n4995, n4996, n4997, n4998, n4999,
         n5000, n5001, n5002, n5003, n5004, n5005, n5006, n5007, n5008, n5009,
         n5010, n5011, n5012, n5013, n5014, n5015, n5016, n5017, n5018, n5019,
         n5020, n5021, n5023, n5024, n5025, n5026, n5027, n5028, n5029, n5032,
         n5033, n5034, n5036, n5037, n5038, n5040, n5041, n5042, n5043, n5044,
         n5045, n5046, n5047, n5048, n5049, n5050, n5051, n5052, n5053, n5054,
         n5055, n5056, n5057, n5058, n5059, n5060, n5061, n5062, n5063, n5064,
         n5065, n5066, n5067, n5068, n5069, n5070, n5071, n5072, n5073, n5074,
         n5075, n5076, n5077, n5078, n5079, n5080, n5081, n5082, n5083, n5084,
         n5085, n5086, n5087, n5088, n5089, n5090, n5091, n5092, n5093, n5094,
         n5095, n5096, n5097, n5098, n5099, n5100, n5101, n5102, n5103, n5104,
         n5105, n5107, n5108, n5109, n5110, n5111, n5112, n5113, n5114, n5115,
         n5116, n5117, n5118, n5120, n5121, n5122, n5123, n5124, n5125, n5126,
         n5127, n5128, n5129, n5130, n5131, n5132, n5133, n5134, n5135, n5136,
         n5137, n5139, n5140, n5141, n5142, n5143, n5146, n5147, n5148, n5149,
         n5150, n5151, n5152, n5153, n5154, n5155, n5156, n5157, n5158, n5160,
         n5161, n5162, n5163, n5164, n5165, n5166, n5167, n5169, n5170, n5171,
         n5172, n5173, n5174, n5175, n5176, n5177, n5178, n5181, n5182, n5183,
         n5184, n5185, n5186, n5188, n5189, n5190, n5191, n5192, n5194, n5195,
         n5196, n5197, n5198, n5199, n5200, n5201, n5203, n5204, n5205, n5206,
         n5207, n5208, n5209, n5210, n5211, n5212, n5213, n5214, n5215, n5216,
         n5217, n5218, n5219, n5220, n5221, n5222, n5223, n5224, n5225, n5226,
         n5227, n5228, n5229, n5230, n5231, n5232, n5233, n5234, n5235, n5236,
         n5237, n5239, n5240, n5241, n5242, n5243, n5244, n5245, n5246, n5247,
         n5248, n5249, n5250, n5251, n5252, n5253, n5254, n5255, n5256, n5257,
         n5258, n5259, n5260, n5261, n5262, n5263, n5264, n5265, n5266, n5267,
         n5268, n5269, n5270, n5271, n5272, n5273, n5274, n5275, n5276, n5277,
         n5278, n5279, n5280, n5281, n5282, n5283, n5284, n5285, n5286, n5287,
         n5288, n5289, n5290, n5291, n5292, n5293, n5294, n5295, n5296, n5297,
         n5298, n5299, n5300, n5301, n5303, n5304, n5305, n5306, n5307, n5308,
         n5309, n5310, n5311, n5312, n5313, n5314, n5315, n5316, n5317, n5318,
         n5319, n5320, n5321, n5322, n5324, n5325, n5326, n5327, n5328, n5329,
         n5330, n5331, n5332, n5333, n5334, n5335, n5336, n5337, n5338, n5339,
         n5340, n5341, n5342, n5343, n5344, n5345, n5346, n5347, n5348, n5349,
         n5350, n5352, n5353, n5354, n5355, n5358, n5359, n5360, n5361, n5362,
         n5363, n5364, n5365, n5366, n5367, n5368, n5369, n5370, n5371, n5372,
         n5373, n5374, n5375, n5376, n5377, n5378, n5379, n5380, n5381, n5382,
         n5383, n5384, n5385, n5387, n5388, n5389, n5390, n5391, n5392, n5393,
         n5394, n5395, n5396, n5397, n5398, n5399, n5400, n5401, n5402, n5403,
         n5404, n5405, n5406, n5407, n5408, n5409, n5410, n5411, n5412, n5413,
         n5414, n5415, n5416, n5417, n5418, n5419, n5420, n5421, n5422, n5423,
         n5424, n5425, n5426, n5427, n5428, n5429, n5430, n5431, n5432, n5433,
         n5434, n5435, n5436, n5437, n5438, n5439, n5440, n5441, n5442, n5443,
         n5444, n5445, n5447, n5448, n5449, n5450, n5451, n5452, n5453, n5454,
         n5455, n5456, n5457, n5459, n5460, n5461, n5462, n5463, n5464, n5465,
         n5466, n5467, n5468, n5469, n5470, n5471, n5472, n5473, n5474, n5475,
         n5476, n5477, n5478, n5479, n5480, n5481, n5482, n5483, n5484, n5485,
         n5486, n5487, n5488, n5489, n5490, n5491, n5492, n5493, n5494, n5495,
         n5496, n5497, n5498, n5499, n5500, n5501, n5502, n5503,
         ex_i_ahb_AHB_Slave_hready, n5505, n5506, n5507, n5508, n5509, n5510,
         n5511, n5512, n5513, n5514, n5515, n5516, n5517, n5518, n5519, n5520,
         n5521, n5522, n5523, n5524, n5525, n5526, n5527, n5528, n5529, n5530,
         n5531, n5532, n5533, n5534, n5535, n5536, n5537, n5538, n5539, n5540,
         n5541, n5542, n5543, n5544, n5545, n5546, n5547, n5548, n5549, n5550,
         n5551, n5552, n5553, n5554, n5555, n5556, n5557, n5558, n5559, n5560,
         n5561, n5562, n5563, n5564, n5565, n5566, n5567, n5568, n5569, n5570,
         n5571, n5572, n5573, n5574, n5575, n5576, n5577, n5578, n5579, n5580,
         n5581, n5582, n5583, n5584, n5585, n5586, n5587, n5588, n5589, n5590,
         n5591, n5592, n5593, n5594, n5595, n5596, n5597, n5598, n5599, n5600,
         n5601, n5602, n5603, n5604, n5605, n5606, n5607, n5608, n5609, n5610,
         n5611, n5612, n5613, n5614, n5615, n5616, n5617, n5618, n5619, n5620,
         n5621, n5622, n5623, n5624, n5625, n5626, n5627, n5628, n5629, n5630,
         n5631, n5632, n5633, n5634, n5635, n5636, n5637, n5638, n5639, n5640,
         n5641, n5642, n5643, n5644, n5645, n5646, n5647, n5648, n5649, n5651,
         n5652, n5653, n5654, n5655, n5656, n5657, n5658, n5659, n5660, n5661,
         n5662, n5663, n5664, n5665, n5666, n5667, n5668, n5669, n5670, n5671,
         n5672, n5673, n5674, n5675, n5676, n5677, n5678, n5679, n5680, n5681,
         n5682, n5683, n5684, n5685, n5686, n5687, n5688, n5689, n5690, n5691,
         n5692, n5693, n5694, n5695, n5696, n5697, n5698, n5699, n5700, n5701,
         n5702, n5703, n5704, n5705, n5706, n5707, n5708, n5709, n5710, n5711,
         n5712, n5713, n5714, n5715, n5716, n5717, n5718, n5719, n5720, n5721,
         n5722, n5723, n5724, n5725, n5726, n5727, n5728, n5729, n5730, n5731,
         n5732, n5733, n5734, n5735, n5736, n5737, n5738, n5739, n5740, n5741,
         n5742, n5743, n5744, n5745, n5746, n5747, n5748, n5749, n5750, n5751,
         n5752, n5753, n5754, n5755, n5756, n5757, n5758, n5759, n5760, n5761,
         n5762, n5763, n5764, n5765, n5766, n5767, n5768, n5769, n5770, n5771,
         n5772, n5773, n5775, n5776, n5777, n5778, n5779, n5780, n5781, n5782,
         n5783, n5784, n5785, n5786, n5787, n5788, n5789, n5790, n5791, n5792,
         n5793, n5794, n5795, n5796, n5797, n5798, n5799, n5800, n5801, n5802,
         n5803, n5804, n5805, n5806, n5807, n5808, n5809, n5810, n5811, n5812,
         n5814, n5815, n5816, n5817, n5818, n5819, n5820, n5821, n5822, n5823,
         n5824, n5825, n5826, n5827, n5828, n5829, n5830, n5831, n5832, n5833,
         n5834, n5835, n5836, n5837, n5838, n5839, n5840, n5841, n5842, n5843,
         n5844, n5845, n5846, n5847, n5848, n5849, n5850, n5851, n5852, n5853,
         n5854, n5855, n5856, n5857, n5858, n5859, n5860, n5861, n5862, n5863,
         n5864, n5865, n5866, n5867, n5868, n5869, n5870, n5871, n5872, n5873,
         n5874, n5875, n5876, n5877, n5878, n5879, n5880, n5881, n5882, n5883,
         n5884, n5885, n5886, n5887, n5888, n5889, n5890, n5891, n5892, n5893,
         n5894, n5895, n5896, n5897, n5898, n5899, n5900, n5901, n5902, n5903,
         n5904, n5905, n5906, n5907, n5908, n5909, n5910, n5911, n5912, n5913,
         n5914, n5915, n5916, n5917, n5918, n5919, n5920, n5921, n5922, n5923,
         n5924, n5925, n5926, n5927, n5928, n5929, n5930, n5931, n5932, n5933,
         n5934, n5935, n5936, n5937, n5938, n5939, n5940, n5941, n5942, n5943,
         n5944, n5945, n5946, n5947, n5948, n5949, n5950, n5951, n5952, n5953,
         n5954, n5955, n5956, n5957, n5958, n5959, n5960, n5961, n5962, n5963,
         n5964, n5965, n5966, n5967, n5968, n5969, n5970, n5971, n5972, n5973,
         n5974, n5975, n5976, n5977, n5978, n5979, n5980, n5981, n5982, n5983,
         n5984, n5985, n5986, n5987, n5988, n5989, n5990, n5991, n5992, n5993,
         n5994, n5995, n5996, n5997, n5998, n5999, n6000, n6001, n6002, n6003,
         n6004, n6005, n6006, n6007, n6008, n6009, n6010, n6011, n6012, n6013,
         n6014, n6015, n6016, n6017, n6018, n6019, n6020, n6021, n6022, n6023,
         n6024, n6025, n6026, n6027, n6028, n6029, n6030, n6031, n6032, n6033,
         n6035, n6036, n6037, n6038, n6039, n6040, n6041, n6042, n6043, n6044,
         n6045, n6046, n6047, n6048, n6049, n6050, n6051, n6052, n6053, n6054,
         n6055, n6056, n6058, n6059, n6060, n6061, n6062, n6063, n6064, n6065,
         n6066, n6067, n6068, n6069, n6070, n6071, n6072, n6073, n6074, n6075,
         n6076, n6077, n6078, n6079, n6080, n6081, n6082, n6083, n6084, n6085,
         n6086, n6087, n6088, n6089, n6090, n6091, n6092, n6093, n6094, n6095,
         n6096, n6097, n6098, n6099, n6100, n6101, n6102, n6103, n6104, n6105,
         n6106, n6107, n6108, n6109, n6110, n6111, n6112, n6113, n6114, n6115,
         n6116, n6117, n6118, n6119, n6120, n6121, n6122, n6123, n6124, n6125,
         n6126, n6127, n6128, n6129, n6130, n6131, n6132, n6133, n6134, n6135,
         n6136, n6137, n6138, n6139, n6140, n6141, n6142, n6143, n6144, n6145,
         n6146, n6147, n6148, n6149, n6150, n6151, n6152, n6153, n6154, n6155,
         n6156, n6157, n6158, n6159, n6160, n6161, n6162, n6163, n6164, n6165,
         n6166, n6167, n6168, n6169, n6170, n6171, n6172, n6173, n6174, n6175,
         n6176, n6177, n6178, n6179, n6180, n6181, n6182, n6183, n6184, n6185,
         n6186, n6187, n6188, n6189, n6190, n6191, n6192, n6193, n6194, n6195,
         n6196, n6197, n6198, n6199, n6200, n6201, n6202, n6203, n6204, n6205,
         n6206, n6207, n6208, n6209, n6210, n6211, n6212, n6213, n6214, n6215,
         n6216, n6217, n6218, n6219, n6220, n6221, n6222, n6223, n6224, n6225,
         n6226, n6227, n6228, n6229, n6230, n6231, n6232, n6233, n6234, n6235,
         n6236, n6237, n6238, n6239, n6240, n6241, n6242, n6243, n6244, n6245,
         n6246, n6247, n6248, n6249, n6250, n6251, n6252, n6253, n6254, n6255,
         n6256, n6257, n6258, n6259, n6260, n6261, n6262, n6263, n6264, n6265,
         n6266, n6267, n6268, n6269, n6270, n6271, n6272, n6273, n6274, n6275,
         n6276, n6277, n6278, n6279, n6280, n6281, n6282, n6283, n6284, n6285,
         n6286, n6287, n6288, n6289, n6290, n6291, n6292, n6293, n6294, n6296,
         n6297, n6298, n6299, n6300, n6301, n6302, n6303, n6304, n6305, n6306,
         n6307, n6308, n6309, n6310, n6311, n6312, n6313, n6314, n6315, n6316,
         n6317, n6318, n6319, n6320, n6321, n6322, n6323, n6324, n6325, n6326,
         n6327, n6328, n6329, n6330, n6331, n6332, n6333, n6334, n6335, n6336,
         n6337, n6338, n6339, n6340, n6341, n6342, n6343, n6344, n6345, n6346,
         n6347, n6348, n6349, n6350, n6351, n6352, n6353, n6354, n6355, n6356,
         n6357, n6358, n6359, n6360, n6361, n6362, n6363, n6364, n6365, n6366,
         n6367, n6368, n6369, n6370, n6371, n6372, n6373, n6374, n6375, n6376,
         n6377, n6378, n6379, n6380, n6381, n6382, n6383, n6384, n6385, n6386,
         n6387, n6388, n6389, n6390, n6391, n6392, n6393, n6394, n6395, n6396,
         n6397, n6398, n6399, n6400, n6401, n6402, n6403, n6404, n6405, n6406,
         n6407, n6408, n6409, n6410, n6411, n6412, n6413, n6414, n6415, n6416,
         n6417, n6418, n6419, n6420, n6421, n6422, n6423, n6424, n6425, n6426,
         n6427, n6428, n6429, n6430, n6431, n6432, n6433, n6434, n6435, n6436,
         n6437, n6438, n6439, n6440, n6441, n6442, n6443, n6444, n6445, n6446,
         n6447, n6448, n6449, n6450, n6451, n6452, n6453, n6454, n6455, n6456,
         n6457, n6458, n6459, n6460, n6461, n6462, n6463, n6464, n6465, n6466,
         n6467, n6468, n6469, n6470, n6471, n6472, n6473, n6474, n6475, n6476,
         n6477, n6478, n6479, n6480, n6481, n6482, n6483, n6484, n6485, n6486,
         n6487, n6488, n6489, n6490, n6491, n6492, n6493, n6494, n6495, n6496,
         n6497, n6498, n6499, n6500, n6501, n6502, n6503, n6504, n6505, n6506,
         n6507, n6508, n6509, n6510, n6511, n6512, n6513, n6514, n6515, n6516,
         n6517, n6518, n6519, n6520, n6521, n6522, n6523, n6524, n6525, n6526,
         n6527, n6528, n6529, n6530, n6531, n6532, n6533, n6534, n6535, n6536,
         n6537, n6538, n6539, n6540, n6541, n6542, n6543, n6544, n6545, n6546,
         n6547, n6548, n6549, n6550, n6551, n6552, n6553, n6554, n6555, n6556,
         n6557, n6558, n6559, n6560, n6561, n6562, n6563, n6564, n6565, n6566,
         n6567, n6568, n6569, n6570, n6571, n6572, n6573, n6574, n6575, n6576,
         n6577, n6578, n6579, n6580, n6581, n6582, n6583, n6584, n6585, n6586,
         n6587, n6588, n6589, n6590, n6591, n6592, n6593, n6594, n6595, n6596,
         n6597, n6598, n6599, n6600, n6601, n6602, n6603, n6604, n6605, n6606,
         n6607, n6608, n6609, n6610, n6611, n6612, n6613, n6614, n6615, n6616,
         n6617, n6618, n6619, n6620, n6621, n6622, n6623, n6624, n6625, n6626,
         n6627, n6628, n6629, n6630, n6631, n6632, n6633, n6634, n6635, n6636,
         n6637, n6638, n6639, n6640, n6641, n6642, n6643, n6644, n6645, n6646,
         n6647, n6648, n6649, n6650, n6651, n6652, n6653, n6654, n6655, n6656,
         n6657, n6658, n6659, n6660, n6661, n6662, n6663, n6664, n6665, n6666,
         n6667, n6668, n6669, n6670, n6671, n6672, n6673, n6674, n6675, n6676,
         n6677, n6678, n6679, n6680, n6681, n6682, n6683, n6684, n6685, n6686,
         n6687, n6688, n6689, n6690, n6691, n6692, n6693, n6694, n6695, n6696,
         n6697, n6698, n6699, n6700, n6701, n6702, n6703, n6704, n6705, n6706,
         n6707, n6708, n6709, n6710, n6711, n6712, n6713, n6714, n6715, n6716,
         n6717, n6718, n6719, n6720, n6721, n6722, n6723, n6724, n6725, n6726,
         n6727, n6728, n6729, n6730, n6731, n6732, n6733, n6734, n6735, n6736,
         n6737, n6738, n6739, n6740, n6741, n6742, n6743, n6744, n6745, n6746,
         n6747, n6748, n6749, n6750, n6751, n6752, n6753, n6754, n6755, n6756,
         n6757, n6758, n6759, n6760, n6761, n6762, n6763, n6764, n6765, n6766,
         n6767, n6768, n6769, n6771, n6772, n6774, n6775, n6777, n6778, n6779,
         n6781, n6782, n6783, n6784, n6785, n6786, n6787, n6788, n6789, n6790,
         n6791, n6792, n6793, n6794, n6795, n6796, n6797, n6798, n6799, n6800,
         n6801, n6802, n6803, n6804, n6805, n6806, n6807, n6808, n6809, n6810,
         n6811, n6812, n6813, n6814, n6815, n6816, n6817, n6818, n6819, n6820,
         n6821, n6822, n6823, n6824, n6825, n6826, n6827, n6828, n6829, n6830,
         n6831, n6832, n6833, n6834, n6835, n6836, n6837, n6838, n6839, n6840,
         n6841, n6842, n6843, n6844, n6845, n6846, n6847, n6848, n6849, n6850,
         n6851, n6852, n6853, n6854, n6855, n6856, n6857, n6858, n6859, n6860,
         n6861, n6862, n6863, n6864, n6865, n6866, n6867, n6868, n6869, n6870,
         n6871, n6872, n6873, n6874, n6875, n6876, n6877, n6878, n6879, n6880,
         n6881, n6882, n6883, n6884, n6885, n6886, n6887, n6888, n6889, n6890,
         n6891, n6892, n6893, n6894, n6895, n6896, n6897, n6898, n6899, n6900,
         n6901, n6902, n6903, n6904, n6905, n6906, n6907, n6908, n6909, n6910,
         n6911, n6912, n6913, n6914, n6915, n6916, n6917, n6918, n6919, n6920,
         n6921, n6922, n6923, n6924, n6925, n6926, n6927, n6928, n6929, n6930,
         n6931, n6932, n6933, n6934, n6935, n6936, n6937, n6938, n6939, n6940,
         n6941, n6942, n6943, n6944, n6945, n6946, n6947, n6948, n6949, n6950,
         n6951, n6952, n6953, n6954, n6955, n6956, n6957, n6958, n6959, n6960,
         n6961, n6962, n6963, n6964, n6965, n6966, n6967, n6968, n6969, n6970,
         n6971, n6972, n6973, n6974, n6975, n6976, n6977, n6978, n6979, n6980,
         n6981, n6982, n6983, n6984, n6985, n6986, n6987, n6988, n6989, n6990,
         n6991, n6992, n6993, n6994, n6995, n6996, n6997, n6998, n6999, n7000,
         n7001, n7002, n7003, n7004, n7005, n7006, n7007, n7008, n7009, n7010,
         n7011, n7012, n7013, n7014, n7015, n7016, n7017, n7018, n7019, n7020,
         n7021, n7022, n7023, n7024, n7025, n7026, n7027, n7028, n7029, n7030,
         n7031, n7032, n7033, n7034, n7035, n7036, n7037, n7038, n7039, n7040,
         n7041, n7042, n7043, n7044, n7045, n7046, n7047, n7048, n7049, n7050,
         n7051, n7052, n7053, n7054, n7055, n7056, n7057, n7058, n7059, n7060,
         n7061, n7062, n7063, n7064, n7065, n7066, n7067, n7068, n7069, n7070,
         n7071, n7072, n7073, n7074, n7075, n7076, n7077, n7078, n7079, n7080,
         n7081, n7082, n7083, n7084, n7085, n7086, n7087, n7088, n7089, n7090,
         n7091, n7092, n7093, n7094, n7095, n7096, n7097, n7098, n7099, n7100,
         n7101, n7102, n7103, n7104, n7105, n7106, n7107, n7108, n7109, n7110,
         n7111, n7112, n7113, n7114, n7115, n7116, n7117, n7118, n7119, n7120,
         n7121, n7122, n7123, n7124, n7125, n7126, n7127, n7128, n7129, n7130,
         n7131, n7132, n7133, n7134, n7135, n7136, n7137, n7138, n7139, n7140,
         n7141, n7142, n7143, n7144, n7145, n7146, n7147, n7148, n7149, n7150,
         n7151, n7152, n7153, n7154, n7155, n7156, n7157, n7158, n7159, n7160,
         n7161, n7162, n7163, n7164, n7165, n7166, n7167, n7168, n7169, n7170,
         n7171, n7172, n7173, n7174, n7175, n7176, n7177, n7178, n7179, n7180,
         n7181, n7182, n7183, n7184, n7185, n7186, n7187, n7188, n7189, n7190,
         n7191, n7192, n7193, n7194, n7195, n7196, n7197, n7198, n7199, n7200,
         n7201, n7202, n7203, n7204, n7205, n7206, n7207, n7208, n7209, n7210,
         n7211, n7212, n7213, n7214, n7215, n7216, n7217, n7218, n7219, n7220,
         n7221, n7222, n7223, n7224, n7225, n7226, n7227, n7228, n7229, n7230,
         n7231, n7232, n7233, n7234, n7235, n7236, n7237, n7238, n7239, n7240,
         n7241, n7242, n7243, n7244, n7245, n7246, n7247, n7248, n7249, n7250,
         n7251, n7252, n7253, n7254, n7255, n7256, n7257, n7258, n7259, n7260,
         n7261, n7262, n7263, n7264, n7265, n7266, n7267, n7268, n7269, n7270,
         n7271, n7272, n7273, n7274, n7275, n7276, n7277, n7278, n7279, n7280,
         n7281, n7282, n7283, n7284, n7285, n7286, n7287, n7288, n7289, n7290,
         n7291, n7292, n7293, n7294, n7295, n7296, n7297, n7298, n7299, n7300,
         n7301, n7302, n7303, n7304, n7305, n7306, n7307, n7308, n7309, n7310,
         n7311, n7312, n7313, n7314, n7315, n7316, n7317, n7318, n7319, n7320,
         n7321, n7322, n7323, n7324, n7325, n7326, n7327, n7328, n7329, n7330,
         n7331, n7332, n7333, n7334, n7335, n7336, n7337, n7338, n7339, n7340,
         n7341, n7342, n7343, n7344, n7345, n7346, n7347, n7348, n7349, n7350,
         n7351, n7352, n7353, n7354, n7355, n7356, n7357, n7358, n7359, n7360,
         n7361, n7362, n7363, n7364, n7365, n7366, n7367, n7368, n7369, n7370,
         n7371, n7372, n7373, n7374, n7375, n7376, n7377, n7378, n7379, n7380,
         n7381, n7382, n7383, n7384, n7385, n7386, n7387, n7388, n7389, n7390,
         n7391, n7392, n7393, n7394, n7395, n7396, n7397, n7398, n7399, n7400,
         n7401, n7402, n7403, n7404, n7405, n7406, n7407, n7408, n7409, n7410,
         n7411, n7412, n7413, n7414, n7415, n7416, n7417, n7418, n7419, n7420,
         n7421, n7422, n7423, n7424, n7425, n7426, n7427, n7428, n7429, n7430,
         n7431, n7432, n7433, n7434, n7435, n7436, n7437, n7438, n7439, n7440,
         n7441, n7442, n7443, n7444, n7445, n7446, n7447, n7448, n7449, n7450,
         n7451, n7452, n7453, n7454, n7455, n7456, n7457, n7458, n7459, n7460,
         n7461, n7462, n7463, n7464, n7465, n7466, n7467, n7468, n7469, n7470,
         n7471, n7472, n7473, n7474, n7475, n7476, n7477, n7478, n7479, n7480,
         n7481, n7482, n7483, n7484, n7485, n7486, n7487, n7488, n7489, n7490,
         n7491, n7492, n7493, n7494, n7495, n7496, n7497, n7498, n7499, n7500,
         n7501, n7502, n7503, n7504, n7505, n7506, n7507, n7508, n7509, n7510,
         n7511, n7512, n7513, n7514, n7515, n7516, n7517, n7518, n7519, n7520,
         n7521, n7522, n7523, n7524, n7525, n7526, n7527, n7528, n7529, n7530,
         n7531, n7532, n7533, n7534, n7535, n7536, n7537, n7538, n7539, n7540,
         n7541, n7542, n7543, n7544, n7545, n7546, n7547, n7548, n7549, n7550,
         n7551, n7552, n7553, n7554, n7555, n7556, n7557, n7558, n7559, n7560,
         n7561, n7562, n7563, n7564, n7565, n7566, n7567, n7568, n7569, n7570,
         n7571, n7572, n7573, n7574, n7575, n7576, n7577, n7578, n7579, n7580,
         n7581, n7582, n7583, n7584, n7585, n7586, n7587, n7588, n7589, n7590,
         n7591, n7592, n7593, n7594, n7595, n7596, n7597, n7598, n7599, n7600,
         n7601, n7602, n7603, n7604, n7605, n7606, n7607, n7608, n7609, n7610,
         n7611, n7612, n7613, n7614, n7615, n7616, n7617, n7618, n7619, n7620,
         n7621, n7622, n7623, n7624, n7625, n7626, n7627, n7628, n7629, n7630,
         n7631, n7632, n7633, n7634, n7635, n7636, n7637, n7638, n7639, n7640,
         n7641, n7642, n7643, n7644, n7645, n7646, n7647, n7648, n7649, n7650,
         n7651, n7652, n7653, n7654, n7655, n7656, n7657, n7658, n7659, n7660,
         n7661, n7662, n7663, n7664, n7665, n7666, n7667, n7668, n7669, n7670,
         n7671, n7672, n7673, n7674, n7675, n7676, n7677, n7678, n7679, n7680,
         n7681, n7682, n7683, n7684, n7685, n7686, n7687, n7688, n7689, n7690,
         n7691, n7692, n7693, n7694, n7695, n7696, n7697, n7698, n7699, n7700,
         n7701, n7702, n7703, n7704, n7705, n7706, n7707, n7708, n7709, n7710,
         n7711, n7712, n7713, n7714, n7715, n7716, n7717, n7718, n7719, n7720,
         n7721, n7722, n7723, n7724, n7725, n7726, n7727, n7728, n7729, n7730,
         n7731, n7732, n7733, n7734, n7735, n7736, n7737, n7738, n7739, n7740,
         n7741, n7742, n7743, n7744, n7745, n7747, n7748, n7749, n7750, n7751,
         n7752, n7753, n7754, n7755, n7756, n7757, n7758, n7759, n7760, n7761,
         n7762, n7763, n7764, n7765, n7766, n7767, n7768, n7769, n7770, n7771,
         n7772, n7773, n7774, n7775, n7776, n7777, n7778, n7779, n7780, n7781,
         n7782, n7783, n7784, n7785, n7786, n7787, n7788, n7789, n7790, n7791,
         n7792, n7793, n7794, n7795, n7796, n7797, n7798, n7799, n7800, n7801,
         n7802, n7803, n7804, n7805, n7806, n7807, n7808, n7809, n7810, n7811,
         n7812, n7813, n7814, n7815, n7816, n7817, n7818, n7819, n7820, n7821,
         n7822, n7823, n7824, n7825, n7826, n7827, n7828, n7829, n7830, n7831,
         n7832, n7833, n7834, n7835, n7836, n7837, n7838, n7839, n7840, n7841,
         n7842, n7843, n7844, n7845, n7846, n7847, n7848, n7849, n7850, n7851,
         n7852, n7853, n7854, n7855, n7856, n7857, n7858, n7859, n7860, n7861,
         n7862, n7863, n7864, n7865, n7866, n7867, n7868, n7869, n7870, n7871,
         n7872, n7873, n7874, n7875, n7876, n7877, n7878, n7879, n7880, n7881,
         n7882, n7883, n7884, n7885, n7886, n7887, n7888, n7889, n7890, n7891,
         n7892, n7893, n7894, n7895, n7896, n7897, n7898, n7899, n7900, n7901,
         n7902, n7903, n7904, n7905, n7906, n7907, n7908, n7909, n7910, n7911,
         n7912, n7913, n7914, n7915, n7916, n7917, n7918, n7919, n7920, n7921,
         n7922, n7923, n7924, n7925, n7926, n7927, n7928, n7929, n7930, n7931,
         n7932, n7933, n7934, n7935, n7936, n7937, n7938, n7939, n7940, n7941,
         n7942, n7943, n7944, n7945, n7946, n7947, n7948, n7949, n7950, n7951,
         n7952, n7953, n7954, n7955, n7956, n7957, n7958, n7959, n7960, n7961,
         n7962, n7963, n7964, n7965, n7966, n7967, n7968, n7969, n7970, n7971,
         n7972, n7973, n7974, n7975, n7976, n7977, n7978, n7979, n7980, n7981,
         n7982, n7983, n7984, n7985, n7986, n7987, n7988, n7989, n7990, n7991,
         n7992, n7993, n7994, n7995, n7996, n7997, n7998, n7999, n8000, n8001,
         n8002, n8003, n8004, n8005, n8006, n8007, n8008, n8009, n8010, n8011,
         n8012, n8013, n8014, n8015, n8016, n8017, n8018, n8019, n8020, n8021,
         n8022, n8023, n8024, n8025, n8026, n8027, n8028, n8029, n8030, n8031,
         n8032, n8033, n8034, n8035, n8036, n8037, n8038, n8039, n8040, n8041,
         n8042, n8043, n8044, n8045, n8046, n8047, n8048, n8049, n8050, n8051,
         n8052, n8053, n8054, n8055, n8056, n8057, n8058, n8059, n8060, n8061,
         n8062, n8063, n8064, n8065, n8066, n8067, n8068, n8069, n8070, n8071,
         n8072, n8073, n8074, n8075, n8076, n8077, n8078, n8079, n8080, n8081,
         n8082, n8083, n8084, n8085, n8086, n8087, n8088, n8089, n8090, n8091,
         n8092, n8093, n8094, n8095, n8096, n8097, n8098, n8099, n8100, n8101,
         n8102, n8103, n8104, n8105, n8106, n8107, n8108, n8109, n8110, n8111,
         n8112, n8113, n8114, n8115, n8116, n8117, n8118, n8119, n8120, n8121,
         n8122, n8123, n8124, n8125, n8126, n8127, n8128, n8129, n8130, n8131,
         n8132, n8133, n8134, n8135, n8136, n8137, n8138, n8139, n8140, n8141,
         n8142, n8143, n8144, n8145, n8146, n8147, n8148, n8149, n8150, n8151,
         n8152, n8153, n8154, n8155, n8156, n8157, n8158, n8159, n8160, n8161,
         n8162, n8163, n8164, n8165, n8166, n8167, n8168, n8169, n8170, n8171,
         n8172, n8173, n8174, n8175, n8176, n8177, n8178, n8179, n8180, n8181,
         n8182, n8183, n8184, n8185, n8186, n8187, n8188, n8189, n8190, n8191,
         n8192, n8193, n8194, n8195, n8196, n8197, n8198, n8199, n8200, n8201,
         n8202, n8203, n8204, n8205, n8206, n8207, n8208, n8209, n8210, n8211,
         n8212, n8213, n8214, n8215, n8216, n8217, n8218, n8219, n8220, n8221,
         n8222, n8223, n8224, n8225, n8226, n8227, n8228, n8229, n8230, n8231,
         n8232, n8233, n8234, n8235, n8236, n8237, n8238, n8239, n8240, n8241,
         n8242, n8243, n8244, n8245, n8246, n8247, n8248, n8249, n8250, n8251,
         n8252, n8253, n8254, n8255, n8256, n8257, n8258, n8259, n8260, n8261,
         n8262, n8263, n8264, n8265, n8266, n8267, n8268, n8269, n8270, n8271,
         n8272, n8273, n8274, n8275, n8276, n8277, n8278, n8279, n8280, n8281,
         n8282, n8283, n8284, n8285, n8286, n8287, n8288, n8289, n8290, n8291,
         n8292, n8293, n8294, n8295, n8296, n8297, n8298, n8299, n8300, n8301,
         n8302, n8303, n8304, n8305, n8306, n8307, n8308, n8309, n8310, n8311,
         n8312, n8313, n8314, n8315, n8316, n8317, n8318, n8319, n8320, n8321,
         n8322, n8323, n8324, n8325, n8326, n8327, n8328, n8329, n8330, n8331,
         n8332, n8333, n8334, n8335, n8336, n8337, n8338, n8339, n8340, n8341,
         n8342, n8343, n8344, n8345, n8346, n8347, n8348, n8349, n8350, n8351,
         n8352, n8353, n8354, n8355, n8356, n8357, n8358, n8359, n8360, n8361,
         n8362, n8363, n8364, n8365, n8366, n8367, n8368, n8369, n8370, n8371,
         n8372, n8373, n8374, n8375, n8376, n8377, n8378, n8379, n8380, n8381,
         n8382, n8383, n8384, n8385, n8386, n8387, n8388, n8389, n8390, n8391,
         n8392, n8393, n8394, n8395, n8396, n8397, n8398, n8399, n8400, n8401,
         n8402, n8404, n8405, n8406, n8407, n8408, n8409, n8410, n8411, n8412,
         n8413, n8414, n8415, n8416, n8417, n8418, n8419, n8420, n8421, n8422,
         n8423, n8424, n8425, n8426, n8427, n8428, n8429, n8430, n8431, n8432,
         n8433, n8434, n8435, n8436, n8437, n8438, n8439, n8440, n8441, n8442,
         n8443, n8444, n8445, n8446, n8447, n8448, n8449, n8450, n8451, n8452,
         n8453, n8454, n8455, n8456, n8457, n8458, n8459, n8460, n8461, n8462,
         n8463, n8464, n8465, n8466, n8467, n8468, n8469, n8470, n8471, n8472,
         n8473, n8474, n8475, n8476, n8477, n8478, n8479, n8480, n8481, n8482,
         n8483, n8484, n8485, n8486, n8487, n8488, n8489, n8490, n8491, n8492,
         n8493, n8494, n8495, n8496, n8497, n8498, n8499, n8500, n8501, n8502,
         n8503, n8504, n8505, n8506, n8507, n8508, n8509, n8510, n8511, n8512,
         n8513, n8514, n8515, n8516, n8517, n8518, n8519, n8520, n8521, n8522,
         n8523, n8524, n8525, n8526, n8527, n8528, n8529, n8530, n8531, n8532,
         n8533, n8534, n8535, n8536, n8537, n8538, n8539, n8540, n8541, n8542,
         n8543, n8544, n8545, n8546, n8547, n8548, n8549, n8550, n8551, n8552,
         n8553, n8554, n8555, n8556, n8557, n8558, n8559, n8560, n8561, n8562,
         n8563, n8564, n8565, n8566, n8567, n8568, n8569, n8570, n8571, n8572,
         n8573, n8574, n8575, n8576, n8577, n8578, n8579, n8580, n8581, n8582,
         n8583, n8584, n8585, n8586, n8587, n8588, n8589, n8590, n8591, n8592,
         n8593, n8594, n8595, n8596, n8597, n8598, n8599, n8600, n8601, n8602,
         n8603, n8604, n8605, n8606, n8607, n8608, n8609, n8610, n8611, n8612,
         n8613, n8614, n8615, n8616, n8617, n8618, n8619, n8620, n8621, n8622,
         n8623, n8624, n8625, n8626, n8627, n8628, n8629, n8630, n8631, n8632,
         n8633, n8634, n8635, n8636, n8637, n8638, n8639, n8640, n8641, n8642,
         n8643, n8644, n8645, n8646, n8647, n8648, n8649, n8650, n8651, n8652,
         n8653, n8654, n8655, n8656, n8657, n8658, n8659, n8660, n8661, n8662,
         n8663, n8664, n8665, n8666, n8667, n8668, n8669, n8670, n8671, n8672,
         n8673, n8674, n8675, n8676, n8677, n8678, n8679, n8680, n8681, n8682,
         n8683, n8684, n8685, n8686, n8687, n8688, n8689, n8690, n8691, n8692,
         n8693, n8694, n8695, n8696, n8697, n8698, n8699, n8700, n8701, n8702,
         n8703, n8704, n8705, n8706, n8707, n8708, n8709, n8710, n8711, n8712,
         n8713, n8714, n8715, n8716, n8717, n8718, n8719, n8720, n8721, n8722,
         n8723, n8724, n8725, n8726, n8727, n8728, n8729, n8730, n8731, n8732,
         n8733, n8734, n8735, n8736, n8737, n8738, n8739, n8740, n8741, n8742,
         n8743, n8744, n8745, n8746, n8747, n8748, n8749, n8750, n8751, n8752,
         n8753, n8754, n8755, n8756, n8757, n8758, n8759, n8760, n8761, n8762,
         n8763, n8764, n8765, n8766, n8767, n8768, n8769, n8770, n8771, n8772,
         n8773, n8774, n8775, n8776, n8777, n8778, n8779, n8780, n8781, n8782,
         n8783, n8784, n8785, n8786, n8787, n8788, n8789, n8790, n8791, n8792,
         n8793, n8794, n8795, n8796, n8797, n8798, n8799, n8800, n8801, n8802,
         n8803, n8804, n8805, n8806, n8807, n8808, n8809, n8810, n8812, n8813,
         n8814, n8815, n8816, n8817, n8818, n8819, n8820, n8821, n8822, n8823,
         n8824, n8825, n8826, n8827, n8828, n8829, n8830, n8831, n8832, n8833,
         n8834, n8835, n8836, n8837, n8838, n8839, n8840, n8841, n8842, n8843,
         n8844, n8845, n8846, n8847, n8848, n8849, n8850, n8851, n8852, n8853,
         n8854, n8855, n8856, n8857, n8858, n8859, n8860, n8861, n8862, n8863,
         n8864, n8865, n8866, n8868, n8869, n8870, n8871, n8872, n8873, n8874,
         n8875, n8876, n8877, n8878, n8879, n8880, n8881, n8882, n8883, n8884,
         n8885, n8886, n8887, n8888, n8889, n8890, n8891, n8892, n8893, n8894,
         n8895, n8896, n8897, n8898, n8899, n8900, n8901, n8902, n8903, n8904,
         n8905, n8906, n8907, n8908, n8909, n8910, n8911, n8912, n8913, n8914,
         n8915, n8916, n8917, n8918, n8919, n8920, n8921, n8922, n8923, n8924,
         n8925, n8926, n8927, n8928, n8929, n8930, n8931, n8932, n8933, n8934,
         n8935, n8936, n8937, n8938, n8939, n8940, n8941, n8942, n8943, n8944,
         n8945, n8946, n8947, n8948, n8949, n8950, n8951, n8952, n8953, n8954,
         n8955, n8956, n8957, n8958, n8959, n8960, n8961, n8962, n8963, n8964,
         n8965, n8966, n8967, n8968, n8969, n8970, n8971, n8972, n8973, n8974,
         n8975, n8976, n8977, n8978, n8979, n8980, n8981, n8982, n8983, n8984,
         n8985, n8986, n8987, n8988, n8989, n8990, n8991, n8992, n8993, n8994,
         n8995, n8996, n8997, n8998, n8999, n9000, n9001, n9002, n9003, n9004,
         n9005, n9006, n9007, n9008, n9009, n9010, n9011, n9012, n9013, n9014,
         n9015, n9016, n9017, n9018, n9019, n9020, n9021, n9022, n9023, n9024,
         n9025, n9026, n9027, n9028, n9029, n9030, n9031, n9032, n9033, n9034,
         n9035, n9036, n9037, n9038, n9039, n9040, n9041, n9042, n9043, n9044,
         n9045, n9046, n9047, n9048, n9049, n9050, n9051, n9052, n9053, n9054,
         n9055, n9056, n9057, n9058, n9059, n9060, n9061, n9062, n9063, n9064,
         n9065, n9066, n9067, n9068, n9069, n9070, n9071, n9072, n9073, n9074,
         n9075, n9076, n9077, n9078, n9079, n9080, n9081, n9082, n9083, n9084,
         n9085, n9086, n9087, n9088, n9089, n9090, n9091, n9092, n9093, n9094,
         n9095, n9096, n9097, n9098, n9099, n9100, n9101, n9102, n9103, n9104,
         n9105, n9106, n9107, n9108, n9109, n9110, n9111, n9112, n9113, n9114,
         n9115, n9116, n9117, n9118, n9119, n9120, n9121, n9122, n9123, n9124,
         n9125, n9126, n9127, n9128, n9129, n9130, n9131, n9132, n9133, n9134,
         n9135, n9136, n9137, n9138, n9139, n9140, n9141, n9142, n9143, n9144,
         n9145, n9146, n9147, n9148, n9149, n9150, n9151, n9152, n9153, n9154,
         n9155, n9156, n9157, n9158, n9159, n9160, n9161, n9162, n9163, n9164,
         n9165, n9166, n9167, n9168, n9169, n9170, n9171, n9172, n9173, n9174,
         n9175, n9176, n9177, n9178, n9179, n9180, n9181, n9182, n9183, n9184,
         n9185, n9186, n9187, n9188, n9189, n9190, n9191, n9192, n9193, n9194,
         n9195, n9196, n9197, n9198, n9199, n9200, n9201, n9202, n9203, n9204,
         n9205, n9206, n9207, n9208, n9209, n9210, n9211, n9212, n9213, n9214,
         n9215, n9216, n9217, n9218, n9219, n9220, n9221, n9222, n9223, n9224,
         n9225, n9226, n9227, n9228, n9229, n9230, n9231, n9232, n9233, n9234,
         n9235, n9236, n9237, n9238, n9239, n9240, n9241, n9242, n9243, n9244,
         n9245, n9246, n9247, n9248, n9249, n9250, n9251, n9252, n9253, n9254,
         n9255, n9256, n9257, n9258, n9259, n9260, n9261, n9262, n9263, n9264,
         n9265, n9266, n9267, n9268, n9269, n9270, n9271, n9272, n9273, n9274,
         n9275, n9276, n9277, n9278, n9279, n9280, n9281, n9282, n9283, n9284,
         n9285, n9286, n9287, n9288, n9289, n9290, n9291, n9292, n9293, n9294,
         n9295, n9296, n9297, n9298, n9299, n9300, n9301, n9302, n9303, n9304,
         n9305, n9306, n9307, n9308, n9309, n9310, n9311, n9312, n9313, n9314,
         n9315, n9316, n9317, n9318, n9319, n9320, n9321, n9322, n9323, n9324,
         n9325, n9326, n9327, n9328, n9329, n9330, n9331, n9332, n9333, n9334,
         n9335, n9336, n9337, n9338, n9339, n9340, n9341, n9342, n9343, n9344,
         n9345, n9346, n9347, n9348, n9349, n9350, n9351, n9352, n9353, n9354,
         n9355, n9356, n9357, n9358, n9359, n9360, n9361, n9362, n9363, n9364,
         n9365, n9366, n9367, n9368, n9369, n9370, n9371, n9372, n9373, n9374,
         n9376, n9377, n9378, n9379, n9380, n9381, n9382, n9383, n9384, n9385,
         n9386, n9387, n9388, n9389, n9390, n9391, n9392, n9393, n9394, n9395,
         n9396, n9397, n9398, n9399, n9400, n9401, n9402, n9403, n9404, n9405,
         n9406, n9407, n9408, n9409, n9410, n9411, n9412, n9413, n9414, n9415,
         n9416, n9417, n9418, n9419, n9420, n9421, n9422, n9423, n9424, n9425,
         n9426, n9427, n9428, n9429, n9430, n9431, n9432, n9433, n9434, n9435,
         n9436, n9437, n9438, n9439, n9440, n9441, n9442, n9443, n9444, n9445,
         n9446, n9447, n9449, n9450, n9451, n9452, n9453, n9454, n9455, n9456,
         n9457, n9458, n9459, n9460, n9461, n9462, n9463, n9464, n9465, n9466,
         n9467, n9468, n9469, n9470, n9471, n9472, n9473, n9474, n9475, n9476,
         n9477, n9478, n9479, n9480, n9481, n9482, n9483, n9484, n9485, n9486,
         n9487, n9488, n9489, n9490, n9491, n9492, n9493, n9494, n9495, n9496,
         n9497, n9498, n9499, n9500, n9501, n9502, n9503, n9504, n9505, n9506,
         n9507, n9508, n9509, n9510, n9511, n9512, n9513, n9514, n9515, n9516,
         n9517, n9518, n9519, n9520, n9521, n9522, n9523, n9524, n9525, n9526,
         n9527, n9528, n9529, n9530, n9531, n9532, n9533, n9534, n9535, n9536,
         n9537, n9538, n9539, n9540, n9541, n9542, n9543, n9544, n9545, n9546,
         n9547, n9548, n9549, n9550, n9551, n9552, n9553, n9554, n9555, n9556,
         n9557, n9558, n9559, n9560, n9561, n9562, n9563, n9564, n9565, n9566,
         n9567, n9568, n9569, n9570, n9571, n9572, n9573, n9574, n9575, n9576,
         n9577, n9578, n9579, n9580, n9581, n9582, n9583, n9584, n9585, n9586,
         n9587, n9588, n9589, n9590, n9591, n9592, n9593, n9594, n9595, n9596,
         n9597, n9598, n9599, n9600, n9601, n9602, n9603, n9604, n9605, n9606,
         n9607, n9608, n9609, n9610, n9611, n9612, n9613, n9614, n9615, n9616,
         n9617, n9618, n9619, n9620, n9621, n9622, n9623, n9624, n9625, n9626,
         n9627, n9628, n9629, n9630, n9631, n9632, n9633, n9634, n9635, n9636,
         n9637, n9638, n9639, n9640, n9641, n9642, n9643, n9644, n9645, n9646,
         n9647, n9648, n9649, n9650, n9651, n9652, n9653, n9654, n9655, n9656,
         n9657, n9658, n9659, n9660, n9661, n9662, n9663, n9664, n9665, n9666,
         n9667, n9668, n9669, n9670, n9671, n9672, n9673, n9674, n9675, n9676,
         n9677, n9678, n9679, n9680, n9681, n9682, n9683, n9684, n9685, n9686,
         n9687, n9688, n9689, n9690, n9691, n9692, n9693, n9694, n9695, n9696,
         n9697, n9698, n9699, n9700, n9701, n9702, n9703, n9704, n9705, n9706,
         n9707, n9708, n9709, n9710, n9711, n9712, n9713, n9714, n9715, n9716,
         n9717, n9718, n9719, n9720, n9721, n9722, n9723, n9724, n9725, n9726,
         n9727, n9728, n9729, n9730, n9731, n9732, n9733, n9734, n9735, n9736,
         n9737, n9738, n9739, n9740, n9741, n9742, n9743, n9744, n9745, n9746,
         n9747, n9748, n9749, n9750, n9751, n9752, n9753, n9754, n9755, n9756,
         n9757, n9758, n9759, n9760, n9761, n9762, n9763, n9764, n9765, n9766,
         n9767, n9768, n9769, n9770, n9771, n9772, n9773, n9774, n9775, n9776,
         n9777, n9778, n9779, n9780, n9781, n9782, n9783, n9784, n9785, n9786,
         n9787, n9788, n9789, n9790, n9791, n9792, n9793, n9794, n9795, n9796,
         n9797, n9798, n9799, n9800, n9801, n9802, n9803, n9804, n9805, n9806,
         n9807, n9808, n9809, n9810, n9811, n9812, n9813, n9814, n9815, n9816,
         n9817, n9818, n9819, n9820, n9821, n9822, n9823, n9824, n9825, n9826,
         n9827, n9828, n9829, n9830, n9831, n9832, n9833, n9834, n9835, n9836,
         n9837, n9838, n9839, n9840, n9841, n9842, n9843, n9844, n9845, n9846,
         n9847, n9848, n9849, n9850, n9851, n9852, n9853, n9854, n9855, n9856,
         n9857, n9858, n9859, n9860, n9861, n9862, n9863, n9864, n9865, n9866,
         n9867, n9868, n9869, n9870, n9871, n9872, n9873, n9874, n9875, n9876,
         n9877, n9878, n9879, n9880, n9881, n9882, n9883, n9884, n9885, n9886,
         n9887, n9888, n9889, n9890, n9891, n9892, n9893, n9894, n9895, n9896,
         n9897, n9898, n9899, n9900, n9901, n9902, n9903, n9904, n9905, n9906,
         n9907, n9908, n9909, n9910, n9911, n9912, n9914, n9915, n9916, n9917,
         n9918, n9919, n9920, n9921, n9922, n9923, n9924, n9925, n9926, n9927,
         n9928, n9929, n9930, n9931, n9932, n9933, n9934, n9935, n9936, n9937,
         n9938, n9939, n9940, n9941, n9942, n9943, n9944, n9945, n9946, n9947,
         n9948, n9949, n9950, n9951, n9952, n9953, n9954, n9955, n9956, n9957,
         n9958, n9959, n9960, n9961, n9962, n9963, n9964, n9965, n9966, n9967,
         n9968, n9969, n9970, n9971, n9972, n9973, n9974, n9975, n9976, n9977,
         n9978, n9979, n9980, n9981, n9982, n9983, n9984, n9985, n9986, n9987,
         n9988, n9989, n9990, n9991, n9992, n9993, n9994, n9995, n9996, n9997,
         n9998, n9999, n10000, n10001, n10002, n10003, n10004, n10005, n10006,
         n10007, n10008, n10009, n10010, n10011, n10012, n10013, n10014,
         n10015, n10016, n10017, n10018, n10019, n10020, n10021, n10023,
         n10024, n10025, n10026, n10027, n10028, n10029, n10030, n10031,
         n10032, n10034, n10035, n10036, n10037, n10038, n10039, n10040,
         n10041, n10042, n10043, n10044, n10045, n10046, n10047, n10048,
         n10049, n10050, n10051, n10052, n10053, n10054, n10055, n10056,
         n10057, n10058, n10059, n10060, n10061, n10062, n10063, n10064,
         n10065, n10066, n10067, n10068, n10069, n10070, n10071, n10072,
         n10073, n10074, n10075, n10076, n10077, n10078, n10079, n10080,
         n10081, n10082, n10083, n10084, n10085, n10086, n10087, n10088,
         n10089, n10090, n10091, n10092, n10093, n10094, n10095, n10096,
         n10097, n10098, n10099, n10100, n10101, n10102, n10103, n10104,
         n10105, n10106, n10107, n10108, n10109, n10110, n10111, n10112,
         n10113, n10114, n10115, n10116, n10117, n10118, n10119, n10120,
         n10121, n10122, n10123, n10124, n10125, n10126, n10127, n10128,
         n10130, n10131, n10132, n10133, n10134, n10135, n10136, n10137,
         n10138, n10139, n10140, n10141, n10142, n10143, n10144, n10145,
         n10146, n10147, n10148, n10149, n10150, n10151, n10152, n10153,
         n10154, n10155, n10156, n10157, n10158, n10159, n10160, n10161,
         n10162, n10163, n10164, n10165, n10166, n10167, n10168, n10169,
         n10170, n10171, n10172, n10173, n10174, n10175, n10176, n10177,
         n10178, n10179, n10180, n10181, n10182, n10183, n10184, n10185,
         n10186, n10187, n10188, n10189, n10190, n10191, n10192, n10193,
         n10194, n10195, n10196, n10197, n10198, n10199, n10200, n10201,
         n10202, n10203, n10204, n10205, n10206, n10207, n10208, n10209,
         n10210, n10211, n10212, n10213, n10214, n10215, n10216, n10217,
         n10218, n10219, n10220, n10221, n10222, n10223, n10224, n10225,
         n10226, n10227, n10228, n10229, n10230, n10231, n10232, n10233,
         n10234, n10235, n10236, n10237, n10238, n10239, n10240, n10241,
         n10242, n10243, n10244, n10245, n10246, n10247, n10248, n10249,
         n10250, n10251, n10252, n10253, n10254, n10255, n10256, n10257,
         n10258, n10259, n10260, n10261, n10262, n10263, n10264, n10265,
         n10266, n10267, n10268, n10269, n10270, n10271, n10272, n10273,
         n10274, n10275, n10276, n10277, n10278, n10279, n10280, n10281,
         n10282, n10283, n10284, n10285, n10286, n10287, n10288, n10289,
         n10290, n10291, n10292, n10293, n10294, n10295, n10296, n10297,
         n10298, n10299, n10300, n10301, n10302, n10303, n10304, n10305,
         n10306, n10307, n10308, n10309, n10310, n10311, n10312, n10313,
         n10314, n10315, n10316, n10317, n10318, n10319, n10320, n10321,
         n10322, n10323, n10324, n10325, n10326, n10327, n10328, n10329,
         n10330, n10331, n10332, n10333, n10334, n10335, n10336, n10337,
         n10338, n10339, n10340, n10341, n10342, n10343, n10344, n10345,
         n10346, n10347, n10348, n10349, n10350, n10351, n10352, n10353,
         n10354, n10355, n10356, n10357, n10358, n10359, n10360, n10361,
         n10362, n10363, n10364, n10365, n10366, n10367, n10368, n10369,
         n10370, n10371, n10372, n10373, n10374, n10375, n10376, n10377,
         n10378, n10379, n10380, n10381, n10382, n10383, n10384, n10385,
         n10386, n10387, n10388, n10389, n10390, n10391, n10392, n10393,
         n10394, n10395, n10396, n10397, n10398, n10399, n10401, n10403,
         n10404, n10405, n10406, n10407, n10408, n10409, n10410, n10411,
         n10412, n10413, n10414, n10415, n10416, n10417, n10418, n10419,
         n10420, n10421, n10422, n10424, n10425, n10426, n10427, n10428,
         n10429, n10430, n10431, n10432, n10433, n10434, n10435, n10436,
         n10437, n10438, n10439, n10440, n10441, n10442, n10443, n10444,
         n10445, n10446, n10447, n10448, n10449, n10450, n10451, n10452,
         n10453, n10454, n10455, n10456, n10457, n10458, n10459, n10460,
         n10461, n10462, n10463, n10464, n10465, n10466, n10467, n10468,
         n10469, n10470, n10471, n10472, n10473, n10474, n10475, n10476,
         n10477, n10478, n10479, n10480, n10481, n10482, n10483, n10484,
         n10485, n10486, n10487, n10488, n10489, n10490, n10491, n10492,
         n10493, n10494, n10495, n10496, n10497, n10498, n10499, n10500,
         n10501, n10502, n10503, n10504, n10505, n10506, n10507, n10508,
         n10509, n10510, n10511, n10512, n10513, n10514, n10515, n10516,
         n10517, n10518, n10519, n10520, n10521, n10522, n10523, n10524,
         n10525, n10526, n10527, n10528, n10529, n10530, n10532, n10533,
         n10534, n10535, n10536, n10537, n10538, n10539, n10540, n10541,
         n10542, n10543, n10544, n10545, n10546, n10547, n10548, n10549,
         n10550, n10551, n10552, n10553, n10554, n10555, n10556, n10562,
         n10563, n10564, n10565, n10566, n10567, n10568, n10569, n10570,
         n10571, n10572, n10573, n10574, n10575, n10576, n10577, n10579,
         n10580, n10581, n10582, n10583, n10584, n10585, n10586, n10587,
         n10588, n10589, n10590, n10591, n10592, n10593, n10594, n10595,
         n10596, n10597, n10598, n10599, n10600, n10601, n10602, n10603,
         n10604, n10605, n10606, n10607, n10608, n10609, n10610, n10611,
         n10612, n10613, n10614, n10615, n10616, n10617, n10618, n10619,
         n10620, n10621, n10622, n10623, n10624, n10625, n10626, n10627,
         n10628, n10629, n10630, n10631, n10633, n10634, n10635, n10636,
         n10637, n10638, n10639, n10640, n10641, n10642, n10643, n10644,
         n10645, n10646, n10647, n10648, n10649, n10650, n10651, n10652,
         n10653, n10654, n10655, n10656, n10657, n10658, n10659, n10660,
         n10661, n10662, n10663, n10664, n10665, n10666, n10667, n10668,
         n10669, n10670, n10671, n10672, n10673, n10674, n10675, n10676,
         n10677, n10678, n10679, n10680, n10681, n10682, n10683, n10684,
         n10685, n10686, n10687, n10688, n10689, n10690, n10691, n10692,
         n10693, n10694, n10695, n10696, n10697, n10698, n10699, n10700,
         n10701, n10702, n10703, n10704, n10705, n10706, n10707, n10708,
         n10709, n10710, n10711, n10712, n10713, n10714, n10715, n10716,
         n10717, n10718, n10719, n10720, n10721, n10722, n10723, n10724,
         n10725, n10726, n10727, n10728, n10729, n10730, n10731, n10732,
         n10733, n10734, n10735, n10736, n10737, n10738, n10739, n10740,
         n10741, n10742, n10743, n10744, n10745, n10746, n10747, n10748,
         n10749, n10750, n10751, n10752, n10753, n10754, n10755, n10756,
         n10757, n10758, n10759, n10760, n10761, n10762, n10763, n10764,
         n10765, n10766, n10767, n10768, n10769, n10770, n10771, n10772,
         n10773, n10774, n10775, n10776, n10777, n10778, n10779, n10780,
         n10781, n10782, n10783, n10784, n10785, n10786, n10787, n10788,
         n10789, n10790, n10791, n10792, n10793, n10794, n10795, n10796,
         n10797, n10798, n10799, n10800, n10801, n10802, n10803, n10804,
         n10805, n10806, n10807, n10808, n10809, n10810, n10811, n10812,
         n10813, n10814, n10815, n10816, n10817, n10818, n10819, n10820,
         n10821, n10822, n10823, n10824, n10825, n10826, n10827, n10828,
         n10829, n10830, n10831, n10832, n10834, n10835, n10836, n10837,
         n10838, n10839, n10840, n10841, n10842, n10843, n10844, n10845,
         n10846, n10847, n10848, n10849, n10850, n10851, n10852, n10853,
         n10854, n10855, n10856, n10857, n10858, n10859, n10860, n10861,
         n10862, n10863, n10864, n10865, n10866, n10867, n10868, n10869,
         n10870, n10871, n10872, n10873, n10874, n10875, n10876, n10877,
         n10878, n10879, n10880, n10881, n10882, n10883, n10884, n10885,
         n10886, n10887, n10888, n10889, n10890, n10891, n10892, n10893,
         n10894, n10895, n10896, n10897, n10898, n10899, n10900, n10901,
         n10902, n10903, n10904, n10905, n10906, n10907, n10908, n10909,
         n10910, n10911, n10912, n10913, n10914, n10915, n10916, n10917,
         n10918, n10919, n10920, n10921, n10922, n10923, n10924, n10925,
         n10926, n10927, n10928, n10929, n10930, n10931, n10932, n10933,
         n10934, n10935, n10936, n10937, n10938, n10939, n10940, n10941,
         n10942, n10943, n10944, n10945, n10946, n10947, n10948, n10949,
         n10950, n10951, n10952, n10953, n10954, n10955, n10956, n10957,
         n10958, n10959, n10960, n10961, n10962, n10963, n10964, n10965,
         n10966, n10967, n10968, n10969, n10970, n10971, n10972, n10973,
         n10974, n10975, n10976, n10977, n10978, n10979, n10980, n10981,
         n10982, n10983, n10984, n10985, n10986, n10987, n10988, n10989,
         n10990, n10991, n10992, n10993, n10994, n10995, n10996, n10997,
         n10998, n10999, n11000, n11001, n11002, n11003, n11004, n11005,
         n11006, n11007, n11008, n11009, n11010, n11011, n11012, n11013,
         n11014, n11015, n11016, n11017, n11018, n11019, n11020, n11021,
         n11022, n11023, n11024, n11025, n11026, n11027, n11028, n11029,
         n11030, n11031, n11032, n11033, n11034, n11035, n11036, n11037,
         n11038, n11039, n11040, n11041, n11042, n11043, n11044, n11045,
         n11046, n11047, n11048, n11050, n11051, n11052, n11054, n11055,
         n11056, n11057, n11058, n11059, n11060, n11061, n11062, n11063,
         n11064, n11065, n11066, n11067, n11068, n11069, n11070, n11071,
         n11072, n11073, n11074, n11075, n11076, n11077, n11078, n11079,
         n11080, n11081, n11082, n11083, n11084, n11085, n11086, n11087,
         n11088, n11089, n11090, n11092, n11094, n11095, n11096, n11097,
         n11098, n11099, n11100, n11101, n11102, n11103, n11104, n11105,
         n11106, n11107, n11108, n11109, n11110, n11111, n11112, n11113,
         n11114, n11129, n11148, n11154, n11156;
  wire   [31:12] i_apb_paddr;
  wire   [15:0] i_apb_prdata_apb_dslcr;
  wire   [31:0] i_apb_pwdata_int;
  wire   [2:0] i_i2c_rx_rd_addr;
  wire   [2:1] i_i2c_rx_wr_addr;
  wire   [2:0] i_i2c_tx_rd_addr;
  wire   [2:1] i_i2c_tx_wr_addr;
  wire   [2:0] i_i2c_ic_tx_tl;
  wire   [2:0] i_i2c_ic_rx_tl;
  wire   [15:0] i_i2c_ic_lcnt;
  wire   [15:0] i_i2c_ic_hcnt;
  wire   [11:0] i_i2c_ic_tar;
  wire   [7:0] i_i2c_ic_sda_setup;
  wire   [5:0] i_i2c_reg_addr;
  wire   [7:0] i_i2c_rx_push_data;
  wire   [9:0] i_i2c_ic_sar;
  wire   [3:0] i_i2c_mst_rx_bit_count;
  wire   [8:0] i_i2c_tx_fifo_data_buf;
  wire   [7:0] i_i2c_ic_spklen_o;
  wire   [12:0] i_i2c_ic_tx_abrt_source;
  wire   [11:0] i_i2c_ic_raw_intr_stat;
  wire   [11:0] i_i2c_ic_intr_mask;
  wire   [7:0] i_i2c_ic_sda_rx_hold_sync;
  wire   [15:1] i_i2c_ic_sda_tx_hold_sync;
  wire   [23:0] i_i2c_ic_sda_hold;
  wire   [1:0] i_i2c_ic_enable;
  wire   [16:0] i_i2c_tx_abrt_source;
  wire   [3:0] i_i2c_slv_debug_cstate;
  wire   [4:0] i_i2c_mst_debug_cstate;
  wire   [2:0] i_ahb_U_mux_hsel_prev;
  wire   [9:0] i_ahb_U_arb_ebtcount;
  wire   [31:0] i_apb_U_DW_apb_ahbsif_saved_hwdata32_c;
  wire   [31:1] i_apb_U_DW_apb_ahbsif_saved_haddr_c;
  wire   [16:1] i_apb_U_DW_apb_ahbsif_piped_haddr_c;
  wire   [2:0] i_apb_U_DW_apb_ahbsif_state;
  wire   [16:0] i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q;
  wire   [16:0] i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync;
  wire   [15:0] i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r;
  wire   [7:2] i_i2c_U_DW_apb_i2c_tx_shift_tx_shift_buf;
  wire   [3:0] i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_bit_count;
  wire   [3:0] i_i2c_U_DW_apb_i2c_tx_shift_tx_bit_count;
  wire   [3:1] i_i2c_U_DW_apb_i2c_rx_shift_scl_hl_edg_cntr;
  wire   [7:0] i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg;
  wire   [7:0] i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg;
  wire   [2:0] i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_bit_count_2to0;
  wire   [7:0] i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count;
  wire  
         [3:0] i_i2c_U_DW_apb_i2c_rx_filter_delay_re_start_en_or_split_start_en
;
  wire   [7:0] i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt;
  wire   [7:0] i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt;
  wire   [7:0] i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt;
  wire   [15:0] i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr;
  wire   [15:0] i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr;
  wire   [15:0] i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr;
  wire   [15:0] i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr;
  wire   [15:0] i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr;
  wire   [15:0] i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr;
  wire   [15:0] i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr;
  wire   [3:0] i_i2c_U_DW_apb_i2c_regfile_ic_rxflr;
  wire   [3:0] i_i2c_U_DW_apb_i2c_regfile_ic_txflr_flushed;
  wire   [3:0] i_i2c_U_DW_apb_i2c_regfile_ic_txflr;
  wire   [2:1] i_i2c_U_DW_apb_i2c_fifo_wrdc_rx_unconn;
  wire   [7:0] i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr;
  wire   [59:0] i_i2c_U_dff_rx_mem;
  wire   [71:0] i_i2c_U_dff_tx_mem;
  wire   [3:0] i_ahb_U_arb_U_arbif_ipl1_int;
  wire   [1:0] i_ahb_U_arb_U_arbif_r_state;
  wire   [2:0] i_ahb_U_arb_U_arbif_r_hsize_d;
  wire   [9:0] i_ahb_U_arb_U_arbif_r_haddr_d;
  wire   [9:0] i_ahb_U_arb_U_ebt_int_count;
  wire   [1:0] i_ahb_U_arb_U_ebt_next_state;
  wire   [1:0] i_ahb_U_arb_U_ebt_current_state;
  wire   [2:0] i_ahb_U_arb_U_gctrl_lock_sm;
  wire   [3:1] i_ahb_U_arb_U_gctrl_bbc;
  wire   [1:0] i_ahb_U_arb_U_gctrl_hgrant_previous;
  wire   [3:0] i_ahb_U_arb_U_gctrl_bc;
  wire   [23:0] i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1;
  wire  
         [16:0] i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1
;
  assign i_i2c_debug_hs = 1'b0;
  assign i_ahb_hresp_s0[1] = 1'b0;
  assign i_ahb_hrdata_s0[10] = 1'b0;
  assign i_ahb_hrdata_s0[11] = 1'b0;
  assign i_ahb_hrdata_s0[14] = 1'b0;
  assign i_ahb_hrdata_s0[15] = 1'b0;
  assign i_ahb_hrdata_s0[17] = 1'b0;
  assign i_ahb_hrdata_s0[18] = 1'b0;
  assign i_ahb_hrdata_s0[19] = 1'b0;
  assign i_ahb_hrdata_s0[22] = 1'b0;
  assign i_ahb_hrdata_s0[23] = 1'b0;
  assign i_ahb_hrdata_s0[24] = 1'b0;
  assign i_ahb_hrdata_s0[26] = 1'b0;
  assign i_ahb_hrdata_s0[27] = 1'b0;
  assign i_ahb_hrdata_s0[30] = 1'b0;
  assign i_ahb_hrdata_s0[31] = 1'b0;
  assign i_ahb_hmaster_data[1] = 1'b0;
  assign i_ahb_hmaster_data[2] = 1'b0;
  assign i_ahb_hmaster_data[3] = 1'b0;
  assign ex_i_ahb_AHB_Master_hready = ex_i_ahb_AHB_Slave_hready;

  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_1_ ( .D(n4630), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[1]), .QN(
        n5121) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_2_ ( .D(n4629), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[2]), .QN(
        n5027) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_3_ ( .D(n4628), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[3]), .QN(
        n4989) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_4_ ( .D(n4627), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[4]), .QN(
        n4853) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_6_ ( .D(n4625), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[6]), .QN(
        n4971) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_7_ ( .D(n4624), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[7]), .QN(
        n4855) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_12_ ( .D(n4623), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[12]), 
        .QN(n5042) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_13_ ( .D(n4622), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[13]) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_14_ ( .D(n4621), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[14]) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_15_ ( .D(n4620), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[15]) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_16_ ( .D(n4619), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[16]) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_17_ ( .D(n4618), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[17]) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_18_ ( .D(n4617), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[18]) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_19_ ( .D(n4616), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[19]) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_20_ ( .D(n4615), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[20]) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_21_ ( .D(n4614), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[21]) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_22_ ( .D(n4613), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[22]) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_23_ ( .D(n4612), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[23]) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_24_ ( .D(n4611), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[24]) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_25_ ( .D(n4610), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[25]) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_26_ ( .D(n4609), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[26]) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_27_ ( .D(n4608), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[27]) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_28_ ( .D(n4607), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[28]) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_29_ ( .D(n4606), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[29]) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_30_ ( .D(n4605), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[30]) );
  FD2 i_ahb_U_arb_U_ebt_current_state_reg_0_ ( .D(
        i_ahb_U_arb_U_ebt_next_state[0]), .CP(HCLK_hclk), .CD(HRESETn_hresetn), 
        .Q(i_ahb_U_arb_U_ebt_current_state[0]) );
  FD2 i_ahb_U_arb_U_ebt_current_state_reg_1_ ( .D(
        i_ahb_U_arb_U_ebt_next_state[1]), .CP(HCLK_hclk), .CD(HRESETn_hresetn), 
        .Q(i_ahb_U_arb_U_ebt_current_state[1]), .QN(n10594) );
  FD2 i_ahb_U_arb_U_arbif_r_state_reg_0_ ( .D(n11156), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_arbif_r_state[0]) );
  FD2 i_ahb_U_arb_U_arbif_r_state_reg_1_ ( .D(i_ahb_U_arb_U_arbif_nxt_state_1_), .CP(HCLK_hclk), .CD(HRESETn_hresetn), .Q(i_ahb_U_arb_U_arbif_r_state[1]), 
        .QN(n10522) );
  FD2 i_ahb_U_arb_U_arbif_r_hresp_s0_reg_0_ ( .D(i_ahb_U_arb_U_arbif_N82), 
        .CP(HCLK_hclk), .CD(HRESETn_hresetn), .Q(i_ahb_hresp_s0[0]), .QN(
        n10481) );
  FD2 i_ahb_U_dfltslv_hresp_none_reg_0_ ( .D(i_ahb_U_dfltslv_N4), .CP(
        HCLK_hclk), .CD(HRESETn_hresetn), .Q(i_ahb_hresp_none_0_) );
  FD2 i_ahb_U_arb_U_arbif_r_haddr_d_reg_3_ ( .D(n4559), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_arbif_r_haddr_d[3]), .QN(n4992) );
  FD2 i_ahb_U_arb_U_gctrl_ihmastlock_reg ( .D(n11148), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(ex_i_ahb_AHB_Slave_hmastlock) );
  FD2 i_ahb_U_arb_U_gctrl_lock_sm_reg_1_ ( .D(n8468), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_gctrl_lock_sm[1]) );
  FD2 i_ahb_U_arb_U_ebt_reg_set_ebt_reg ( .D(n4374), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_ebt_reg_set_ebt), .QN(n5043) );
  FD2 i_apb_U_DW_apb_ahbsif_piped_haddr_reg_1_ ( .D(n4658), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_piped_haddr_c[1]), .QN(
        n4942) );
  FD2 i_apb_U_DW_apb_ahbsif_piped_haddr_reg_2_ ( .D(n4657), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_piped_haddr_c[2]), .QN(
        n4920) );
  FD2 i_apb_U_DW_apb_ahbsif_piped_haddr_reg_3_ ( .D(n4656), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_piped_haddr_c[3]), .QN(
        n4926) );
  FD2 i_apb_U_DW_apb_ahbsif_piped_haddr_reg_4_ ( .D(n4655), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_piped_haddr_c[4]), .QN(
        n4900) );
  FD2 i_apb_U_DW_apb_ahbsif_piped_haddr_reg_5_ ( .D(n4654), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_piped_haddr_c[5]), .QN(
        n4986) );
  FD2 i_apb_U_DW_apb_ahbsif_piped_haddr_reg_6_ ( .D(n4653), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_piped_haddr_c[6]), .QN(
        n4907) );
  FD2 i_apb_U_DW_apb_ahbsif_piped_haddr_reg_7_ ( .D(n4652), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_piped_haddr_c[7]), .QN(
        n4912) );
  FD2 i_apb_U_DW_apb_ahbsif_piped_haddr_reg_12_ ( .D(n4651), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_piped_haddr_c[12]), 
        .QN(n4883) );
  FD2 i_apb_U_DW_apb_ahbsif_piped_haddr_reg_16_ ( .D(n4647), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_piped_haddr_c[16]), 
        .QN(n4889) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_0_ ( .D(n4602), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[0]), 
        .QN(n4856) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_1_ ( .D(n4601), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[1]), 
        .QN(n4857) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_2_ ( .D(n4600), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[2]), 
        .QN(n4955) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_3_ ( .D(n4599), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[3]), 
        .QN(n5004) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_4_ ( .D(n4598), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[4]), 
        .QN(n4960) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_5_ ( .D(n4597), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[5]), 
        .QN(n4991) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_6_ ( .D(n4596), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[6]), 
        .QN(n4974) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_7_ ( .D(n4595), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[7]), 
        .QN(n4948) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_8_ ( .D(n4594), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[8]), 
        .QN(n4931) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_9_ ( .D(n4593), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[9]), 
        .QN(n4932) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_10_ ( .D(n4592), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[10]), 
        .QN(n4937) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_11_ ( .D(n4591), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[11]), 
        .QN(n4940) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_12_ ( .D(n4590), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[12]), 
        .QN(n4943) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_13_ ( .D(n4589), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[13]), 
        .QN(n4977) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_14_ ( .D(n4588), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[14]), 
        .QN(n4946) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_15_ ( .D(n4587), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[15]), 
        .QN(n4916) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_16_ ( .D(n4586), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[16]), 
        .QN(n4921) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_17_ ( .D(n4585), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[17]), 
        .QN(n4922) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_18_ ( .D(n4584), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[18]), 
        .QN(n4927) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_19_ ( .D(n4583), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[19]), 
        .QN(n4895) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_20_ ( .D(n4582), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[20]), 
        .QN(n4901) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_21_ ( .D(n4581), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .QN(n4983) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_22_ ( .D(n4580), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[22]), 
        .QN(n4985) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_23_ ( .D(n4579), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[23]), 
        .QN(n4904) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_24_ ( .D(n4578), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[24]), 
        .QN(n4908) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_25_ ( .D(n4577), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[25]), 
        .QN(n4909) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_26_ ( .D(n4576), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[26]), 
        .QN(n4913) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_27_ ( .D(n4575), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[27]), 
        .QN(n4880) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_28_ ( .D(n4574), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[28]), 
        .QN(n4884) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_29_ ( .D(n4573), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[29]), 
        .QN(n4887) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_31_ ( .D(n4571), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[31]), 
        .QN(n4890) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_rx_tl_reg_0_ ( .D(n4465), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_rx_tl[0]), .QN(n10556) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_rx_tl_reg_2_ ( .D(n4463), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_rx_tl[2]), .QN(n10985) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_lcnt_reg_2_ ( .D(n4455), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_lcnt[2]), .QN(n5061) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_lcnt_reg_4_ ( .D(n4453), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_lcnt[4]), .QN(n5060) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_lcnt_reg_5_ ( .D(n4452), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_lcnt[5]), .QN(n10743) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_lcnt_reg_6_ ( .D(n4451), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_lcnt[6]), .QN(n5058) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_lcnt_reg_7_ ( .D(n4450), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_lcnt[7]), .QN(n5059) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_lcnt_reg_8_ ( .D(n4449), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_lcnt[8]), .QN(n10883) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_lcnt_reg_9_ ( .D(n4448), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_lcnt[9]), .QN(n11023) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_lcnt_reg_10_ ( .D(n4447), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_lcnt[10]), .QN(n4892) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_lcnt_reg_11_ ( .D(n4446), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_lcnt[11]), .QN(n10884)
         );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_lcnt_reg_12_ ( .D(n4445), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_lcnt[12]), .QN(n10882)
         );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_lcnt_reg_13_ ( .D(n4444), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_lcnt[13]), .QN(n11025)
         );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_lcnt_reg_14_ ( .D(n4443), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_lcnt[14]), .QN(n11029)
         );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_lcnt_reg_15_ ( .D(n4442), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_lcnt[15]), .QN(n4858) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_hcnt_reg_0_ ( .D(n4441), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_hcnt[0]), .QN(n5045) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_hcnt_reg_1_ ( .D(n4440), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_hcnt[1]) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_hcnt_reg_2_ ( .D(n4439), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_hcnt[2]), .QN(n10984) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_hcnt_reg_4_ ( .D(n4437), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_hcnt[4]), .QN(n11001) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_hcnt_reg_5_ ( .D(n4436), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_hcnt[5]), .QN(n4859) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_hcnt_reg_6_ ( .D(n4435), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_hcnt[6]), .QN(n10744) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_hcnt_reg_7_ ( .D(n4434), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_hcnt[7]), .QN(n4956) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_hcnt_reg_8_ ( .D(n4433), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_hcnt[8]), .QN(n4958) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_hcnt_reg_9_ ( .D(n4432), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_hcnt[9]), .QN(n11024) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_hcnt_reg_10_ ( .D(n4431), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_hcnt[10]), .QN(n4959) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_hcnt_reg_11_ ( .D(n4430), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_hcnt[11]), .QN(n4961) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_hcnt_reg_12_ ( .D(n4429), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_hcnt[12]), .QN(n10879)
         );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_hcnt_reg_13_ ( .D(n4428), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_hcnt[13]), .QN(n11026)
         );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_hcnt_reg_14_ ( .D(n4427), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_hcnt[14]), .QN(n4947) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_hcnt_reg_15_ ( .D(n4426), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_hcnt[15]), .QN(n5002) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sar_reg_1_ ( .D(n4424), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_sar[1]), .QN(n10837) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sar_reg_3_ ( .D(n4422), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_sar[3]), .QN(n5064) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sar_reg_5_ ( .D(n4420), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_sar[5]), .QN(n4950) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sar_reg_7_ ( .D(n4418), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_sar[7]), .QN(n10834) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sar_reg_8_ ( .D(n4417), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_sar[8]), .QN(n5063) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sar_reg_9_ ( .D(n4416), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_sar[9]), .QN(n4951) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_tar_reg_reg_1_ ( .D(n4414), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_tar[1]), .QN(n10778) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_tar_reg_reg_3_ ( .D(n4412), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_tar[3]), .QN(n4953) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_tar_reg_reg_5_ ( .D(n4410), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_tar[5]), .QN(n4933) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_tar_reg_reg_7_ ( .D(n4408), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_tar[7]), .QN(n4934) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_tar_reg_reg_8_ ( .D(n4407), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_tar[8]), .QN(n4935) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_tar_reg_reg_9_ ( .D(n4406), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_tar[9]), .QN(n4936) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_tar_reg_reg_10_ ( .D(n4405), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_tar[10]), .QN(n10881) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_tar_reg_reg_11_ ( .D(n4404), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_tar[11]), .QN(n4938) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_con_pre_reg_7_ ( .D(n4396), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_p_det_ifaddr), .QN(n4941) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_1_ ( .D(n4504), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[1]), .QN(n5013) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_2_ ( .D(n4503), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[2]), .QN(n10983) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_3_ ( .D(n4502), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[3]), .QN(n10991) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_4_ ( .D(n4501), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[4]), .QN(n11000) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_5_ ( .D(n4500), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[5]), .QN(n5044) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_6_ ( .D(n4499), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[6]), .QN(n5046) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_7_ ( .D(n4498), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[7]), .QN(n5040) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_8_ ( .D(n4497), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[8]), .QN(n4967) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_9_ ( .D(n4496), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[9]), .QN(n5049) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_10_ ( .D(n4495), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[10]), .QN(n5036) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_11_ ( .D(n4494), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[11]), .QN(
        n10895) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_12_ ( .D(n4493), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[12]), .QN(
        n10896) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_13_ ( .D(n4492), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[13]), .QN(
        n11028) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_14_ ( .D(n4491), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[14]), .QN(
        n11031) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_15_ ( .D(n4490), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[15]), .QN(
        n11033) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_16_ ( .D(n4483), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[16]), .QN(
        n10563) );
  FD2 i_ahb_U_arb_U_gctrl_bbc_reg_1_ ( .D(n4388), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_gctrl_bbc[1]), .QN(n10755) );
  FD2 i_ahb_U_arb_U_gctrl_bc_reg_3_ ( .D(n4370), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_gctrl_bc[3]), .QN(n10554) );
  FD2 i_ahb_U_arb_U_gctrl_bc_reg_2_ ( .D(n4371), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_gctrl_bc[2]), .QN(n10780) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_enable_sync_sample_meta_reg_0_ ( .D(
        i_i2c_ic_enable[0]), .CP(i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_enable_sync_next_sample_syncm1_0_) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_ic_bus_idle_reg ( .D(
        i_i2c_U_DW_apb_i2c_clk_gen_N13), .CP(i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_ic_bus_idle), .QN(n10457) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_gen_call_sample_meta_reg_0_ ( .D(
        i_i2c_ic_ack_general_call), .CP(i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_gen_call_next_sample_syncm1_0_) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_master_1_sync_sample_meta_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_master_1_sync_N2), .CP(i_i2c_ic_clk), 
        .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_master_1_sync_next_sample_syncm1_0_) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_ss_sync_sample_meta_reg_0_ ( .D(1'b1), .CP(
        i_i2c_ic_clk), .CD(n11059), .QN(n4902) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_10bit_mst_1_sync_sample_meta_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_10bit_mst_1_sync_N2), .CP(i_i2c_ic_clk), 
        .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_10bit_mst_1_sync_next_sample_syncm1_0_)
         );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_10bit_slv_1_sync_sample_meta_reg_0_ ( .D(
        n11114), .CP(i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_10bit_slv_1_sync_next_sample_syncm1_0_)
         );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_10bit_slv_1_sync_sample_syncl_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_10bit_slv_1_sync_next_sample_syncm1_0_), 
        .CP(i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_sync_ic_10bit_slv_sync_inv) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_rstrt_en_1_sync_sample_meta_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_rstrt_en_1_sync_N2), .CP(i_i2c_ic_clk), 
        .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_rstrt_en_1_sync_next_sample_syncm1_0_) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_slave_en_1_sync_sample_meta_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_slave_en_1_sync_N2), .CP(i_i2c_ic_clk), 
        .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_slave_en_1_sync_next_sample_syncm1_0_) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_slave_en_1_sync_sample_syncl_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_slave_en_1_sync_next_sample_syncm1_0_), 
        .CP(i_i2c_ic_clk), .CD(n4869), .Q(i_i2c_ic_slave_en_sync) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_p_det_ifaddr_sample_meta_reg_0_ ( .D(
        i_i2c_p_det_ifaddr), .CP(i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_p_det_ifaddr_next_sample_syncm1_0_) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_p_det_ifaddr_sample_syncl_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_p_det_ifaddr_next_sample_syncm1_0_), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(i_i2c_p_det_ifaddr_sync) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_0_ ( .D(
        i_i2c_ic_sda_hold[0]), .CP(i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[0]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_1_ ( .D(
        i_i2c_ic_sda_hold[1]), .CP(i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[1]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_2_ ( .D(
        i_i2c_ic_sda_hold[2]), .CP(i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[2]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_3_ ( .D(
        i_i2c_ic_sda_hold[3]), .CP(i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[3]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_4_ ( .D(
        i_i2c_ic_sda_hold[4]), .CP(i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[4]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_5_ ( .D(
        i_i2c_ic_sda_hold[5]), .CP(i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[5]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_6_ ( .D(
        i_i2c_ic_sda_hold[6]), .CP(i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[6]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_7_ ( .D(
        i_i2c_ic_sda_hold[7]), .CP(i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[7]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_8_ ( .D(
        i_i2c_ic_sda_hold[8]), .CP(i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[8]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_9_ ( .D(
        i_i2c_ic_sda_hold[9]), .CP(i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[9]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_10_ ( .D(
        i_i2c_ic_sda_hold[10]), .CP(i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[10]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_11_ ( .D(
        i_i2c_ic_sda_hold[11]), .CP(i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[11]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_12_ ( .D(
        i_i2c_ic_sda_hold[12]), .CP(i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[12]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_13_ ( .D(
        i_i2c_ic_sda_hold[13]), .CP(i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[13]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_14_ ( .D(
        i_i2c_ic_sda_hold[14]), .CP(i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[14]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_15_ ( .D(
        i_i2c_ic_sda_hold[15]), .CP(i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[15]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_16_ ( .D(
        i_i2c_ic_sda_hold[16]), .CP(i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[16]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_17_ ( .D(
        i_i2c_ic_sda_hold[17]), .CP(i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[17]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_18_ ( .D(
        i_i2c_ic_sda_hold[18]), .CP(i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[18]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_19_ ( .D(
        i_i2c_ic_sda_hold[19]), .CP(i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[19]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_20_ ( .D(
        i_i2c_ic_sda_hold[20]), .CP(i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[20]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_21_ ( .D(
        i_i2c_ic_sda_hold[21]), .CP(i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[21]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_22_ ( .D(
        i_i2c_ic_sda_hold[22]), .CP(i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[22]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_meta_reg_23_ ( .D(
        i_i2c_ic_sda_hold[23]), .CP(i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[23]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_18_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[18]), 
        .CP(i_i2c_ic_clk), .CD(n11059), .Q(i_i2c_ic_sda_rx_hold_sync[2]) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_20_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[20]), 
        .CP(i_i2c_ic_clk), .CD(n11059), .Q(i_i2c_ic_sda_rx_hold_sync[4]) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_U_scl_sync_U_SYNC_sample_meta_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_rx_filter_U_scl_sync_U_SYNC_N2), .CP(i_i2c_ic_clk), 
        .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_U_scl_sync_U_SYNC_next_sample_syncm1_0_)
         );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_U_scl_sync_U_SYNC_sample_syncl_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_rx_filter_U_scl_sync_U_SYNC_next_sample_syncm1_0_), 
        .CP(i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_U_scl_sync_data_d_int_0_), .QN(n10482) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_rx_filter_N57), .CP(i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[0]), .QN(n10466) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt_reg_5_ ( .D(
        i_i2c_U_DW_apb_i2c_rx_filter_N62), .CP(i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[5]), .QN(n10471) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_int_d_reg ( .D(i_i2c_scl_int), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(i_i2c_U_DW_apb_i2c_clk_gen_scl_int_d), 
        .QN(n10511) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_sda_vld_int_reg ( .D(n4668), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(i_i2c_sda_vld) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_U_sda_sync_U_SYNC_sample_syncl_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_rx_filter_U_sda_sync_U_SYNC_next_sample_syncm1_0_), 
        .CP(i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_U_sda_sync_data_d_int_0_), .QN(n10548) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_rx_filter_N94), .CP(i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[0]), .QN(n10425) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt_reg_1_ ( .D(
        i_i2c_U_DW_apb_i2c_rx_filter_N95), .CP(i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[1]), .QN(n10490) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt_reg_2_ ( .D(
        i_i2c_U_DW_apb_i2c_rx_filter_N96), .CP(i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[2]), .QN(n5051) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt_reg_3_ ( .D(
        i_i2c_U_DW_apb_i2c_rx_filter_N97), .CP(i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[3]), .QN(n10491) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt_reg_4_ ( .D(
        i_i2c_U_DW_apb_i2c_rx_filter_N98), .CP(i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[4]), .QN(n10435) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt_reg_5_ ( .D(
        i_i2c_U_DW_apb_i2c_rx_filter_N99), .CP(i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[5]), .QN(n10492) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt_reg_7_ ( .D(
        i_i2c_U_DW_apb_i2c_rx_filter_N101), .CP(i_i2c_ic_clk), .CD(n11059), 
        .Q(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[7]), .QN(n10489) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_s_det_reg ( .D(
        i_i2c_U_DW_apb_i2c_rx_filter_s_det_int), .CP(i_i2c_ic_clk), .CD(
        i_i2c_ic_rst_n), .Q(i_i2c_s_det) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_s_det_flg_sync_sample_meta_reg_0_ ( .D(
        i_i2c_s_det_flg), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_s_det_flg_sync_next_sample_syncm1_0_) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_s_det_flg_sync_sample_syncl_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_intctl_U_s_det_flg_sync_next_sample_syncm1_0_), 
        .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_s_det_flg_sync) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_s_det_flg_sync_q_reg ( .D(
        i_i2c_U_DW_apb_i2c_intctl_s_det_flg_sync), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_DW_apb_i2c_intctl_s_det_flg_sync_q) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr_reg_0_ ( .D(n4319), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[0]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_meta_reg_12_ ( 
        .D(i_i2c_tx_abrt_source[12]), .CP(PCLK_pclk), .CD(PRESETn_presetn), 
        .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[12]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_syncl_reg_12_ ( 
        .D(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[12]), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[12]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q_reg_12_ ( .D(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[12]), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[12]) );
  FD2 i_i2c_U_DW_apb_i2c_biu_prdata_reg_12_ ( .D(n3946), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_apb_prdata_apb_dslcr[12]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_flg_sync_sample_meta_reg_0_ ( .D(
        i_i2c_tx_abrt_flg), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_flg_sync_next_sample_syncm1_0_) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_flg_sync_sample_syncl_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_flg_sync_next_sample_syncm1_0_), 
        .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_flg_sync) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_tx_abrt_flg_sync_q_reg ( .D(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_flg_sync), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_DW_apb_i2c_intctl_tx_abrt_flg_sync_q) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_abort_sync_sample_meta_reg_0_ ( .D(
        i_i2c_ic_enable[1]), .CP(i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_ic_abort_sync_next_sample_syncm1_0_) );
  FD2 i_i2c_U_DW_apb_i2c_mstfsm_ic_abort_sync_d_reg ( .D(i_i2c_ic_abort_sync), 
        .CP(i_i2c_ic_clk), .CD(n11058), .QN(n4905) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_tx_empty_sync_sample_meta_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_empty_n), .CP(i_i2c_ic_clk), .CD(
        n11058), .Q(
        i_i2c_U_DW_apb_i2c_sync_U_tx_empty_sync_next_sample_syncm1_0_) );
  FD2 i_i2c_U_DW_apb_i2c_mstfsm_mst_gen_ack_en_r_reg ( .D(n11111), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_mstfsm_mst_gen_ack_en_r) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_ic_data_oe_early_reg ( .D(
        i_i2c_U_DW_apb_i2c_tx_shift_N84), .CP(i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_ic_data_oe_early) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_ic_data_oe_reg ( .D(
        i_i2c_U_DW_apb_i2c_tx_shift_ic_data_oe_early), .CP(i_i2c_ic_clk), .CD(
        n11058), .Q(i_i2c_ic_data_oe), .QN(n10540) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_debug_slv_cstate_reg_2_ ( .D(
        i_i2c_slv_debug_cstate[2]), .CP(i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_debug_slv_cstate[2]) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_debug_slv_cstate_reg_0_ ( .D(
        i_i2c_slv_debug_cstate[0]), .CP(i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_debug_slv_cstate[0]) );
  FD2 i_i2c_U_DW_apb_i2c_slvfsm_slv_rx_2addr_reg ( .D(n4302), .CP(i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(i_i2c_slv_rx_2addr), .QN(n10608) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_debug_slv_cstate_reg_3_ ( .D(
        i_i2c_slv_debug_cstate[3]), .CP(i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_debug_slv_cstate[3]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_slv_rx_aborted_sync_sample_meta_reg_0_ ( .D(
        i_i2c_slv_rx_aborted), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_slv_rx_aborted_sync_next_sample_syncm1_0_)
         );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_slv_rx_aborted_sync_sample_syncl_reg_0_ ( 
        .D(
        i_i2c_U_DW_apb_i2c_intctl_U_slv_rx_aborted_sync_next_sample_syncm1_0_), 
        .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_slv_rx_aborted_sync) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_bit_count_reg_0_ ( .D(n4293), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_bit_count_2to0[0]), .QN(n10518) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_bit_count_reg_2_ ( .D(n4291), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_bit_count_2to0[2]) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_slv_rxbyte_rdy_reg ( .D(n4295), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(i_i2c_slv_rxbyte_rdy), .QN(n10478) );
  FD2 i_i2c_U_DW_apb_i2c_slvfsm_slv_fifo_filled_and_flushed_reg ( .D(n4294), 
        .CP(i_i2c_ic_clk), .CD(n11057), .Q(i_i2c_slv_fifo_filled_and_flushed), 
        .QN(n10974) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_slv_fifo_filled_and_flushed_sync_sample_meta_reg_0_ ( 
        .D(i_i2c_slv_fifo_filled_and_flushed), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_slv_fifo_filled_and_flushed_sync_next_sample_syncm1_0_) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_slv_fifo_filled_and_flushed_sync_sample_syncl_reg_0_ ( 
        .D(
        i_i2c_U_DW_apb_i2c_intctl_U_slv_fifo_filled_and_flushed_sync_next_sample_syncm1_0_), .CP(PCLK_pclk), .CD(PRESETn_presetn), .QN(n5096) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_debug_addr_10bit_reg ( .D(i_i2c_rx_addr_10bit), 
        .CP(i_i2c_ic_clk), .CD(n11057), .Q(i_i2c_debug_addr_10bit) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_rx_gen_call_r_reg ( .D(i_i2c_rx_gen_call), 
        .CP(i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_toggle_rx_gen_call_r) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_rx_gen_call_flg_sync_sample_meta_reg_0_ ( 
        .D(i_i2c_rx_gen_call_flg), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_rx_gen_call_flg_sync_next_sample_syncm1_0_) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_rx_gen_call_flg_sync_sample_syncl_reg_0_ ( 
        .D(
        i_i2c_U_DW_apb_i2c_intctl_U_rx_gen_call_flg_sync_next_sample_syncm1_0_), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_rx_gen_call_flg_sync) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_rx_gen_call_flg_sync_q_reg ( .D(
        i_i2c_U_DW_apb_i2c_intctl_rx_gen_call_flg_sync), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_DW_apb_i2c_intctl_rx_gen_call_flg_sync_q)
         );
  FD2 i_i2c_U_DW_apb_i2c_toggle_debug_slv_cstate_reg_1_ ( .D(
        i_i2c_slv_debug_cstate[1]), .CP(i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_debug_slv_cstate[1]) );
  FD2 i_i2c_U_DW_apb_i2c_slvfsm_slv_activity_reg ( .D(
        i_i2c_U_DW_apb_i2c_slvfsm_N284), .CP(i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_slv_activity) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_debug_slave_act_reg ( .D(i_i2c_slv_activity), 
        .CP(i_i2c_ic_clk), .CD(n11056), .Q(i_i2c_debug_slave_act) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_slv_activity_sync_sample_meta_reg_0_ ( .D(
        i_i2c_slv_activity), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_slv_activity_sync_next_sample_syncm1_0_)
         );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_slv_activity_sync_sample_syncl_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_intctl_U_slv_activity_sync_next_sample_syncm1_0_), 
        .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_slv_activity_sync) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_slv_activity_r_reg ( .D(
        i_i2c_slv_activity_sync), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_regfile_slv_activity_r) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_p_det_flg_sync_sample_meta_reg_0_ ( .D(
        i_i2c_p_det_flg), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_p_det_flg_sync_next_sample_syncm1_0_) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_p_det_flg_sync_sample_syncl_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_intctl_U_p_det_flg_sync_next_sample_syncm1_0_), 
        .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_p_det_flg_sync) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_p_det_flg_sync_q_reg ( .D(
        i_i2c_U_DW_apb_i2c_intctl_p_det_flg_sync), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_DW_apb_i2c_intctl_p_det_flg_sync_q) );
  FD2 i_i2c_U_DW_apb_i2c_slvfsm_ic_enable_sync_vld_reg ( .D(n4296), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_slvfsm_ic_enable_sync_vld) );
  FD2 i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count_reg_2_ ( .D(n4279), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[2]) );
  FD2 i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count_reg_6_ ( .D(n4275), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[6]), .QN(n10586) );
  FD2 i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count_reg_7_ ( .D(n4274), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[7]), .QN(n10459) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_scl_hld_low_en_r_reg ( .D(
        i_i2c_scl_hld_low_en), .CP(i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_scl_hld_low_en_r) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_rx_done_flg_sync_sample_meta_reg_0_ ( .D(
        i_i2c_rx_done_flg), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_rx_done_flg_sync_next_sample_syncm1_0_) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_rx_done_flg_sync_sample_syncl_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_intctl_U_rx_done_flg_sync_next_sample_syncm1_0_), 
        .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_rx_done_flg_sync) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_rx_done_flg_sync_q_reg ( .D(
        i_i2c_U_DW_apb_i2c_intctl_rx_done_flg_sync), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_DW_apb_i2c_intctl_rx_done_flg_sync_q) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_slv_clr_leftover_flg_sync_sample_meta_reg_0_ ( 
        .D(i_i2c_slv_clr_leftover_flg), .CP(PCLK_pclk), .CD(PRESETn_presetn), 
        .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_slv_clr_leftover_flg_sync_next_sample_syncm1_0_) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_slv_clr_leftover_flg_sync_sample_syncl_reg_0_ ( 
        .D(
        i_i2c_U_DW_apb_i2c_intctl_U_slv_clr_leftover_flg_sync_next_sample_syncm1_0_), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_slv_clr_leftover_flg_sync) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_slv_clr_leftover_flg_sync_q_reg ( .D(
        i_i2c_U_DW_apb_i2c_intctl_slv_clr_leftover_flg_sync), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_slv_clr_leftover_flg_sync_q) );
  FD2 i_i2c_U_DW_apb_i2c_fifo_U_tx_pop_flg_sync_sample_meta_reg_0_ ( .D(
        i_i2c_tx_pop_flg), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_fifo_U_tx_pop_flg_sync_next_sample_syncm1_0_) );
  FD2 i_i2c_U_DW_apb_i2c_fifo_U_tx_pop_flg_sync_sample_syncl_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_fifo_U_tx_pop_flg_sync_next_sample_syncm1_0_), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_fifo_tx_pop_flg_sync) );
  FD2 i_i2c_U_DW_apb_i2c_fifo_tx_pop_flg_sync_q_reg ( .D(
        i_i2c_U_DW_apb_i2c_fifo_tx_pop_flg_sync), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_DW_apb_i2c_fifo_tx_pop_flg_sync_q) );
  FD2 i_i2c_U_DW_apb_i2c_fifo_tx_pop_sync_dly_reg ( .D(n5442), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .QN(n4906) );
  FD2 i_i2c_U_dff_tx_mem_reg_7__0_ ( .D(n4199), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[0]), .QN(n10852) );
  FD2 i_i2c_U_dff_tx_mem_reg_7__1_ ( .D(n4191), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[1]), .QN(n10856) );
  FD2 i_i2c_U_dff_tx_mem_reg_7__2_ ( .D(n4183), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[2]), .QN(n10855) );
  FD2 i_i2c_U_dff_tx_mem_reg_7__3_ ( .D(n4175), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[3]), .QN(n10859) );
  FD2 i_i2c_U_dff_tx_mem_reg_7__4_ ( .D(n4167), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[4]), .QN(n10853) );
  FD2 i_i2c_U_dff_tx_mem_reg_7__5_ ( .D(n4159), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[5]), .QN(n10857) );
  FD2 i_i2c_U_dff_tx_mem_reg_7__6_ ( .D(n4151), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[6]), .QN(n10854) );
  FD2 i_i2c_U_dff_tx_mem_reg_7__7_ ( .D(n4143), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[7]), .QN(n10858) );
  FD2 i_i2c_U_dff_tx_mem_reg_7__8_ ( .D(n4135), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[8]), .QN(n10860) );
  FD2 i_i2c_U_dff_tx_mem_reg_5__0_ ( .D(n4197), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[18]), .QN(n10949) );
  FD2 i_i2c_U_dff_tx_mem_reg_5__1_ ( .D(n4189), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[19]), .QN(n10921) );
  FD2 i_i2c_U_dff_tx_mem_reg_5__2_ ( .D(n4181), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[20]), .QN(n10928) );
  FD2 i_i2c_U_dff_tx_mem_reg_5__3_ ( .D(n4173), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[21]), .QN(n10899) );
  FD2 i_i2c_U_dff_tx_mem_reg_5__4_ ( .D(n4165), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[22]), .QN(n10942) );
  FD2 i_i2c_U_dff_tx_mem_reg_5__5_ ( .D(n4157), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[23]), .QN(n10913) );
  FD2 i_i2c_U_dff_tx_mem_reg_5__6_ ( .D(n4149), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[24]), .QN(n10935) );
  FD2 i_i2c_U_dff_tx_mem_reg_5__7_ ( .D(n4141), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[25]), .QN(n10906) );
  FD2 i_i2c_U_dff_tx_mem_reg_5__8_ ( .D(n4133), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[26]), .QN(n10885) );
  FD2 i_i2c_U_dff_tx_mem_reg_3__0_ ( .D(n4195), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[36]), .QN(n10952) );
  FD2 i_i2c_U_dff_tx_mem_reg_3__1_ ( .D(n4187), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[37]), .QN(n10924) );
  FD2 i_i2c_U_dff_tx_mem_reg_3__2_ ( .D(n4179), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[38]), .QN(n10931) );
  FD2 i_i2c_U_dff_tx_mem_reg_3__3_ ( .D(n4171), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[39]), .QN(n10902) );
  FD2 i_i2c_U_dff_tx_mem_reg_3__4_ ( .D(n4163), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[40]), .QN(n10945) );
  FD2 i_i2c_U_dff_tx_mem_reg_3__5_ ( .D(n4155), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[41]), .QN(n10916) );
  FD2 i_i2c_U_dff_tx_mem_reg_3__6_ ( .D(n4147), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[42]), .QN(n10938) );
  FD2 i_i2c_U_dff_tx_mem_reg_3__7_ ( .D(n4139), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[43]), .QN(n10909) );
  FD2 i_i2c_U_dff_tx_mem_reg_3__8_ ( .D(n4131), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[44]), .QN(n10889) );
  FD2 i_i2c_U_dff_tx_mem_reg_1__0_ ( .D(n4193), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[54]), .QN(n10953) );
  FD2 i_i2c_U_dff_tx_mem_reg_1__1_ ( .D(n4185), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[55]), .QN(n10925) );
  FD2 i_i2c_U_dff_tx_mem_reg_1__2_ ( .D(n4177), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[56]), .QN(n10932) );
  FD2 i_i2c_U_dff_tx_mem_reg_1__3_ ( .D(n4169), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[57]), .QN(n10903) );
  FD2 i_i2c_U_dff_tx_mem_reg_1__4_ ( .D(n4161), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[58]), .QN(n10946) );
  FD2 i_i2c_U_dff_tx_mem_reg_1__5_ ( .D(n4153), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[59]), .QN(n10917) );
  FD2 i_i2c_U_dff_tx_mem_reg_1__6_ ( .D(n4145), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[60]), .QN(n10939) );
  FD2 i_i2c_U_dff_tx_mem_reg_1__7_ ( .D(n4137), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[61]), .QN(n10910) );
  FD2 i_i2c_U_dff_tx_mem_reg_1__8_ ( .D(n4129), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[62]), .QN(n10890) );
  FD2 i_i2c_U_dff_tx_mem_reg_6__0_ ( .D(n4198), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[9]), .QN(n10955) );
  FD2 i_i2c_U_dff_tx_mem_reg_6__1_ ( .D(n4190), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[10]), .QN(n10927) );
  FD2 i_i2c_U_dff_tx_mem_reg_6__2_ ( .D(n4182), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[11]), .QN(n10934) );
  FD2 i_i2c_U_dff_tx_mem_reg_6__3_ ( .D(n4174), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[12]), .QN(n10905) );
  FD2 i_i2c_U_dff_tx_mem_reg_6__5_ ( .D(n4158), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[14]), .QN(n10919) );
  FD2 i_i2c_U_dff_tx_mem_reg_6__6_ ( .D(n4150), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[15]), .QN(n10941) );
  FD2 i_i2c_U_dff_tx_mem_reg_6__7_ ( .D(n4142), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[16]), .QN(n10912) );
  FD2 i_i2c_U_dff_tx_mem_reg_6__8_ ( .D(n4134), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[17]), .QN(n10892) );
  FD2 i_i2c_U_dff_tx_mem_reg_4__0_ ( .D(n4196), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[27]), .QN(n10950) );
  FD2 i_i2c_U_dff_tx_mem_reg_4__1_ ( .D(n4188), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[28]), .QN(n10922) );
  FD2 i_i2c_U_dff_tx_mem_reg_4__2_ ( .D(n4180), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[29]), .QN(n10929) );
  FD2 i_i2c_U_dff_tx_mem_reg_4__3_ ( .D(n4172), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[30]), .QN(n10900) );
  FD2 i_i2c_U_dff_tx_mem_reg_4__4_ ( .D(n4164), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[31]), .QN(n10943) );
  FD2 i_i2c_U_dff_tx_mem_reg_4__5_ ( .D(n4156), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[32]), .QN(n10914) );
  FD2 i_i2c_U_dff_tx_mem_reg_4__6_ ( .D(n4148), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[33]), .QN(n10936) );
  FD2 i_i2c_U_dff_tx_mem_reg_4__7_ ( .D(n4140), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[34]), .QN(n10907) );
  FD2 i_i2c_U_dff_tx_mem_reg_4__8_ ( .D(n4132), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[35]), .QN(n10887) );
  FD2 i_i2c_U_dff_tx_mem_reg_2__0_ ( .D(n4194), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[45]), .QN(n10954) );
  FD2 i_i2c_U_dff_tx_mem_reg_2__1_ ( .D(n4186), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[46]), .QN(n10926) );
  FD2 i_i2c_U_dff_tx_mem_reg_2__2_ ( .D(n4178), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[47]), .QN(n10933) );
  FD2 i_i2c_U_dff_tx_mem_reg_2__3_ ( .D(n4170), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[48]), .QN(n10904) );
  FD2 i_i2c_U_dff_tx_mem_reg_2__4_ ( .D(n4162), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[49]), .QN(n10947) );
  FD2 i_i2c_U_dff_tx_mem_reg_2__5_ ( .D(n4154), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[50]), .QN(n10918) );
  FD2 i_i2c_U_dff_tx_mem_reg_2__6_ ( .D(n4146), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[51]), .QN(n10940) );
  FD2 i_i2c_U_dff_tx_mem_reg_2__7_ ( .D(n4138), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[52]), .QN(n10911) );
  FD2 i_i2c_U_dff_tx_mem_reg_2__8_ ( .D(n4130), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[53]), .QN(n10891) );
  FD2 i_i2c_U_dff_tx_mem_reg_0__0_ ( .D(n4192), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[63]), .QN(n10951) );
  FD2 i_i2c_U_dff_tx_mem_reg_0__1_ ( .D(n4184), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[64]), .QN(n10923) );
  FD2 i_i2c_U_dff_tx_mem_reg_0__2_ ( .D(n4176), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[65]), .QN(n10930) );
  FD2 i_i2c_U_dff_tx_mem_reg_0__3_ ( .D(n4168), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[66]), .QN(n10901) );
  FD2 i_i2c_U_dff_tx_mem_reg_0__4_ ( .D(n4160), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[67]), .QN(n10944) );
  FD2 i_i2c_U_dff_tx_mem_reg_0__5_ ( .D(n4152), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[68]), .QN(n10915) );
  FD2 i_i2c_U_dff_tx_mem_reg_0__6_ ( .D(n4144), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[69]), .QN(n10937) );
  FD2 i_i2c_U_dff_tx_mem_reg_0__7_ ( .D(n4136), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[70]), .QN(n10908) );
  FD2 i_i2c_U_dff_tx_mem_reg_0__8_ ( .D(n4128), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[71]), .QN(n10888) );
  FD2 i_i2c_U_DW_apb_i2c_mstfsm_start_en_int_reg ( .D(n4201), .CP(i_i2c_ic_clk), .CD(n11054), .Q(i_i2c_start_en), .QN(n10429) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_st_scl_s_hld_en_reg ( .D(i_i2c_start_en), 
        .CP(i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_st_scl_s_hld_en) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_ack_int_reg ( .D(n4250), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(i_i2c_mst_rx_ack_vld), .QN(n5068) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_debug_mst_cstate_reg_3_ ( .D(
        i_i2c_mst_debug_cstate[3]), .CP(i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_debug_mst_cstate[3]) );
  FD2 i_i2c_U_DW_apb_i2c_fifo_U_rx_push_flg_sync_sample_meta_reg_0_ ( .D(
        i_i2c_rx_push_flg), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_fifo_U_rx_push_flg_sync_next_sample_syncm1_0_) );
  FD2 i_i2c_U_DW_apb_i2c_fifo_U_rx_push_flg_sync_sample_syncl_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_fifo_U_rx_push_flg_sync_next_sample_syncm1_0_), 
        .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_fifo_rx_push_flg_sync) );
  FD2 i_i2c_U_DW_apb_i2c_fifo_rx_push_sync_dly_reg ( .D(i_i2c_rx_push_sync), 
        .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_fifo_rx_push_sync_dly) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_debug_mst_cstate_reg_0_ ( .D(
        i_i2c_mst_debug_cstate[0]), .CP(i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_debug_mst_cstate[0]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_meta_reg_10_ ( 
        .D(i_i2c_tx_abrt_source[10]), .CP(PCLK_pclk), .CD(PRESETn_presetn), 
        .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[10]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_syncl_reg_10_ ( 
        .D(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[10]), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[10]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q_reg_10_ ( .D(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[10]), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[10]) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_debug_mst_cstate_reg_4_ ( .D(
        i_i2c_mst_debug_cstate[4]), .CP(i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_debug_mst_cstate[4]) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_debug_master_act_reg ( .D(i_i2c_mst_activity), 
        .CP(i_i2c_ic_clk), .CD(n11056), .Q(i_i2c_debug_master_act) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_mst_activity_sync_sample_meta_reg_0_ ( .D(
        i_i2c_mst_activity), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_mst_activity_sync_next_sample_syncm1_0_)
         );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_mst_activity_sync_sample_syncl_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_intctl_U_mst_activity_sync_next_sample_syncm1_0_), 
        .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_mst_activity_sync) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_mst_activity_r_reg ( .D(
        i_i2c_mst_activity_sync), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_regfile_mst_activity_r) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_activity_r_reg ( .D(i_i2c_activity), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_regfile_activity_r) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_stop_det_intr_reg ( .D(n11103), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_stop_det_intr) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_start_det_intr_reg ( .D(n11102), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_start_det_intr) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_rx_done_intr_reg ( .D(n11097), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_rx_done_intr) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_gen_call_intr_reg ( .D(n10631), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_gen_call_intr) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_tx_abrt_intr_reg ( .D(n11104), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_tx_abrt_intr) );
  FD2 i_i2c_U_DW_apb_i2c_biu_prdata_reg_6_ ( .D(n3952), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_apb_prdata_apb_dslcr[6]), .QN(n5117) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_activity_intr_reg ( .D(n11096), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_activity_intr) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_debug_mst_cstate_reg_1_ ( .D(
        i_i2c_mst_debug_cstate[1]), .CP(i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_debug_mst_cstate[1]) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_debug_mst_cstate_reg_2_ ( .D(
        i_i2c_mst_debug_cstate[2]), .CP(i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_debug_mst_cstate[2]) );
  FD2 i_i2c_U_DW_apb_i2c_mstfsm_old_is_read_reg ( .D(n4243), .CP(i_i2c_ic_clk), 
        .CD(n11055), .Q(i_i2c_U_DW_apb_i2c_mstfsm_old_is_read) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_meta_reg_16_ ( 
        .D(i_i2c_tx_abrt_source[16]), .CP(PCLK_pclk), .CD(PRESETn_presetn), 
        .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[16]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_syncl_reg_16_ ( 
        .D(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[16]), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[16]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q_reg_16_ ( .D(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[16]), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[16]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_meta_reg_5_ ( .D(
        i_i2c_tx_abrt_source[5]), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[5])
         );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_syncl_reg_5_ ( 
        .D(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[5]), 
        .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[5]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q_reg_5_ ( .D(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[5]), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[5]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_meta_reg_7_ ( .D(
        i_i2c_tx_abrt_source[7]), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[7])
         );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_syncl_reg_7_ ( 
        .D(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[7]), 
        .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[7]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q_reg_7_ ( .D(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[7]), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[7]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_meta_reg_0_ ( .D(
        i_i2c_tx_abrt_source[0]), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[0])
         );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_syncl_reg_0_ ( 
        .D(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[0]), 
        .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[0]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[0]), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[0]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_meta_reg_3_ ( .D(
        i_i2c_tx_abrt_source[3]), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[3])
         );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_syncl_reg_3_ ( 
        .D(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[3]), 
        .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[3]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q_reg_3_ ( .D(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[3]), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[3]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_meta_reg_1_ ( .D(
        i_i2c_tx_abrt_source[1]), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[1])
         );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_syncl_reg_1_ ( 
        .D(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[1]), 
        .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[1]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q_reg_1_ ( .D(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[1]), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[1]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_meta_reg_2_ ( .D(
        i_i2c_tx_abrt_source[2]), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[2])
         );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_syncl_reg_2_ ( 
        .D(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[2]), 
        .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[2]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q_reg_2_ ( .D(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[2]), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[2]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_meta_reg_4_ ( .D(
        i_i2c_tx_abrt_source[4]), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[4])
         );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_syncl_reg_4_ ( 
        .D(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[4]), 
        .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[4]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q_reg_4_ ( .D(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[4]), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[4]) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_debug_s_gen_reg ( .D(
        i_i2c_U_DW_apb_i2c_toggle_N27), .CP(i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_debug_s_gen) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_delay_re_start_en_or_split_start_en_reg_0_ ( 
        .D(i_i2c_U_DW_apb_i2c_rx_filter_N165), .CP(i_i2c_ic_clk), .CD(
        i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_delay_re_start_en_or_split_start_en[0])
         );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_delay_re_start_en_or_split_start_en_reg_1_ ( 
        .D(i_i2c_U_DW_apb_i2c_rx_filter_delay_re_start_en_or_split_start_en[0]), .CP(i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_delay_re_start_en_or_split_start_en[1])
         );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_delay_re_start_en_or_split_start_en_reg_2_ ( 
        .D(i_i2c_U_DW_apb_i2c_rx_filter_delay_re_start_en_or_split_start_en[1]), .CP(i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_delay_re_start_en_or_split_start_en[2])
         );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_delay_re_start_en_or_split_start_en_reg_3_ ( 
        .D(i_i2c_U_DW_apb_i2c_rx_filter_delay_re_start_en_or_split_start_en[2]), .CP(i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_delay_re_start_en_or_split_start_en[3])
         );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_scl_s_stp_int_reg ( .D(n4220), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(i_i2c_scl_s_setup_en), .QN(n10453) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cmplt_reg ( .D(n4203), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(i_i2c_scl_s_setup_cmplt), .QN(n10590)
         );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_set_tx_empty_en_flg_sync_sample_meta_reg_0_ ( 
        .D(i_i2c_set_tx_empty_en_flg), .CP(PCLK_pclk), .CD(PRESETn_presetn), 
        .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_set_tx_empty_en_flg_sync_next_sample_syncm1_0_) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_set_tx_empty_en_flg_sync_sample_syncl_reg_0_ ( 
        .D(
        i_i2c_U_DW_apb_i2c_intctl_U_set_tx_empty_en_flg_sync_next_sample_syncm1_0_), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_set_tx_empty_en_flg_sync) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_set_tx_empty_en_flg_sync_q_reg ( .D(
        i_i2c_U_DW_apb_i2c_intctl_set_tx_empty_en_flg_sync), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_set_tx_empty_en_flg_sync_q) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_mst_slv_ack_ext_r_reg ( .D(
        i_i2c_U_DW_apb_i2c_tx_shift_mst_slv_ack_ext), .CP(i_i2c_ic_clk), .CD(
        n11057), .Q(i_i2c_U_DW_apb_i2c_tx_shift_mst_slv_ack_ext_r) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_start_sda_gate_r_reg ( .D(
        i_i2c_U_DW_apb_i2c_tx_shift_N271), .CP(i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_start_sda_gate_r), .QN(n10581) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_meta_reg_15_ ( 
        .D(i_i2c_tx_abrt_source[15]), .CP(PCLK_pclk), .CD(PRESETn_presetn), 
        .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[15]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_syncl_reg_15_ ( 
        .D(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[15]), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[15]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q_reg_15_ ( .D(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[15]), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[15]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_meta_reg_13_ ( 
        .D(i_i2c_tx_abrt_source[13]), .CP(PCLK_pclk), .CD(PRESETn_presetn), 
        .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[13]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_syncl_reg_13_ ( 
        .D(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[13]), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[13]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q_reg_13_ ( .D(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[13]), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[13]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_ic_rd_req_flg_sync_sample_meta_reg_0_ ( .D(
        i_i2c_ic_rd_req_flg), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_ic_rd_req_flg_sync_next_sample_syncm1_0_)
         );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_ic_rd_req_flg_sync_sample_syncl_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_intctl_U_ic_rd_req_flg_sync_next_sample_syncm1_0_), 
        .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_ic_rd_req_flg_sync) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_rd_req_flg_sync_q_reg ( .D(
        i_i2c_U_DW_apb_i2c_intctl_ic_rd_req_flg_sync), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_DW_apb_i2c_intctl_ic_rd_req_flg_sync_q)
         );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_rd_req_intr_reg ( .D(n10736), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_rd_req_intr) );
  FD2 i_i2c_U_DW_apb_i2c_biu_prdata_reg_5_ ( .D(n3953), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_apb_prdata_apb_dslcr[5]), .QN(n10408) );
  FD2 i_i2c_U_DW_apb_i2c_mstfsm_tx_empty_hld_reg ( .D(n4076), .CP(i_i2c_ic_clk), .CD(n11056), .QN(n5099) );
  FD2 i_i2c_U_DW_apb_i2c_mstfsm_mst_tx_flush_reg ( .D(n4061), .CP(i_i2c_ic_clk), .CD(n11058), .Q(i_i2c_U_DW_apb_i2c_mstfsm_mst_tx_flush), .QN(n10797) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_meta_reg_9_ ( .D(
        i_i2c_tx_abrt_source[9]), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[9])
         );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_syncl_reg_9_ ( 
        .D(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[9]), 
        .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[9]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q_reg_9_ ( .D(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[9]), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[9]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_meta_reg_11_ ( 
        .D(i_i2c_tx_abrt_source[11]), .CP(PCLK_pclk), .CD(PRESETn_presetn), 
        .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[11]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_syncl_reg_11_ ( 
        .D(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[11]), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[11]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q_reg_11_ ( .D(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[11]), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[11]) );
  FD2 i_i2c_U_DW_apb_i2c_biu_prdata_reg_11_ ( .D(n3947), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_apb_prdata_apb_dslcr[11]), .QN(n5076) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_tx_over_intr_reg ( .D(n11106), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_tx_over_intr) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_txflr_reg_0_ ( .D(n4066), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_U_DW_apb_i2c_regfile_ic_txflr[0]) );
  FD2 i_i2c_U_DW_apb_i2c_biu_prdata_reg_4_ ( .D(n3954), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_apb_prdata_apb_dslcr[4]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_raw_rx_over_reg ( .D(n4055), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_raw_intr_stat[1]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_rx_over_intr_reg ( .D(n10630), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_rx_over_intr) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_rx_under_intr_reg ( .D(n11099), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_rx_under_intr) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_rxflr_reg_0_ ( .D(n4052), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[0]) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_rxflr_reg_2_ ( .D(n4050), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[2]), .QN(
        n5120) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_rxflr_reg_3_ ( .D(n4053), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[3]), .QN(
        n10410) );
  FD2 i_i2c_U_DW_apb_i2c_biu_prdata_reg_1_ ( .D(n3957), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_apb_prdata_apb_dslcr[1]), .QN(n10407) );
  FD2 i_i2c_U_DW_apb_i2c_biu_prdata_reg_3_ ( .D(n3955), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_apb_prdata_apb_dslcr[3]), .QN(n10406) );
  FD2 i_i2c_U_DW_apb_i2c_biu_prdata_reg_2_ ( .D(n3956), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_apb_prdata_apb_dslcr[2]) );
  FD2 i_i2c_U_DW_apb_i2c_biu_prdata_reg_7_ ( .D(n3951), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_apb_prdata_apb_dslcr[7]), .QN(n5118) );
  FD2 i_i2c_U_DW_apb_i2c_biu_prdata_reg_8_ ( .D(n3950), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_apb_prdata_apb_dslcr[8]) );
  FD2 i_i2c_U_DW_apb_i2c_biu_prdata_reg_9_ ( .D(n3949), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_apb_prdata_apb_dslcr[9]), .QN(n5094) );
  FD2 i_i2c_U_DW_apb_i2c_biu_prdata_reg_10_ ( .D(n3948), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_apb_prdata_apb_dslcr[10]), .QN(n5080) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_meta_reg_14_ ( 
        .D(i_i2c_tx_abrt_source[14]), .CP(PCLK_pclk), .CD(PRESETn_presetn), 
        .Q(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[14]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_sample_syncl_reg_14_ ( 
        .D(
        i_i2c_U_DW_apb_i2c_intctl_U_tx_abrt_source_sync_next_sample_syncm1[14]), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[14]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q_reg_14_ ( .D(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[14]), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[14]) );
  FD2 i_i2c_U_dff_rx_mem_reg_5__0_ ( .D(n4038), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[16]), .QN(n10963) );
  FD2 i_i2c_U_dff_rx_mem_reg_1__0_ ( .D(n4034), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[46]), .QN(n10964) );
  FD2 i_i2c_U_dff_rx_mem_reg_7__1_ ( .D(n4032), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[1]), .QN(n10819) );
  FD2 i_i2c_U_dff_rx_mem_reg_6__1_ ( .D(n4031), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[9]), .QN(n10817) );
  FD2 i_i2c_U_dff_rx_mem_reg_5__1_ ( .D(n4030), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[17]), .QN(n10971) );
  FD2 i_i2c_U_dff_rx_mem_reg_4__1_ ( .D(n4029), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[25]), .QN(n10816) );
  FD2 i_i2c_U_dff_rx_mem_reg_3__1_ ( .D(n4028), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[33]), .QN(n10814) );
  FD2 i_i2c_U_dff_rx_mem_reg_2__1_ ( .D(n4027), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[41]), .QN(n10815) );
  FD2 i_i2c_U_dff_rx_mem_reg_1__1_ ( .D(n4026), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[47]), .QN(n10972) );
  FD2 i_i2c_U_dff_rx_mem_reg_0__1_ ( .D(n4025), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[55]), .QN(n10818) );
  FD2 i_i2c_U_dff_rx_mem_reg_7__2_ ( .D(n4024), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[2]), .QN(n4910) );
  FD2 i_i2c_U_dff_rx_mem_reg_6__2_ ( .D(n4023), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[10]), .QN(n10979) );
  FD2 i_i2c_U_dff_rx_mem_reg_5__2_ ( .D(n4022), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[18]), .QN(n10975) );
  FD2 i_i2c_U_dff_rx_mem_reg_4__2_ ( .D(n4021), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[26]), .QN(n10978) );
  FD2 i_i2c_U_dff_rx_mem_reg_3__2_ ( .D(n4020), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[34]), .QN(n5113) );
  FD2 i_i2c_U_dff_rx_mem_reg_2__2_ ( .D(n4019), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[42]), .QN(n10977) );
  FD2 i_i2c_U_dff_rx_mem_reg_1__2_ ( .D(n4018), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[48]), .QN(n10976) );
  FD2 i_i2c_U_dff_rx_mem_reg_0__2_ ( .D(n4017), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[56]), .QN(n5109) );
  FD2 i_i2c_U_dff_rx_mem_reg_5__3_ ( .D(n4014), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[19]), .QN(n10987) );
  FD2 i_i2c_U_dff_rx_mem_reg_2__3_ ( .D(n4011), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .QN(n10993) );
  FD2 i_i2c_U_dff_rx_mem_reg_1__3_ ( .D(n4010), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[49]), .QN(n10988) );
  FD2 i_i2c_U_dff_rx_mem_reg_0__3_ ( .D(n4009), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .QN(n10992) );
  FD2 i_i2c_U_dff_rx_mem_reg_5__4_ ( .D(n4006), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[20]), .QN(n10995) );
  FD2 i_i2c_U_dff_rx_mem_reg_2__4_ ( .D(n4003), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .QN(n10999) );
  FD2 i_i2c_U_dff_rx_mem_reg_1__4_ ( .D(n4002), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[50]), .QN(n10996) );
  FD2 i_i2c_U_dff_rx_mem_reg_0__4_ ( .D(n4001), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .QN(n10998) );
  FD2 i_i2c_U_dff_rx_mem_reg_7__5_ ( .D(n4000), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[5]), .QN(n4911) );
  FD2 i_i2c_U_dff_rx_mem_reg_6__5_ ( .D(n3999), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[13]), .QN(n11009) );
  FD2 i_i2c_U_dff_rx_mem_reg_5__5_ ( .D(n3998), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[21]), .QN(n11005) );
  FD2 i_i2c_U_dff_rx_mem_reg_4__5_ ( .D(n3997), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[29]), .QN(n11008) );
  FD2 i_i2c_U_dff_rx_mem_reg_3__5_ ( .D(n3996), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[37]), .QN(n5114) );
  FD2 i_i2c_U_dff_rx_mem_reg_2__5_ ( .D(n3995), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[43]), .QN(n11007) );
  FD2 i_i2c_U_dff_rx_mem_reg_1__5_ ( .D(n3994), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[51]), .QN(n11006) );
  FD2 i_i2c_U_dff_rx_mem_reg_0__5_ ( .D(n3993), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[57]), .QN(n5111) );
  FD2 i_i2c_U_dff_rx_mem_reg_7__6_ ( .D(n3992), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[6]), .QN(n4914) );
  FD2 i_i2c_U_dff_rx_mem_reg_6__6_ ( .D(n3991), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[14]), .QN(n11013) );
  FD2 i_i2c_U_dff_rx_mem_reg_5__6_ ( .D(n3990), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[22]), .QN(n11011) );
  FD2 i_i2c_U_dff_rx_mem_reg_4__6_ ( .D(n3989), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[30]), .QN(n5091) );
  FD2 i_i2c_U_dff_rx_mem_reg_3__6_ ( .D(n3988), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[38]), .QN(n5115) );
  FD2 i_i2c_U_dff_rx_mem_reg_2__6_ ( .D(n3987), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[44]), .QN(n5090) );
  FD2 i_i2c_U_dff_rx_mem_reg_1__6_ ( .D(n3986), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[52]), .QN(n11012) );
  FD2 i_i2c_U_dff_rx_mem_reg_0__6_ ( .D(n3985), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[58]), .QN(n5110) );
  FD2 i_i2c_U_dff_rx_mem_reg_7__7_ ( .D(n3984), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[7]), .QN(n11020) );
  FD2 i_i2c_U_dff_rx_mem_reg_6__7_ ( .D(n3983), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[15]), .QN(n11019) );
  FD2 i_i2c_U_dff_rx_mem_reg_5__7_ ( .D(n3982), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[23]), .QN(n11017) );
  FD2 i_i2c_U_dff_rx_mem_reg_4__7_ ( .D(n3981), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[31]), .QN(n5093) );
  FD2 i_i2c_U_dff_rx_mem_reg_3__7_ ( .D(n3980), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[39]), .QN(n11016) );
  FD2 i_i2c_U_dff_rx_mem_reg_2__7_ ( .D(n3979), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[45]), .QN(n5092) );
  FD2 i_i2c_U_dff_rx_mem_reg_1__7_ ( .D(n3978), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[53]), .QN(n11018) );
  FD2 i_i2c_U_dff_rx_mem_reg_0__7_ ( .D(n3977), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[59]), .QN(n5108) );
  FD4 i_i2c_U_DW_apb_i2c_tx_shift_data_scl_reg ( .D(n3927), .CP(i_i2c_ic_clk), 
        .SD(n11055), .Q(i_i2c_U_DW_apb_i2c_tx_shift_data_scl) );
  FD4 i_i2c_U_DW_apb_i2c_tx_shift_data_sda_reg ( .D(n3926), .CP(i_i2c_ic_clk), 
        .SD(n11056), .Q(i_i2c_U_DW_apb_i2c_tx_shift_data_sda) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_intr_mask_reg_10_ ( .D(n3920), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_intr_mask[10]), .QN(
        n4915) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_0_ ( .D(n3918), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[0]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_1_ ( .D(n3917), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[1]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_2_ ( .D(n3916), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[2]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_3_ ( .D(n3915), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[3]), .QN(n5003) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_4_ ( .D(n3914), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[4]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_5_ ( .D(n3913), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[5]), .QN(n4990) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_6_ ( .D(n3912), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[6]), .QN(n4973) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_7_ ( .D(n3911), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[7]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_8_ ( .D(n3910), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[8]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_9_ ( .D(n3909), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[9]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_10_ ( .D(n3908), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[10]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_11_ ( .D(n3907), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[11]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_12_ ( .D(n3906), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[12]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_13_ ( .D(n3905), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[13]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_14_ ( .D(n3904), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[14]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_15_ ( .D(n3903), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[15]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_16_ ( .D(n3902), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[16]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_17_ ( .D(n3901), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[17]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_18_ ( .D(n3900), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[18]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_19_ ( .D(n3899), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[19]), .QN(n4894) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_20_ ( .D(n3898), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[20]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_21_ ( .D(n3897), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[21]), .QN(n4881) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_22_ ( .D(n3896), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[22]), .QN(n4984) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_23_ ( .D(n3895), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[23]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_24_ ( .D(n3894), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[24]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_25_ ( .D(n3893), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[25]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_26_ ( .D(n3892), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[26]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_27_ ( .D(n3891), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[27]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_28_ ( .D(n3890), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[28]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_29_ ( .D(n3889), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[29]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_30_ ( .D(n3888), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[30]) );
  FD2 i_apb_U_DW_apb_ahbsif_pwdata_int_reg_31_ ( .D(n3887), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_pwdata_int[31]) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_setup_reg_0_ ( .D(n3886), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_setup[0]), .QN(n4882) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_setup_reg_1_ ( .D(n3885), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_setup[1]), .QN(n4885) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_setup_reg_3_ ( .D(n3884), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_setup[3]), .QN(n4886) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_setup_reg_4_ ( .D(n3883), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_setup[4]), .QN(n4888) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_s_det_tog_reg ( .D(n3880), .CP(i_i2c_ic_clk), 
        .CD(n11054), .Q(i_i2c_s_det_flg) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_arb_lost_tog_reg ( .D(n3879), .CP(i_i2c_ic_clk), .CD(n11055), .Q(i_i2c_tx_abrt_source[12]) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_rx_gen_call_tog_reg ( .D(n3873), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(i_i2c_rx_gen_call_flg) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_p_det_tog_reg ( .D(n3872), .CP(i_i2c_ic_clk), 
        .CD(n4870), .Q(i_i2c_p_det_flg) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_slv_arb_lost_reg ( .D(n3871), .CP(
        i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_slv_arb_lost) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_tx_pop_tog_reg ( .D(n3870), .CP(i_i2c_ic_clk), 
        .CD(i_i2c_ic_rst_n), .Q(i_i2c_tx_pop_flg) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr_reg_0_ ( .D(n3851), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[0]) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_rx_push_tog_reg ( .D(n3834), .CP(i_i2c_ic_clk), 
        .CD(n11059), .Q(i_i2c_rx_push_flg) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_set_tx_empty_en_tog_reg ( .D(n3808), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(i_i2c_set_tx_empty_en_flg) );
  FD4 i_ahb_U_arb_U_gctrl_hgrant_previous_reg_1_ ( .D(
        ex_i_ahb_AHB_Master_hgrant), .CP(HCLK_hclk), .SD(HRESETn_hresetn), .Q(
        i_ahb_U_arb_U_gctrl_hgrant_previous[1]) );
  FD4 i_i2c_U_DW_apb_i2c_rx_filter_scl_clk_int_reg ( .D(n4349), .CP(
        i_i2c_ic_clk), .SD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_scl_clk_int), .QN(n5052) );
  FD4 i_i2c_U_DW_apb_i2c_rx_filter_scl_int_q_reg ( .D(i_i2c_scl_int), .CP(
        i_i2c_ic_clk), .SD(n11057), .Q(i_i2c_U_DW_apb_i2c_rx_filter_scl_int_q), 
        .QN(n5053) );
  FD4 i_i2c_U_DW_apb_i2c_rx_filter_sda_cnt_reg_0_ ( .D(n4347), .CP(
        i_i2c_ic_clk), .SD(n11058), .Q(i_i2c_U_DW_apb_i2c_rx_filter_sda_cnt_0_), .QN(n5055) );
  FD4 i_i2c_U_DW_apb_i2c_rx_filter_sda_cnt_reg_1_ ( .D(n4348), .CP(
        i_i2c_ic_clk), .SD(n4870), .QN(n5054) );
  FD4 i_i2c_U_DW_apb_i2c_rx_filter_sda_int_q_reg ( .D(i_i2c_sda_int), .CP(
        i_i2c_ic_clk), .SD(n11059), .Q(i_i2c_U_DW_apb_i2c_rx_filter_sda_int_q)
         );
  FD4 i_i2c_U_DW_apb_i2c_sync_tx_empty_sync_r_reg ( .D(n10436), .CP(
        i_i2c_ic_clk), .SD(n11055), .Q(i_i2c_U_DW_apb_i2c_sync_tx_empty_sync_r) );
  FD4 i_i2c_U_DW_apb_i2c_tx_shift_data_sda_prev_r_reg ( .D(n4081), .CP(
        i_i2c_ic_clk), .SD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_data_sda_prev_r), .QN(n10850) );
  FD4 i_i2c_U_DW_apb_i2c_tx_shift_slv_data_sda_reg ( .D(n4256), .CP(
        i_i2c_ic_clk), .SD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_slv_data_sda) );
  FD4 i_i2c_U_DW_apb_i2c_tx_shift_stop_scl_reg ( .D(n4103), .CP(i_i2c_ic_clk), 
        .SD(n4869), .Q(i_i2c_U_DW_apb_i2c_tx_shift_stop_scl), .QN(n5067) );
  FD4 i_i2c_U_DW_apb_i2c_tx_shift_re_start_scl_reg ( .D(n4083), .CP(
        i_i2c_ic_clk), .SD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_re_start_scl) );
  FD4 i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_data_scl_reg ( .D(n4049), .CP(
        i_i2c_ic_clk), .SD(n11057), .Q(i_i2c_mst_rx_data_scl), .QN(n4891) );
  FD4 i_i2c_U_DW_apb_i2c_tx_shift_re_start_sda_reg ( .D(n4082), .CP(
        i_i2c_ic_clk), .SD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_re_start_sda) );
  FD4 i_i2c_U_DW_apb_i2c_tx_shift_start_sda_reg ( .D(n4127), .CP(i_i2c_ic_clk), 
        .SD(n11054), .Q(i_i2c_U_DW_apb_i2c_tx_shift_start_sda) );
  FD4 i_i2c_U_DW_apb_i2c_tx_shift_stop_sda_gate_r_reg ( .D(
        i_i2c_U_DW_apb_i2c_tx_shift_N280), .CP(i_i2c_ic_clk), .SD(
        i_i2c_ic_rst_n), .Q(i_i2c_U_DW_apb_i2c_tx_shift_stop_sda_gate_r) );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_wr_addr_at_max_reg ( .D(
        i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N40), .CP(PCLK_pclk), .Q(
        i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_wr_addr_at_max) );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_wr_addr_int_reg_1_ ( .D(
        i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N42), .CP(PCLK_pclk), .Q(
        i_i2c_tx_wr_addr[1]), .QN(n10543) );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_rd_addr_int_reg_0_ ( .D(n11107), .CP(
        PCLK_pclk), .Q(i_i2c_tx_rd_addr[0]), .QN(n10893) );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_rd_addr_at_max_reg ( .D(
        i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N39), .CP(PCLK_pclk), .QN(n10886) );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_error_int_reg ( .D(
        i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N38), .CP(PCLK_pclk), .Q(
        i_i2c_U_DW_apb_i2c_fifo_tx_error_ir) );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_wr_addr_at_max_reg ( .D(
        i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N40), .CP(PCLK_pclk), .QN(n10839) );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_rd_addr_at_max_reg ( .D(
        i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N39), .CP(PCLK_pclk), .QN(n10962) );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_word_count_reg_2_ ( .D(n11101), .CP(
        PCLK_pclk), .Q(i_i2c_U_DW_apb_i2c_fifo_wrdc_rx_unconn[2]), .QN(n4972)
         );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_almost_full_int_reg ( .D(
        i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N36), .CP(PCLK_pclk), .QN(n10409) );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_error_int_reg ( .D(
        i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N38), .CP(PCLK_pclk), .Q(
        i_i2c_U_DW_apb_i2c_fifo_rx_error_ir) );
  FD2P i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_11_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[11]), 
        .CP(i_i2c_ic_clk), .CD(n11054), .Q(i_i2c_ic_sda_tx_hold_sync[11]), 
        .QN(n10487) );
  FD2P i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_12_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[12]), 
        .CP(i_i2c_ic_clk), .CD(n11057), .Q(i_i2c_ic_sda_tx_hold_sync[12]), 
        .QN(n10488) );
  FD2P i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_7_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[7]), 
        .CP(i_i2c_ic_clk), .CD(n4870), .Q(i_i2c_ic_sda_tx_hold_sync[7]), .QN(
        n10505) );
  FD2P i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_5_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[5]), 
        .CP(i_i2c_ic_clk), .CD(n11056), .Q(i_i2c_ic_sda_tx_hold_sync[5]), .QN(
        n11039) );
  FD2P i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_6_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[6]), 
        .CP(i_i2c_ic_clk), .CD(n11056), .Q(i_i2c_ic_sda_tx_hold_sync[6]), .QN(
        n11037) );
  FD2P i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_3_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[3]), 
        .CP(i_i2c_ic_clk), .CD(n11056), .Q(i_i2c_ic_sda_tx_hold_sync[3]), .QN(
        n11041) );
  FD2P i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_8_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[8]), 
        .CP(i_i2c_ic_clk), .CD(n4870), .Q(i_i2c_ic_sda_tx_hold_sync[8]), .QN(
        n10467) );
  FD2P i_ahb_U_mux_hsel_prev_reg_0_ ( .D(n4660), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_mux_hsel_prev[0]), .QN(n10747) );
  FD2P i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_1_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[1]), 
        .CP(i_i2c_ic_clk), .CD(n4870), .Q(i_i2c_ic_sda_tx_hold_sync[1]), .QN(
        n11043) );
  FD2P i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_9_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[9]), 
        .CP(i_i2c_ic_clk), .CD(n4869), .Q(i_i2c_ic_sda_tx_hold_sync[9]), .QN(
        n10485) );
  FD2P i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_10_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[10]), 
        .CP(i_i2c_ic_clk), .CD(n11058), .Q(i_i2c_ic_sda_tx_hold_sync[10]), 
        .QN(n10504) );
  FD2P i_ahb_U_mux_hsel_prev_reg_1_ ( .D(n4661), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_mux_hsel_prev[1]), .QN(n11047) );
  FD2P i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[0]), 
        .CP(i_i2c_ic_clk), .CD(n11058), .Q(n11089), .QN(n11042) );
  FD2P i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr_reg_0_ ( .D(n3869), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[0]) );
  FD2P i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt_reg_4_ ( .D(
        i_i2c_U_DW_apb_i2c_rx_filter_N61), .CP(i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[4]), .QN(n10469) );
  FD2P i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr_reg_0_ ( .D(n4335), .CP(
        i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[0]) );
  FD2P i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr_reg_0_ ( .D(n4124), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[0]) );
  FD2P i_i2c_U_DW_apb_i2c_regfile_r_ic_fs_spklen_reg_6_ ( .D(n4474), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_spklen_o[6]), .QN(n10829) );
  FD2P i_i2c_U_DW_apb_i2c_sync_U_tx_empty_sync_sample_syncl_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_tx_empty_sync_next_sample_syncm1_0_), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_sync_tx_empty_int_inv), .QN(n10436) );
  FD2P i_i2c_U_DW_apb_i2c_tx_shift_tx_fifo_data_buf_reg_8_ ( .D(n4264), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(i_i2c_tx_fifo_data_buf[8]), 
        .QN(n10424) );
  FD2P i_i2c_U_DW_apb_i2c_rx_shift_mst_rxbyte_rdy_reg ( .D(n4056), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(i_i2c_mst_rxbyte_rdy), .QN(n10774) );
  FD2P i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r_reg_6_ ( .D(n4093), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[6]), .QN(n10771) );
  FD2P i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r_reg_10_ ( .D(n4089), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[10]), .QN(n10770) );
  FD2P i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r_reg_13_ ( .D(n4086), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[13]), .QN(n10769) );
  FD2P i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r_reg_14_ ( .D(n4085), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[14]), .QN(n10620) );
  FD2P i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r_reg_15_ ( .D(n4084), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[15]), .QN(n10619) );
  FD2P i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr_reg_2_ ( .D(n4072), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[2]), .QN(n10746) );
  FD2P i_ahb_U_arb_U_gctrl_r_hmaster_reg_0_ ( .D(n4663), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_hmaster_0_), .QN(n11048) );
  FD2P i_apb_U_DW_apb_ahbsif_state_reg_0_ ( .D(n10421), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_state[0]), .QN(n5160) );
  FD2P i_apb_U_DW_apb_ahbsif_penable_reg ( .D(n3923), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_penable), .QN(n10782) );
  FD2P i_apb_U_DW_apb_ahbsif_paddr_reg_12_ ( .D(n11080), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_paddr[12]), .QN(n5481) );
  FD2P i_apb_U_DW_apb_ahbsif_paddr_reg_16_ ( .D(n11076), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_paddr[16]), .QN(n5479) );
  FD2P i_apb_U_DW_apb_ahbsif_paddr_reg_13_ ( .D(n11079), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(n10849) );
  FD2 i_apb_U_DW_apb_ahbsif_psel_en_reg ( .D(n3925), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_psel_en), .QN(n11046) );
  FD2P i_apb_U_DW_apb_ahbsif_paddr_reg_25_ ( .D(n11067), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_paddr[25]) );
  FD2P i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_4_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[4]), 
        .CP(i_i2c_ic_clk), .CD(n4869), .Q(i_i2c_ic_sda_tx_hold_sync[4]), .QN(
        n11038) );
  FD2P i_i2c_U_DW_apb_i2c_regfile_r_ic_fs_spklen_reg_4_ ( .D(n4476), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_spklen_o[4]), .QN(n11036) );
  FD2P i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt_reg_6_ ( .D(
        i_i2c_U_DW_apb_i2c_rx_filter_N63), .CP(i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[6]) );
  FD2P i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt_reg_7_ ( .D(
        i_i2c_U_DW_apb_i2c_rx_filter_N64), .CP(i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[7]), .QN(n10650) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_13_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[13]), 
        .CP(i_i2c_ic_clk), .CD(n11056), .Q(i_i2c_ic_sda_tx_hold_sync[13]), 
        .QN(n11035) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_setup_reg_6_ ( .D(n10510), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(n10897), .QN(
        i_i2c_ic_sda_setup[6]) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_setup_reg_5_ ( .D(n10509), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(n10898), .QN(
        i_i2c_ic_sda_setup[5]) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_setup_reg_2_ ( .D(n10508), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(n10986) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_tar_reg_reg_4_ ( .D(n10847), .CP(PCLK_pclk), .CD(PRESETn_presetn), .QN(n10844) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_tar_reg_reg_2_ ( .D(n10846), .CP(PCLK_pclk), .CD(PRESETn_presetn), .QN(n10843) );
  FD2P i_ahb_U_arb_U_arbif_r_haddr_d_reg_9_ ( .D(n4565), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_arbif_r_haddr_d[9]), .QN(n10785) );
  FD2P i_ahb_U_arb_U_arbif_r_haddr_d_reg_8_ ( .D(n4564), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_arbif_r_haddr_d[8]), .QN(n10784) );
  FD2P i_i2c_U_DW_apb_i2c_regfile_ic_rx_tl_reg_1_ ( .D(n4464), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_rx_tl[1]), .QN(n10775) );
  FD2P i_ahb_U_arb_U_arbif_idef_mst_reg_0_ ( .D(n4539), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_def_mst_0_), .QN(n10750) );
  FD2P i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr_reg_7_ ( .D(n4075), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[7]), .QN(n10734) );
  FD2P i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr_reg_3_ ( .D(n4071), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[3]), .QN(n10732) );
  FD2P i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr_reg_4_ ( .D(n4070), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[4]), .QN(n10731) );
  FD2P i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr_reg_5_ ( .D(n4069), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[5]), .QN(n10730) );
  FD2P i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr_reg_6_ ( .D(n4068), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[6]), .QN(n10729) );
  FD2P i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r_reg_4_ ( .D(n4095), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[4]), .QN(n10726) );
  FD2P i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r_reg_5_ ( .D(n4094), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[5]), .QN(n10725) );
  FD2P i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r_reg_8_ ( .D(n4091), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[8]), .QN(n10724) );
  FD2P i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r_reg_9_ ( .D(n4090), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[9]), .QN(n10723) );
  FD2P i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr_reg_5_ ( .D(n3827), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[5]), .QN(n10722) );
  FD2P i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr_reg_2_ ( .D(n3830), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[2]), .QN(n10721) );
  FD2P i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr_reg_4_ ( .D(n3828), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[4]), .QN(n10719) );
  FD2P i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr_reg_2_ ( .D(n4333), .CP(
        i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[2]), .QN(n10685) );
  FD2P i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr_reg_4_ ( .D(n4331), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[4]), .QN(n10683) );
  FD2P i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr_reg_5_ ( .D(n4330), .CP(
        i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[5]), .QN(n10682) );
  FD2P i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr_reg_2_ ( .D(n3867), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[2]), .QN(n10673) );
  FD2P i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr_reg_3_ ( .D(n3866), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[3]), .QN(n10672) );
  FD2P i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr_reg_5_ ( .D(n3864), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[5]), .QN(n10670) );
  FD2P i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr_reg_2_ ( .D(n4216), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[2]), .QN(n10663) );
  FD2P i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr_reg_3_ ( .D(n4215), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[3]), .QN(n10662) );
  FD2P i_ahb_U_arb_U_arbif_ireg_hrdata_reg_4_ ( .D(n4363), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_ahb_hrdata_s0[4]), .QN(n10649) );
  FD2P i_ahb_U_arb_U_arbif_ireg_hrdata_reg_6_ ( .D(n4361), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_ahb_hrdata_s0[6]), .QN(n10647) );
  FD2P i_ahb_U_arb_U_arbif_ireg_hrdata_reg_7_ ( .D(n4360), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_ahb_hrdata_s0[7]), .QN(n10646) );
  FD2P i_ahb_U_arb_U_arbif_ireg_hrdata_reg_9_ ( .D(n4358), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_ahb_hrdata_s0[9]), .QN(n10645) );
  FD2P i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r_reg_7_ ( .D(n4092), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[7]), .QN(n10621) );
  FD1P i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_rd_addr_int_reg_0_ ( .D(n11094), .CP(
        PCLK_pclk), .Q(i_i2c_rx_rd_addr[0]), .QN(n10592) );
  FD2P i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r_reg_3_ ( .D(n4096), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[3]), .QN(n10580) );
  FD2P i_ahb_U_arb_U_arbif_r_haddr_d_reg_0_ ( .D(n4556), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_arbif_r_haddr_d[0]), .QN(n10565) );
  FD2P i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_23_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[23]), 
        .CP(i_i2c_ic_clk), .CD(n11059), .Q(i_i2c_ic_sda_rx_hold_sync[7]), .QN(
        n10550) );
  FD1P i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_full_int_reg ( .D(n10521), .CP(
        PCLK_pclk), .Q(i_i2c_rx_full), .QN(n10547) );
  FD1P i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_word_count_reg_1_ ( .D(n10520), .CP(
        PCLK_pclk), .Q(i_i2c_U_DW_apb_i2c_fifo_wrdc_rx_unconn[1]), .QN(n10546)
         );
  FD2P i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count_reg_0_ ( .D(n4281), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[0]), .QN(n10541) );
  FD2P i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_16_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[16]), 
        .CP(i_i2c_ic_clk), .CD(n11059), .Q(i_i2c_ic_sda_rx_hold_sync[0]), .QN(
        n10523) );
  FD1P i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_rd_addr_int_reg_2_ ( .D(
        i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N46), .CP(PCLK_pclk), .Q(
        i_i2c_rx_rd_addr[2]), .QN(n10519) );
  FD2P i_apb_U_DW_apb_ahbsif_paddr_reg_5_ ( .D(n11083), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_i2c_reg_addr[3]), .QN(n10512) );
  FD2P i_i2c_U_DW_apb_i2c_slvfsm_slv_current_state_reg_3_ ( .D(
        i_i2c_U_DW_apb_i2c_slvfsm_N39), .CP(i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), 
        .Q(i_i2c_slv_debug_cstate[3]), .QN(n10497) );
  FD2P i_i2c_U_DW_apb_i2c_mstfsm_mst_current_state_reg_1_ ( .D(
        i_i2c_U_DW_apb_i2c_mstfsm_N68), .CP(i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_mst_debug_cstate[1]), .QN(n10494) );
  FD2P i_i2c_U_DW_apb_i2c_sync_U_ic_abort_sync_sample_syncl_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_abort_sync_next_sample_syncm1_0_), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(i_i2c_ic_abort_sync), .QN(n10493) );
  FD2P i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cmplt_reg ( .D(n3853), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(i_i2c_scl_s_hld_cmplt), .QN(n10484) );
  FD2P i_i2c_U_DW_apb_i2c_mstfsm_mst_current_state_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_mstfsm_N67), .CP(i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_mst_debug_cstate[0]), .QN(n10475) );
  FD2P i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt_reg_1_ ( .D(
        i_i2c_U_DW_apb_i2c_rx_filter_N58), .CP(i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[1]), .QN(n10470) );
  FD2P i_i2c_U_DW_apb_i2c_mstfsm_mst_current_state_reg_4_ ( .D(
        i_i2c_U_DW_apb_i2c_mstfsm_N71), .CP(i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_mst_debug_cstate[4]), .QN(n10465) );
  FD2P i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r_reg_12_ ( .D(n4087), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[12]), .QN(n10463) );
  FD2P i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r_reg_11_ ( .D(n4088), .CP(
        i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[11]), .QN(n10460) );
  FD2P i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count_reg_1_ ( .D(n4280), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[1]), .QN(n10448) );
  FD1P i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_rd_addr_int_reg_1_ ( .D(
        i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N45), .CP(PCLK_pclk), .Q(
        i_i2c_rx_rd_addr[1]), .QN(n10444) );
  FD1P i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_word_count_reg_0_ ( .D(n11100), .CP(
        PCLK_pclk), .Q(n10416), .QN(n10442) );
  FD2P i_i2c_U_DW_apb_i2c_slvfsm_slv_current_state_reg_1_ ( .D(
        i_i2c_U_DW_apb_i2c_slvfsm_N37), .CP(i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_slv_debug_cstate[1]), .QN(n10440) );
  FD2P i_i2c_U_DW_apb_i2c_regfile_ic_tx_tl_reg_1_ ( .D(n4472), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_tx_tl[1]), .QN(n10439) );
  FD2P i_i2c_U_DW_apb_i2c_rx_filter_ack_det_reg ( .D(n3815), .CP(i_i2c_ic_clk), 
        .CD(n4869), .Q(i_i2c_ack_det), .QN(n10437) );
  FD2P i_apb_U_DW_apb_ahbsif_state_reg_1_ ( .D(
        i_apb_U_DW_apb_ahbsif_nextstate_1_), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_state[1]), .QN(n10432) );
  FD2P i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r_reg_1_ ( .D(n4098), .CP(
        i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[1]), .QN(n10426) );
  FD2P i_apb_U_DW_apb_ahbsif_paddr_reg_18_ ( .D(n11074), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_paddr[18]) );
  FD2P i_apb_U_DW_apb_ahbsif_paddr_reg_24_ ( .D(n11068), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_paddr[24]), .QN(n5483) );
  FD2P i_apb_U_DW_apb_ahbsif_paddr_reg_19_ ( .D(n11073), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_paddr[19]), .QN(n5469) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_14_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[14]), 
        .CP(i_i2c_ic_clk), .CD(n11057), .Q(i_i2c_ic_sda_tx_hold_sync[14]), 
        .QN(n11034) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_2_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[2]), 
        .CP(i_i2c_ic_clk), .CD(n11055), .Q(i_i2c_ic_sda_tx_hold_sync[2]), .QN(
        n11040) );
  FD2P i_apb_U_DW_apb_ahbsif_paddr_reg_21_ ( .D(n11071), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_paddr[21]) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_31_ ( .D(n4604), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[31]) );
  FD2P i_apb_U_DW_apb_ahbsif_paddr_reg_29_ ( .D(n11063), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_paddr[29]), .QN(n5472) );
  FD2P i_i2c_U_DW_apb_i2c_regfile_ic_enable_reg_reg_0_ ( .D(n4506), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_enable[0]), .QN(n10412)
         );
  FD2 i_apb_U_DW_apb_ahbsif_paddr_reg_6_ ( .D(n11082), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_i2c_reg_addr[4]), .QN(n11045) );
  FD2 i_ahb_U_arb_U_mask_r_rec_hsplit_reg_1_ ( .D(n4535), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .QN(n10861) );
  FD2 i_ahb_U_arb_U_arbif_r_hwrite_d_reg ( .D(n4567), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .QN(n10959) );
  FD2 i_ahb_U_arb_U_arbif_ebtcount_reg_8_ ( .D(n4542), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .QN(n10961) );
  FD2 i_ahb_U_arb_U_arbif_ebt_reg ( .D(n4368), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_arbif_ebt) );
  FD2 i_ahb_U_arb_U_arbif_ebtcount_reg_5_ ( .D(n4545), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .QN(n10960) );
  FD3 i_ahb_U_arb_U_gctrl_hgrant_previous_reg_0_ ( .D(
        i_ahb_U_arb_U_gctrl_bus_hgrant_0_), .CP(HCLK_hclk), .CD(1'b1), .SD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_gctrl_hgrant_previous[0]) );
  FD2 i_ahb_U_arb_U_ebt_count_reg_9_ ( .D(n4375), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_ebt_int_count[9]) );
  FD2 i_ahb_U_arb_U_ebt_count_reg_8_ ( .D(n4376), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_ebt_int_count[8]) );
  FD2 i_ahb_U_arb_U_ebt_count_reg_7_ ( .D(n4377), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_ebt_int_count[7]) );
  FD2 i_ahb_U_arb_U_ebt_count_reg_6_ ( .D(n4378), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_ebt_int_count[6]), .QN(n4917) );
  FD2 i_ahb_U_arb_U_ebt_count_reg_5_ ( .D(n4379), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_ebt_int_count[5]), .QN(n4918) );
  FD2 i_ahb_U_arb_U_ebt_count_reg_4_ ( .D(n4380), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_ebt_int_count[4]) );
  FD2 i_ahb_U_arb_U_ebt_count_reg_2_ ( .D(n4382), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_ebt_int_count[2]) );
  FD2 i_ahb_U_arb_U_ebt_count_reg_0_ ( .D(n4384), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_ebt_int_count[0]) );
  FD2 i_ahb_U_arb_U_mask_extend_ltip_reg ( .D(n4391), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_mask_extend_ltip), .QN(n10874) );
  FD2 i_ahb_U_arb_U_ebt_ahbarbint_reg ( .D(n4369), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_ahbarbint) );
  FD2 i_apb_U_DW_apb_ahbsif_saved_haddr_reg_5_ ( .D(n4626), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_haddr_c[5]), .QN(
        n10842) );
  FD2 i_ahb_U_dfltslv_hready_resp_none_reg ( .D(i_ahb_U_dfltslv_next_state), 
        .CP(HCLK_hclk), .CD(HRESETn_hresetn), .Q(n10431), .QN(
        i_ahb_hready_resp_none) );
  FD2P i_ahb_U_mux_hsel_prev_reg_2_ ( .D(n4662), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_mux_hsel_prev[2]), .QN(n10404) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_rx_full_intr_reg ( .D(n11098), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_rx_full_intr) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_txflr_flushed_reg_2_ ( .D(n3804), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_regfile_ic_txflr_flushed[2]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_tx_empty_intr_reg ( .D(n11105), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_tx_empty_intr) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_txflr_flushed_reg_1_ ( .D(n3805), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_regfile_ic_txflr_flushed[1]) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_txflr_flushed_reg_0_ ( .D(n3806), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_regfile_ic_txflr_flushed[0]) );
  FD2 i_i2c_U_DW_apb_i2c_fifo_rx_pop_dly_reg ( .D(n11092), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_U_DW_apb_i2c_fifo_rx_pop_dly), .QN(
        n10958) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_txflr_flushed_reg_3_ ( .D(n3803), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_regfile_ic_txflr_flushed[3]) );
  FD2 i_i2c_U_DW_apb_i2c_fifo_tx_push_dly_reg ( .D(n7776), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_U_DW_apb_i2c_fifo_tx_push_dly) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_raw_rd_req_reg ( .D(n4077), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_raw_intr_stat[5]), .QN(n10841) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_tx_abrt_source_reg_12_ ( .D(n3963), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_tx_abrt_source[12]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_tx_abrt_source_reg_11_ ( .D(n3964), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_tx_abrt_source[11]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_tx_abrt_source_reg_10_ ( .D(n3965), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_tx_abrt_source[10]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_tx_abrt_source_reg_9_ ( .D(n3966), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_tx_abrt_source[9]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_tx_abrt_source_reg_7_ ( .D(n3968), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_tx_abrt_source[7]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_tx_abrt_source_reg_5_ ( .D(n3970), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_tx_abrt_source[5]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_tx_abrt_source_reg_4_ ( .D(n3971), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_tx_abrt_source[4]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_tx_abrt_source_reg_3_ ( .D(n3972), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_tx_abrt_source[3]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_tx_abrt_source_reg_2_ ( .D(n3973), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_tx_abrt_source[2]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_tx_abrt_source_reg_1_ ( .D(n3974), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_tx_abrt_source[1]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_tx_abrt_source_reg_0_ ( .D(n3975), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_tx_abrt_source[0]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_raw_activity_reg ( .D(n4245), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_raw_intr_stat[8]), .QN(n10411) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_tx_abrt_source_reg_16_ ( .D(n10528), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .QN(n10967) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_tx_abrt_source_reg_15_ ( .D(n10527), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .QN(n11032) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_tx_abrt_source_reg_14_ ( .D(n10525), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .QN(n11030) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_tx_abrt_source_reg_13_ ( .D(n10526), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .QN(n11027) );
  FD2 i_i2c_U_dff_tx_mem_reg_6__4_ ( .D(n4166), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_tx_mem[13]), .QN(n10948) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_23_ ( .D(n4482), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[23]), .QN(
        n10875) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_22_ ( .D(n4489), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[22]), .QN(
        n11015) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_21_ ( .D(n4488), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[21]), .QN(
        n10876) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_20_ ( .D(n4487), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[20]), .QN(
        n11004) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_19_ ( .D(n4486), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[19]), .QN(
        n10990) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_18_ ( .D(n4485), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[18]), .QN(
        n10981) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_17_ ( .D(n4484), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[17]), .QN(
        n10877) );
  FD2 i_i2c_U_DW_apb_i2c_biu_prdata_reg_15_ ( .D(n3943), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_apb_prdata_apb_dslcr[15]), .QN(n5098) );
  FD2 i_i2c_U_DW_apb_i2c_biu_prdata_reg_14_ ( .D(n3944), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_apb_prdata_apb_dslcr[14]), .QN(n5097) );
  FD2 i_i2c_U_DW_apb_i2c_biu_prdata_reg_13_ ( .D(n3945), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_apb_prdata_apb_dslcr[13]) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_ic_intr_mask_reg_2_ ( .D(n3939), .CP(
        PCLK_pclk), .SD(PRESETn_presetn), .Q(i_i2c_ic_intr_mask[2]), .QN(
        n10588) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_ic_intr_mask_reg_11_ ( .D(n3933), .CP(
        PCLK_pclk), .SD(PRESETn_presetn), .Q(i_i2c_ic_intr_mask[11]), .QN(
        n10806) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_ic_tar_reg_reg_6_ ( .D(n4409), .CP(PCLK_pclk), 
        .SD(PRESETn_presetn), .Q(i_i2c_ic_tar[6]), .QN(n10772) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_ic_intr_mask_reg_7_ ( .D(n3934), .CP(
        PCLK_pclk), .SD(PRESETn_presetn), .Q(i_i2c_ic_intr_mask[7]), .QN(
        n10804) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_ic_intr_mask_reg_5_ ( .D(n3936), .CP(
        PCLK_pclk), .SD(PRESETn_presetn), .Q(i_i2c_ic_intr_mask[5]), .QN(
        n10805) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_ic_intr_mask_reg_3_ ( .D(n3938), .CP(
        PCLK_pclk), .SD(PRESETn_presetn), .Q(i_i2c_ic_intr_mask[3]), .QN(
        n10799) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_ic_intr_mask_reg_1_ ( .D(n3940), .CP(
        PCLK_pclk), .SD(PRESETn_presetn), .Q(i_i2c_ic_intr_mask[1]), .QN(
        n10803) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_ic_intr_mask_reg_0_ ( .D(n3941), .CP(
        PCLK_pclk), .SD(PRESETn_presetn), .Q(i_i2c_ic_intr_mask[0]), .QN(
        n10802) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_r_ic_fs_spklen_reg_0_ ( .D(n4480), .CP(
        PCLK_pclk), .SD(PRESETn_presetn), .Q(i_i2c_ic_spklen_o[0]), .QN(n10583) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_ic_sda_hold_reg_0_ ( .D(n4505), .CP(PCLK_pclk), .SD(PRESETn_presetn), .Q(i_i2c_ic_sda_hold[0]), .QN(n10968) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_ic_tar_reg_reg_0_ ( .D(n4415), .CP(PCLK_pclk), 
        .SD(PRESETn_presetn), .Q(i_i2c_ic_tar[0]), .QN(n10920) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_ic_ack_general_call_reg ( .D(n4507), .CP(
        PCLK_pclk), .SD(PRESETn_presetn), .Q(i_i2c_ic_ack_general_call), .QN(
        n10969) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_ic_intr_mask_reg_6_ ( .D(n3935), .CP(
        PCLK_pclk), .SD(PRESETn_presetn), .Q(i_i2c_ic_intr_mask[6]), .QN(
        n10956) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_ic_intr_mask_reg_4_ ( .D(n3937), .CP(
        PCLK_pclk), .SD(PRESETn_presetn), .QN(n11003) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_ic_sar_reg_6_ ( .D(n4419), .CP(PCLK_pclk), 
        .SD(PRESETn_presetn), .Q(i_i2c_ic_sar[6]), .QN(n10880) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_ic_sar_reg_2_ ( .D(n4423), .CP(PCLK_pclk), 
        .SD(PRESETn_presetn), .Q(i_i2c_ic_sar[2]), .QN(n10982) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_ic_sar_reg_0_ ( .D(n4425), .CP(PCLK_pclk), 
        .SD(PRESETn_presetn), .Q(i_i2c_ic_sar[0]), .QN(n10966) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_hcnt_reg_3_ ( .D(n4438), .CP(
        PCLK_pclk), .SD(PRESETn_presetn), .Q(i_i2c_ic_hcnt[3]), .QN(n10878) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_ic_con_pre_reg_6_ ( .D(n4397), .CP(PCLK_pclk), 
        .SD(PRESETn_presetn), .Q(i_i2c_U_DW_apb_i2c_regfile_ic_con_pre_6_), 
        .QN(i_i2c_U_DW_apb_i2c_sync_U_ic_slave_en_1_sync_N2) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_ic_con_pre_reg_5_ ( .D(n4398), .CP(PCLK_pclk), 
        .SD(PRESETn_presetn), .Q(i_i2c_ic_rstrt_en), .QN(
        i_i2c_U_DW_apb_i2c_sync_U_ic_rstrt_en_1_sync_N2) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_ic_con_pre_reg_4_ ( .D(n4399), .CP(PCLK_pclk), 
        .SD(PRESETn_presetn), .QN(
        i_i2c_U_DW_apb_i2c_sync_U_ic_10bit_mst_1_sync_N2) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_ic_con_pre_reg_3_ ( .D(n4400), .CP(PCLK_pclk), 
        .SD(PRESETn_presetn), .Q(i_i2c_ic_10bit_slv), .QN(n11114) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_ic_con_pre_reg_0_ ( .D(n4403), .CP(PCLK_pclk), 
        .SD(PRESETn_presetn), .QN(
        i_i2c_U_DW_apb_i2c_sync_U_ic_master_1_sync_N2) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_ic_sar_reg_4_ ( .D(n4421), .CP(PCLK_pclk), 
        .SD(PRESETn_presetn), .Q(i_i2c_ic_sar[4]), .QN(n11002) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_lcnt_reg_1_ ( .D(n10529), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(n10838), .QN(i_i2c_ic_lcnt[1]) );
  FD2 i_ahb_U_arb_U_ebt_count_reg_3_ ( .D(n4381), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_ebt_int_count[3]), .QN(n10869) );
  FD2 i_ahb_U_arb_U_gctrl_ihlock_reg ( .D(n4385), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_gctrl_ihlock), .QN(n10593) );
  FD2 i_ahb_U_arb_U_arbif_r_hsize_d_reg_1_ ( .D(n4569), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_arbif_r_hsize_d[1]), .QN(n10788) );
  FD2 i_ahb_U_arb_U_arbif_r_haddr_d_reg_7_ ( .D(n4563), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_arbif_r_haddr_d[7]), .QN(n10779) );
  FD2 i_ahb_U_arb_U_gctrl_wasinn_reg ( .D(n4394), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_gctrl_wasinn), .QN(n10865) );
  FD2 i_ahb_U_arb_U_arbif_r_hsize_d_reg_0_ ( .D(n4568), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_arbif_r_hsize_d[0]), .QN(n10787) );
  FD2 i_ahb_U_arb_U_arbif_r_haddr_d_reg_4_ ( .D(n4560), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_arbif_r_haddr_d[4]), .QN(n10446) );
  FD2 i_ahb_U_arb_U_arbif_r_haddr_d_reg_2_ ( .D(n4558), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_arbif_r_haddr_d[2]), .QN(n10428) );
  FD2 i_ahb_U_arb_U_arbif_r_haddr_d_reg_1_ ( .D(n4557), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_arbif_r_haddr_d[1]), .QN(n10455) );
  FD2 i_apb_U_DW_apb_ahbsif_use_saved_data_reg ( .D(i_apb_U_DW_apb_ahbsif_N739), .CP(HCLK_hclk), .CD(HRESETn_hresetn), .Q(
        i_apb_U_DW_apb_ahbsif_use_saved_data), .QN(n10538) );
  FD2 i_ahb_U_arb_U_arbif_r_hsize_d_reg_2_ ( .D(n4570), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_arbif_r_hsize_d[2]), .QN(n10789) );
  FD2 i_ahb_U_arb_U_arbif_r_haddr_d_reg_6_ ( .D(n4562), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_arbif_r_haddr_d[6]), .QN(n10748) );
  FD2 i_ahb_U_arb_U_arbif_r_haddr_d_reg_5_ ( .D(n4561), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_arbif_r_haddr_d[5]), .QN(n10405) );
  FD2 i_ahb_U_arb_U_arbif_r_hsel_arb_d_reg ( .D(n4555), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_arbif_r_hsel_arb_d), .QN(n10786) );
  FD2 i_ahb_U_arb_U_arbif_r_htrans_d_reg_1_ ( .D(n4566), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_arbif_r_htrans_d_1_), .QN(n10749)
         );
  FD2 i_ahb_U_arb_U_arbif_ebtcount_reg_9_ ( .D(n4541), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_ebtcount[9]), .QN(n10873) );
  FD2 i_ahb_U_arb_U_mask_r_mask_locked_reg_1_ ( .D(n4390), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_ahb_U_arb_U_mask_r_mask_locked_1_), .QN(
        n10862) );
  FD2 i_ahb_U_arb_U_arbif_ipl1_reg_3_ ( .D(n4554), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_arbif_ipl1_int[3]), .QN(n10793) );
  FD2 i_ahb_U_arb_U_arbif_ipl1_reg_2_ ( .D(n4551), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_arbif_ipl1_int[2]), .QN(n10791) );
  FD2 i_ahb_U_arb_U_arbif_ipl1_reg_1_ ( .D(n4552), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_arbif_ipl1_int[1]), .QN(n10792) );
  FD2 i_ahb_U_arb_U_arbif_ebtcount_reg_7_ ( .D(n4543), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_ebtcount[7]), .QN(n10872) );
  FD2 i_ahb_U_arb_U_arbif_ebtcount_reg_6_ ( .D(n4544), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_ebtcount[6]), .QN(n10871) );
  FD2 i_ahb_U_arb_U_arbif_ebtcount_reg_4_ ( .D(n4546), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_ebtcount[4]), .QN(n10870) );
  FD2 i_ahb_U_arb_U_arbif_ebtcount_reg_3_ ( .D(n4547), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_ebtcount[3]), .QN(n10868) );
  FD2 i_ahb_U_arb_U_arbif_ebtcount_reg_2_ ( .D(n4548), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_ebtcount[2]), .QN(n10867) );
  FD2 i_ahb_U_arb_U_arbif_ebtcount_reg_1_ ( .D(n4549), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_ebtcount[1]), .QN(n10866) );
  FD2 i_ahb_U_arb_U_arbif_ebtcount_reg_0_ ( .D(n4550), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_ebtcount[0]), .QN(n10836) );
  FD2 i_ahb_U_arb_U_arbif_ebten_reg ( .D(n4540), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_ebten), .QN(n10751) );
  FD4 i_i2c_U_DW_apb_i2c_rx_filter_U_sda_sync_U_SYNC_sample_meta_reg_0_ ( .D(
        i_i2c_ic_data_in_a), .CP(i_i2c_ic_clk), .SD(i_i2c_ic_rst_n), .QN(
        i_i2c_U_DW_apb_i2c_rx_filter_U_sda_sync_U_SYNC_next_sample_syncm1_0_)
         );
  FD2 i_apb_U_DW_apb_ahbsif_saved_hwdata32_reg_30_ ( .D(n4572), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[30]), 
        .QN(n10851) );
  FD2P i_apb_U_DW_apb_ahbsif_pwrite_reg ( .D(n3924), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_pwrite), .QN(n10828) );
  FD2P i_apb_U_DW_apb_ahbsif_pipeline_reg ( .D(n4631), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_pipeline_c), .QN(n10483) );
  FD2P i_apb_U_DW_apb_ahbsif_paddr_reg_2_ ( .D(n11086), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_i2c_reg_addr[0]), .QN(n10530) );
  FD2P i_apb_U_DW_apb_ahbsif_paddr_reg_7_ ( .D(n11081), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_i2c_reg_addr[5]), .QN(n10524) );
  FD2P i_apb_U_DW_apb_ahbsif_paddr_reg_3_ ( .D(n11085), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_i2c_reg_addr[1]), .QN(n11044) );
  FD2P i_apb_U_DW_apb_ahbsif_paddr_reg_1_ ( .D(n11087), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_i2c_U_DW_apb_i2c_regfile_N402), .QN(n10970) );
  FD2P i_ahb_U_arb_U_arbif_r_hready_resp_s0_reg ( .D(n5554), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(n10501), .QN(n11184) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_debug_data_reg ( .D(
        i_i2c_U_DW_apb_i2c_toggle_N28), .CP(i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_debug_data) );
  FD2 i_i2c_U_DW_apb_i2c_slvfsm_slv_rx_aborted_reg ( .D(n4303), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(i_i2c_slv_rx_aborted) );
  FD2 i_i2c_U_DW_apb_i2c_mstfsm_abrt_in_rcve_trns_reg ( .D(n4062), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(i_i2c_abrt_in_rcve_trns), .QN(n11022) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_rx_push_data_reg_7_ ( .D(n3795), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(i_i2c_rx_push_data[7]), .QN(n11021) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_rx_push_data_reg_6_ ( .D(n3796), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(i_i2c_rx_push_data[6]), .QN(n11014) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_rx_push_data_reg_5_ ( .D(n3797), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(i_i2c_rx_push_data[5]), .QN(
        n11010) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_rx_push_data_reg_4_ ( .D(n3798), .CP(
        i_i2c_ic_clk), .CD(n11059), .Q(i_i2c_rx_push_data[4]), .QN(n10997) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_rx_push_data_reg_3_ ( .D(n3799), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(i_i2c_rx_push_data[3]), .QN(n10989) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_rx_push_data_reg_2_ ( .D(n3800), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(i_i2c_rx_push_data[2]), .QN(n10980) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_rx_push_data_reg_1_ ( .D(n3801), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(i_i2c_rx_push_data[1]), .QN(n10973) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_rx_push_data_reg_0_ ( .D(n3802), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(i_i2c_rx_push_data[0]), .QN(n10965) );
  FD2 i_i2c_U_DW_apb_i2c_mstfsm_split_start_en_int_reg ( .D(n4667), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(i_i2c_split_start_en) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_debug_p_gen_reg ( .D(n11110), .CP(i_i2c_ic_clk), .CD(n11055), .Q(i_i2c_debug_p_gen) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_rx_push_reg ( .D(
        i_i2c_U_DW_apb_i2c_rx_shift_N29), .CP(i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_rx_push) );
  FD2 i_i2c_U_DW_apb_i2c_mstfsm_delay_stop_en_reg ( .D(
        i_i2c_U_DW_apb_i2c_mstfsm_N399), .CP(i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_mstfsm_delay_stop_en) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_abrt_slvrd_intx_tog_reg ( .D(n4253), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(i_i2c_tx_abrt_source[15]) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_debug_rd_reg ( .D(n11109), .CP(i_i2c_ic_clk), 
        .CD(n4870), .Q(i_i2c_debug_rd) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_abrt_slv_arblost_tog_reg ( .D(n3976), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(i_i2c_tx_abrt_source[14]) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_debug_addr_reg ( .D(
        i_i2c_U_DW_apb_i2c_toggle_N29), .CP(i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_debug_addr) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_rx_done_tog_reg ( .D(n4254), .CP(i_i2c_ic_clk), 
        .CD(n4869), .Q(i_i2c_rx_done_flg) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_slv_clr_leftover_tog_reg ( .D(n4079), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(i_i2c_slv_clr_leftover_flg) );
  FD2 i_i2c_U_DW_apb_i2c_slvfsm_slv_addressed_reg ( .D(n4299), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(i_i2c_slv_addressed), .QN(n10957) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_abrt_10b_rd_norstrt_tog_reg ( .D(n4244), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(i_i2c_tx_abrt_source[10]) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_ready_reg ( .D(
        i_i2c_U_DW_apb_i2c_tx_shift_N394), .CP(i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_slv_tx_ready_unconn) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_ready_dly2_reg ( .D(
        i_i2c_U_DW_apb_i2c_tx_shift_N395), .CP(i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_ready_dly2) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_ack_vld_reg ( .D(n4262), .CP(
        i_i2c_ic_clk), .CD(n11059), .Q(i_i2c_slv_tx_ack_vld), .QN(n10894) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_ic_rd_req_tog_reg ( .D(n4078), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(i_i2c_ic_rd_req_flg) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_abrt_slvflush_txfifo_tog_reg ( .D(n4080), .CP(
        i_i2c_ic_clk), .CD(n11059), .Q(i_i2c_tx_abrt_source[13]) );
  FD2 i_i2c_U_DW_apb_i2c_mstfsm_abrt_in_idle_reg ( .D(n4237), .CP(i_i2c_ic_clk), .CD(n11055), .Q(i_i2c_U_DW_apb_i2c_mstfsm_abrt_in_idle) );
  FD2 i_i2c_U_DW_apb_i2c_slvfsm_slv_tx_flush_reg ( .D(n4273), .CP(i_i2c_ic_clk), .CD(n11055), .Q(i_i2c_U_DW_apb_i2c_slvfsm_slv_tx_flush), .QN(n10864) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_abrt_user_abrt_tog_reg ( .D(n4238), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(i_i2c_tx_abrt_source[16]) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_stop_scl_lcnt_en_reg ( .D(n4101), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_stop_scl_lcnt_en) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_abrt_txdata_noack_tog_reg ( .D(n4235), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(i_i2c_tx_abrt_source[3]) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_abrt_10addr2_noack_tog_reg ( .D(n4232), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(i_i2c_tx_abrt_source[2]) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_abrt_10addr1_noack_tog_reg ( .D(n4234), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(i_i2c_tx_abrt_source[1]) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_abrt_7b_addr_noack_tog_reg ( .D(n4236), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(i_i2c_tx_abrt_source[0]) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_abrt_gcall_noack_tog_reg ( .D(n4230), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(i_i2c_tx_abrt_source[4]) );
  FD3 i_i2c_U_DW_apb_i2c_tx_shift_re_start_sda_r_reg ( .D(
        i_i2c_U_DW_apb_i2c_tx_shift_re_start_sda), .CP(i_i2c_ic_clk), .CD(1'b1), .SD(i_i2c_ic_rst_n), .Q(i_i2c_U_DW_apb_i2c_tx_shift_re_start_sda_r) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_scl_edg_hl_q_reg ( .D(n11050), .CP(
        i_i2c_ic_clk), .CD(n4870), .QN(n4923) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_abrt_sbyte_norstrt_tog_reg ( .D(n4060), .CP(
        i_i2c_ic_clk), .CD(n11059), .Q(i_i2c_tx_abrt_source[9]) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_abrt_master_dis_tog_reg ( .D(n4059), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(i_i2c_tx_abrt_source[11]) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_scl_p_stp_int_reg ( .D(n4104), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(i_i2c_scl_p_setup_en) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_p_det_intr_reg ( .D(
        i_i2c_U_DW_apb_i2c_rx_filter_N199), .CP(i_i2c_ic_clk), .CD(
        i_i2c_ic_rst_n), .Q(i_i2c_p_det_intr) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_abrt_sbyte_ackdet_tog_reg ( .D(n4231), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(i_i2c_tx_abrt_source[7]) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_abrt_gcall_read_tog_reg ( .D(n4058), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(i_i2c_tx_abrt_source[5]) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_re_start_scl_lcnt_en_reg ( .D(n4126), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_re_start_scl_lcnt_en) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg_reg_7_ ( .D(n4041), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg[7]), .QN(n5083) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_mst_tx_bwen_reg ( .D(n3835), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(i_i2c_U_DW_apb_i2c_tx_shift_mst_tx_bwen) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_bwen_reg ( .D(n3807), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(i_i2c_mst_rx_bwen) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_scl_hl_edg_cntr_reg_0_ ( .D(n3877), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .QN(n4924) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_tx_pop_reg ( .D(n9116), .CP(i_i2c_ic_clk), 
        .CD(n11055), .Q(i_i2c_tx_pop) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_set_tx_empty_en_reg ( .D(
        i_i2c_U_DW_apb_i2c_tx_shift_N73), .CP(i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_set_tx_empty_en) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg_reg_4_ ( .D(n4044), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg[4]), .QN(n5081) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg_reg_0_ ( .D(n4048), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg[0]), .QN(n5082) );
  FD2 i_i2c_U_DW_apb_i2c_mstfsm_ic_abort_chk_win_reg ( .D(n3878), .CP(
        i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_mstfsm_ic_abort_chk_win) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg_reg_6_ ( .D(n4042), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg[6]), .QN(n5070) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg_reg_3_ ( .D(n4045), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg[3]), .QN(n5071) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg_reg_2_ ( .D(n4046), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg[2]), .QN(n5073) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_tx_abrt_r_reg ( .D(
        i_i2c_U_DW_apb_i2c_toggle_tx_abrt), .CP(i_i2c_ic_clk), .CD(n11058), 
        .QN(n5102) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cmplt_reg ( .D(n4320), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(i_i2c_U_DW_apb_i2c_mstfsm_N362) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_tx_fifo_data_buf_reg_5_ ( .D(n4267), .CP(
        i_i2c_ic_clk), .CD(n4869), .QN(n4925) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_tx_fifo_data_buf_reg_4_ ( .D(n4268), .CP(
        i_i2c_ic_clk), .CD(n11059), .QN(n4928) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_tx_fifo_data_buf_reg_2_ ( .D(n4270), .CP(
        i_i2c_ic_clk), .CD(n11054), .QN(n4929) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_tx_fifo_data_buf_reg_6_ ( .D(n4266), .CP(
        i_i2c_ic_clk), .CD(n11058), .QN(n4930) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_tx_fifo_data_buf_reg_0_ ( .D(n4272), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(i_i2c_tx_fifo_data_buf[0]), .QN(n4897)
         );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_tx_fifo_data_buf_reg_3_ ( .D(n4269), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(i_i2c_tx_fifo_data_buf[3]) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_tx_fifo_data_buf_reg_7_ ( .D(n4265), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(i_i2c_tx_fifo_data_buf[7]), .QN(n4898)
         );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_tx_fifo_data_buf_reg_1_ ( .D(n4271), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(i_i2c_tx_fifo_data_buf[1]) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg_reg_1_ ( .D(n4288), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[1]) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_bit_count_reg_2_ ( .D(n4257), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_bit_count[2]) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cmplt_reg ( .D(n3816), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(i_i2c_scl_p_setup_cmplt) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_rx_addr_10bit_reg ( .D(n4301), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(i_i2c_rx_addr_10bit), .QN(n5095) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr_reg_0_ ( .D(n3832), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[0]) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr_reg_1_ ( .D(n3850), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[1]) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_tx_shift_buf_reg_3_ ( .D(n4226), .CP(
        i_i2c_ic_clk), .CD(n11054), .QN(n4899) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_tx_shift_buf_reg_1_ ( .D(n4228), .CP(
        i_i2c_ic_clk), .CD(n11054), .QN(n4896) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_tx_shift_buf_reg_0_ ( .D(n4229), .CP(
        i_i2c_ic_clk), .CD(n11054), .QN(n5079) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg_reg_5_ ( .D(n4043), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg[5]), .QN(n5069) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg_reg_1_ ( .D(n4047), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg[1]), .QN(n5072) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_tx_shift_buf_reg_2_ ( .D(n4227), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_tx_shift_buf[2]) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_data_scl_lcnt_en_reg ( .D(n3809), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_data_scl_lcnt_en) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr_reg_1_ ( .D(n4334), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[1]) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr_reg_1_ ( .D(n3831), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[1]) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_ack_vld_reg ( .D(n4297), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(i_i2c_slv_rx_ack_vld), .QN(n4903) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr_reg_1_ ( .D(n3868), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[1]) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_mst_arb_lost_reg ( .D(n4057), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_mst_arb_lost) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_scl_hcnt_en_int_reg ( .D(n3810), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(i_i2c_scl_hcnt_en) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_tx_shift_buf_reg_7_ ( .D(n4222), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_tx_shift_buf[7]), .QN(n5077) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_tx_shift_buf_reg_6_ ( .D(n4223), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_tx_shift_buf[6]), .QN(n5075) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_tx_shift_buf_reg_5_ ( .D(n4224), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_tx_shift_buf[5]), .QN(n5078) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_tx_shift_buf_reg_4_ ( .D(n4225), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_tx_shift_buf[4]), .QN(n5074) );
  FD2 i_i2c_U_DW_apb_i2c_toggle_tx_abrt_tog_reg ( .D(n4240), .CP(i_i2c_ic_clk), 
        .CD(n11058), .Q(i_i2c_tx_abrt_flg) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_tx_bit_count_reg_2_ ( .D(n3812), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_tx_bit_count[2]) );
  FD2 i_i2c_U_DW_apb_i2c_mstfsm_byte_waiting_q_reg ( .D(n4233), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_mstfsm_byte_waiting_q) );
  FD2P i_apb_U_DW_apb_ahbsif_paddr_reg_26_ ( .D(n11066), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_paddr[26]) );
  FD4 i_ahb_U_arb_U_gctrl_bus_hgrant_reg_0_ ( .D(n3929), .CP(HCLK_hclk), .SD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_gctrl_bus_hgrant_0_), .QN(n10863)
         );
  FD4 i_apb_U_DW_apb_ahbsif_hready_resp_reg ( .D(n3942), .CP(HCLK_hclk), .SD(
        HRESETn_hresetn), .Q(i_apb_hready_resp), .QN(n10781) );
  FD2P i_apb_U_DW_apb_ahbsif_paddr_reg_15_ ( .D(n11077), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_paddr[15]) );
  FD2P i_i2c_U_DW_apb_i2c_fifo_rx_push_flg_sync_q_reg ( .D(
        i_i2c_U_DW_apb_i2c_fifo_rx_push_flg_sync), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_DW_apb_i2c_fifo_rx_push_flg_sync_q) );
  FD2P i_ahb_U_arb_U_gctrl_lock_sm_reg_0_ ( .D(n11090), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_gctrl_lock_sm[0]) );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_empty_n_reg ( .D(
        i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N33), .CP(PCLK_pclk), .Q(
        i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_empty_n), .QN(n10735) );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_full_int_reg ( .D(n6473), .CP(
        PCLK_pclk), .Q(n10413), .QN(n10535) );
  FD2 i_apb_U_DW_apb_ahbsif_use_saved_reg ( .D(n4664), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_use_saved_c), .QN(n10777)
         );
  FD2 i_ahb_U_arb_U_gctrl_bbc_reg_3_ ( .D(n4386), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_gctrl_bbc[3]), .QN(n10754) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_fs_spklen_reg_2_ ( .D(n4478), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_spklen_o[2]), .QN(n4968)
         );
  FD2 i_ahb_U_arb_U_gctrl_bc_reg_0_ ( .D(n4373), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_gctrl_bc[0]), .QN(n10753) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_fs_spklen_reg_3_ ( .D(n4477), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_spklen_o[3]), .QN(n10830) );
  FD2 i_i2c_U_dff_rx_mem_reg_6__0_ ( .D(n4039), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[8]), .QN(n10811) );
  FD2 i_ahb_U_arb_U_gctrl_csilt_reg ( .D(n4392), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_csilt), .QN(n10752) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r_reg_2_ ( .D(n4097), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[2]), .QN(n10727) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_raw_gen_call_reg ( .D(n4249), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_raw_intr_stat[11]), .QN(n10576) );
  FD2 i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count_reg_3_ ( .D(n4278), .CP(
        i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[3]), .QN(n10552) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_enable_reg_reg_1_ ( .D(n4239), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_enable[1]) );
  FD4 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_lcnt_reg_3_ ( .D(n4454), .CP(
        PCLK_pclk), .SD(PRESETn_presetn), .Q(i_i2c_ic_lcnt[3]), .QN(n10994) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_gen_call_sample_syncl_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_gen_call_next_sample_syncm1_0_), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(i_i2c_ic_ack_general_call_sync), 
        .QN(n10462) );
  FD4 i_i2c_U_DW_apb_i2c_sync_U_ic_ss_sync_sample_syncl_reg_0_ ( .D(n4902), 
        .CP(i_i2c_ic_clk), .SD(i_i2c_ic_rst_n), .Q(n10579) );
  FD2 i_apb_U_DW_apb_ahbsif_paddr_reg_31_ ( .D(n11061), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_paddr[31]), .QN(n10835) );
  FD2P i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr_reg_1_ ( .D(n4123), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[1]) );
  FD2P i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr_reg_0_ ( .D(n4218), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[0]) );
  FD2P i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr_reg_1_ ( .D(n4217), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[1]) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_fs_spklen_reg_1_ ( .D(n4479), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_spklen_o[1]), .QN(n10832) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_fs_spklen_reg_5_ ( .D(n4475), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_spklen_o[5]), .QN(n10464) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_ss_lcnt_reg_0_ ( .D(n4457), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_lcnt[0]), .QN(n5062) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_r_ic_fs_spklen_reg_7_ ( .D(n4481), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_spklen_o[7]), .QN(n10831) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_15_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[15]), 
        .CP(i_i2c_ic_clk), .CD(n11059), .Q(i_i2c_ic_sda_tx_hold_sync[15]), 
        .QN(n10477) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr_reg_6_ ( .D(n3863), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[6]), .QN(n10669) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr_reg_6_ ( .D(n4329), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[6]), .QN(n10681) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr_reg_4_ ( .D(n3865), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[4]), .QN(n10671) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_master_1_sync_sample_syncl_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_master_1_sync_next_sample_syncm1_0_), 
        .CP(i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_sync_ic_master_sync_inv), .QN(n10502) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr_reg_3_ ( .D(n4332), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[3]), .QN(n10684) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr_reg_4_ ( .D(n4120), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[4]), .QN(n10700) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr_reg_4_ ( .D(n4214), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[4]), .QN(n10661) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr_reg_5_ ( .D(n4213), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[5]), .QN(n10660) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr_reg_3_ ( .D(n4121), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[3]), .QN(n10701) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt_reg_3_ ( .D(
        i_i2c_U_DW_apb_i2c_rx_filter_N60), .CP(i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[3]), .QN(n5050) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr_reg_6_ ( .D(n3826), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[6]), .QN(n10718) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr_reg_2_ ( .D(n4317), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[2]), .QN(n10763) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr_reg_3_ ( .D(n3829), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[3]), .QN(n10720) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr_reg_2_ ( .D(n4122), .CP(
        i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[2]), .QN(n10702) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr_reg_1_ ( .D(n4318), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[1]), .QN(n10474) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr_reg_3_ ( .D(n4316), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[3]), .QN(n10692) );
  FD2 i_i2c_U_DW_apb_i2c_mstfsm_mst_current_state_reg_2_ ( .D(
        i_i2c_U_DW_apb_i2c_mstfsm_N69), .CP(i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_mst_debug_cstate[2]), .QN(n10472) );
  FD2 i_i2c_U_DW_apb_i2c_slvfsm_slv_current_state_reg_2_ ( .D(
        i_i2c_U_DW_apb_i2c_slvfsm_N38), .CP(i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_slv_debug_cstate[2]), .QN(n10479) );
  FD2 i_i2c_U_DW_apb_i2c_slvfsm_slv_current_state_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_slvfsm_N36), .CP(i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_slv_debug_cstate[0]), .QN(n10480) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr_reg_7_ ( .D(n3862), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[7]), .QN(n10602) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r_reg_0_ ( .D(n4099), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[0]), .QN(n10503) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr_reg_5_ ( .D(n4119), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[5]), .QN(n10699) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr_reg_6_ ( .D(n4118), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[6]), .QN(n10698) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt_reg_2_ ( .D(
        i_i2c_U_DW_apb_i2c_rx_filter_N59), .CP(i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[2]), .QN(n10468) );
  FD2 i_i2c_U_DW_apb_i2c_mstfsm_mst_current_state_reg_3_ ( .D(
        i_i2c_U_DW_apb_i2c_mstfsm_N70), .CP(i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_mst_debug_cstate[3]), .QN(n10473) );
  FD2 i_apb_U_DW_apb_ahbsif_state_reg_2_ ( .D(n5342), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_state[2]), .QN(n10500) );
  FD2 i_apb_U_DW_apb_ahbsif_piped_hwrite_reg ( .D(n4659), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_U_DW_apb_ahbsif_piped_hwrite_c), .QN(n10783) );
  FD2 i_ahb_U_arb_U_gctrl_lock_sm_reg_2_ ( .D(
        i_ahb_U_arb_U_gctrl_nxt_lock_sm_2_), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_gctrl_lock_sm[2]), .QN(n10433) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr_reg_6_ ( .D(n4212), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[6]), .QN(n10659) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr_reg_7_ ( .D(n4328), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[7]), .QN(n10606) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr_reg_4_ ( .D(n3847), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[4]), .QN(n10710) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr_reg_3_ ( .D(n3848), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[3]), .QN(n10711) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr_reg_7_ ( .D(n4117), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[7]), .QN(n10611) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr_reg_2_ ( .D(n3849), .CP(
        i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[2]), .QN(n10712) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_p_det_reg ( .D(n11129), .CP(i_i2c_ic_clk), 
        .CD(i_i2c_ic_rst_n), .Q(i_i2c_p_det), .QN(n10567) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_hcnt_cmplt_int_reg ( .D(n3852), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_hcnt_cmplt_int), .QN(n10430) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_rstrt_en_1_sync_sample_syncl_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_rstrt_en_1_sync_next_sample_syncm1_0_), 
        .CP(i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_sync_ic_rstrt_en_sync_inv), .QN(n10516) );
  FD4 i_ahb_U_arb_U_gctrl_bbc_reg_0_ ( .D(n10401), .CP(HCLK_hclk), .SD(
        HRESETn_hresetn), .Q(n10486) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr_reg_5_ ( .D(n4314), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[5]), .QN(n10690) );
  FD2 i_ahb_U_arb_U_gctrl_r_hmaster_d_reg_0_ ( .D(n4393), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_gctrl_r_hmaster_d_0_), .QN(n10476)
         );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr_reg_8_ ( .D(n4327), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[8]), .QN(n10680) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr_reg_9_ ( .D(n4326), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[9]), .QN(n10679) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr_reg_9_ ( .D(n3860), .CP(
        i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[9]), .QN(n10667) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_rx_scl_hcnt_en_reg ( .D(n4252), .CP(
        i_i2c_ic_clk), .CD(n11059), .Q(i_i2c_rx_scl_hcnt_en), .QN(n10766) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr_reg_8_ ( .D(n3861), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[8]), .QN(n10668) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr_reg_8_ ( .D(n4116), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[8]), .QN(n10697) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr_reg_5_ ( .D(n3846), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[5]), .QN(n10709) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr_reg_7_ ( .D(n4211), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[7]), .QN(n10597) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_lcnt_cmplt_reg ( .D(n4109), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(i_i2c_scl_lcnt_cmplt), .QN(n10532) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr_reg_4_ ( .D(n4315), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[4]), .QN(n10691) );
  FD2 i_ahb_U_arb_U_gctrl_bus_hgrant_reg_1_ ( .D(n3881), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(ex_i_ahb_AHB_Master_hgrant), .QN(n10506) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_17_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[17]), 
        .CP(i_i2c_ic_clk), .CD(n11059), .Q(i_i2c_ic_sda_rx_hold_sync[1]), .QN(
        n10507) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_mst_tx_ack_int_reg ( .D(n3833), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(i_i2c_mst_tx_ack_vld), .QN(n10495) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr_reg_9_ ( .D(n4115), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[9]), .QN(n10696) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_bit_count_reg_1_ ( .D(n4292), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_bit_count_2to0[1]), .QN(n10629) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr_reg_6_ ( .D(n3845), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[6]), .QN(n10708) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr_reg_8_ ( .D(n4210), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[8]), .QN(n10658) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr_reg_8_ ( .D(n3824), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[8]), .QN(n10717) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr_reg_7_ ( .D(n3844), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[7]), .QN(n10614) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr_reg_7_ ( .D(n3825), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[7]), .QN(n10571) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr_reg_9_ ( .D(n3823), .CP(
        i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[9]), .QN(n10716) );
  FD2 i_ahb_U_arb_U_gctrl_bc_reg_1_ ( .D(n4372), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_gctrl_bc[1]) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr_reg_6_ ( .D(n4313), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[6]), .QN(n10689) );
  FD2 i_apb_U_DW_apb_ahbsif_paddr_reg_30_ ( .D(n11062), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_paddr[30]), .QN(n5473) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg_reg_7_ ( .D(n4282), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[7]), .QN(n10741) );
  FD2 i_i2c_U_DW_apb_i2c_mstfsm_addr_2byte_sent_reg ( .D(n4241), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_mstfsm_addr_2byte_sent), .QN(n10515) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_bit_count_reg_3_ ( .D(n4290), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_bit_count_3_), .QN(n10499) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_tx_bit_count_reg_3_ ( .D(n3811), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_tx_bit_count[3]), .QN(n10445) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_19_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[19]), 
        .CP(i_i2c_ic_clk), .CD(n11059), .Q(i_i2c_ic_sda_rx_hold_sync[3]), .QN(
        n10498) );
  FD2 i_i2c_U_DW_apb_i2c_mstfsm_addr_1byte_sent_reg ( .D(n4242), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_mstfsm_addr_1byte_sent), .QN(n10536) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_tx_bit_count_reg_1_ ( .D(n3813), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_tx_bit_count[1]), .QN(n10572) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr_reg_11_ ( .D(n3821), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[11]), .QN(n10618) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr_reg_10_ ( .D(n3841), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[10]), .QN(n10705) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr_reg_11_ ( .D(n4113), .CP(
        i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[11]), .QN(n10610) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_10bit_mst_1_sync_sample_syncl_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_10bit_mst_1_sync_next_sample_syncm1_0_), 
        .CP(i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_sync_ic_10bit_mst_sync_inv), .QN(n10438) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_tx_bit_count_reg_0_ ( .D(n3814), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_tx_bit_count[0]), .QN(n10607) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr_reg_10_ ( .D(n4114), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[10]), .QN(n10695) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr_reg_10_ ( .D(n4208), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[10]), .QN(n10656) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr_reg_10_ ( .D(n4325), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[10]), .QN(n10678) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr_reg_10_ ( .D(n3859), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[10]), .QN(n10666) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr_reg_11_ ( .D(n4324), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[11]), .QN(n10605) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr_reg_14_ ( .D(n4305), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[14]), .QN(n10568) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr_reg_12_ ( .D(n4323), .CP(
        i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[12]), .QN(n10677) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr_reg_10_ ( .D(n3822), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[10]), .QN(n10715) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_rx_scl_lcnt_en_reg ( .D(n4251), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(i_i2c_rx_scl_lcnt_en), .QN(n10796) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_re_scl_s_hld_en_reg ( .D(n4202), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_re_scl_s_hld_en), .QN(n10795) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr_reg_8_ ( .D(n4311), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[8]), .QN(n10761) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr_reg_12_ ( .D(n3839), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[12]), .QN(n10704) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr_reg_15_ ( .D(n4304), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[15]), .QN(n10764) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr_reg_7_ ( .D(n4312), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[7]), .QN(n10762) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg_reg_0_ ( .D(n4289), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[0]), .QN(n10742) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr_reg_9_ ( .D(n4310), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[9]), .QN(n10760) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr_reg_13_ ( .D(n4306), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[13]), .QN(n10758) );
  FD2 i_apb_U_DW_apb_ahbsif_paddr_reg_22_ ( .D(n11070), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_paddr[22]) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_cmplt_reg ( .D(n4260), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(i_i2c_slv_tx_cmplt), .QN(n10549) );
  FD2 i_apb_U_DW_apb_ahbsif_paddr_reg_27_ ( .D(n11065), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_paddr[27]), .QN(n5467) );
  FD2 i_apb_U_DW_apb_ahbsif_paddr_reg_14_ ( .D(n11078), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(n10848) );
  FD2 i_apb_U_DW_apb_ahbsif_paddr_reg_23_ ( .D(n11069), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_paddr[23]) );
  FD2 i_apb_U_DW_apb_ahbsif_paddr_reg_28_ ( .D(n11064), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_paddr[28]) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg_reg_5_ ( .D(n4284), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[5]), .QN(n10496) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg_reg_3_ ( .D(n4286), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[3]), .QN(n10441) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg_reg_4_ ( .D(n4285), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[4]), .QN(n10739) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg_reg_6_ ( .D(n4283), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[6]), .QN(n10740) );
  FD2 i_apb_U_DW_apb_ahbsif_paddr_reg_20_ ( .D(n11072), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_paddr[20]), .QN(n4919) );
  FD2 i_apb_U_DW_apb_ahbsif_paddr_reg_17_ ( .D(n11075), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_paddr[17]), .QN(n4954) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg_reg_2_ ( .D(n4287), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[2]), .QN(n10674) );
  FD2 i_apb_U_DW_apb_ahbsif_paddr_reg_4_ ( .D(n11084), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_i2c_reg_addr[2]), .QN(n10415) );
  FD2 i_ahb_U_arb_U_arbif_r_hmaster_d_reg_0_ ( .D(n4603), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_arbif_r_hmaster_d_0_), .QN(n10450)
         );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt_reg_6_ ( .D(
        i_i2c_U_DW_apb_i2c_rx_filter_N100), .CP(i_i2c_ic_clk), .CD(n11058), 
        .Q(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[6]), .QN(n10434) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_tx_tl_reg_2_ ( .D(n4471), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_tx_tl[2]), .QN(n10533) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_byte_wait_scl_reg ( .D(
        i_i2c_U_DW_apb_i2c_tx_shift_byte_wait_en), .CP(i_i2c_ic_clk), .CD(
        n11056), .Q(i_i2c_byte_wait_scl), .QN(n10534) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_21_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[21]), 
        .CP(i_i2c_ic_clk), .CD(n11059), .Q(i_i2c_ic_sda_rx_hold_sync[5]), .QN(
        n10539) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_tx_tl_reg_0_ ( .D(n4473), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_tx_tl[0]), .QN(n10517) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr_reg_13_ ( .D(n3838), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[13]), .QN(n10703) );
  FD2 i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr_reg_0_ ( .D(n4074), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[0]), .QN(n10733) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr_reg_12_ ( .D(n4112), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[12]), .QN(n10694) );
  FD2 i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr_reg_1_ ( .D(n4073), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(
        i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[1]), .QN(n10773) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr_reg_9_ ( .D(n3842), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[9]), .QN(n10706) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr_reg_11_ ( .D(n3858), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[11]), .QN(n10601) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr_reg_12_ ( .D(n3820), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[12]), .QN(n10714) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr_reg_9_ ( .D(n4209), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[9]), .QN(n10657) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr_reg_12_ ( .D(n4307), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[12]), .QN(n10687) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr_reg_11_ ( .D(n3840), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[11]), .QN(n10613) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_ic_clk_oe_reg ( .D(n4100), .CP(i_i2c_ic_clk), 
        .CD(n11057), .Q(i_i2c_ic_clk_oe), .QN(n5100) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt_reg_0_ ( .D(n4344), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[0]), .QN(n10443) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt_reg_1_ ( .D(n4343), .CP(
        i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[1]), .QN(n10427) );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_empty_n_reg ( .D(
        i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N33), .CP(PCLK_pclk), .Q(n10417), 
        .QN(n10449) );
  FD2 i_ahb_U_arb_U_gctrl_bbc_reg_2_ ( .D(n4387), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_gctrl_bbc[2]), .QN(n10756) );
  FD2 i_apb_U_DW_apb_ahbsif_paddr_wr_reg_0_ ( .D(n3919), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_apb_paddr_wr_0_), .QN(n10513) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_sample_syncl_reg_22_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_sda_hold_sync_next_sample_syncm1[22]), 
        .CP(i_i2c_ic_clk), .CD(n11059), .Q(i_i2c_ic_sda_rx_hold_sync[6]), .QN(
        n10514) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_fifo_rst_n_int_reg ( .D(
        i_i2c_U_DW_apb_i2c_regfile_fix_c), .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_U_DW_apb_i2c_regfile_fifo_rst_n_int), .QN(n10767) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr_reg_13_ ( .D(n4111), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[13]), .QN(n10693) );
  FD4 i_i2c_U_DW_apb_i2c_tx_shift_stop_sda_reg ( .D(n4102), .CP(i_i2c_ic_clk), 
        .SD(n4869), .Q(i_i2c_U_DW_apb_i2c_tx_shift_stop_sda), .QN(n10776) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr_reg_14_ ( .D(n4204), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[14]), .QN(n10595) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr_reg_14_ ( .D(n4110), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[14]), .QN(n10609) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr_reg_12_ ( .D(n4206), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[12]), .QN(n10655) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr_reg_12_ ( .D(n3857), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[12]), .QN(n10665) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr_reg_13_ ( .D(n3819), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[13]), .QN(n10713) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr_reg_14_ ( .D(n4321), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[14]), .QN(n10604) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr_reg_14_ ( .D(n3855), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[14]), .QN(n10600) );
  FD4 i_ahb_U_arb_U_arbif_ipl1_reg_0_ ( .D(n4553), .CP(HCLK_hclk), .SD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_arbif_ipl1_int[0]), .QN(n10790) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr_reg_8_ ( .D(n3843), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[8]), .QN(n10707) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr_reg_13_ ( .D(n3856), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[13]), .QN(n10664) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr_reg_13_ ( .D(n4205), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[13]), .QN(n10654) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr_reg_13_ ( .D(n4322), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[13]), .QN(n10676) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr_reg_14_ ( .D(n3837), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[14]), .QN(n10570) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr_reg_10_ ( .D(n4309), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[10]), .QN(n10688) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr_reg_11_ ( .D(n4308), .CP(
        i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[11]), .QN(n10759) );
  FD2 i_i2c_U_DW_apb_i2c_mstfsm_mst_activity_reg ( .D(
        i_i2c_U_DW_apb_i2c_mstfsm_N457), .CP(i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_mst_activity), .QN(n10768) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_raw_tx_over_reg ( .D(n4200), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_raw_intr_stat[3]), .QN(n10574) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_rx_gen_call_reg ( .D(n4298), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(i_i2c_rx_gen_call), .QN(n10564) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_bit_count_reg_1_ ( .D(n4107), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(i_i2c_mst_rx_bit_count[1]), .QN(n10738)
         );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr_reg_15_ ( .D(n3854), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[15]), .QN(n10599) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr_reg_15_ ( .D(n4336), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[15]), .QN(n10603) );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_word_count_reg_1_ ( .D(n11113), .CP(
        PCLK_pclk), .Q(n10418), .QN(n4994) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_con_pre_reg_8_ ( .D(n4395), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_tx_empty_ctrl), .QN(n10800) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr_reg_14_ ( .D(n3818), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[14]), .QN(n10617) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr_reg_15_ ( .D(n4125), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[15]), .QN(n10612) );
  FD2 i_ahb_U_arb_U_ebt_count_reg_1_ ( .D(n4383), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_U_arb_U_ebt_int_count[1]), .QN(n10737) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr_reg_11_ ( .D(n4207), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[11]), .QN(n10596) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_bit_count_reg_2_ ( .D(n4106), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(i_i2c_mst_rx_bit_count[2]), 
        .QN(n10585) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_bit_count_reg_0_ ( .D(n4108), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(i_i2c_mst_rx_bit_count[0]), .QN(n10591)
         );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr_reg_15_ ( .D(n3836), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[15]), .QN(n10615) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt_reg_4_ ( .D(n4340), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[4]), .QN(n10652) );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_almost_empty_n_reg ( .D(n11088), .CP(
        PCLK_pclk), .Q(i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_almost_empty_n) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt_reg_2_ ( .D(n4342), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[2]), .QN(n10651) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt_reg_3_ ( .D(n4341), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[3]), .QN(n10461) );
  FD2 i_i2c_U_dff_rx_mem_reg_7__4_ ( .D(n4008), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[4]), .QN(n10827) );
  FD2 i_i2c_U_dff_rx_mem_reg_6__4_ ( .D(n4007), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[12]), .QN(n10826) );
  FD2 i_i2c_U_dff_rx_mem_reg_4__4_ ( .D(n4005), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[28]), .QN(n10825) );
  FD2 i_i2c_U_dff_rx_mem_reg_3__4_ ( .D(n4004), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[36]), .QN(n10824) );
  FD2 i_i2c_U_dff_rx_mem_reg_7__3_ ( .D(n4016), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[3]), .QN(n10823) );
  FD2 i_i2c_U_dff_rx_mem_reg_6__3_ ( .D(n4015), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[11]), .QN(n10822) );
  FD2 i_i2c_U_dff_rx_mem_reg_4__3_ ( .D(n4013), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[27]), .QN(n10821) );
  FD2 i_i2c_U_dff_rx_mem_reg_3__3_ ( .D(n4012), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[35]), .QN(n10820) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_tx_data_capture_reg ( .D(n11052), .CP(
        i_i2c_ic_clk), .CD(n11056), .Q(i_i2c_debug_wr), .QN(n10569) );
  FD2 i_i2c_U_DW_apb_i2c_mstfsm_re_start_en_int_reg ( .D(n4221), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(i_i2c_re_start_en), .QN(n10537) );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_wr_addr_int_reg_1_ ( .D(
        i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N42), .CP(PCLK_pclk), .Q(
        i_i2c_rx_wr_addr[1]), .QN(n10625) );
  FD2 i_i2c_U_DW_apb_i2c_sync_U_ic_enable_sync_sample_syncl_reg_0_ ( .D(
        i_i2c_U_DW_apb_i2c_sync_U_ic_enable_sync_next_sample_syncm1_0_), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(i_i2c_ic_enable_sync), .QN(n10447) );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_wr_addr_int_reg_0_ ( .D(n11095), .CP(
        PCLK_pclk), .Q(n10840), .QN(n10542) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_raw_rx_done_reg ( .D(n4246), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_raw_intr_stat[7]) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_raw_rx_under_reg ( .D(n4054), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_raw_intr_stat[0]), .QN(n10582) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_ic_en_reg ( .D(i_i2c_U_DW_apb_i2c_intctl_N4), 
        .CP(PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_en), .QN(n10555) );
  FD4 i_i2c_U_DW_apb_i2c_rx_filter_sda_data_int_reg ( .D(n4346), .CP(
        i_i2c_ic_clk), .SD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_sda_data_int), .QN(n10794) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_ready_dly1_reg ( .D(n11051), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_ready_dly1), .QN(n10728) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr_reg_15_ ( .D(n3817), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[15]), .QN(n10616) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_bit_count_reg_3_ ( .D(n4105), .CP(
        i_i2c_ic_clk), .CD(n11055), .Q(i_i2c_mst_rx_bit_count[3]), .QN(n10765)
         );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_word_count_reg_0_ ( .D(n11060), .CP(
        PCLK_pclk), .Q(n10420), .QN(n10419) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_txflr_reg_3_ ( .D(n4067), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_U_DW_apb_i2c_regfile_ic_txflr[3]), .QN(
        n10544) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_rx_addr_match_reg ( .D(n4300), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(i_i2c_rx_addr_match), .QN(
        n10675) );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_wr_addr_int_reg_0_ ( .D(n11108), .CP(
        PCLK_pclk), .QN(n10845) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_rx_slv_read_reg ( .D(
        i_i2c_U_DW_apb_i2c_rx_shift_rx_slv_read_s), .CP(i_i2c_ic_clk), .CD(
        n4870), .Q(i_i2c_rx_slv_read), .QN(n10454) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt_reg_5_ ( .D(n4339), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[5]), .QN(n10456) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_slv_ack_det_reg ( .D(n4261), .CP(
        i_i2c_ic_clk), .CD(n11054), .Q(i_i2c_slv_ack_det), .QN(n10551) );
  FD2 i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count_reg_4_ ( .D(n4277), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[4]), .QN(n10452) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_raw_tx_abrt_reg ( .D(n4063), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_raw_intr_stat[6]), .QN(n10577) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_intr_mask_reg_9_ ( .D(n3921), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_intr_mask[9]), .QN(
        n10801) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_raw_start_det_reg ( .D(n4247), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_raw_intr_stat[10]), .QN(n10623) );
  FD4 i_i2c_U_DW_apb_i2c_clk_gen_count_en_reg ( .D(n3928), .CP(i_i2c_ic_clk), 
        .SD(n11055), .Q(i_i2c_U_DW_apb_i2c_clk_gen_count_en), .QN(n10686) );
  FD2 i_i2c_U_DW_apb_i2c_intctl_raw_stop_det_reg ( .D(n4248), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_ic_raw_intr_stat[9]), .QN(n10622) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_scl_hl_edg_cntr_reg_1_ ( .D(n3876), .CP(
        i_i2c_ic_clk), .CD(n11059), .Q(
        i_i2c_U_DW_apb_i2c_rx_shift_scl_hl_edg_cntr[1]), .QN(n10627) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_bit_count_reg_3_ ( .D(n4263), .CP(
        i_i2c_ic_clk), .CD(n11058), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_bit_count[3]), .QN(n10587) );
  FD2 i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr_reg_15_ ( .D(n4219), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[15]), .QN(n10598) );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_wr_addr_int_reg_2_ ( .D(
        i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N43), .CP(PCLK_pclk), .Q(
        i_i2c_tx_wr_addr[2]), .QN(n10451) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_scl_hl_edg_cntr_reg_3_ ( .D(n3874), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_rx_shift_scl_hl_edg_cntr[3]), .QN(n10757) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt_reg_6_ ( .D(n4338), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[6]), .QN(n10653) );
  FD2 i_i2c_U_DW_apb_i2c_rx_shift_scl_hl_edg_cntr_reg_2_ ( .D(n3875), .CP(
        i_i2c_ic_clk), .CD(n4869), .Q(
        i_i2c_U_DW_apb_i2c_rx_shift_scl_hl_edg_cntr[2]), .QN(n10628) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_bit_count_reg_0_ ( .D(n4259), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_bit_count[0]), .QN(n10562) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_txflr_reg_1_ ( .D(n4065), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_U_DW_apb_i2c_regfile_ic_txflr[1]), .QN(
        n10626) );
  FD2 i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_bit_count_reg_1_ ( .D(n4258), .CP(
        i_i2c_ic_clk), .CD(n11057), .Q(
        i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_bit_count[1]), .QN(n10573) );
  FD4 i_i2c_U_DW_apb_i2c_rx_filter_sda_post_hold_done_reg ( .D(n4345), .CP(
        i_i2c_ic_clk), .SD(n11054), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_sda_post_hold_done), .QN(n10545) );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_rd_addr_int_reg_1_ ( .D(
        i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N45), .CP(PCLK_pclk), .Q(
        i_i2c_tx_rd_addr[1]), .QN(n10584) );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_rd_addr_int_reg_2_ ( .D(
        i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N46), .CP(PCLK_pclk), .Q(
        i_i2c_tx_rd_addr[2]), .QN(n10745) );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_word_count_reg_2_ ( .D(n11112), .CP(
        PCLK_pclk), .Q(i_i2c_U_DW_apb_i2c_fifo_wrdc_tx_unconn_2_), .QN(n10458)
         );
  FD2 i_i2c_U_dff_rx_mem_reg_7__0_ ( .D(n4040), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[0]), .QN(n10813) );
  FD2 i_i2c_U_dff_rx_mem_reg_0__0_ ( .D(n4033), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[54]), .QN(n10812) );
  FD2 i_i2c_U_dff_rx_mem_reg_4__0_ ( .D(n4037), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[24]), .QN(n10810) );
  FD2 i_i2c_U_dff_rx_mem_reg_2__0_ ( .D(n4035), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[40]), .QN(n10809) );
  FD2 i_i2c_U_dff_rx_mem_reg_3__0_ ( .D(n4036), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_i2c_U_dff_rx_mem[32]), .QN(n10808) );
  FD2 i_i2c_U_DW_apb_i2c_biu_prdata_reg_0_ ( .D(n3958), .CP(PCLK_pclk), .CD(
        PRESETn_presetn), .Q(i_apb_prdata_apb_dslcr[0]), .QN(n10422) );
  FD2 i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count_reg_5_ ( .D(n4276), .CP(
        i_i2c_ic_clk), .CD(n4870), .Q(
        i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[5]), .QN(n10553) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_intr_mask_reg_8_ ( .D(n3922), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_intr_mask[8]), .QN(
        n10807) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_txflr_reg_2_ ( .D(n4064), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_U_DW_apb_i2c_regfile_ic_txflr[2]), .QN(
        n10414) );
  FD1 i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_wr_addr_int_reg_2_ ( .D(
        i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N43), .CP(PCLK_pclk), .Q(
        i_i2c_rx_wr_addr[2]), .QN(n10589) );
  FD2 i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt_reg_7_ ( .D(n4337), .CP(
        i_i2c_ic_clk), .CD(i_i2c_ic_rst_n), .Q(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[7]), .QN(n10566) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_sda_setup_reg_7_ ( .D(n3882), .CP(
        PCLK_pclk), .CD(PRESETn_presetn), .Q(i_i2c_ic_sda_setup[7]), .QN(
        n10798) );
  FD2 i_i2c_U_DW_apb_i2c_regfile_ic_rxflr_reg_1_ ( .D(n4051), .CP(PCLK_pclk), 
        .CD(PRESETn_presetn), .Q(i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[1]), .QN(
        n10575) );
  FD2 i_ahb_U_arb_U_arbif_ireg_hrdata_reg_12_ ( .D(n4357), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_ahb_hrdata_s0[12]), .QN(n10640) );
  FD2 i_ahb_U_arb_U_arbif_ireg_hrdata_reg_13_ ( .D(n4356), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_ahb_hrdata_s0[13]), .QN(n10639) );
  FD2 i_ahb_U_arb_U_arbif_ireg_hrdata_reg_16_ ( .D(n4355), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_ahb_hrdata_s0[16]), .QN(n10638) );
  FD2 i_ahb_U_arb_U_arbif_ireg_hrdata_reg_20_ ( .D(n4354), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_ahb_hrdata_s0[20]), .QN(n10637) );
  FD2 i_ahb_U_arb_U_arbif_ireg_hrdata_reg_25_ ( .D(n4352), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_ahb_hrdata_s0[25]), .QN(n10636) );
  FD2 i_ahb_U_arb_U_arbif_ireg_hrdata_reg_29_ ( .D(n4350), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_ahb_hrdata_s0[29]), .QN(n10635) );
  FD2 i_ahb_U_arb_U_arbif_ireg_hrdata_reg_21_ ( .D(n4353), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_ahb_hrdata_s0[21]), .QN(n10634) );
  FD2 i_ahb_U_arb_U_arbif_ireg_hrdata_reg_28_ ( .D(n4351), .CP(HCLK_hclk), 
        .CD(HRESETn_hresetn), .Q(i_ahb_hrdata_s0[28]), .QN(n10633) );
  FD2 i_ahb_U_arb_U_arbif_ireg_hrdata_reg_8_ ( .D(n4359), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_hrdata_s0[8]), .QN(n10641) );
  FD2 i_ahb_U_arb_U_arbif_ireg_hrdata_reg_5_ ( .D(n4362), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_hrdata_s0[5]), .QN(n10648) );
  FD2 i_ahb_U_arb_U_arbif_ireg_hrdata_reg_1_ ( .D(n4366), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_hrdata_s0[1]), .QN(n10643) );
  FD2 i_ahb_U_arb_U_arbif_ireg_hrdata_reg_3_ ( .D(n4364), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_hrdata_s0[3]), .QN(n10642) );
  FD2 i_ahb_U_arb_U_arbif_ireg_hrdata_reg_2_ ( .D(n4365), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_hrdata_s0[2]), .QN(n10624) );
  FD2 i_ahb_U_arb_U_arbif_ireg_hrdata_reg_0_ ( .D(n4367), .CP(HCLK_hclk), .CD(
        HRESETn_hresetn), .Q(i_ahb_hrdata_s0[0]), .QN(n10644) );
  AO3 U4918 ( .A(n6938), .B(n8475), .C(n6697), .D(n6696), .Z(n3911) );
  AO3 U4919 ( .A(n8877), .B(n6749), .C(n5214), .D(n5212), .Z(n4365) );
  AO3 U4920 ( .A(n10028), .B(n8529), .C(n6979), .D(n6978), .Z(n11062) );
  IVDA U4921 ( .A(n7708), .Z(n10150) );
  B4I U4922 ( .A(n5412), .Z(n5137) );
  AO6 U4923 ( .A(n6668), .B(n5156), .C(n5286), .Z(n6680) );
  ND2 U4924 ( .A(n10071), .B(n8612), .Z(n10028) );
  ND2 U4925 ( .A(n8940), .B(n5236), .Z(n5235) );
  IVA U4926 ( .A(n5012), .Z(n5167) );
  B4I U4927 ( .A(n6944), .Z(n8639) );
  NR2 U4928 ( .A(n5752), .B(n5735), .Z(n8878) );
  IVA U4929 ( .A(n7223), .Z(n9313) );
  IVA U4930 ( .A(n10020), .Z(ex_i_ahb_AHB_Slave_haddr[17]) );
  ND2 U4931 ( .A(n6527), .B(n5163), .Z(n8338) );
  AO7 U4932 ( .A(n7186), .B(n10686), .C(n7183), .Z(n7207) );
  ND2 U4933 ( .A(n5416), .B(n5415), .Z(n6473) );
  AO7 U4934 ( .A(n4792), .B(n5342), .C(n10131), .Z(n5286) );
  NR2 U4935 ( .A(n5810), .B(n5793), .Z(n5236) );
  IVAP U4936 ( .A(n10377), .Z(n10397) );
  MUX21L U4937 ( .A(i_apb_pwdata_int[0]), .B(i_apb_pwdata_int[16]), .S(n6397), 
        .Z(n7649) );
  IVDA U4938 ( .A(n7672), .Y(n8058), .Z(n8138) );
  NR2 U4939 ( .A(n5691), .B(n4952), .Z(n5253) );
  AN3 U4940 ( .A(n5056), .B(n7650), .C(n5465), .Z(n8211) );
  IVP U4941 ( .A(n7768), .Z(n5163) );
  IVA U4942 ( .A(n6245), .Z(n6248) );
  IVP U4943 ( .A(n10076), .Z(ex_i_ahb_AHB_Slave_haddr[5]) );
  NR2 U4944 ( .A(i_i2c_U_DW_apb_i2c_regfile_N402), .B(n8164), .Z(n6527) );
  MUX21L U4945 ( .A(i_apb_pwdata_int[2]), .B(i_apb_pwdata_int[18]), .S(n6397), 
        .Z(n6395) );
  ND3 U4946 ( .A(n5025), .B(n7438), .C(n10417), .Z(n10357) );
  NR2 U4947 ( .A(i_i2c_sda_int), .B(n9237), .Z(n9310) );
  AO6 U4948 ( .A(n5268), .B(n8874), .C(n5267), .Z(n5266) );
  ND2 U4949 ( .A(n8457), .B(n6297), .Z(n6943) );
  ND4 U4950 ( .A(n6259), .B(n6258), .C(n6257), .D(n6256), .Z(n6265) );
  NR2 U4951 ( .A(n5436), .B(n5336), .Z(n5706) );
  ND2 U4952 ( .A(n8460), .B(n8422), .Z(n5318) );
  IVDA U4953 ( .A(n8289), .Z(n8043) );
  IVDA U4954 ( .A(n6956), .Y(n5047), .Z(n8631) );
  ND2 U4955 ( .A(n5628), .B(n5627), .Z(i_ahb_U_arb_U_gctrl_nxt_lock_sm_2_) );
  IVDA U4956 ( .A(n6253), .Z(n6258) );
  IVDA U4957 ( .A(n7711), .Y(n7712), .Z(n10055) );
  NR2 U4958 ( .A(i_i2c_mst_rx_bit_count[3]), .B(n7436), .Z(n8946) );
  IVP U4959 ( .A(n6752), .Z(ex_i_ahb_AHB_Slave_hburst[2]) );
  NR2 U4960 ( .A(n10569), .B(n8851), .Z(n9317) );
  ND2 U4961 ( .A(n8941), .B(n5696), .Z(n5336) );
  AO7 U4962 ( .A(n6471), .B(n6470), .C(n5037), .Z(n6472) );
  AO7 U4963 ( .A(n5734), .B(n5321), .C(n10170), .Z(n5320) );
  IVA U4964 ( .A(n7764), .Z(n5466) );
  IVDAP U4965 ( .A(n8067), .Y(n8068), .Z(n8281) );
  MUX21L U4966 ( .A(i_apb_pwdata_int[12]), .B(i_apb_pwdata_int[28]), .S(n6397), 
        .Z(n8344) );
  IVDA U4967 ( .A(n5313), .Z(n5298) );
  MUX21L U4968 ( .A(i_apb_pwdata_int[15]), .B(i_apb_pwdata_int[31]), .S(n6397), 
        .Z(n8343) );
  AO7 U4969 ( .A(n5324), .B(n5303), .C(n6296), .Z(n8817) );
  ND2 U4970 ( .A(n6819), .B(n8295), .Z(n8332) );
  B5IP U4971 ( .A(n6733), .Z(n10146) );
  ND2 U4972 ( .A(n8541), .B(n7073), .Z(n7436) );
  IVDA U4973 ( .A(n5282), .Z(n4806) );
  IVP U4974 ( .A(n5750), .Z(ex_i_ahb_AHB_Slave_haddr[9]) );
  IVP U4975 ( .A(n7743), .Z(ex_i_ahb_AHB_Slave_haddr[0]) );
  ND4 U4976 ( .A(n5703), .B(n5230), .C(n5702), .D(n5704), .Z(n6751) );
  ND2 U4977 ( .A(n5345), .B(n5313), .Z(n5181) );
  IVP U4978 ( .A(n5743), .Z(n4779) );
  MUX21L U4979 ( .A(i_apb_pwdata_int[14]), .B(i_apb_pwdata_int[30]), .S(n6397), 
        .Z(n8189) );
  MUX21L U4980 ( .A(i_apb_pwdata_int[13]), .B(i_apb_pwdata_int[29]), .S(n6397), 
        .Z(n8193) );
  ND2 U4981 ( .A(n5512), .B(ex_i_ahb_AHB_Master_haddr[0]), .Z(n7743) );
  IVDA U4982 ( .A(n5029), .Z(n5028) );
  AO2 U4983 ( .A(n6177), .B(n6176), .C(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[3]), .D(n6175), .Z(n6546)
         );
  ND2 U4984 ( .A(n5345), .B(n5143), .Z(n5332) );
  ND3 U4985 ( .A(n5592), .B(n5589), .C(n5257), .Z(n5256) );
  ND2 U4986 ( .A(n10161), .B(n5578), .Z(n4939) );
  ND2 U4987 ( .A(n5603), .B(n4861), .Z(n5291) );
  AO6 U4988 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[3]), .B(n6186), 
        .C(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[4]), .Z(n6544) );
  ND3 U4989 ( .A(n5588), .B(n5333), .C(n4865), .Z(n5258) );
  IVA U4990 ( .A(n4792), .Z(n4789) );
  B3IP U4991 ( .A(n7084), .Z1(n6894), .Z2(n8432) );
  ND2 U4992 ( .A(n10415), .B(n6454), .Z(n8027) );
  NR2 U4993 ( .A(n5382), .B(n5146), .Z(n5316) );
  ND2 U4994 ( .A(n5619), .B(n5795), .Z(n5261) );
  ND2 U4995 ( .A(n10483), .B(n6669), .Z(n5182) );
  AO6 U4996 ( .A(n6647), .B(n6644), .C(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[15]), .Z(n6597) );
  IVDA U4997 ( .A(n9481), .Y(n7314), .Z(n10038) );
  NR2 U4998 ( .A(n5177), .B(n4822), .Z(n5216) );
  AO7 U4999 ( .A(n6619), .B(n5499), .C(n10460), .Z(n6620) );
  NR2 U5000 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[5]), .B(n6538), 
        .Z(n6090) );
  IVDA U5001 ( .A(n6670), .Z(n4805) );
  ND4 U5002 ( .A(n5540), .B(n10064), .C(n5297), .D(n5295), .Z(n5552) );
  IVA U5003 ( .A(n10483), .Z(n4766) );
  IVA U5004 ( .A(n5405), .Z(n4765) );
  IVP U5005 ( .A(n6292), .Z(n6669) );
  IVDA U5006 ( .A(n6758), .Y(n5557), .Z(n6804) );
  NR2 U5007 ( .A(n10021), .B(i_i2c_U_DW_apb_i2c_regfile_N402), .Z(n6455) );
  NR2 U5008 ( .A(i_apb_paddr[21]), .B(i_apb_paddr[18]), .Z(n5411) );
  ND3 U5009 ( .A(n6092), .B(n6093), .C(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[7]), .Z(n6581) );
  AO7 U5010 ( .A(n5685), .B(i_ahb_U_arb_U_gctrl_bc[3]), .C(
        ex_i_ahb_AHB_Slave_htrans[0]), .Z(n5229) );
  ND2 U5011 ( .A(n4825), .B(n6666), .Z(n5283) );
  ND2 U5012 ( .A(n5330), .B(n5378), .Z(n5341) );
  ND2 U5013 ( .A(n5572), .B(n5776), .Z(n5255) );
  AO7 U5014 ( .A(n6011), .B(n6218), .C(n6010), .Z(n6012) );
  ND2 U5015 ( .A(n5586), .B(n5587), .Z(n5294) );
  ND2 U5016 ( .A(n6292), .B(n4823), .Z(n4822) );
  IVDA U5017 ( .A(n5308), .Z(n4786) );
  AO7 U5018 ( .A(n5541), .B(n5296), .C(ex_i_ahb_AHB_Slave_haddr[3]), .Z(n5295)
         );
  B2I U5019 ( .A(i_apb_paddr_wr_0_), .Z1(n5831), .Z2(n6396) );
  NR2 U5020 ( .A(n5555), .B(n6291), .Z(n5348) );
  IVDAP U5021 ( .A(n5406), .Y(n5143), .Z(n5405) );
  IVP U5022 ( .A(n5775), .Z(n6797) );
  ND2 U5023 ( .A(n5512), .B(ex_i_ahb_AHB_Master_haddr[8]), .Z(n5537) );
  IVP U5024 ( .A(n6673), .Z(n5781) );
  IVDA U5025 ( .A(n5381), .Z(n5330) );
  ND2 U5026 ( .A(n9480), .B(n7082), .Z(n7990) );
  IVA U5027 ( .A(n5033), .Z(n4823) );
  IVDA U5028 ( .A(n5582), .Y(n5146), .Z(n5378) );
  ND2 U5029 ( .A(n10506), .B(n5571), .Z(n10167) );
  ND2 U5030 ( .A(n10483), .B(n5178), .Z(n4785) );
  AO6 U5031 ( .A(n6573), .B(n9236), .C(n10723), .Z(n6575) );
  IVA U5032 ( .A(n6624), .Z(n6628) );
  ND2 U5033 ( .A(n6759), .B(ex_i_ahb_AHB_Slave_hresp[1]), .Z(n5597) );
  MUX21L U5034 ( .A(n10504), .B(n5933), .S(n6063), .Z(n6615) );
  EO U5035 ( .A(n5497), .B(n6059), .Z(n6068) );
  IVAP U5036 ( .A(n5532), .Z(ex_i_ahb_AHB_Slave_haddr[6]) );
  MUX21L U5037 ( .A(n5584), .B(ex_i_ahb_AHB_Slave_hresp[0]), .S(n6759), .Z(
        n5587) );
  IVA U5038 ( .A(i_apb_paddr[30]), .Z(n4799) );
  EO U5039 ( .A(n6026), .B(n6027), .Z(n5048) );
  EN U5040 ( .A(n5993), .B(i_i2c_ic_sda_tx_hold_sync[11]), .Z(n4949) );
  ND2 U5041 ( .A(n10863), .B(i_ahb_U_arb_def_mst_0_), .Z(n5571) );
  IVDA U5042 ( .A(n6673), .Z(n5280) );
  ND2 U5043 ( .A(i_ahb_U_mux_hsel_prev[2]), .B(ex_i_ahb_AHB_Slave_hready_resp), 
        .Z(n5776) );
  NR2 U5044 ( .A(i_apb_U_DW_apb_ahbsif_state[2]), .B(
        i_apb_U_DW_apb_ahbsif_state[0]), .Z(n6672) );
  IVDA U5045 ( .A(n10501), .Y(n4868), .Z(n5203) );
  IVDAP U5046 ( .A(i_ahb_U_mux_hsel_prev[2]), .Y(n5775), .Z(n10366) );
  EN U5047 ( .A(n6075), .B(n6074), .Z(n6077) );
  IVA U5048 ( .A(n4798), .Z(n4795) );
  IVDA U5049 ( .A(i_i2c_mst_rxbyte_rdy), .Z(n7499) );
  NR2 U5050 ( .A(ex_i_ahb_AHB_Master_haddr[17]), .B(n5010), .Z(n5190) );
  NR2 U5051 ( .A(ex_i_ahb_AHB_Master_haddr[27]), .B(
        ex_i_ahb_AHB_Master_haddr[20]), .Z(n5449) );
  EO U5052 ( .A(n5949), .B(n5948), .Z(n5952) );
  EN U5053 ( .A(n5998), .B(i_i2c_ic_sda_tx_hold_sync[14]), .Z(n5009) );
  IVDA U5054 ( .A(n5951), .Z(n6075) );
  ND2 U5055 ( .A(i_apb_U_DW_apb_ahbsif_state[0]), .B(n10500), .Z(n6670) );
  IVDAP U5056 ( .A(i_ahb_hmaster_0_), .Y(n5536), .Z(n5790) );
  OR3 U5057 ( .A(n6111), .B(n5501), .C(n5962), .Z(n6079) );
  IVDA U5058 ( .A(n6083), .Z(n6087) );
  AO2 U5059 ( .A(i_i2c_ic_spklen_o[2]), .B(n10468), .C(i_i2c_ic_spklen_o[3]), 
        .D(n5050), .Z(n7573) );
  ND2 U5060 ( .A(n6208), .B(n6207), .Z(n7575) );
  IVDA U5061 ( .A(n11034), .Y(n5008), .Z(n5999) );
  IVAP U5062 ( .A(n5849), .Z(n6021) );
  AO7 U5063 ( .A(n5919), .B(n6046), .C(n5918), .Z(n5950) );
  IVP U5064 ( .A(i_i2c_U_DW_apb_i2c_sync_ic_master_sync_inv), .Z(n9236) );
  ND2 U5065 ( .A(n5945), .B(i_i2c_ic_sda_tx_hold_sync[8]), .Z(n5920) );
  ND2 U5066 ( .A(n6121), .B(n6130), .Z(n5851) );
  ND2 U5067 ( .A(n6045), .B(n6044), .Z(n5918) );
  IVA U5068 ( .A(n10467), .Z(n5898) );
  IVDA U5069 ( .A(i_i2c_ic_sda_tx_hold_sync[4]), .Y(n5903), .Z(n5124) );
  AN3 U5070 ( .A(n6545), .B(n6581), .C(n6157), .Z(n6187) );
  AO6 U5071 ( .A(n6282), .B(n6281), .C(n6280), .Z(
        i_i2c_U_DW_apb_i2c_tx_shift_N84) );
  ND2 U5072 ( .A(n6948), .B(ex_i_ahb_AHB_Master_haddr[9]), .Z(n5750) );
  ND4 U5073 ( .A(n5188), .B(n5775), .C(n6948), .D(i_ahb_hready_resp_s0), .Z(
        n5406) );
  NR2 U5074 ( .A(n5778), .B(n5789), .Z(n5450) );
  ND3 U5075 ( .A(n11045), .B(i_i2c_reg_addr[5]), .C(n10415), .Z(n6334) );
  IVDA U5076 ( .A(n6526), .Y(n5139), .Z(n7768) );
  ND2 U5077 ( .A(n8639), .B(n6991), .Z(n6992) );
  ND2 U5078 ( .A(n8639), .B(n6949), .Z(n6950) );
  ND2 U5079 ( .A(n8639), .B(n6994), .Z(n6995) );
  ND2 U5080 ( .A(n8639), .B(n7004), .Z(n7005) );
  ND2 U5081 ( .A(n8639), .B(n6952), .Z(n6953) );
  ND2 U5082 ( .A(n8639), .B(n6945), .Z(n6946) );
  IVDA U5083 ( .A(n10500), .Z(n4796) );
  B4I U5084 ( .A(n8067), .Z(n7994) );
  ND4P U5085 ( .A(n7969), .B(n7968), .C(n7967), .D(n7966), .Z(n7970) );
  ND2P U5086 ( .A(n9740), .B(n9739), .Z(n9741) );
  AO6P U5087 ( .A(n8745), .B(n8744), .C(n8743), .Z(n8757) );
  AO7P U5088 ( .A(n9724), .B(n9723), .C(n9722), .Z(n9727) );
  AO7P U5089 ( .A(n9718), .B(n9717), .C(n9716), .Z(n9723) );
  B2IP U5090 ( .A(n9464), .Z1(n9465), .Z2(n9370) );
  ND2P U5091 ( .A(n9071), .B(n9323), .Z(n9072) );
  ENP U5092 ( .A(n7265), .B(i_i2c_tx_abrt_flg), .Z(n4240) );
  ND2P U5093 ( .A(n5102), .B(i_i2c_U_DW_apb_i2c_toggle_tx_abrt), .Z(n7265) );
  B2IP U5094 ( .A(n7090), .Z2(n11052) );
  AO7P U5095 ( .A(n7416), .B(n7415), .C(n10776), .Z(
        i_i2c_U_DW_apb_i2c_tx_shift_N280) );
  ND2P U5096 ( .A(i_i2c_U_DW_apb_i2c_mstfsm_addr_1byte_sent), .B(n7361), .Z(
        n7393) );
  AO7P U5097 ( .A(n9193), .B(n9704), .C(n9192), .Z(n9194) );
  AO6P U5098 ( .A(n9201), .B(n9200), .C(n9199), .Z(n9204) );
  AO6P U5099 ( .A(n7409), .B(n7408), .C(n7407), .Z(n4201) );
  MUX21LP U5100 ( .A(n9924), .B(n9923), .S(n9922), .Z(n4100) );
  ND2 U5101 ( .A(n10096), .B(n10099), .Z(n10100) );
  EOP U5102 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[6]), .B(
        i_i2c_ic_spklen_o[6]), .Z(n6205) );
  AO3 U5103 ( .A(n6548), .B(n6541), .C(n6544), .D(n6187), .Z(n6188) );
  ND2 U5104 ( .A(n7410), .B(n6245), .Z(n6246) );
  B2IP U5105 ( .A(n6804), .Z2(n5503) );
  B2IP U5106 ( .A(n6804), .Z1(n5502), .Z2(n6762) );
  ND2P U5107 ( .A(n10368), .B(n10367), .Z(ex_i_ahb_AHB_Master_hrdata[10]) );
  ND2P U5108 ( .A(n10370), .B(n10369), .Z(ex_i_ahb_AHB_Master_hrdata[11]) );
  ND2P U5109 ( .A(n10372), .B(n10371), .Z(ex_i_ahb_AHB_Master_hrdata[14]) );
  ND2P U5110 ( .A(n10375), .B(n10374), .Z(ex_i_ahb_AHB_Master_hrdata[15]) );
  B2IP U5111 ( .A(n6957), .Z1(n10004), .Z2(n10169) );
  AO3 U5112 ( .A(n6981), .B(n10028), .C(n5247), .D(n5245), .Z(n11067) );
  ND2 U5113 ( .A(n10156), .B(n5246), .Z(n5245) );
  ND2 U5114 ( .A(n10073), .B(i_apb_U_DW_apb_ahbsif_saved_haddr_c[25]), .Z(
        n5247) );
  AO3 U5115 ( .A(n6929), .B(n10135), .C(n6695), .D(n6694), .Z(n3890) );
  AO3 U5116 ( .A(n6929), .B(n10138), .C(n6693), .D(n6692), .Z(n3909) );
  AO3 U5117 ( .A(n6929), .B(n8476), .C(n6691), .D(n6690), .Z(n3914) );
  AO3 U5118 ( .A(n6929), .B(n10166), .C(n6689), .D(n6688), .Z(n3895) );
  AO3 U5119 ( .A(n6929), .B(n10122), .C(n6928), .D(n6927), .Z(n3902) );
  AO3 U5120 ( .A(n6929), .B(n10124), .C(n6720), .D(n6719), .Z(n3900) );
  AO3 U5121 ( .A(n6929), .B(n10142), .C(n6710), .D(n6709), .Z(n3908) );
  AO3 U5122 ( .A(n6929), .B(n10137), .C(n6712), .D(n6711), .Z(n3893) );
  B2IP U5123 ( .A(n10110), .Z2(n4767) );
  IVDA U5124 ( .A(n6963), .Y(n5390) );
  ND2 U5125 ( .A(n5330), .B(n4802), .Z(n5226) );
  NR2 U5126 ( .A(n5776), .B(n5308), .Z(n4802) );
  ND2 U5127 ( .A(n5191), .B(n5186), .Z(n5185) );
  ND2P U5128 ( .A(n8153), .B(n8152), .Z(n8154) );
  AO3P U5129 ( .A(n6863), .B(n6862), .C(n6861), .D(n6860), .Z(n6864) );
  B2IP U5130 ( .A(n8188), .Z2(n8190) );
  NR2P U5131 ( .A(n7441), .B(n10359), .Z(n11094) );
  AO6P U5132 ( .A(n8157), .B(n8156), .C(n5026), .Z(n8162) );
  NR2P U5133 ( .A(n8155), .B(n8154), .Z(n8156) );
  ND2 U5134 ( .A(n5366), .B(n5139), .Z(n10282) );
  ND2P U5135 ( .A(n7572), .B(n5139), .Z(n7729) );
  NR2P U5136 ( .A(n6842), .B(n6841), .Z(n6853) );
  ND4P U5137 ( .A(n6840), .B(n6839), .C(n6838), .D(n6837), .Z(n6841) );
  NR2P U5138 ( .A(i_i2c_rx_wr_addr[2]), .B(n7715), .Z(n8186) );
  ND3 U5139 ( .A(n5828), .B(n5829), .C(n5358), .Z(n5429) );
  IVDA U5140 ( .A(n6383), .Y(n6384) );
  NR2 U5141 ( .A(n4815), .B(n5455), .Z(n6359) );
  NR2 U5142 ( .A(n5455), .B(i_apb_paddr[17]), .Z(n6374) );
  B2IP U5143 ( .A(n5462), .Z1(n5020), .Z2(n5442) );
  NR2P U5144 ( .A(n4965), .B(n5012), .Z(n6808) );
  B4I U5145 ( .A(n8164), .Z(n8285) );
  ND2P U5146 ( .A(n10970), .B(n5163), .Z(n7748) );
  B2IP U5147 ( .A(n8338), .Z2(n8339) );
  ND2P U5148 ( .A(n8255), .B(n6826), .Z(n8269) );
  B4I U5149 ( .A(n6329), .Z(n8255) );
  ND2P U5150 ( .A(n7769), .B(n5163), .Z(n10151) );
  AO7P U5151 ( .A(n6745), .B(n6744), .C(n6743), .Z(n6748) );
  NR2P U5152 ( .A(n6468), .B(n5370), .Z(n5373) );
  ND2P U5153 ( .A(n6517), .B(n6516), .Z(n8094) );
  ND2P U5154 ( .A(n6882), .B(n6413), .Z(n8066) );
  AO7 U5155 ( .A(n6444), .B(n6443), .C(n10416), .Z(n6866) );
  AO3 U5156 ( .A(n6444), .B(n6443), .C(n6430), .D(n6429), .Z(n6433) );
  NR2 U5157 ( .A(n6481), .B(n4994), .Z(n6482) );
  AO3P U5158 ( .A(n6290), .B(n10410), .C(n6289), .D(n6288), .Z(n4053) );
  ND2P U5159 ( .A(n5822), .B(n8063), .Z(n7862) );
  AO7 U5160 ( .A(n6677), .B(i_apb_U_DW_apb_ahbsif_pipeline_c), .C(n5318), .Z(
        n5403) );
  AO3 U5161 ( .A(n6677), .B(n5387), .C(n6676), .D(n8461), .Z(n6678) );
  IVDA U5162 ( .A(n5379), .Z(n4782) );
  ND2P U5163 ( .A(n8532), .B(n8531), .Z(n4605) );
  ND2 U5164 ( .A(n6943), .B(n6942), .Z(n8792) );
  AO3 U5165 ( .A(n8874), .B(n5244), .C(n8873), .D(n8872), .Z(n11078) );
  ND2 U5166 ( .A(n10156), .B(n4746), .Z(n8836) );
  AO7 U5167 ( .A(n6296), .B(n5345), .C(n5324), .Z(n4800) );
  ND2 U5168 ( .A(n5324), .B(n6296), .Z(n5224) );
  AN3 U5169 ( .A(n6666), .B(n4795), .C(n5280), .Z(n4760) );
  B2I U5170 ( .A(ex_i_ahb_AHB_Master_haddr[16]), .Z1(n5010), .Z2(n5011) );
  ND2P U5171 ( .A(n4785), .B(n4684), .Z(n4783) );
  AN2P U5172 ( .A(n6294), .B(n4760), .Z(n4684) );
  ND2P U5173 ( .A(n6943), .B(n6942), .Z(n6944) );
  ENP U5174 ( .A(n5205), .B(n6970), .Z(n6942) );
  B3IP U5175 ( .A(n10157), .Z1(n10160), .Z2(n10075) );
  AN2P U5176 ( .A(n10158), .B(i_i2c_reg_addr[5]), .Z(n4746) );
  ND3P U5177 ( .A(n6971), .B(n10154), .C(n6970), .Z(n10157) );
  AO7P U5178 ( .A(n4987), .B(n5555), .C(n5199), .Z(n5262) );
  B4I U5179 ( .A(n5489), .Z(n10065) );
  IVDAP U5180 ( .A(ex_i_ahb_AHB_Master_haddr[17]), .Y(n4987), .Z(n5791) );
  IVAP U5181 ( .A(n5199), .Z(n4969) );
  ND2P U5182 ( .A(n5011), .B(n6948), .Z(n5199) );
  B2IP U5183 ( .A(ex_i_ahb_AHB_Master_haddr[12]), .Z1(n6681), .Z2(n5788) );
  AO7P U5184 ( .A(n5227), .B(n5341), .C(n5226), .Z(n5324) );
  B4I U5185 ( .A(n4783), .Z(n6296) );
  IVDA U5186 ( .A(n6666), .Z(n4763) );
  AO3 U5187 ( .A(n5154), .B(n10160), .C(n10015), .D(n10014), .Z(n11068) );
  AO3 U5188 ( .A(n5153), .B(n5152), .C(n10017), .D(n10016), .Z(n11073) );
  ND2 U5189 ( .A(n5791), .B(n4969), .Z(n5267) );
  ND3P U5190 ( .A(n5384), .B(n6965), .C(n8612), .Z(n5489) );
  AO3P U5191 ( .A(n4766), .B(n4765), .C(n6296), .D(n5182), .Z(n6298) );
  AO3 U5192 ( .A(n10028), .B(n10027), .C(n10026), .D(n10025), .Z(n11086) );
  AO2P U5193 ( .A(n10023), .B(i_apb_U_DW_apb_ahbsif_saved_haddr_c[2]), .C(
        n10024), .D(n10075), .Z(n10026) );
  ND4 U5194 ( .A(n8827), .B(n8826), .C(n8825), .D(n8824), .Z(n11087) );
  ND4 U5195 ( .A(n8832), .B(n8831), .C(n8830), .D(n8829), .Z(n11076) );
  ND2P U5197 ( .A(n6932), .B(n5388), .Z(n10110) );
  ND2 U5198 ( .A(n10156), .B(n4769), .Z(n6972) );
  AN2P U5199 ( .A(i_apb_paddr[28]), .B(n10158), .Z(n4769) );
  ND2 U5200 ( .A(n10156), .B(n4770), .Z(n6974) );
  AN2P U5201 ( .A(i_apb_paddr[31]), .B(n10158), .Z(n4770) );
  ND2 U5202 ( .A(n10156), .B(n4771), .Z(n6989) );
  AN2P U5203 ( .A(n10158), .B(n5468), .Z(n4771) );
  ND2 U5204 ( .A(n10156), .B(n4772), .Z(n8855) );
  AN2P U5205 ( .A(n10158), .B(i_apb_paddr[15]), .Z(n4772) );
  ND2 U5206 ( .A(n10156), .B(n4773), .Z(n8858) );
  AN2P U5207 ( .A(n10110), .B(i_apb_paddr[23]), .Z(n4773) );
  ND2 U5208 ( .A(n10156), .B(n4774), .Z(n8861) );
  AN2P U5209 ( .A(n10070), .B(i_apb_paddr[21]), .Z(n4774) );
  ND2 U5210 ( .A(n10156), .B(n4775), .Z(n8864) );
  AN2P U5211 ( .A(i_apb_paddr[18]), .B(n10158), .Z(n4775) );
  ND2 U5212 ( .A(n10156), .B(n4776), .Z(n8869) );
  AN2P U5213 ( .A(n10158), .B(i_apb_paddr[20]), .Z(n4776) );
  ND2 U5214 ( .A(n10156), .B(n4777), .Z(n10036) );
  AN2P U5215 ( .A(n10158), .B(n5482), .Z(n4777) );
  ND2 U5216 ( .A(n10156), .B(n4778), .Z(n10084) );
  AN2P U5217 ( .A(i_i2c_reg_addr[1]), .B(n10110), .Z(n4778) );
  AN2P U5218 ( .A(n5350), .B(n5217), .Z(n6971) );
  AN2P U5219 ( .A(n5379), .B(n8828), .Z(n10074) );
  ND3P U5220 ( .A(n5535), .B(n5454), .C(n4779), .Z(n5744) );
  B2I U5221 ( .A(n5350), .Z2(n4788) );
  IVP U5222 ( .A(n5222), .Z(n5221) );
  OR2P U5223 ( .A(n5173), .B(i_apb_pclk_en), .Z(n5223) );
  B2I U5224 ( .A(n5150), .Z2(n4791) );
  ND4P U5225 ( .A(n5150), .B(n5281), .C(n8471), .D(n4788), .Z(n8524) );
  B2I U5226 ( .A(n6674), .Z2(n4792) );
  NR2P U5227 ( .A(n5486), .B(n5282), .Z(n5276) );
  IVAP U5228 ( .A(i_apb_U_DW_apb_ahbsif_state[1]), .Z(n4798) );
  ND4P U5229 ( .A(n4919), .B(n5472), .C(n4954), .D(n4799), .Z(n5818) );
  ND4P U5230 ( .A(n6298), .B(n5028), .C(n5332), .D(n4800), .Z(n5325) );
  B2I U5231 ( .A(n5317), .Z2(n4803) );
  B2IP U5232 ( .A(n8524), .Z1(n10117), .Z2(n10165) );
  AO3P U5233 ( .A(n5784), .B(n5304), .C(n10432), .D(n5223), .Z(n5222) );
  B2I U5234 ( .A(ex_i_ahb_AHB_Master_haddr[18]), .Z2(n4807) );
  B2I U5235 ( .A(ex_i_ahb_AHB_Master_haddr[23]), .Z2(n4808) );
  B2I U5236 ( .A(ex_i_ahb_AHB_Master_haddr[24]), .Z2(n4809) );
  B2I U5237 ( .A(ex_i_ahb_AHB_Master_haddr[25]), .Z2(n4810) );
  B2I U5238 ( .A(ex_i_ahb_AHB_Master_haddr[30]), .Z2(n4811) );
  B2I U5239 ( .A(ex_i_ahb_AHB_Master_haddr[31]), .Z2(n4812) );
  B2I U5240 ( .A(ex_i_ahb_AHB_Master_haddr[19]), .Z2(n4813) );
  AO3P U5241 ( .A(n4814), .B(n5185), .C(n5219), .D(n5218), .Z(n5217) );
  NR2P U5242 ( .A(n5220), .B(n5143), .Z(n4814) );
  IVDA U5243 ( .A(i_apb_penable), .Z(n4815) );
  IVP U5244 ( .A(i_ahb_U_mux_hsel_prev[1]), .Z(n5189) );
  B2I U5245 ( .A(ex_i_ahb_AHB_Master_haddr[21]), .Z2(n4816) );
  B2I U5246 ( .A(ex_i_ahb_AHB_Master_haddr[22]), .Z2(n4817) );
  B2I U5247 ( .A(ex_i_ahb_AHB_Master_haddr[26]), .Z2(n4818) );
  B2I U5248 ( .A(ex_i_ahb_AHB_Master_haddr[28]), .Z2(n4819) );
  B2I U5249 ( .A(ex_i_ahb_AHB_Master_haddr[29]), .Z2(n4820) );
  IVDA U5250 ( .A(n5365), .Z(n4821) );
  IVDA U5251 ( .A(n6129), .Y(n6132) );
  IVP U5252 ( .A(n6619), .Z(n6560) );
  ND2 U5253 ( .A(n10488), .B(n6028), .Z(n5977) );
  IVP U5254 ( .A(n6001), .Z(n6002) );
  IVDA U5255 ( .A(i_apb_U_DW_apb_ahbsif_pipeline_c), .Y(n5780), .Z(n4825) );
  ND2 U5256 ( .A(n5500), .B(n5969), .Z(n5970) );
  IVDA U5257 ( .A(n5693), .Y(n5694) );
  ND2 U5258 ( .A(n5274), .B(n5603), .Z(n5797) );
  ND2 U5259 ( .A(i_i2c_reg_addr[2]), .B(n5413), .Z(n6468) );
  ND2 U5260 ( .A(n5783), .B(n5784), .Z(n5186) );
  IVDA U5261 ( .A(n8213), .Y(n6830) );
  AO6 U5262 ( .A(n5941), .B(n5940), .C(n5939), .Z(n5985) );
  ND2 U5263 ( .A(n5126), .B(n6015), .Z(n6016) );
  IVP U5264 ( .A(n5797), .Z(n5228) );
  IVDA U5265 ( .A(n5562), .Y(n5567) );
  IVDA U5266 ( .A(n5440), .Z(n5279) );
  IVDA U5267 ( .A(n10320), .Y(n10321) );
  IVDA U5268 ( .A(n6420), .Z(n5838) );
  ND4 U5269 ( .A(n5775), .B(n11184), .C(n5200), .D(n5433), .Z(n5599) );
  IVDA U5270 ( .A(n7751), .Y(n5795) );
  NR2 U5271 ( .A(n5309), .B(i_ahb_U_arb_U_gctrl_nxt_lock_sm_2_), .Z(n5705) );
  IVDA U5272 ( .A(n8303), .Y(n8306) );
  IVDA U5273 ( .A(n8320), .Y(n8271) );
  IVDA U5274 ( .A(n8299), .Y(n7636) );
  IVDA U5275 ( .A(n10337), .Y(n10343) );
  IVDA U5276 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[6]), .Y(n7584) );
  IVDA U5277 ( .A(n8186), .Y(n7716) );
  IVDA U5278 ( .A(n6530), .Y(n5824) );
  IVDA U5279 ( .A(n10097), .Y(n10098), .Z(n7411) );
  B2I U5280 ( .A(n6734), .Z1(n8264), .Z2(n8158) );
  AO3 U5281 ( .A(n5506), .B(n10991), .C(n6327), .D(n6326), .Z(n6348) );
  NR2 U5282 ( .A(n6843), .B(n7996), .Z(n8134) );
  NR2 U5283 ( .A(n7575), .B(n6209), .Z(n6212) );
  IVDA U5284 ( .A(n5047), .Y(n8637) );
  ND3 U5285 ( .A(n5276), .B(n5460), .C(n5461), .Z(n7679) );
  IVDA U5286 ( .A(n9991), .Z(n10000) );
  IVDA U5287 ( .A(n10070), .Y(n5242) );
  IVDA U5288 ( .A(n8975), .Y(n7034) );
  IVDA U5289 ( .A(n6812), .Z(n6814) );
  IVDA U5290 ( .A(n6395), .Y(n8340) );
  ND2 U5291 ( .A(n10004), .B(n4806), .Z(n8874) );
  ND2 U5292 ( .A(n6939), .B(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[19]), .Z(
        n5285) );
  IVDA U5293 ( .A(n6500), .Z(n6501) );
  IVDA U5294 ( .A(n5770), .Z(n5452) );
  ND2 U5295 ( .A(n6997), .B(i_apb_U_DW_apb_ahbsif_piped_haddr_c[16]), .Z(n6302) );
  ND4 U5296 ( .A(n8880), .B(n8879), .C(n5301), .D(n5300), .Z(n4364) );
  AO3 U5297 ( .A(n10020), .B(n5244), .C(n10019), .D(n10018), .Z(n11075) );
  IVP U5298 ( .A(n5537), .Z(ex_i_ahb_AHB_Slave_haddr[8]) );
  AN2P U5299 ( .A(i_i2c_reg_addr[3]), .B(n10415), .Z(n4850) );
  IVDA U5300 ( .A(n8297), .Y(n4851), .Z(n4852) );
  IVDA U5301 ( .A(n5239), .Y(n4854), .Z(n5198) );
  ND3 U5302 ( .A(n5793), .B(n6751), .C(n5806), .Z(n4860) );
  AN2P U5303 ( .A(n5601), .B(n5602), .Z(n4861) );
  IVDA U5304 ( .A(n5812), .Y(n4862), .Z(n4863) );
  ND2 U5305 ( .A(n10862), .B(n5654), .Z(n4864) );
  AN3 U5306 ( .A(n10433), .B(n5683), .C(n5591), .Z(n4865) );
  NR2 U5307 ( .A(n5733), .B(n5730), .Z(n4866) );
  IVDA U5308 ( .A(n5751), .Y(n5735) );
  IVDA U5309 ( .A(n7471), .Y(n4870), .Z(n4871) );
  IVDA U5310 ( .A(i_i2c_ic_rst_n), .Y(n7471), .Z(n4869) );
  IVDA U5311 ( .A(n7472), .Y(n11056) );
  IVDA U5312 ( .A(n7471), .Y(n11058) );
  IVDA U5313 ( .A(n4871), .Y(n11057) );
  IVDA U5314 ( .A(n7472), .Y(n11055) );
  IVDA U5315 ( .A(n7471), .Y(n11054) );
  IVDA U5316 ( .A(n6833), .Y(n4893) );
  MUX21H U5317 ( .A(n5975), .B(n10488), .S(n5974), .Z(n4944) );
  AN2P U5318 ( .A(n5859), .B(n5993), .Z(n4945) );
  OR2P U5319 ( .A(n4860), .B(n5021), .Z(n4952) );
  AN2P U5320 ( .A(n4806), .B(n10004), .Z(ex_i_ahb_AHB_Slave_haddr[14]) );
  AN2P U5321 ( .A(n6395), .B(n10056), .Z(n4962) );
  IVDA U5322 ( .A(n6681), .Y(n4963), .Z(n4964) );
  MUX21H U5323 ( .A(i_apb_pwdata_int[7]), .B(i_apb_pwdata_int[23]), .S(n6396), 
        .Z(n4965) );
  AN2P U5324 ( .A(n5943), .B(n10467), .Z(n4966) );
  AN2P U5325 ( .A(n5411), .B(n5437), .Z(n4970) );
  IVDA U5326 ( .A(n7996), .Y(n4975), .Z(n4976) );
  IVDA U5327 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[13]), .Y(n4978) );
  IVDA U5328 ( .A(n10771), .Y(n4980), .Z(n4981) );
  IVDA U5329 ( .A(ex_i_ahb_AHB_Master_haddr[13]), .Y(n6955), .Z(n5789) );
  AN4P U5330 ( .A(n5537), .B(n7721), .C(n5750), .D(n7744), .Z(n4988) );
  MUX21H U5331 ( .A(n9529), .B(n10605), .S(n9528), .Z(n4993) );
  ND2 U5332 ( .A(i_ahb_U_arb_U_arbif_r_haddr_d[0]), .B(
        ex_i_ahb_AHB_Master_haddr[0]), .Z(n4995) );
  IVDA U5333 ( .A(n8642), .Y(n4996), .Z(n10054) );
  MUX21H U5334 ( .A(n9334), .B(n10601), .S(n9595), .Z(n4997) );
  IVDA U5335 ( .A(ex_i_ahb_AHB_Master_haddr[5]), .Y(n4998), .Z(n4999) );
  MUX21H U5336 ( .A(n9378), .B(n10610), .S(n9409), .Z(n5000) );
  MUX21H U5337 ( .A(n9047), .B(n10618), .S(n9046), .Z(n5001) );
  IVP U5338 ( .A(n8332), .Z(n8204) );
  B2I U5339 ( .A(n9870), .Z1(n5005), .Z2(n9905) );
  MUX21HP U5340 ( .A(i_apb_pwdata_int[4]), .B(i_apb_pwdata_int[20]), .S(n6396), 
        .Z(n5012) );
  IVDA U5341 ( .A(n8421), .Y(n5014), .Z(n5015) );
  IVDA U5342 ( .A(n8421), .Y(n5016), .Z(n5017) );
  IVDA U5343 ( .A(i_i2c_rx_full), .Y(n5018), .Z(n5019) );
  IVP U5344 ( .A(n5778), .Z(n5162) );
  IVDA U5345 ( .A(n5709), .Z(n5021) );
  IVDA U5346 ( .A(n6515), .Y(n5025), .Z(n5026) );
  IVDA U5347 ( .A(n6299), .Z(n5029) );
  IVDA U5348 ( .A(n10132), .Z(n5032) );
  IVDA U5349 ( .A(n6672), .Y(n5033), .Z(n5269) );
  ND2 U5350 ( .A(n5727), .B(n5726), .Z(n5038) );
  MUX21H U5351 ( .A(n8589), .B(n10461), .S(n8588), .Z(n5057) );
  NR2 U5352 ( .A(n10556), .B(n8213), .Z(n5065) );
  MUX21H U5353 ( .A(n9829), .B(n10596), .S(n9828), .Z(n5084) );
  IVDA U5354 ( .A(n6859), .Y(n5087), .Z(n5088) );
  B2I U5355 ( .A(n9415), .Z1(n9235), .Z2(n9408) );
  AN2P U5356 ( .A(n6448), .B(n6447), .Z(n5101) );
  B4I U5357 ( .A(n5101), .Z(n7931) );
  IVDA U5358 ( .A(n5364), .Y(n5103), .Z(n5104) );
  IVDA U5359 ( .A(i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_empty_n), .Z(n5105) );
  ND2 U5360 ( .A(n10420), .B(n10458), .Z(n5107) );
  IVDA U5361 ( .A(n10419), .Y(n5421), .Z(n5066) );
  ND2 U5362 ( .A(i_i2c_rx_wr_addr[1]), .B(n10589), .Z(n5112) );
  NR2 U5363 ( .A(n10582), .B(n8216), .Z(n5116) );
  IVDA U5364 ( .A(n8263), .Y(n8051) );
  MUX21H U5365 ( .A(n10467), .B(n5944), .S(n6085), .Z(n5123) );
  AN3 U5366 ( .A(n6260), .B(n6599), .C(n6585), .Z(n5127) );
  ND2 U5367 ( .A(n6179), .B(n6178), .Z(n6539) );
  IVDA U5368 ( .A(n6626), .Y(n5128), .Z(n6098) );
  ND2 U5369 ( .A(n10777), .B(i_apb_U_DW_apb_ahbsif_nextstate_1_), .Z(n5129) );
  ND2P U5370 ( .A(n6523), .B(n8185), .Z(n8102) );
  ND2 U5371 ( .A(n8135), .B(i_apb_prdata_apb_dslcr[4]), .Z(n5130) );
  ND4P U5372 ( .A(n6381), .B(n6380), .C(n6379), .D(n6378), .Z(n6843) );
  IVDA U5373 ( .A(n8099), .Y(n5133), .Z(n10012) );
  IVDA U5374 ( .A(n5485), .Y(n5134), .Z(n5135) );
  ND2 U5375 ( .A(n6741), .B(n5442), .Z(n7888) );
  ND2P U5376 ( .A(n6732), .B(n5139), .Z(n5412) );
  ND2 U5377 ( .A(n5581), .B(n5775), .Z(n5382) );
  AN2P U5378 ( .A(n5644), .B(n5776), .Z(n5141) );
  AO7P U5379 ( .A(n5493), .B(n10366), .C(n5644), .Z(n5254) );
  AN2P U5380 ( .A(n5279), .B(n5493), .Z(n5142) );
  NR2P U5381 ( .A(n5505), .B(n7833), .Z(n8196) );
  B2IP U5382 ( .A(n5811), .Z1(n5505), .Z2(n10403) );
  IVDA U5383 ( .A(n5319), .Y(n5147), .Z(n5309) );
  NR2 U5384 ( .A(n10171), .B(n5646), .Z(n5148) );
  OR2P U5385 ( .A(n5689), .B(n5688), .Z(n5149) );
  B4IP U5386 ( .A(n6895), .Z(n6939) );
  ND2P U5387 ( .A(n5388), .B(n6932), .Z(n10070) );
  ND2 U5388 ( .A(n10158), .B(n5470), .Z(n5153) );
  ND2 U5389 ( .A(n10158), .B(n5484), .Z(n5154) );
  AN2P U5390 ( .A(i_apb_U_DW_apb_ahbsif_nextstate_1_), .B(n5388), .Z(n5155) );
  AN2P U5391 ( .A(n5528), .B(n5456), .Z(n5158) );
  AO7 U5392 ( .A(n5405), .B(n6669), .C(n10483), .Z(n5303) );
  B4I U5393 ( .A(n7470), .Z(n8324) );
  NR2P U5394 ( .A(n6492), .B(n6475), .Z(n5414) );
  NR2 U5395 ( .A(i_apb_paddr[24]), .B(i_apb_paddr[18]), .Z(n6357) );
  ND4 U5396 ( .A(n5493), .B(n5203), .C(n5623), .D(n5279), .Z(n5616) );
  ND2 U5397 ( .A(n7442), .B(n7443), .Z(n5436) );
  ND2P U5398 ( .A(n10755), .B(n5656), .Z(n5663) );
  ND4P U5399 ( .A(n5618), .B(n5617), .C(n5616), .D(n5615), .Z(n5619) );
  AO7 U5400 ( .A(n5781), .B(n5283), .C(n5033), .Z(n5782) );
  ND2 U5401 ( .A(i_ahb_U_mux_hsel_prev[0]), .B(n5189), .Z(n5511) );
  ND2 U5402 ( .A(n5381), .B(n5172), .Z(n5204) );
  ND2 U5403 ( .A(n5512), .B(n5486), .Z(n8857) );
  NR2 U5404 ( .A(ex_i_ahb_AHB_Master_haddr[14]), .B(
        ex_i_ahb_AHB_Master_haddr[15]), .Z(n5317) );
  ND4 U5405 ( .A(n5449), .B(n5276), .C(n6291), .D(n5173), .Z(n5344) );
  ND2 U5406 ( .A(n9691), .B(n9690), .Z(n10273) );
  AO7 U5407 ( .A(n9682), .B(n9681), .C(n9680), .Z(n9689) );
  IVA U5408 ( .A(n7186), .Z(n7187) );
  AO7 U5409 ( .A(n9291), .B(n9290), .C(n9289), .Z(n9292) );
  AO2 U5410 ( .A(n6573), .B(n6563), .C(n10723), .D(n4981), .Z(n6566) );
  IVA U5411 ( .A(n5734), .Z(n5768) );
  ND2P U5412 ( .A(n8186), .B(n8185), .Z(n8187) );
  NR2 U5413 ( .A(n9709), .B(n9708), .Z(n9710) );
  IVP U5414 ( .A(n5166), .Z(n10008) );
  OR2P U5415 ( .A(n5096), .B(n8231), .Z(n8037) );
  B2I U5416 ( .A(n8112), .Z1(n8117), .Z2(n11051) );
  AO7 U5417 ( .A(n8415), .B(n10483), .C(n5165), .Z(n5352) );
  ND2 U5418 ( .A(n5382), .B(n5198), .Z(n5208) );
  EO U5419 ( .A(n6085), .B(n6040), .Z(n6041) );
  IVP U5420 ( .A(n7931), .Z(n5161) );
  IVDA U5421 ( .A(n6056), .Y(n5125) );
  IVP U5422 ( .A(n4965), .Z(n5166) );
  IVA U5423 ( .A(n5649), .Z(n5578) );
  NR2 U5424 ( .A(n5425), .B(n5424), .Z(n5423) );
  IVDA U5425 ( .A(n5305), .Y(n5034), .Z(n5304) );
  MUX21H U5426 ( .A(n9972), .B(n10460), .S(n9977), .Z(n9973) );
  ND2 U5427 ( .A(n7453), .B(n6228), .Z(n7400) );
  IVA U5428 ( .A(n4805), .Z(n6671) );
  ND2 U5429 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[5]), .B(n10464), .Z(n7583) );
  IVDAP U5430 ( .A(n11047), .Y(n5140), .Z(n5201) );
  EN U5431 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[0]), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[1]), .Z(n8580) );
  IVDAP U5432 ( .A(i_apb_pclk_en), .Y(n5784), .Z(n5779) );
  IVA U5433 ( .A(n4812), .Z(n6958) );
  IVA U5434 ( .A(n4811), .Z(n6977) );
  IVA U5435 ( .A(n4810), .Z(n6980) );
  IVA U5436 ( .A(n4809), .Z(n8535) );
  IVA U5437 ( .A(n4808), .Z(n8624) );
  IVA U5438 ( .A(n4807), .Z(n8558) );
  IVDAP U5439 ( .A(ex_i_ahb_AHB_Master_hwrite), .Y(n6291), .Z(n6293) );
  IVDAP U5440 ( .A(n9871), .Y(n4982) );
  IVDAP U5441 ( .A(n9525), .Y(n9311), .Z(n9518) );
  IVA U5442 ( .A(n8953), .Z(n8927) );
  IVA U5443 ( .A(n10273), .Z(n9693) );
  AO7 U5444 ( .A(n7430), .B(n10764), .C(n7429), .Z(n4304) );
  IVA U5445 ( .A(n9333), .Z(n9331) );
  IVA U5446 ( .A(n9309), .Z(n9307) );
  ND2 U5447 ( .A(n9689), .B(n9688), .Z(n9690) );
  IVA U5448 ( .A(n8917), .Z(n8923) );
  OR2P U5449 ( .A(n8919), .B(n8918), .Z(n8920) );
  IVA U5450 ( .A(n9292), .Z(n9301) );
  IVA U5451 ( .A(n9687), .Z(n9688) );
  AO3 U5452 ( .A(n8916), .B(n8913), .C(n8915), .D(n8914), .Z(n8917) );
  AN2P U5453 ( .A(n9679), .B(n9678), .Z(n9680) );
  IVA U5454 ( .A(n6244), .Z(n6247) );
  IVDAP U5455 ( .A(n9385), .Y(n5089) );
  OR2P U5456 ( .A(n8912), .B(n8911), .Z(n8913) );
  IVA U5457 ( .A(n9232), .Z(n9233) );
  IVA U5458 ( .A(n6103), .Z(n6104) );
  IVA U5459 ( .A(n9672), .Z(n9676) );
  IVA U5460 ( .A(n9227), .Z(n9231) );
  ND2 U5461 ( .A(n6566), .B(n6565), .Z(n6568) );
  IVA U5462 ( .A(n6025), .Z(n6032) );
  IVA U5463 ( .A(n7175), .Z(n7178) );
  IVA U5464 ( .A(n9606), .Z(n9607) );
  IVA U5465 ( .A(n8445), .Z(n8446) );
  IVA U5466 ( .A(n8444), .Z(n8451) );
  ND4 U5467 ( .A(n5808), .B(n5809), .C(n5235), .D(n5232), .Z(n4372) );
  IVA U5468 ( .A(n9156), .Z(n9157) );
  IVA U5469 ( .A(n10230), .Z(n10231) );
  IVA U5470 ( .A(n9105), .Z(n8883) );
  IVAP U5471 ( .A(n5331), .Z(n6997) );
  ND2 U5472 ( .A(n10071), .B(n5349), .Z(n5401) );
  IVA U5473 ( .A(n8980), .Z(n8983) );
  IVA U5474 ( .A(n10236), .Z(n10238) );
  IVA U5475 ( .A(n8938), .Z(n7052) );
  AN2P U5476 ( .A(n7737), .B(n5553), .Z(n5554) );
  IVA U5477 ( .A(n10269), .Z(n7074) );
  IVA U5478 ( .A(n8882), .Z(n8519) );
  IVA U5479 ( .A(n7165), .Z(n7168) );
  IVA U5480 ( .A(n8881), .Z(n8521) );
  IVA U5481 ( .A(n8934), .Z(n8935) );
  IVA U5482 ( .A(n8948), .Z(n8947) );
  IVA U5483 ( .A(n5560), .Z(n10401) );
  IVA U5484 ( .A(n9107), .Z(n8439) );
  B2I U5485 ( .A(n8880), .Z2(n10053) );
  ND2 U5486 ( .A(i_ahb_U_arb_U_arbif_ipl1_int[2]), .B(n5751), .Z(n5213) );
  IVA U5487 ( .A(n9602), .Z(n9603) );
  IVA U5488 ( .A(n6012), .Z(n6017) );
  IVA U5489 ( .A(n10266), .Z(n8981) );
  IVA U5490 ( .A(n8604), .Z(n8611) );
  IVA U5491 ( .A(n8538), .Z(n7075) );
  AO6 U5492 ( .A(n8405), .B(n5148), .C(n5648), .Z(n5311) );
  IVA U5493 ( .A(n8435), .Z(n8434) );
  IVA U5494 ( .A(n9264), .Z(n9244) );
  IVA U5495 ( .A(n8508), .Z(n8510) );
  IVA U5496 ( .A(n8467), .Z(n8466) );
  IVA U5497 ( .A(n7750), .Z(n11100) );
  IVA U5498 ( .A(n8565), .Z(n8564) );
  IVA U5499 ( .A(n8571), .Z(n8569) );
  IVA U5500 ( .A(n8517), .Z(n8437) );
  ND4 U5501 ( .A(i_i2c_ic_tx_tl[2]), .B(n6497), .C(n5361), .D(n5360), .Z(n5359) );
  IVA U5502 ( .A(n5629), .Z(n5642) );
  OR2P U5503 ( .A(n8412), .B(n8423), .Z(n8413) );
  ND2 U5504 ( .A(n9236), .B(n6573), .Z(n5926) );
  OR4 U5505 ( .A(n11050), .B(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[0]), 
        .C(n9148), .D(n9138), .Z(n8527) );
  IVA U5506 ( .A(n9073), .Z(n9075) );
  ND2 U5507 ( .A(n6615), .B(n6101), .Z(n6102) );
  IVA U5508 ( .A(n10263), .Z(n9605) );
  IVA U5509 ( .A(n8890), .Z(n8897) );
  IVA U5510 ( .A(n5810), .Z(n5234) );
  IVA U5511 ( .A(n10104), .Z(n6236) );
  MUX21L U5512 ( .A(n6395), .B(n10928), .S(n5464), .Z(n4181) );
  IVA U5513 ( .A(n10114), .Z(n6661) );
  IVA U5514 ( .A(n10112), .Z(n10113) );
  IVA U5515 ( .A(n9149), .Z(n9146) );
  IVA U5516 ( .A(n9714), .Z(n9700) );
  AO7 U5517 ( .A(n9712), .B(n9711), .C(n9710), .Z(n9713) );
  OR2P U5518 ( .A(n10146), .B(n8337), .Z(n6735) );
  IVA U5519 ( .A(n10254), .Z(n8840) );
  AN2P U5520 ( .A(n5680), .B(n10476), .Z(n5681) );
  IVA U5521 ( .A(n10330), .Z(n8093) );
  AN2P U5522 ( .A(n8471), .B(n6754), .Z(n6755) );
  IVA U5523 ( .A(n10297), .Z(n8408) );
  IVA U5524 ( .A(n6583), .Z(n6043) );
  MUX21L U5525 ( .A(n10488), .B(n5980), .S(n6063), .Z(n6600) );
  B2I U5526 ( .A(n7049), .Z1(n7050), .Z2(n11050) );
  AO3 U5527 ( .A(n9645), .B(n9644), .C(n9643), .D(n9642), .Z(n9650) );
  AN2P U5528 ( .A(n8414), .B(n6964), .Z(n6965) );
  IVA U5529 ( .A(n8817), .Z(n8819) );
  IVA U5530 ( .A(n9715), .Z(n9701) );
  IVA U5531 ( .A(n5799), .Z(n5800) );
  IVA U5532 ( .A(n11110), .Z(n7943) );
  MUX21L U5533 ( .A(n6041), .B(n6040), .S(n6169), .Z(n6583) );
  ND3 U5534 ( .A(n9637), .B(n9641), .C(n9636), .Z(n9644) );
  IVA U5535 ( .A(i_i2c_scl_int), .Z(n10216) );
  IVA U5536 ( .A(i_i2c_U_DW_apb_i2c_mstfsm_N399), .Z(n7257) );
  IVA U5537 ( .A(n8370), .Z(n8369) );
  MUX21L U5538 ( .A(n5100), .B(i_i2c_scl_int), .S(n10333), .Z(n10114) );
  IVA U5539 ( .A(n6260), .Z(n6214) );
  AN3 U5540 ( .A(n6332), .B(n6331), .C(n6330), .Z(n6333) );
  IVA U5541 ( .A(n9081), .Z(n6235) );
  IVA U5542 ( .A(n7959), .Z(n7960) );
  MUX21L U5543 ( .A(i_i2c_ic_sda_tx_hold_sync[12]), .B(n5979), .S(n6021), .Z(
        n5980) );
  IVA U5544 ( .A(n10294), .Z(n7553) );
  NR2 U5545 ( .A(n10845), .B(n5466), .Z(n5465) );
  IVA U5546 ( .A(n9144), .Z(n9147) );
  IVA U5547 ( .A(n6751), .Z(n6753) );
  OR2P U5548 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[5]), .B(n9647), .Z(
        n9642) );
  IVA U5549 ( .A(n7990), .Z(n7991) );
  AO3 U5550 ( .A(n5209), .B(n4854), .C(n5335), .D(n5208), .Z(n5248) );
  IVA U5551 ( .A(n5806), .Z(n5807) );
  IVA U5552 ( .A(n8270), .Z(n8272) );
  IVA U5553 ( .A(n7300), .Z(n7253) );
  B3IP U5554 ( .A(n5491), .Z1(n5686), .Z2(ex_i_ahb_AHB_Master_hresp[0]) );
  ND2 U5555 ( .A(n5779), .B(n5782), .Z(n5218) );
  OR2P U5556 ( .A(i_i2c_ic_sda_tx_hold_sync[15]), .B(n5961), .Z(n5897) );
  IVA U5557 ( .A(n8258), .Z(n8274) );
  AN2P U5558 ( .A(i_i2c_U_DW_apb_i2c_fifo_wrdc_tx_unconn_2_), .B(n5161), .Z(
        n6493) );
  IVA U5559 ( .A(n11109), .Z(n10270) );
  IVA U5560 ( .A(n8307), .Z(n7555) );
  IVA U5561 ( .A(n5736), .Z(n5759) );
  IVA U5562 ( .A(n9133), .Z(n9148) );
  AN2P U5563 ( .A(n10538), .B(n5352), .Z(n8471) );
  IVA U5564 ( .A(n8366), .Z(n8367) );
  IVA U5565 ( .A(n7377), .Z(n7384) );
  AN2P U5566 ( .A(n10056), .B(n10055), .Z(n10057) );
  AO7 U5567 ( .A(n6232), .B(n10247), .C(
        i_i2c_U_DW_apb_i2c_slvfsm_ic_enable_sync_vld), .Z(n6268) );
  IVA U5568 ( .A(n7478), .Z(i_ahb_U_arb_U_ebt_next_state[0]) );
  OR4 U5569 ( .A(n10199), .B(n7064), .C(n7533), .D(n7063), .Z(n7065) );
  IVA U5570 ( .A(n7878), .Z(n7490) );
  IVA U5571 ( .A(n8230), .Z(n7565) );
  AO7 U5572 ( .A(n7751), .B(n5289), .C(i_ahb_U_arb_U_mask_r_mask_locked_1_), 
        .Z(n7754) );
  IVA U5573 ( .A(n10242), .Z(n8329) );
  IVA U5574 ( .A(n8304), .Z(n7559) );
  EO U5575 ( .A(n8501), .B(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[7]), 
        .Z(n8396) );
  OR2P U5576 ( .A(n5047), .B(n8529), .Z(n8530) );
  IVA U5577 ( .A(n7450), .Z(n7467) );
  IVA U5578 ( .A(n7390), .Z(n9319) );
  IVA U5579 ( .A(n9613), .Z(n9615) );
  IVA U5580 ( .A(n5341), .Z(n5209) );
  IVA U5581 ( .A(n5758), .Z(n5762) );
  IVA U5582 ( .A(n5682), .Z(n5648) );
  IVA U5583 ( .A(n7657), .Z(n5164) );
  IVA U5584 ( .A(n8936), .Z(n8937) );
  AN2P U5585 ( .A(n8285), .B(i_i2c_ic_intr_mask[8]), .Z(n7849) );
  IVA U5586 ( .A(n8544), .Z(n6915) );
  AN3 U5587 ( .A(n4763), .B(n5280), .C(n5184), .Z(n5191) );
  AN3 U5588 ( .A(n5704), .B(n10753), .C(n5703), .Z(n5195) );
  IVA U5589 ( .A(n10247), .Z(n7520) );
  IVA U5590 ( .A(n5741), .Z(n5742) );
  IVA U5591 ( .A(n7554), .Z(n8301) );
  OR2P U5592 ( .A(n7931), .B(n6467), .Z(n6475) );
  AN2P U5593 ( .A(ex_i_ahb_AHB_Slave_hburst[2]), .B(
        ex_i_ahb_AHB_Master_hburst[1]), .Z(n5631) );
  IVA U5594 ( .A(n6161), .Z(n6164) );
  IVA U5595 ( .A(ex_i_ahb_AHB_Slave_haddr[8]), .Z(n7745) );
  IVA U5596 ( .A(ex_i_ahb_AHB_Slave_haddr[9]), .Z(n7936) );
  IVA U5597 ( .A(n5760), .Z(n5729) );
  IVA U5598 ( .A(ex_i_ahb_AHB_Slave_hwrite), .Z(n7946) );
  IVA U5599 ( .A(ex_i_ahb_AHB_Slave_haddr[3]), .Z(n10082) );
  IVA U5600 ( .A(n7297), .Z(n7094) );
  IVA U5601 ( .A(n7577), .Z(n7580) );
  IVA U5602 ( .A(n7618), .Z(n7353) );
  IVA U5603 ( .A(n10278), .Z(n10281) );
  IVA U5604 ( .A(n7320), .Z(n7455) );
  EN U5605 ( .A(n6045), .B(n6044), .Z(n6048) );
  AN2P U5606 ( .A(n5101), .B(n10439), .Z(n6476) );
  IVA U5607 ( .A(n8480), .Z(n8499) );
  IVA U5608 ( .A(ex_i_ahb_AHB_Slave_haddr[25]), .Z(n6981) );
  IVA U5609 ( .A(n8481), .Z(n8483) );
  IVA U5610 ( .A(n8490), .Z(n8482) );
  IVA U5611 ( .A(ex_i_ahb_AHB_Slave_hsize[0]), .Z(n7725) );
  IVA U5612 ( .A(n10146), .Z(n8352) );
  IVA U5613 ( .A(n8500), .Z(n8501) );
  IVA U5614 ( .A(n7078), .Z(n7334) );
  IVA U5615 ( .A(ex_i_ahb_AHB_Slave_haddr[26]), .Z(n6985) );
  IVA U5616 ( .A(n9135), .Z(n8091) );
  IVA U5617 ( .A(n8489), .Z(n8381) );
  IVA U5618 ( .A(n7351), .Z(n7352) );
  IVA U5619 ( .A(n7374), .Z(n7375) );
  IVA U5620 ( .A(n7343), .Z(n7249) );
  IVA U5621 ( .A(n7274), .Z(n7338) );
  IVA U5622 ( .A(n9466), .Z(n10039) );
  IVA U5623 ( .A(n7942), .Z(n5608) );
  IVA U5624 ( .A(ex_i_ahb_AHB_Slave_haddr[28]), .Z(n8798) );
  IVA U5625 ( .A(ex_i_ahb_AHB_Slave_haddr[30]), .Z(n8529) );
  IVA U5626 ( .A(ex_i_ahb_AHB_Slave_haddr[31]), .Z(n6976) );
  ND2 U5627 ( .A(n5685), .B(n5231), .Z(n5230) );
  ND3 U5628 ( .A(n8035), .B(n8034), .C(i_i2c_ic_tx_tl[2]), .Z(n8036) );
  IVA U5629 ( .A(n7533), .Z(n7539) );
  IVA U5630 ( .A(n6909), .Z(n6912) );
  IVA U5631 ( .A(n10327), .Z(n8106) );
  IVA U5632 ( .A(ex_i_ahb_AHB_Slave_hsize[1]), .Z(n7720) );
  IVA U5633 ( .A(n10105), .Z(n10106) );
  IVA U5634 ( .A(ex_i_ahb_AHB_Slave_haddr[27]), .Z(n8651) );
  IVA U5635 ( .A(n8286), .Z(n7901) );
  IVA U5636 ( .A(n5617), .Z(n5289) );
  IVA U5637 ( .A(n7534), .Z(n7536) );
  IVA U5638 ( .A(ex_i_ahb_AHB_Slave_haddr[29]), .Z(n8793) );
  NR2 U5639 ( .A(n5183), .B(n5178), .Z(n5184) );
  IVA U5640 ( .A(n8563), .Z(n7435) );
  IVA U5641 ( .A(n7738), .Z(n5823) );
  IVA U5642 ( .A(n8081), .Z(n7513) );
  IVA U5643 ( .A(n6633), .Z(n6101) );
  IVA U5644 ( .A(n7621), .Z(n7359) );
  IVA U5645 ( .A(n7872), .Z(n7251) );
  IVA U5646 ( .A(n5655), .Z(n5659) );
  IVA U5647 ( .A(n8460), .Z(n5165) );
  IVA U5648 ( .A(n7214), .Z(n7236) );
  IVA U5649 ( .A(n7328), .Z(n7329) );
  EO U5650 ( .A(n8583), .B(n10652), .Z(n8581) );
  IVA U5651 ( .A(n7479), .Z(n6231) );
  EO U5652 ( .A(n8586), .B(n10651), .Z(n8587) );
  IVA U5653 ( .A(n7081), .Z(n7082) );
  IVA U5654 ( .A(n5685), .Z(n5699) );
  IVA U5655 ( .A(n5124), .Z(n6170) );
  ND2 U5656 ( .A(n5700), .B(i_ahb_U_arb_U_gctrl_bc[2]), .Z(n5231) );
  IVA U5657 ( .A(n5609), .Z(n5610) );
  IVA U5658 ( .A(n5745), .Z(n5728) );
  IVA U5659 ( .A(n9036), .Z(n9060) );
  IVA U5660 ( .A(n9453), .Z(n9436) );
  IVA U5661 ( .A(ex_i_ahb_AHB_Slave_hwdata[14]), .Z(n10119) );
  IVA U5662 ( .A(n8491), .Z(n8376) );
  IVA U5663 ( .A(n9353), .Z(n9571) );
  IVA U5664 ( .A(ex_i_ahb_AHB_Slave_hwdata[15]), .Z(n10134) );
  IVA U5665 ( .A(n7518), .Z(n7519) );
  IVA U5666 ( .A(n10322), .Z(n7516) );
  IVA U5667 ( .A(n7459), .Z(n8118) );
  IVA U5668 ( .A(n10246), .Z(n10248) );
  IVA U5669 ( .A(n8362), .Z(n8363) );
  IVA U5670 ( .A(n6014), .Z(n6015) );
  IVA U5671 ( .A(ex_i_ahb_AHB_Slave_hwdata[26]), .Z(n10141) );
  IVA U5672 ( .A(ex_i_ahb_AHB_Slave_hwdata[18]), .Z(n10124) );
  IVA U5673 ( .A(ex_i_ahb_AHB_Slave_hwdata[25]), .Z(n10137) );
  IVA U5674 ( .A(ex_i_ahb_AHB_Slave_hwdata[30]), .Z(n10118) );
  IVA U5675 ( .A(n8415), .Z(n8411) );
  IVA U5676 ( .A(ex_i_ahb_AHB_Slave_hwdata[24]), .Z(n10120) );
  IVA U5677 ( .A(ex_i_ahb_AHB_Slave_hwdata[19]), .Z(n8474) );
  IVA U5678 ( .A(ex_i_ahb_AHB_Slave_hwdata[20]), .Z(n8473) );
  IVA U5679 ( .A(ex_i_ahb_AHB_Slave_hwdata[23]), .Z(n10166) );
  IVA U5680 ( .A(ex_i_ahb_AHB_Slave_hwdata[21]), .Z(n8525) );
  IVA U5681 ( .A(n9959), .Z(n10060) );
  IVA U5682 ( .A(ex_i_ahb_AHB_Slave_hwdata[16]), .Z(n10122) );
  IVA U5683 ( .A(ex_i_ahb_AHB_Slave_hwdata[17]), .Z(n10126) );
  IVA U5684 ( .A(ex_i_ahb_AHB_Slave_hwdata[31]), .Z(n8526) );
  IVA U5685 ( .A(ex_i_ahb_AHB_Slave_hwdata[29]), .Z(n10143) );
  IVA U5686 ( .A(ex_i_ahb_AHB_Slave_hwdata[28]), .Z(n10135) );
  IVA U5687 ( .A(n9865), .Z(n9896) );
  IVA U5688 ( .A(ex_i_ahb_AHB_Slave_hwdata[27]), .Z(n10139) );
  IVP U5689 ( .A(ex_i_ahb_AHB_Slave_hwdata[9]), .Z(n10138) );
  IVA U5690 ( .A(n6469), .Z(n5169) );
  IVP U5691 ( .A(ex_i_ahb_AHB_Slave_hwdata[8]), .Z(n10121) );
  IVA U5692 ( .A(n9803), .Z(n9786) );
  IVA U5693 ( .A(n5930), .Z(n5928) );
  IVP U5694 ( .A(ex_i_ahb_AHB_Slave_hwdata[7]), .Z(n8475) );
  IVA U5695 ( .A(n5511), .Z(n5371) );
  IVA U5696 ( .A(n8592), .Z(n8328) );
  IVP U5697 ( .A(ex_i_ahb_AHB_Slave_hwdata[6]), .Z(n10130) );
  IVP U5698 ( .A(ex_i_ahb_AHB_Slave_hwdata[5]), .Z(n8472) );
  IVA U5699 ( .A(n9557), .Z(n9533) );
  IVP U5700 ( .A(ex_i_ahb_AHB_Slave_hwdata[4]), .Z(n8476) );
  IVA U5701 ( .A(n7573), .Z(n7574) );
  IVA U5702 ( .A(ex_i_ahb_AHB_Slave_hwdata[12]), .Z(n10136) );
  B4I U5703 ( .A(n8357), .Z(n9989) );
  IVA U5704 ( .A(ex_i_ahb_AHB_Slave_hwdata[0]), .Z(n10123) );
  IVA U5705 ( .A(ex_i_ahb_AHB_Slave_hwdata[11]), .Z(n10140) );
  IVA U5706 ( .A(ex_i_ahb_AHB_Slave_hwdata[22]), .Z(n10128) );
  IVA U5707 ( .A(n9069), .Z(n8839) );
  IVA U5708 ( .A(n10167), .Z(n10168) );
  IVA U5709 ( .A(n7399), .Z(n7344) );
  IVA U5710 ( .A(ex_i_ahb_AHB_Slave_hwdata[10]), .Z(n10142) );
  IVA U5711 ( .A(n4786), .Z(n5335) );
  ND4 U5712 ( .A(n5487), .B(n5788), .C(n5450), .D(n5041), .Z(n5183) );
  AN3 U5713 ( .A(i_ahb_U_mux_hsel_prev[0]), .B(n5190), .C(n5189), .Z(n5188) );
  IVA U5714 ( .A(n7831), .Z(n5724) );
  MUX21H U5715 ( .A(n7198), .B(n10759), .S(n7239), .Z(n7199) );
  IVA U5716 ( .A(n7292), .Z(n7317) );
  IVA U5717 ( .A(n7232), .Z(n7233) );
  IVA U5718 ( .A(n7224), .Z(n7225) );
  IVA U5719 ( .A(n7239), .Z(n7240) );
  IVA U5720 ( .A(n7307), .Z(n7309) );
  IVA U5721 ( .A(n9900), .Z(n9901) );
  IVA U5722 ( .A(n8072), .Z(n6746) );
  IVA U5723 ( .A(n9550), .Z(n9551) );
  IVA U5724 ( .A(n10450), .Z(n5651) );
  IVA U5725 ( .A(n7267), .Z(n7268) );
  IVA U5726 ( .A(n8071), .Z(n6736) );
  ND3 U5727 ( .A(n7832), .B(n7831), .C(n7830), .Z(n7833) );
  IVA U5728 ( .A(n9555), .Z(n9522) );
  IVA U5729 ( .A(n9528), .Z(n9514) );
  IVA U5730 ( .A(n7378), .Z(n7379) );
  IVA U5731 ( .A(n9131), .Z(n9132) );
  IVA U5732 ( .A(n10088), .Z(n10089) );
  IVA U5733 ( .A(n9595), .Z(n9596) );
  IVA U5734 ( .A(n9427), .Z(n9420) );
  IVA U5735 ( .A(n9828), .Z(n9823) );
  IVA U5736 ( .A(n9875), .Z(n9876) );
  IVA U5737 ( .A(n7403), .Z(n7404) );
  IVA U5738 ( .A(n7280), .Z(n7277) );
  IVA U5739 ( .A(n7904), .Z(n11097) );
  IVA U5740 ( .A(n9801), .Z(n9761) );
  IVA U5741 ( .A(n9332), .Z(n8791) );
  IVA U5742 ( .A(n8120), .Z(n10332) );
  IVA U5743 ( .A(n9881), .Z(n9882) );
  IVA U5744 ( .A(n9021), .Z(n9022) );
  IVA U5745 ( .A(n9818), .Z(n9819) );
  IVA U5746 ( .A(n9034), .Z(n8995) );
  IVA U5747 ( .A(n7079), .Z(n7282) );
  IVA U5748 ( .A(n9046), .Z(n9000) );
  IVA U5749 ( .A(n9590), .Z(n9345) );
  MUX21L U5750 ( .A(i_apb_pwdata_int[8]), .B(i_apb_pwdata_int[24]), .S(n6397), 
        .Z(n7708) );
  IVA U5751 ( .A(n7453), .Z(n7321) );
  IVA U5752 ( .A(n8963), .Z(n8969) );
  IVA U5753 ( .A(n8588), .Z(n8586) );
  IVA U5754 ( .A(n6904), .Z(n6898) );
  IVA U5755 ( .A(n9409), .Z(n9410) );
  IVA U5756 ( .A(n10252), .Z(n10256) );
  IVA U5757 ( .A(n8484), .Z(n8485) );
  IVA U5758 ( .A(n8379), .Z(n8380) );
  IVA U5759 ( .A(n9364), .Z(n9365) );
  IVA U5760 ( .A(n9451), .Z(n9435) );
  IVA U5761 ( .A(n7958), .Z(n11104) );
  IVA U5762 ( .A(n7517), .Z(n7521) );
  IVA U5763 ( .A(n6874), .Z(n6876) );
  AN2P U5764 ( .A(n8816), .B(n8414), .Z(n8822) );
  IVA U5765 ( .A(n6434), .Z(n6429) );
  IVA U5766 ( .A(i_i2c_activity), .Z(n7562) );
  IVA U5767 ( .A(n8103), .Z(n10324) );
  IVDA U5768 ( .A(n5201), .Z(n5200) );
  IVA U5769 ( .A(n8848), .Z(n8841) );
  IVA U5770 ( .A(n8209), .Z(n8210) );
  IVA U5771 ( .A(n8113), .Z(n6818) );
  IVA U5772 ( .A(n7263), .Z(n7588) );
  IVA U5773 ( .A(n8240), .Z(n11099) );
  EO U5774 ( .A(n5945), .B(i_i2c_ic_sda_tx_hold_sync[8]), .Z(n5949) );
  IVA U5775 ( .A(n7765), .Z(n7709) );
  IVA U5776 ( .A(n9692), .Z(n10275) );
  EO U5777 ( .A(n6027), .B(i_i2c_ic_sda_tx_hold_sync[14]), .Z(n5992) );
  ND2 U5778 ( .A(n5860), .B(n10477), .Z(n5861) );
  IVA U5779 ( .A(n7473), .Z(n11106) );
  IVA U5780 ( .A(n8478), .Z(n7072) );
  IVA U5781 ( .A(n10295), .Z(n10296) );
  IVA U5782 ( .A(n10362), .Z(n10363) );
  IVA U5783 ( .A(n9977), .Z(n9978) );
  IVA U5784 ( .A(n8430), .Z(n7452) );
  IVA U5785 ( .A(n9983), .Z(n9984) );
  IVA U5786 ( .A(n8598), .Z(n8511) );
  IVA U5787 ( .A(n7792), .Z(n7788) );
  IVA U5788 ( .A(n11103), .Z(n7923) );
  EO U5789 ( .A(n6149), .B(n5852), .Z(n6150) );
  IVA U5790 ( .A(n7540), .Z(n7542) );
  ND2 U5791 ( .A(n7583), .B(n7579), .Z(n6209) );
  IVA U5792 ( .A(n7774), .Z(n7771) );
  IVA U5793 ( .A(n7795), .Z(n7786) );
  EO U5794 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[13]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[12]), .Z(n7218) );
  EO U5795 ( .A(i_i2c_ic_sda_rx_hold_sync[0]), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[0]), .Z(n8382) );
  NR2 U5796 ( .A(i_apb_paddr[23]), .B(i_apb_paddr[21]), .Z(n6352) );
  AN2P U5797 ( .A(n10769), .B(n10463), .Z(n6030) );
  EO U5798 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[1]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[0]), .Z(n9861) );
  IVA U5799 ( .A(n10575), .Z(n6528) );
  EO U5800 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[1]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[0]), .Z(n7196) );
  EO U5801 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[12]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[13]), .Z(n9358) );
  EO U5802 ( .A(i_i2c_ic_sda_rx_hold_sync[5]), .B(i_i2c_ic_sda_rx_hold_sync[4]), .Z(n8388) );
  EO U5803 ( .A(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[0]), .B(n10773), .Z(
        n7815) );
  EO U5804 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[12]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[13]), .Z(n9839) );
  EO U5805 ( .A(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[4]), .B(n10730), .Z(
        n7808) );
  IVA U5806 ( .A(i_i2c_ic_sar[7]), .Z(n8333) );
  EO U5807 ( .A(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[1]), .B(
        i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[0]), .Z(n7814) );
  EO U5808 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[4]), .B(n10456), .Z(n8574) );
  EO U5809 ( .A(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[4]), .B(
        i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[5]), .Z(n7810) );
  AN2P U5810 ( .A(i_i2c_rx_wr_addr[2]), .B(n10625), .Z(n7738) );
  IVDA U5811 ( .A(n10863), .Z(n5274) );
  IVA U5812 ( .A(n8098), .Z(n5170) );
  IVA U5813 ( .A(i_i2c_ic_sar[1]), .Z(n8205) );
  EO U5814 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[0]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[1]), .Z(n9815) );
  NR2 U5815 ( .A(ex_i_ahb_AHB_Master_hgrant), .B(n10476), .Z(n5194) );
  EO U5816 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[12]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[13]), .Z(n9403) );
  IVA U5817 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[7]), .Z(n8754) );
  EO U5818 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[0]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[1]), .Z(n9424) );
  IVA U5819 ( .A(n7737), .Z(n5171) );
  IVA U5820 ( .A(n10620), .Z(n6195) );
  IVAP U5821 ( .A(n11043), .Z(n6130) );
  EO U5822 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[0]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[1]), .Z(n9506) );
  IVAP U5823 ( .A(n11042), .Z(n6121) );
  IVA U5824 ( .A(n5467), .Z(n5468) );
  EO U5825 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[0]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[1]), .Z(n9015) );
  EO U5826 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[0]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[1]), .Z(n9587) );
  EO U5827 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[12]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[13]), .Z(n9795) );
  EO U5828 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[12]), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[13]), .Z(n9953) );
  EO U5829 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[12]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[13]), .Z(n9041) );
  IVA U5830 ( .A(n10460), .Z(n5967) );
  IVA U5831 ( .A(n5481), .Z(n5482) );
  IVP U5832 ( .A(n5776), .Z(n5172) );
  IVDA U5833 ( .A(i_i2c_mst_rxbyte_rdy), .Z(n7507) );
  EO U5834 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[12]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[13]), .Z(n9544) );
  AN2P U5835 ( .A(i_ahb_U_arb_U_mask_extend_ltip), .B(n10450), .Z(n7752) );
  AN2P U5836 ( .A(n10512), .B(n10417), .Z(n6424) );
  NR2 U5837 ( .A(i_i2c_mst_debug_cstate[3]), .B(i_i2c_mst_debug_cstate[4]), 
        .Z(n6228) );
  OR4 U5838 ( .A(i_ahb_U_arb_U_arbif_ipl1_int[3]), .B(
        i_ahb_U_arb_U_arbif_ipl1_int[1]), .C(i_ahb_U_arb_U_arbif_ipl1_int[2]), 
        .D(i_ahb_U_arb_U_arbif_ipl1_int[0]), .Z(n5654) );
  IVA U5839 ( .A(n10422), .Z(n6782) );
  EN U5840 ( .A(i_i2c_U_DW_apb_i2c_fifo_wrdc_rx_unconn[1]), .B(n10416), .Z(
        n6414) );
  OR2P U5841 ( .A(n10420), .B(n10458), .Z(n6461) );
  OR2P U5842 ( .A(i_i2c_ic_tx_tl[1]), .B(i_i2c_ic_tx_tl[0]), .Z(n6467) );
  IVA U5843 ( .A(n5469), .Z(n5470) );
  IVA U5844 ( .A(n5483), .Z(n5484) );
  EO U5845 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[1]), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[0]), .Z(n9965) );
  IVA U5846 ( .A(n5479), .Z(n5480) );
  IVA U5847 ( .A(n6674), .Z(n5173) );
  IVDAP U5848 ( .A(n5779), .Y(n8818), .Z(n8414) );
  IVA U5849 ( .A(ex_i_ahb_AHB_Master_hprot[0]), .Z(n6816) );
  IVA U5850 ( .A(ex_i_ahb_AHB_Master_hsize[2]), .Z(n5539) );
  IVA U5851 ( .A(ex_i_ahb_AHB_Master_hsize[0]), .Z(n7724) );
  IVA U5852 ( .A(ex_i_ahb_AHB_Master_haddr[2]), .Z(n7935) );
  IVA U5853 ( .A(ex_i_ahb_AHB_Master_hburst[1]), .Z(n5260) );
  IVDA U5854 ( .A(ex_i_ahb_AHB_Master_haddr[15]), .Y(n5487), .Z(n5486) );
  IVA U5855 ( .A(ex_i_ahb_AHB_Master_haddr[1]), .Z(n5515) );
  IVA U5856 ( .A(ex_i_ahb_AHB_Master_haddr[3]), .Z(n5451) );
  IVA U5857 ( .A(ex_i_ahb_AHB_Master_hprot[1]), .Z(n6815) );
  IVA U5858 ( .A(ex_i_ahb_AHB_Master_hbusreq), .Z(n5397) );
  IVA U5859 ( .A(i_i2c_ic_clk_in_a), .Z(
        i_i2c_U_DW_apb_i2c_rx_filter_U_scl_sync_U_SYNC_N2) );
  IVA U5860 ( .A(ex_i_ahb_AHB_Slave_hresp[1]), .Z(n5576) );
  IVDA U5861 ( .A(ex_i_ahb_AHB_Slave_hready_resp), .Y(n5007), .Z(n5488) );
  IVA U5862 ( .A(ex_i_ahb_AHB_Master_hburst[2]), .Z(n5174) );
  IVA U5863 ( .A(ex_i_ahb_AHB_Master_haddr[27]), .Z(n5175) );
  IVA U5864 ( .A(ex_i_ahb_AHB_Master_haddr[20]), .Z(n5176) );
  IVDAP U5865 ( .A(n5178), .Z(n5177) );
  NR2P U5866 ( .A(n6669), .B(n5177), .Z(n6963) );
  OR2P U5867 ( .A(n7680), .B(n5177), .Z(n10163) );
  ND4P U5868 ( .A(n5307), .B(n5449), .C(n5447), .D(n5448), .Z(n5178) );
  ND4P U5869 ( .A(n6299), .B(n5224), .C(n5181), .D(n6298), .Z(n6970) );
  AO3P U5870 ( .A(n5341), .B(n5207), .C(n5405), .D(n5206), .Z(n5313) );
  ND2P U5871 ( .A(n6670), .B(n5305), .Z(n6666) );
  ND2P U5872 ( .A(i_apb_U_DW_apb_ahbsif_state[2]), .B(n5160), .Z(n5305) );
  AN2P U5873 ( .A(n5571), .B(n5194), .Z(n5562) );
  AO6P U5874 ( .A(n5204), .B(n5192), .C(n5308), .Z(n5220) );
  ND4 U5875 ( .A(n5775), .B(n5581), .C(n5381), .D(n5582), .Z(n5192) );
  ND2P U5876 ( .A(n5623), .B(n5197), .Z(n5811) );
  NR2P U5877 ( .A(n5645), .B(n5254), .Z(n5197) );
  NR2P U5878 ( .A(n5562), .B(n5563), .Z(n5617) );
  AO7P U5879 ( .A(i_ahb_U_arb_U_gctrl_r_hmaster_d_0_), .B(n5571), .C(n5561), 
        .Z(n5563) );
  OR2P U5880 ( .A(n5201), .B(n10376), .Z(n10377) );
  IVDA U5881 ( .A(n7742), .Y(n5023), .Z(n5270) );
  B3IP U5882 ( .A(n10366), .Z1(n7742), .Z2(n10396) );
  ND2P U5883 ( .A(i_ahb_hrdata_s0[1]), .B(n10051), .Z(n5747) );
  ND4P U5884 ( .A(n10053), .B(n5749), .C(n5748), .D(n5747), .Z(n4366) );
  AN2P U5885 ( .A(n5702), .B(n5195), .Z(n8941) );
  IVAP U5886 ( .A(n5196), .Z(n5721) );
  ND4P U5887 ( .A(n5713), .B(n5492), .C(n5712), .D(n5714), .Z(n5196) );
  ND2 U5888 ( .A(n5381), .B(n5172), .Z(n5239) );
  NR2P U5889 ( .A(n11048), .B(ex_i_ahb_AHB_Master_haddr[17]), .Z(n5381) );
  AO3 U5890 ( .A(n5220), .B(n5143), .C(n5216), .D(n5215), .Z(n5210) );
  AO7P U5891 ( .A(n10431), .B(i_ahb_U_mux_hsel_prev[0]), .C(n5189), .Z(n5582)
         );
  ND4P U5892 ( .A(n5649), .B(n5326), .C(n5614), .D(n5693), .Z(n5620) );
  ND2 U5893 ( .A(n5350), .B(n5217), .Z(n5205) );
  ND4P U5894 ( .A(n6955), .B(n5317), .C(n5011), .D(n5250), .Z(n5308) );
  ND2P U5895 ( .A(n10781), .B(n5140), .Z(n5581) );
  OR2P U5896 ( .A(n5308), .B(n5239), .Z(n5206) );
  OR2P U5897 ( .A(n5308), .B(n5382), .Z(n5207) );
  AN2P U5898 ( .A(n5777), .B(n5788), .Z(n5250) );
  ND2P U5899 ( .A(n5221), .B(n5210), .Z(n5350) );
  IVP U5900 ( .A(n5211), .Z(n5321) );
  AO3P U5901 ( .A(n5551), .B(n5552), .C(ex_i_ahb_AHB_Slave_htrans[1]), .D(
        n5550), .Z(n5211) );
  OR2P U5902 ( .A(n5743), .B(n5211), .Z(n5770) );
  OR2P U5903 ( .A(n5539), .B(n5555), .Z(n7744) );
  OR2P U5904 ( .A(n8877), .B(n5213), .Z(n5212) );
  OR2P U5905 ( .A(n10624), .B(n6750), .Z(n5214) );
  ND2P U5906 ( .A(n5320), .B(n5769), .Z(n5752) );
  IVDAP U5907 ( .A(n5752), .Y(n5157), .Z(n8877) );
  OR2P U5908 ( .A(n5348), .B(i_apb_pclk_en), .Z(n5215) );
  AO6P U5909 ( .A(n5237), .B(n5784), .C(n10432), .Z(n5219) );
  NR2P U5910 ( .A(n5717), .B(n5716), .Z(n5719) );
  ND2P U5911 ( .A(n5708), .B(n5803), .Z(n5252) );
  AO2P U5912 ( .A(n5721), .B(n5720), .C(n5719), .D(n5718), .Z(n3929) );
  ND2 U5913 ( .A(n6955), .B(n4803), .Z(n5263) );
  OR2P U5914 ( .A(n7445), .B(i_ahb_U_arb_U_gctrl_nxt_lock_sm_2_), .Z(n5803) );
  ND2P U5915 ( .A(n5812), .B(n5337), .Z(n5627) );
  NR2P U5916 ( .A(n5580), .B(n5225), .Z(n7445) );
  ENP U5917 ( .A(n5338), .B(ex_i_ahb_AHB_Master_hresp[0]), .Z(n5225) );
  OR2P U5918 ( .A(n5329), .B(n5382), .Z(n5227) );
  ND2P U5919 ( .A(n5607), .B(n5228), .Z(n5438) );
  AO3P U5920 ( .A(n5312), .B(n6797), .C(n5776), .D(n5644), .Z(n5603) );
  IVP U5921 ( .A(n5229), .Z(n5703) );
  B4I U5922 ( .A(n5647), .Z(ex_i_ahb_AHB_Slave_htrans[0]) );
  IVAP U5923 ( .A(n5597), .Z(ex_i_ahb_AHB_Master_hresp[1]) );
  ND2P U5924 ( .A(ex_i_ahb_AHB_Master_hresp[1]), .B(n5623), .Z(n5704) );
  ND2P U5925 ( .A(n5814), .B(n6752), .Z(n5702) );
  OR2P U5926 ( .A(n5174), .B(n5555), .Z(n6752) );
  ND2 U5927 ( .A(n5792), .B(n10355), .Z(n8943) );
  ND4P U5928 ( .A(n5640), .B(n5643), .C(n5642), .D(n5641), .Z(n10355) );
  ND2 U5929 ( .A(n5233), .B(n10355), .Z(n5232) );
  AN2P U5930 ( .A(n5792), .B(n5234), .Z(n5233) );
  OR2P U5931 ( .A(n5803), .B(n5804), .Z(n8940) );
  NR2P U5932 ( .A(n5283), .B(n5783), .Z(n5237) );
  AO6P U5933 ( .A(n5780), .B(n6293), .C(n5781), .Z(n5783) );
  AO3 U5934 ( .A(n5243), .B(n5242), .C(n5241), .D(n5240), .Z(n11070) );
  OR2P U5935 ( .A(n5489), .B(n8868), .Z(n5240) );
  ND2 U5936 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[22]), .B(n10081), .Z(
        n5241) );
  ND2 U5937 ( .A(i_apb_paddr[22]), .B(n10075), .Z(n5243) );
  B2I U5938 ( .A(n5489), .Z2(n5244) );
  AN2P U5939 ( .A(n10158), .B(i_apb_paddr[25]), .Z(n5246) );
  AN2P U5940 ( .A(n6965), .B(n5384), .Z(n10071) );
  NR2P U5941 ( .A(n6962), .B(n5385), .Z(n5384) );
  ND2 U5942 ( .A(n5249), .B(n5248), .Z(n8814) );
  AN2P U5943 ( .A(n5405), .B(n5017), .Z(n5249) );
  MUX21L U5944 ( .A(n5711), .B(n5710), .S(n5720), .Z(n3881) );
  ND2P U5945 ( .A(n5715), .B(n5718), .Z(n5720) );
  ND4P U5946 ( .A(n5259), .B(n5253), .C(n5252), .D(n5251), .Z(n5718) );
  ND2P U5947 ( .A(n5706), .B(n5705), .Z(n5251) );
  AO7P U5948 ( .A(n5258), .B(n5256), .C(n4862), .Z(n7442) );
  AO3P U5949 ( .A(n5255), .B(n5254), .C(n5602), .D(n5616), .Z(n5812) );
  ND2 U5950 ( .A(n5609), .B(n5613), .Z(n5257) );
  ND2P U5951 ( .A(n5583), .B(n5557), .Z(n5589) );
  AO6P U5952 ( .A(n5647), .B(n5574), .C(n5573), .Z(n5333) );
  ND2 U5953 ( .A(n5707), .B(n5692), .Z(n5259) );
  OR2P U5954 ( .A(n5536), .B(n5260), .Z(n5814) );
  ND2P U5955 ( .A(n5620), .B(n5261), .Z(n5319) );
  ND2 U5956 ( .A(n7443), .B(n5261), .Z(n7444) );
  AO3 U5957 ( .A(n5264), .B(n5263), .C(n5383), .D(n5262), .Z(n5265) );
  NR2P U5958 ( .A(n5785), .B(n5786), .Z(n5383) );
  ND4P U5959 ( .A(n5526), .B(n5527), .C(n5176), .D(n5434), .Z(n5786) );
  NR2P U5960 ( .A(ex_i_ahb_AHB_Master_haddr[23]), .B(
        ex_i_ahb_AHB_Master_haddr[22]), .Z(n5527) );
  ND4P U5961 ( .A(n5525), .B(n5524), .C(n5523), .D(n5175), .Z(n5785) );
  NR2P U5962 ( .A(ex_i_ahb_AHB_Master_haddr[31]), .B(
        ex_i_ahb_AHB_Master_haddr[28]), .Z(n5523) );
  NR2P U5963 ( .A(ex_i_ahb_AHB_Master_haddr[30]), .B(
        ex_i_ahb_AHB_Master_haddr[29]), .Z(n5524) );
  NR2P U5964 ( .A(ex_i_ahb_AHB_Master_haddr[25]), .B(
        ex_i_ahb_AHB_Master_haddr[26]), .Z(n5525) );
  AN2P U5965 ( .A(n5791), .B(n5512), .Z(n5264) );
  NR2P U5966 ( .A(n5266), .B(n5265), .Z(ex_i_ahb_AHB_Slave_hsel) );
  AN2P U5967 ( .A(n8857), .B(n5393), .Z(n5268) );
  B2I U5968 ( .A(n10158), .Z2(n10159) );
  ND2 U5969 ( .A(n10074), .B(i_apb_U_DW_apb_ahbsif_piped_haddr_c[16]), .Z(
        n8829) );
  IVDA U5970 ( .A(n7445), .Y(n5641), .Z(n5678) );
  IVDAP U5971 ( .A(ex_i_ahb_AHB_Master_haddr[14]), .Y(n5041), .Z(n5282) );
  ND2 U5972 ( .A(n5676), .B(n5677), .Z(n5310) );
  AO7P U5973 ( .A(n10171), .B(n5653), .C(n10861), .Z(n4535) );
  ND4 U5974 ( .A(n5776), .B(n5511), .C(n5493), .D(n5644), .Z(n5615) );
  ND2P U5975 ( .A(n5271), .B(n5681), .Z(n5712) );
  EOP U5976 ( .A(n5692), .B(i_ahb_hmaster_data[0]), .Z(n5271) );
  AO3P U5977 ( .A(n10028), .B(n6985), .C(n6984), .D(n6983), .Z(n11066) );
  AO3P U5978 ( .A(n10028), .B(n8793), .C(n6988), .D(n6987), .Z(n11063) );
  ND2P U5979 ( .A(i_ahb_hmaster_0_), .B(ex_i_ahb_AHB_Master_haddr[7]), .Z(
        n10032) );
  ND2 U5980 ( .A(n10075), .B(n5272), .Z(n6983) );
  AN2P U5981 ( .A(n10158), .B(i_apb_paddr[26]), .Z(n5272) );
  ND2 U5982 ( .A(n10075), .B(n5273), .Z(n6987) );
  AN2P U5983 ( .A(n10158), .B(i_apb_paddr[29]), .Z(n5273) );
  B4I U5984 ( .A(n6750), .Z(n10051) );
  ND2 U5985 ( .A(n10075), .B(n5275), .Z(n6978) );
  AN2P U5986 ( .A(n10158), .B(n5474), .Z(n5275) );
  AO3P U5987 ( .A(n5548), .B(n5547), .C(ex_i_ahb_AHB_Slave_haddr[6]), .D(n5546), .Z(n5549) );
  ND2 U5988 ( .A(n10075), .B(n5277), .Z(n8826) );
  AN2P U5989 ( .A(n10158), .B(i_i2c_U_DW_apb_i2c_regfile_N402), .Z(n5277) );
  ND2 U5990 ( .A(n10075), .B(n5278), .Z(n8832) );
  AN2P U5991 ( .A(n5480), .B(n10158), .Z(n5278) );
  AO3P U5992 ( .A(n6925), .B(n10143), .C(n6941), .D(n6940), .Z(n3889) );
  AO3P U5993 ( .A(n8941), .B(n5149), .C(n5690), .D(n5438), .Z(n5691) );
  ND2P U5994 ( .A(n8364), .B(n8363), .Z(n8365) );
  AO3P U5995 ( .A(n6925), .B(n10141), .C(n6924), .D(n6923), .Z(n3892) );
  AO3P U5996 ( .A(n6935), .B(n10130), .C(n6934), .D(n6933), .Z(n3912) );
  ND4P U5997 ( .A(n5679), .B(n5794), .C(n7443), .D(n7442), .Z(n5692) );
  AO3P U5998 ( .A(n6935), .B(n10119), .C(n6699), .D(n6698), .Z(n3904) );
  AO3P U5999 ( .A(n6925), .B(n10134), .C(n6703), .D(n6702), .Z(n3903) );
  AO3P U6000 ( .A(n6935), .B(n10120), .C(n6708), .D(n6707), .Z(n3894) );
  AO3P U6001 ( .A(n6925), .B(n10121), .C(n6714), .D(n6713), .Z(n3910) );
  AO3P U6002 ( .A(n6935), .B(n6723), .C(n6722), .D(n6721), .Z(n3905) );
  AO3P U6003 ( .A(n6938), .B(n10139), .C(n6725), .D(n6724), .Z(n3891) );
  AO3P U6004 ( .A(n6935), .B(n8526), .C(n6728), .D(n6727), .Z(n3887) );
  B2I U6005 ( .A(n5217), .Z2(n5281) );
  IVP U6006 ( .A(n5388), .Z(n8823) );
  ND2P U6007 ( .A(n5350), .B(n5217), .Z(n5388) );
  OR2P U6008 ( .A(n8823), .B(n6682), .Z(n6706) );
  OR2P U6009 ( .A(n6971), .B(n6683), .Z(n6895) );
  AO3P U6010 ( .A(n6938), .B(n8474), .C(n5285), .D(n5284), .Z(n3899) );
  ND2 U6011 ( .A(n6726), .B(i_apb_pwdata_int[19]), .Z(n5284) );
  B2IP U6012 ( .A(n6706), .Z2(n6938) );
  AO3P U6013 ( .A(n6938), .B(n10118), .C(n6731), .D(n6730), .Z(n3888) );
  AO3P U6014 ( .A(n6938), .B(n10136), .C(n6701), .D(n6700), .Z(n3906) );
  AO3P U6015 ( .A(n6925), .B(n10128), .C(n6705), .D(n6704), .Z(n3896) );
  AO3P U6016 ( .A(n6925), .B(n10123), .C(n6716), .D(n6715), .Z(n3918) );
  AO3P U6017 ( .A(n6938), .B(n10126), .C(n6718), .D(n6717), .Z(n3901) );
  AO3P U6018 ( .A(n6935), .B(n10140), .C(n6922), .D(n6921), .Z(n3907) );
  AO3P U6019 ( .A(n6938), .B(n10125), .C(n6937), .D(n6936), .Z(n3916) );
  AO3P U6020 ( .A(n6925), .B(n8473), .C(n6685), .D(n6684), .Z(n3898) );
  AO3P U6021 ( .A(n6935), .B(n8477), .C(n6687), .D(n6686), .Z(n3915) );
  AO3P U6022 ( .A(n6935), .B(n8472), .C(n6897), .D(n6896), .Z(n3913) );
  AO3P U6023 ( .A(n6925), .B(n8525), .C(n5288), .D(n5287), .Z(n3897) );
  ND2 U6024 ( .A(n6726), .B(i_apb_pwdata_int[21]), .Z(n5287) );
  OR2P U6025 ( .A(n4983), .B(n6895), .Z(n5288) );
  AO3P U6026 ( .A(n5570), .B(n5289), .C(n5568), .D(n5569), .Z(n5337) );
  AN2P U6027 ( .A(n5290), .B(i_ahb_hresp_none_0_), .Z(n5584) );
  ND2P U6028 ( .A(i_ahb_hready_resp_none), .B(n5290), .Z(n5493) );
  NR2P U6029 ( .A(i_ahb_U_mux_hsel_prev[0]), .B(i_ahb_U_mux_hsel_prev[1]), .Z(
        n5290) );
  AO3P U6030 ( .A(n5293), .B(n5292), .C(n5600), .D(n5291), .Z(n5794) );
  ND2 U6031 ( .A(n5693), .B(n5408), .Z(n5292) );
  AN2P U6032 ( .A(n5588), .B(n5599), .Z(n5693) );
  ND2 U6033 ( .A(n5326), .B(n5444), .Z(n5293) );
  ND2P U6034 ( .A(n5598), .B(n5294), .Z(n5444) );
  B4I U6035 ( .A(n10027), .Z(ex_i_ahb_AHB_Slave_haddr[2]) );
  OR2P U6036 ( .A(n10027), .B(n4998), .Z(n5296) );
  ND2 U6037 ( .A(ex_i_ahb_AHB_Slave_haddr[4]), .B(n10032), .Z(n5541) );
  AN2P U6038 ( .A(n5537), .B(n5750), .Z(n5297) );
  OR2P U6039 ( .A(n5436), .B(i_ahb_U_arb_U_gctrl_nxt_lock_sm_2_), .Z(n5490) );
  B4I U6040 ( .A(n5299), .Z(ex_i_ahb_AHB_Slave_haddr[4]) );
  ND2P U6041 ( .A(n5790), .B(ex_i_ahb_AHB_Master_haddr[4]), .Z(n5299) );
  OR2P U6042 ( .A(n6750), .B(n10642), .Z(n5300) );
  AO3P U6043 ( .A(n5457), .B(n10145), .C(n5746), .D(n5770), .Z(n6750) );
  OR2P U6044 ( .A(n8876), .B(n8877), .Z(n5301) );
  ND2P U6045 ( .A(n5512), .B(ex_i_ahb_AHB_Master_htrans[0]), .Z(n5609) );
  AN4P U6046 ( .A(n5788), .B(n5276), .C(n5162), .D(n6955), .Z(n6292) );
  ND2P U6047 ( .A(n8821), .B(n5306), .Z(n8828) );
  ND2P U6048 ( .A(n8822), .B(n5388), .Z(n5306) );
  ND2P U6049 ( .A(i_apb_U_DW_apb_ahbsif_piped_hwrite_c), .B(
        i_apb_U_DW_apb_ahbsif_pipeline_c), .Z(n6673) );
  ND4 U6050 ( .A(n5307), .B(n5447), .C(n5448), .D(n5339), .Z(n5340) );
  AN2P U6051 ( .A(n5526), .B(n5527), .Z(n5307) );
  IVP U6052 ( .A(n5319), .Z(n5679) );
  ND2 U6053 ( .A(n10074), .B(i_apb_U_DW_apb_ahbsif_piped_haddr_c[3]), .Z(
        n10085) );
  AO7P U6054 ( .A(n5342), .B(n5129), .C(n5327), .Z(n5379) );
  ND2P U6055 ( .A(n5148), .B(n8406), .Z(n5713) );
  OR2P U6056 ( .A(n8468), .B(n7445), .Z(n8406) );
  ND4P U6057 ( .A(n5640), .B(n5643), .C(n5641), .D(n5642), .Z(n5492) );
  AN2P U6058 ( .A(n5679), .B(n5621), .Z(n5643) );
  AN2P U6059 ( .A(n5311), .B(n5310), .Z(n5714) );
  AN2P U6060 ( .A(n5511), .B(n5493), .Z(n5312) );
  ND4 U6061 ( .A(n5162), .B(n5775), .C(n5581), .D(n5582), .Z(n5588) );
  ND2P U6062 ( .A(n6963), .B(n5298), .Z(n8422) );
  AO3 U6063 ( .A(n5016), .B(n5298), .C(n8424), .D(n5389), .Z(n5391) );
  ND2P U6064 ( .A(i_ahb_U_arb_def_mst_0_), .B(n5673), .Z(n5372) );
  OR2P U6065 ( .A(n10171), .B(n5649), .Z(n5673) );
  ND2P U6066 ( .A(n5441), .B(n5141), .Z(n10171) );
  AO7P U6067 ( .A(n5315), .B(n5314), .C(n5558), .Z(n5805) );
  AO7P U6068 ( .A(n5316), .B(n5488), .C(ex_i_ahb_AHB_Slave_htrans[1]), .Z(
        n5314) );
  NR2P U6069 ( .A(n5316), .B(n6797), .Z(n5315) );
  NR2P U6070 ( .A(n5344), .B(n5340), .Z(n5345) );
  ND2 U6071 ( .A(n6971), .B(n5150), .Z(n6677) );
  AO2P U6072 ( .A(n5269), .B(n8423), .C(n10432), .D(n5318), .Z(n6675) );
  NR3P U6073 ( .A(n5745), .B(n5722), .C(n5723), .Z(n5734) );
  ND4P U6074 ( .A(n5521), .B(n5520), .C(n5519), .D(n5522), .Z(n5723) );
  ND4P U6075 ( .A(n5531), .B(n5530), .C(n5534), .D(n5533), .Z(n5722) );
  NR2P U6076 ( .A(n5322), .B(n5038), .Z(n5769) );
  AN2P U6077 ( .A(n5728), .B(n5743), .Z(n5322) );
  ND2P U6078 ( .A(n5158), .B(n5811), .Z(n5743) );
  OR2P U6079 ( .A(i_ahb_U_mux_hsel_prev[2]), .B(n5440), .Z(n5644) );
  B2I U6080 ( .A(n5333), .Z2(n5326) );
  ND4 U6081 ( .A(n5408), .B(n5589), .C(n5333), .D(n5588), .Z(n5338) );
  ND2 U6082 ( .A(n5325), .B(n8815), .Z(n5327) );
  ND4P U6083 ( .A(n4803), .B(n6955), .C(n5011), .D(n5328), .Z(n5329) );
  AN2P U6084 ( .A(n5777), .B(n5788), .Z(n5328) );
  OR2P U6085 ( .A(n5334), .B(n5342), .Z(n5331) );
  ND2P U6086 ( .A(n4791), .B(n5155), .Z(n8461) );
  ND3 U6087 ( .A(n5281), .B(n4788), .C(n5047), .Z(n5334) );
  AO3P U6088 ( .A(n6304), .B(n6303), .C(n6302), .D(n6301), .Z(n4619) );
  OR2P U6089 ( .A(n5596), .B(n5338), .Z(n7443) );
  AN4P U6090 ( .A(n10404), .B(i_ahb_U_mux_hsel_prev[0]), .C(n4868), .D(n5189), 
        .Z(n5574) );
  OR2P U6091 ( .A(n4939), .B(n5695), .Z(n5628) );
  AN2P U6092 ( .A(n5450), .B(n5788), .Z(n5339) );
  AN2P U6093 ( .A(n5434), .B(n5523), .Z(n5447) );
  NR2P U6094 ( .A(ex_i_ahb_AHB_Master_haddr[18]), .B(
        ex_i_ahb_AHB_Master_haddr[19]), .Z(n5434) );
  AN2P U6095 ( .A(n5525), .B(n5524), .Z(n5448) );
  NR2P U6096 ( .A(ex_i_ahb_AHB_Master_haddr[24]), .B(
        ex_i_ahb_AHB_Master_haddr[21]), .Z(n5526) );
  IVDAP U6097 ( .A(n5325), .Y(n5150), .Z(n5342) );
  AN2P U6098 ( .A(n5343), .B(n5342), .Z(n5349) );
  AN2P U6099 ( .A(ex_i_ahb_AHB_Slave_haddr[4]), .B(n5281), .Z(n5343) );
  AO7P U6100 ( .A(n5346), .B(n8818), .C(n5032), .Z(
        i_apb_U_DW_apb_ahbsif_nextstate_1_) );
  AO6P U6101 ( .A(n4792), .B(n5347), .C(n5380), .Z(n5346) );
  AO3 U6102 ( .A(i_apb_U_DW_apb_ahbsif_state[0]), .B(n5280), .C(
        i_apb_U_DW_apb_ahbsif_state[1]), .D(n10132), .Z(n5347) );
  AN2P U6103 ( .A(n10004), .B(n6293), .Z(ex_i_ahb_AHB_Slave_hwrite) );
  ND2P U6104 ( .A(n8425), .B(n10421), .Z(n8426) );
  OR2P U6105 ( .A(i_apb_U_DW_apb_ahbsif_state[1]), .B(
        i_apb_U_DW_apb_ahbsif_state[0]), .Z(n6674) );
  ND2P U6106 ( .A(n5358), .B(n5353), .Z(n5368) );
  AN2P U6107 ( .A(n6388), .B(n5353), .Z(n5428) );
  ND3 U6108 ( .A(n5830), .B(n6390), .C(n5353), .Z(n5430) );
  IVAP U6109 ( .A(n5455), .Z(n5353) );
  MUX21LP U6110 ( .A(n4990), .B(n4881), .S(n6396), .Z(n8357) );
  ND2P U6111 ( .A(n8211), .B(n8210), .Z(n5464) );
  ND2 U6112 ( .A(n5355), .B(n5354), .Z(n6537) );
  AN2P U6113 ( .A(n6436), .B(n6528), .Z(n5354) );
  IVAP U6114 ( .A(n6500), .Z(n6529) );
  ND2P U6115 ( .A(n6436), .B(n5355), .Z(n6500) );
  ND2P U6116 ( .A(n10410), .B(n6285), .Z(n5355) );
  NR2P U6117 ( .A(n5842), .B(n7440), .Z(n6436) );
  MUX21L U6118 ( .A(n6502), .B(n6501), .S(
        i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[0]), .Z(n4052) );
  ND2 U6119 ( .A(n5358), .B(n5411), .Z(n5424) );
  AN2P U6120 ( .A(i_apb_pwrite), .B(i_apb_penable), .Z(n5358) );
  AO2 U6121 ( .A(n5120), .B(n6287), .C(n6531), .D(n5836), .Z(n5846) );
  NR2 U6122 ( .A(n5827), .B(n6283), .Z(n6531) );
  ND3 U6123 ( .A(n5838), .B(n7438), .C(n7524), .Z(n6283) );
  NR2 U6124 ( .A(n5835), .B(n6498), .Z(n6287) );
  ND3P U6125 ( .A(n5409), .B(n4821), .C(n6518), .Z(n6498) );
  OR2P U6126 ( .A(n6426), .B(n6515), .Z(n6518) );
  NR2 U6127 ( .A(n6473), .B(n5359), .Z(n6489) );
  OR2P U6128 ( .A(n10458), .B(n5476), .Z(n5360) );
  ND2 U6129 ( .A(i_i2c_U_DW_apb_i2c_fifo_wrdc_tx_unconn_2_), .B(n5135), .Z(
        n5361) );
  ND3 U6130 ( .A(n10458), .B(n5134), .C(n5476), .Z(n6497) );
  ND2P U6131 ( .A(n6480), .B(n10420), .Z(n5476) );
  ND2 U6132 ( .A(n6391), .B(n6364), .Z(n5432) );
  NR2P U6133 ( .A(n10848), .B(n10849), .Z(n6364) );
  NR2P U6134 ( .A(i_apb_paddr[22]), .B(i_apb_paddr[19]), .Z(n6391) );
  IVA U6135 ( .A(n5432), .Z(n5362) );
  AN3P U6136 ( .A(n5362), .B(n4970), .C(n6388), .Z(n6463) );
  NR2P U6137 ( .A(i_apb_paddr[23]), .B(i_apb_paddr[24]), .Z(n5437) );
  NR3P U6138 ( .A(i_apb_paddr[17]), .B(i_apb_paddr[15]), .C(i_apb_paddr[20]), 
        .Z(n6388) );
  EN U6139 ( .A(i_i2c_U_DW_apb_i2c_intctl_tx_abrt_flg_sync), .B(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_flg_sync_q), .Z(n5364) );
  IVP U6140 ( .A(n5363), .Z(n7524) );
  ND2 U6141 ( .A(n5364), .B(i_i2c_ic_enable[0]), .Z(n5363) );
  IVAP U6142 ( .A(n5199), .Z(ex_i_ahb_AHB_Slave_haddr[16]) );
  ND2P U6143 ( .A(n7524), .B(n5365), .Z(n7440) );
  ND4P U6144 ( .A(n6464), .B(n6811), .C(n6833), .D(n6463), .Z(n5365) );
  NR2 U6145 ( .A(n7734), .B(n7735), .Z(n5366) );
  ND2 U6146 ( .A(n10556), .B(n10352), .Z(n6868) );
  NR2 U6147 ( .A(n10013), .B(n10012), .Z(n11095) );
  ND2P U6148 ( .A(n5459), .B(n6451), .Z(n7767) );
  IVA U6149 ( .A(n5367), .Z(n7756) );
  NR2P U6150 ( .A(n6526), .B(n7767), .Z(n7776) );
  ND4P U6151 ( .A(n6452), .B(n4970), .C(n7756), .D(n7755), .Z(n6526) );
  NR2P U6152 ( .A(n5425), .B(n5368), .Z(n7755) );
  ND2P U6153 ( .A(n10835), .B(i_apb_psel_en), .Z(n5425) );
  ND4 U6154 ( .A(n6391), .B(n6415), .C(n6389), .D(n6390), .Z(n5367) );
  AN2P U6155 ( .A(n6387), .B(n6388), .Z(n6452) );
  B2I U6156 ( .A(n5463), .Z1(n5037), .Z2(n5369) );
  ND2 U6157 ( .A(n6462), .B(n5463), .Z(n5370) );
  ND2P U6158 ( .A(n5462), .B(n5105), .Z(n5463) );
  ND2 U6159 ( .A(n4994), .B(n5369), .Z(n6456) );
  NR2 U6160 ( .A(n10288), .B(n5369), .Z(n10289) );
  EOP U6161 ( .A(i_i2c_U_DW_apb_i2c_fifo_tx_pop_flg_sync), .B(
        i_i2c_U_DW_apb_i2c_fifo_tx_pop_flg_sync_q), .Z(n5462) );
  ND2P U6162 ( .A(n5371), .B(n5585), .Z(n5586) );
  ND2 U6163 ( .A(n5375), .B(n10355), .Z(n5374) );
  IVP U6164 ( .A(n5372), .Z(n5439) );
  ND2 U6165 ( .A(n5372), .B(n5674), .Z(n5395) );
  ND4P U6166 ( .A(n5169), .B(n5373), .C(n6464), .D(n6463), .Z(n6480) );
  NR2P U6167 ( .A(n5430), .B(n5429), .Z(n6464) );
  AO3 U6168 ( .A(n10174), .B(n10780), .C(n5376), .D(n5374), .Z(n4371) );
  AN3 U6169 ( .A(n10174), .B(n5792), .C(ex_i_ahb_AHB_Slave_hburst[2]), .Z(
        n5375) );
  ND2 U6170 ( .A(n8940), .B(n5377), .Z(n5376) );
  AN2P U6171 ( .A(n10174), .B(n6753), .Z(n5377) );
  AN3P U6172 ( .A(n5775), .B(n5581), .C(n5582), .Z(n5613) );
  ND2 U6173 ( .A(n5394), .B(n4782), .Z(n10068) );
  ND2 U6174 ( .A(n5398), .B(n4782), .Z(n5400) );
  NR2 U6175 ( .A(n8415), .B(n5280), .Z(n5380) );
  ND2 U6176 ( .A(n6672), .B(i_apb_U_DW_apb_ahbsif_state[1]), .Z(n10132) );
  AN2P U6177 ( .A(n5383), .B(n5787), .Z(i_ahb_hsel_s0) );
  IVP U6178 ( .A(n5350), .Z(n5385) );
  ND2 U6179 ( .A(n5789), .B(n5788), .Z(n5393) );
  IVP U6180 ( .A(n6675), .Z(n5387) );
  IVP U6181 ( .A(n8422), .Z(n8423) );
  IVP U6182 ( .A(n8461), .Z(n5404) );
  ND2 U6183 ( .A(n5017), .B(n5390), .Z(n5389) );
  NR2 U6184 ( .A(n5392), .B(n5391), .Z(n8425) );
  NR2 U6185 ( .A(n8422), .B(n5015), .Z(n5392) );
  ND4 U6186 ( .A(n10086), .B(n10083), .C(n10085), .D(n10084), .Z(n11085) );
  AN2P U6187 ( .A(n8828), .B(i_apb_U_DW_apb_ahbsif_piped_haddr_c[6]), .Z(n5394) );
  AO3 U6188 ( .A(n5396), .B(n5439), .C(n5675), .D(n5395), .Z(n5676) );
  ND4 U6189 ( .A(n7652), .B(n7655), .C(n5164), .D(n5397), .Z(n5396) );
  AN2P U6190 ( .A(n8828), .B(i_apb_U_DW_apb_ahbsif_piped_haddr_c[4]), .Z(n5398) );
  ND4 U6191 ( .A(n5400), .B(n5401), .C(n10072), .D(n5399), .Z(n11084) );
  ND2 U6192 ( .A(n5402), .B(n10156), .Z(n5399) );
  AN2P U6193 ( .A(i_i2c_reg_addr[2]), .B(n10070), .Z(n5402) );
  AO7P U6194 ( .A(n5404), .B(n5403), .C(n6675), .Z(n6679) );
  ND2 U6195 ( .A(n10433), .B(n5407), .Z(n7751) );
  IVP U6196 ( .A(n5591), .Z(n5407) );
  ND2 U6197 ( .A(i_ahb_U_arb_U_gctrl_lock_sm[0]), .B(
        i_ahb_U_arb_U_gctrl_lock_sm[1]), .Z(n5591) );
  AO7P U6198 ( .A(n5613), .B(n5590), .C(n5609), .Z(n5408) );
  NR2 U6199 ( .A(n6531), .B(n6499), .Z(n6502) );
  NR2 U6200 ( .A(i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[3]), .B(n5410), .Z(n5409)
         );
  ND2 U6201 ( .A(n7524), .B(i_i2c_rx_push_sync), .Z(n5410) );
  NR2 U6202 ( .A(i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[1]), .B(n6498), .Z(n6533)
         );
  MUX21L U6203 ( .A(n7649), .B(n10953), .S(n7948), .Z(n4193) );
  ND2P U6204 ( .A(n7651), .B(n10283), .Z(n7948) );
  ND2 U6205 ( .A(n5413), .B(n5024), .Z(n7530) );
  NR2P U6206 ( .A(i_i2c_reg_addr[3]), .B(i_i2c_reg_addr[1]), .Z(n5413) );
  IVP U6207 ( .A(n5476), .Z(n6485) );
  NR3 U6208 ( .A(n5418), .B(n6473), .C(n5414), .Z(n6491) );
  MUX21LP U6209 ( .A(n5421), .B(n5066), .S(n5443), .Z(n6492) );
  AN3P U6210 ( .A(n5056), .B(n7764), .C(n7650), .Z(n10283) );
  IVP U6211 ( .A(n6526), .Z(n7650) );
  ND2 U6212 ( .A(n6450), .B(n7776), .Z(n5415) );
  ND2 U6213 ( .A(n7888), .B(n6453), .Z(n5416) );
  OR2P U6214 ( .A(n10451), .B(n10151), .Z(n10153) );
  ND2P U6215 ( .A(i_ahb_hmaster_0_), .B(ex_i_ahb_AHB_Master_htrans[0]), .Z(
        n5647) );
  AN2P U6216 ( .A(ex_i_ahb_AHB_Slave_htrans[0]), .B(n5665), .Z(n5666) );
  IVP U6217 ( .A(n5425), .Z(n5828) );
  AO3 U6218 ( .A(n6461), .B(n5485), .C(n6459), .D(n6460), .Z(n5419) );
  ND3 U6219 ( .A(n6910), .B(n5417), .C(n4918), .Z(n8548) );
  ND4 U6220 ( .A(n5417), .B(n6910), .C(n4918), .D(n4917), .Z(n6916) );
  ND2 U6221 ( .A(n6910), .B(n5417), .Z(n8546) );
  ND2 U6222 ( .A(n6910), .B(n10869), .Z(n6909) );
  NR2 U6223 ( .A(i_ahb_U_arb_U_ebt_int_count[4]), .B(
        i_ahb_U_arb_U_ebt_int_count[3]), .Z(n5417) );
  IVP U6224 ( .A(n6492), .Z(n6474) );
  NR2 U6225 ( .A(n5420), .B(n5419), .Z(n5418) );
  MUX21L U6226 ( .A(n5422), .B(n5107), .S(n6466), .Z(n5420) );
  OR2P U6227 ( .A(n5485), .B(n10458), .Z(n5422) );
  AO3P U6228 ( .A(n6458), .B(n6470), .C(n6457), .D(n6456), .Z(n5485) );
  ND4 U6229 ( .A(n5428), .B(n5431), .C(n5423), .D(n5426), .Z(n6470) );
  IVA U6230 ( .A(n6677), .Z(n8459) );
  ND2 U6231 ( .A(n6390), .B(n5437), .Z(n5427) );
  NR2 U6232 ( .A(n5432), .B(n5427), .Z(n5426) );
  AN2P U6233 ( .A(n5830), .B(n5829), .Z(n5431) );
  AN2P U6234 ( .A(i_ahb_U_mux_hsel_prev[0]), .B(n5162), .Z(n5433) );
  ND2 U6235 ( .A(n5435), .B(n5169), .Z(n6458) );
  NR2 U6236 ( .A(n10418), .B(n6468), .Z(n5435) );
  OR2P U6237 ( .A(n10366), .B(n5511), .Z(n5572) );
  AN2P U6238 ( .A(n5608), .B(n5438), .Z(n5621) );
  AO7 U6239 ( .A(n5505), .B(n10355), .C(n10354), .Z(n10356) );
  NR2 U6240 ( .A(ex_i_ahb_AHB_Slave_htrans[0]), .B(n5660), .Z(n5662) );
  AN3 U6241 ( .A(n5670), .B(n5668), .C(n5669), .Z(n7652) );
  ND2 U6242 ( .A(n5672), .B(ex_i_ahb_AHB_Slave_htrans[0]), .Z(n7655) );
  ND2 U6243 ( .A(i_apb_hready_resp), .B(i_ahb_U_mux_hsel_prev[1]), .Z(n5440)
         );
  IVP U6244 ( .A(n5645), .Z(n5441) );
  ND2 U6245 ( .A(n6472), .B(n6480), .Z(n5443) );
  IVP U6246 ( .A(n5444), .Z(n5684) );
  OR2P U6247 ( .A(n10403), .B(n5445), .Z(n7753) );
  ND2 U6248 ( .A(n5684), .B(n7752), .Z(n5445) );
  OR2P U6249 ( .A(n5536), .B(n5451), .Z(n5548) );
  ND2 U6250 ( .A(n7737), .B(n5452), .Z(i_ahb_U_arb_U_arbif_N82) );
  ND2 U6251 ( .A(n5744), .B(n5452), .Z(n5553) );
  AO6 U6252 ( .A(n10145), .B(n5452), .C(n5171), .Z(n11156) );
  AO6 U6253 ( .A(n10144), .B(n5452), .C(n5171), .Z(
        i_ahb_U_arb_U_arbif_nxt_state_1_) );
  ND2P U6254 ( .A(i_apb_paddr[12]), .B(i_apb_paddr[16]), .Z(n5455) );
  B2I U6255 ( .A(n8215), .Z1(n5131), .Z2(n5453) );
  OR2P U6256 ( .A(n8215), .B(n5117), .Z(n7953) );
  OR2P U6257 ( .A(n5453), .B(n5080), .Z(n7983) );
  OR2P U6258 ( .A(n5453), .B(n5097), .Z(n7668) );
  OR2P U6259 ( .A(n5453), .B(n5098), .Z(n7677) );
  OR2P U6260 ( .A(n5453), .B(n5076), .Z(n7887) );
  AO7 U6261 ( .A(n8301), .B(n5132), .C(i_i2c_ic_raw_intr_stat[5]), .Z(n7532)
         );
  AO6 U6262 ( .A(i_apb_prdata_apb_dslcr[2]), .B(n5131), .C(n8320), .Z(n8026)
         );
  AO6 U6263 ( .A(i_apb_prdata_apb_dslcr[8]), .B(n5132), .C(n8134), .Z(n7860)
         );
  MUX21L U6264 ( .A(i_apb_prdata_apb_dslcr[12]), .B(n4975), .S(n5453), .Z(
        n7433) );
  MUX21L U6265 ( .A(i_apb_prdata_apb_dslcr[13]), .B(n4975), .S(n5453), .Z(
        n7673) );
  EO1 U6266 ( .A(i_i2c_U_DW_apb_i2c_regfile_ic_txflr_flushed[0]), .B(n7982), 
        .C(n5453), .D(n5118), .Z(n7919) );
  EO1 U6267 ( .A(i_i2c_U_DW_apb_i2c_regfile_ic_txflr_flushed[2]), .B(n7982), 
        .C(n5453), .D(n5094), .Z(n7930) );
  AO7 U6268 ( .A(n7560), .B(n5132), .C(i_i2c_ic_raw_intr_stat[8]), .Z(n7561)
         );
  AO7 U6269 ( .A(n7566), .B(n5132), .C(i_i2c_ic_raw_intr_stat[11]), .Z(n7569)
         );
  AO7 U6270 ( .A(n7637), .B(n5132), .C(i_i2c_ic_raw_intr_stat[3]), .Z(n7638)
         );
  AO3 U6271 ( .A(n8303), .B(n5132), .C(i_i2c_ic_raw_intr_stat[6]), .D(n7663), 
        .Z(n7664) );
  AO7 U6272 ( .A(n7556), .B(n5131), .C(i_i2c_ic_raw_intr_stat[7]), .Z(n7558)
         );
  IVP U6273 ( .A(n5722), .Z(n5454) );
  NR3 U6274 ( .A(n5785), .B(n5786), .C(n4963), .Z(n5456) );
  ND2 U6275 ( .A(n6477), .B(n6481), .Z(n7934) );
  ND2P U6276 ( .A(n5037), .B(n6741), .Z(n6481) );
  ND6P U6277 ( .A(n7756), .B(n6451), .C(n4970), .D(n5459), .E(n6452), .F(n7755), .Z(n6741) );
  IVP U6278 ( .A(n5743), .Z(n10170) );
  OR2P U6279 ( .A(n5742), .B(n5743), .Z(n10145) );
  IVP U6280 ( .A(n5744), .Z(n5457) );
  AN2P U6281 ( .A(n6392), .B(n10970), .Z(n5459) );
  OR2P U6282 ( .A(n8209), .B(n10282), .Z(n7848) );
  AO3P U6283 ( .A(n10644), .B(n6762), .C(n6784), .D(n6783), .Z(
        ex_i_ahb_AHB_Master_hrdata[0]) );
  ND2P U6284 ( .A(n10845), .B(n7764), .Z(n7735) );
  NR2 U6285 ( .A(n5789), .B(n5536), .Z(n5460) );
  NR3P U6286 ( .A(i_i2c_reg_addr[4]), .B(i_i2c_reg_addr[5]), .C(
        i_i2c_reg_addr[3]), .Z(n6392) );
  NR2 U6287 ( .A(n5788), .B(n7679), .Z(n5787) );
  NR2 U6288 ( .A(n5010), .B(n5791), .Z(n5461) );
  ND4 U6289 ( .A(n5627), .B(n7442), .C(n7443), .D(n5628), .Z(n8405) );
  ND2 U6290 ( .A(n5326), .B(n5575), .Z(n5695) );
  ND2 U6291 ( .A(n6739), .B(n7776), .Z(n7891) );
  OR2P U6292 ( .A(n7846), .B(n10282), .Z(n7847) );
  OR2P U6293 ( .A(n8095), .B(n5471), .Z(n8065) );
  OR2P U6294 ( .A(n8064), .B(n10840), .Z(n5471) );
  ND2 U6295 ( .A(n8063), .B(i_i2c_rx_push_sync), .Z(n8095) );
  ND4 U6296 ( .A(n6400), .B(n6808), .C(n6809), .D(n6399), .Z(n10056) );
  IVP U6297 ( .A(n5473), .Z(n5474) );
  AN2P U6298 ( .A(n7776), .B(n7775), .Z(n5475) );
  ENP U6299 ( .A(i_i2c_U_DW_apb_i2c_fifo_rx_push_flg_sync), .B(
        i_i2c_U_DW_apb_i2c_fifo_rx_push_flg_sync_q), .Z(n5477) );
  AN2P U6300 ( .A(n5477), .B(n5826), .Z(n5478) );
  AO3 U6301 ( .A(n6470), .B(n6458), .C(n6457), .D(n6456), .Z(n6465) );
  ND2P U6302 ( .A(n5587), .B(n5586), .Z(n5491) );
  ND4 U6303 ( .A(n5628), .B(n5627), .C(n7443), .D(n5794), .Z(n5629) );
  AO7 U6304 ( .A(n5613), .B(n5612), .C(n5611), .Z(n5614) );
  NR2P U6305 ( .A(n5201), .B(n10366), .Z(n6763) );
  B2I U6306 ( .A(n7442), .Z1(n7446), .Z2(n5640) );
  ND4 U6307 ( .A(n5567), .B(n5566), .C(n5565), .D(n5564), .Z(n5568) );
  AO3 U6308 ( .A(n6548), .B(n6547), .C(n6187), .D(n6546), .Z(n6189) );
  AN2P U6309 ( .A(n6593), .B(n6592), .Z(n5494) );
  NR2 U6310 ( .A(n5891), .B(n5872), .Z(n5880) );
  ND2 U6311 ( .A(n6255), .B(n6253), .Z(n6097) );
  ND2 U6312 ( .A(n5127), .B(n10096), .Z(n7410) );
  ND2P U6313 ( .A(n6564), .B(n6196), .Z(n6197) );
  ND2 U6314 ( .A(i_i2c_ic_spklen_o[3]), .B(n5905), .Z(n6159) );
  ND2 U6315 ( .A(n6001), .B(n4944), .Z(n5976) );
  ND3 U6316 ( .A(n5878), .B(n5906), .C(n5909), .Z(n5495) );
  ND2P U6317 ( .A(n5877), .B(n5876), .Z(n5878) );
  AO6 U6318 ( .A(n6604), .B(n6603), .C(n5496), .Z(n6605) );
  ND2P U6319 ( .A(n6619), .B(n9236), .Z(n5968) );
  AO3P U6320 ( .A(n6225), .B(n6224), .C(n6223), .D(n6222), .Z(n6226) );
  ND2P U6321 ( .A(n6602), .B(n5981), .Z(n6036) );
  ND2P U6322 ( .A(n6642), .B(n10333), .Z(n6200) );
  MUX21L U6323 ( .A(n10487), .B(n4949), .S(n5498), .Z(n5935) );
  AO7 U6324 ( .A(n10097), .B(n6243), .C(n6242), .Z(n6244) );
  B4I U6325 ( .A(n5901), .Z(n6564) );
  ND3 U6326 ( .A(n7413), .B(n7412), .C(n7411), .Z(n10101) );
  ND2 U6327 ( .A(n6053), .B(n6052), .Z(n6582) );
  ND3P U6328 ( .A(n6639), .B(n6638), .C(n6637), .Z(n6651) );
  AO6 U6329 ( .A(n6191), .B(n6647), .C(n6190), .Z(n6199) );
  AN2P U6330 ( .A(n6564), .B(n5935), .Z(n5499) );
  ND2 U6331 ( .A(n6564), .B(n5935), .Z(n5500) );
  AN3 U6332 ( .A(n5880), .B(n5893), .C(n5495), .Z(n5501) );
  ND3 U6333 ( .A(i_ahb_U_mux_hsel_prev[0]), .B(n10404), .C(n5189), .Z(n6758)
         );
  ND2P U6334 ( .A(n5197), .B(n5623), .Z(ex_i_ahb_AHB_Slave_hready) );
  ND2 U6335 ( .A(n10970), .B(n6763), .Z(n6781) );
  ND2 U6336 ( .A(i_apb_prdata_apb_dslcr[1]), .B(n10373), .Z(n6761) );
  IVDA U6337 ( .A(n8290), .Y(n5507), .Z(n5506) );
  IVDA U6338 ( .A(n8290), .Y(n5509), .Z(n5508) );
  ND2 U6339 ( .A(n7629), .B(n8035), .Z(n8290) );
  NR2 U6340 ( .A(n6492), .B(n7931), .Z(n11060) );
  ND2P U6341 ( .A(i_i2c_rx_full), .B(n6518), .Z(n8185) );
  NR2 U6342 ( .A(i_apb_paddr[29]), .B(i_apb_paddr[26]), .Z(n6389) );
  ND4 U6343 ( .A(n6439), .B(n6431), .C(n10546), .D(n6441), .Z(n6432) );
  ND2 U6344 ( .A(ex_i_ahb_AHB_Master_hgrant), .B(n10476), .Z(n5561) );
  IVDA U6345 ( .A(n5794), .Z(n5802) );
  ND2 U6346 ( .A(n5794), .B(n5147), .Z(n8468) );
  EON1 U6347 ( .A(n6261), .B(n10100), .C(n10099), .D(n10098), .Z(n10102) );
  AO7 U6348 ( .A(n10723), .B(n6607), .C(n5970), .Z(n5982) );
  ND3 U6349 ( .A(n8306), .B(n10577), .C(n8307), .Z(n8308) );
  IVP U6350 ( .A(n5538), .Z(n7721) );
  ND2 U6352 ( .A(i_ahb_U_arb_U_arbif_r_state[1]), .B(
        i_ahb_U_arb_U_arbif_r_state[0]), .Z(n7737) );
  ND2 U6353 ( .A(n10405), .B(n4998), .Z(n5514) );
  ND2 U6354 ( .A(i_ahb_U_arb_U_arbif_r_haddr_d[5]), .B(n4999), .Z(n5513) );
  ND2 U6355 ( .A(n5514), .B(n5513), .Z(n5522) );
  NR2P U6356 ( .A(n6957), .B(n5515), .Z(n11154) );
  EN U6357 ( .A(n11154), .B(i_ahb_U_arb_U_arbif_r_haddr_d[1]), .Z(n5521) );
  IVAP U6358 ( .A(n10032), .Z(ex_i_ahb_AHB_Slave_haddr[7]) );
  EN U6359 ( .A(ex_i_ahb_AHB_Slave_haddr[7]), .B(
        i_ahb_U_arb_U_arbif_r_haddr_d[7]), .Z(n5520) );
  NR2 U6360 ( .A(n6293), .B(n10522), .Z(n5518) );
  EON1 U6361 ( .A(ex_i_ahb_AHB_Master_haddr[3]), .B(
        i_ahb_U_arb_U_arbif_r_haddr_d[3]), .C(i_ahb_U_arb_U_arbif_r_haddr_d[3]), .D(ex_i_ahb_AHB_Master_haddr[3]), .Z(n5517) );
  NR2 U6362 ( .A(i_ahb_U_arb_U_arbif_r_haddr_d[9]), .B(
        i_ahb_U_arb_U_arbif_r_haddr_d[8]), .Z(n7831) );
  AN3 U6363 ( .A(n5777), .B(n6948), .C(n7831), .Z(n5516) );
  AN3 U6364 ( .A(n5518), .B(n5517), .C(n5516), .Z(n5519) );
  IVP U6365 ( .A(n5723), .Z(n5535) );
  NR2P U6366 ( .A(n5203), .B(n6758), .Z(n5645) );
  ND2P U6367 ( .A(ex_i_ahb_AHB_Slave_hready_resp), .B(i_ahb_U_mux_hsel_prev[2]), .Z(n5623) );
  OR2P U6368 ( .A(i_ahb_U_arb_U_arbif_r_haddr_d[0]), .B(
        ex_i_ahb_AHB_Master_haddr[0]), .Z(n5529) );
  ND2 U6369 ( .A(n4995), .B(n5529), .Z(n5531) );
  EN U6370 ( .A(ex_i_ahb_AHB_Slave_haddr[4]), .B(
        i_ahb_U_arb_U_arbif_r_haddr_d[4]), .Z(n5530) );
  ND2P U6371 ( .A(i_ahb_hmaster_0_), .B(ex_i_ahb_AHB_Master_haddr[2]), .Z(
        n10027) );
  EN U6372 ( .A(ex_i_ahb_AHB_Slave_haddr[2]), .B(
        i_ahb_U_arb_U_arbif_r_haddr_d[2]), .Z(n5534) );
  IVDAP U6373 ( .A(n11048), .Y(n6948), .Z(n5555) );
  ND2P U6374 ( .A(n5512), .B(ex_i_ahb_AHB_Master_haddr[6]), .Z(n5532) );
  EN U6375 ( .A(ex_i_ahb_AHB_Slave_haddr[6]), .B(
        i_ahb_U_arb_U_arbif_r_haddr_d[6]), .Z(n5533) );
  IVAP U6376 ( .A(n5548), .Z(ex_i_ahb_AHB_Slave_haddr[3]) );
  AN2P U6377 ( .A(ex_i_ahb_AHB_Master_hsize[1]), .B(
        ex_i_ahb_AHB_Master_hsize[0]), .Z(n5538) );
  B3IP U6378 ( .A(n11048), .Z1(n5512), .Z2(n6957) );
  AN2P U6379 ( .A(n7721), .B(n7744), .Z(n5540) );
  OR2P U6380 ( .A(ex_i_ahb_AHB_Slave_haddr[3]), .B(n5541), .Z(n5544) );
  OR2P U6381 ( .A(n6957), .B(n4998), .Z(n10076) );
  AO3 U6382 ( .A(ex_i_ahb_AHB_Master_haddr[4]), .B(n10032), .C(n10027), .D(
        n10076), .Z(n5542) );
  ND2 U6383 ( .A(n5542), .B(n10082), .Z(n5543) );
  ND2 U6384 ( .A(n5544), .B(n5543), .Z(n5551) );
  IVP U6385 ( .A(ex_i_ahb_AHB_Slave_haddr[2]), .Z(n5547) );
  OR2P U6386 ( .A(ex_i_ahb_AHB_Master_haddr[4]), .B(
        ex_i_ahb_AHB_Master_haddr[5]), .Z(n5545) );
  NR2 U6387 ( .A(ex_i_ahb_AHB_Slave_haddr[7]), .B(n5545), .Z(n5546) );
  IVP U6388 ( .A(n5549), .Z(n7939) );
  ND2 U6389 ( .A(n4988), .B(n7939), .Z(n5550) );
  AN2P U6390 ( .A(n5162), .B(n6948), .Z(ex_i_ahb_AHB_Slave_htrans[1]) );
  ND2 U6391 ( .A(n5647), .B(ex_i_ahb_AHB_Slave_htrans[1]), .Z(n7653) );
  AN2P U6392 ( .A(n10486), .B(i_ahb_hmaster_0_), .Z(n5656) );
  ND2 U6393 ( .A(n5656), .B(n5162), .Z(n5655) );
  AN2P U6394 ( .A(n7653), .B(n5655), .Z(n5559) );
  ND2 U6395 ( .A(n5162), .B(n6948), .Z(n5725) );
  NR2 U6396 ( .A(n5203), .B(n5725), .Z(n5556) );
  ND2 U6397 ( .A(n5502), .B(n5556), .Z(n5558) );
  ND2 U6398 ( .A(n5702), .B(n10174), .Z(n7658) );
  AO4 U6399 ( .A(n5559), .B(n7658), .C(n10174), .D(n10486), .Z(n5560) );
  ND2 U6401 ( .A(n5645), .B(n5795), .Z(n5570) );
  OR2P U6402 ( .A(i_ahb_U_arb_U_gctrl_lock_sm[0]), .B(
        i_ahb_U_arb_U_gctrl_lock_sm[1]), .Z(n5683) );
  OR2P U6403 ( .A(n10433), .B(n5683), .Z(n5569) );
  ND2 U6404 ( .A(n5007), .B(n6797), .Z(n5566) );
  NR2 U6405 ( .A(n5563), .B(n7751), .Z(n5565) );
  ND2 U6406 ( .A(n5270), .B(n5142), .Z(n5564) );
  AN2P U6407 ( .A(ex_i_ahb_AHB_Master_hlock), .B(n10167), .Z(n5602) );
  IVP U6408 ( .A(n5623), .Z(n5590) );
  ND2 U6409 ( .A(n5609), .B(n5590), .Z(n5575) );
  AN3 U6410 ( .A(ex_i_ahb_AHB_Master_htrans[1]), .B(i_ahb_U_mux_hsel_prev[2]), 
        .C(ex_i_ahb_AHB_Slave_hready_resp), .Z(n5573) );
  NR2P U6411 ( .A(i_ahb_U_arb_U_gctrl_lock_sm[0]), .B(
        i_ahb_U_arb_U_gctrl_lock_sm[2]), .Z(n8470) );
  ND2 U6412 ( .A(i_ahb_U_arb_U_gctrl_lock_sm[1]), .B(n8470), .Z(n5579) );
  IVP U6413 ( .A(n5579), .Z(n10161) );
  NR2 U6414 ( .A(ex_i_ahb_AHB_Slave_hresp[0]), .B(n5576), .Z(n5577) );
  ND2 U6415 ( .A(n6759), .B(n5577), .Z(n5649) );
  OR2P U6416 ( .A(n5579), .B(n5597), .Z(n5580) );
  IVDAP U6417 ( .A(ex_i_ahb_AHB_Master_htrans[1]), .Y(n5778), .Z(n5777) );
  B3IP U6418 ( .A(n11184), .Z2(i_ahb_hready_resp_s0) );
  AN2P U6419 ( .A(n5162), .B(i_ahb_hready_resp_s0), .Z(n5583) );
  NR2 U6420 ( .A(n10481), .B(n6759), .Z(n5585) );
  ND2 U6421 ( .A(n5609), .B(n5590), .Z(n5592) );
  EN U6422 ( .A(n5555), .B(i_ahb_U_arb_U_gctrl_r_hmaster_d_0_), .Z(n5595) );
  ND2 U6423 ( .A(ex_i_ahb_AHB_Master_hresp[1]), .B(i_ahb_U_arb_csilt), .Z(
        n5594) );
  NR2 U6424 ( .A(i_ahb_U_arb_U_gctrl_lock_sm[1]), .B(
        i_ahb_U_arb_U_gctrl_lock_sm[2]), .Z(n5593) );
  AN2P U6425 ( .A(i_ahb_U_arb_U_gctrl_lock_sm[0]), .B(n5593), .Z(n5600) );
  AO7 U6426 ( .A(n5595), .B(n5594), .C(n5600), .Z(n5596) );
  NR2 U6427 ( .A(i_ahb_U_arb_csilt), .B(n5597), .Z(n5598) );
  ND2 U6428 ( .A(ex_i_ahb_AHB_Slave_htrans[0]), .B(n5725), .Z(n5601) );
  AN2P U6429 ( .A(n7443), .B(n5802), .Z(n5622) );
  AN2P U6430 ( .A(i_ahb_U_arb_U_ebt_current_state[0]), .B(
        i_ahb_U_arb_U_ebt_current_state[1]), .Z(n6899) );
  AO7 U6431 ( .A(i_ahb_U_arb_U_ebt_reg_set_ebt), .B(n6899), .C(
        i_ahb_U_arb_ebten), .Z(n7634) );
  AN2P U6432 ( .A(n5043), .B(n7634), .Z(n7942) );
  EO U6433 ( .A(ex_i_ahb_AHB_Master_hgrant), .B(
        i_ahb_U_arb_U_gctrl_hgrant_previous[1]), .Z(n5604) );
  NR2 U6434 ( .A(i_ahb_U_arb_U_gctrl_hgrant_previous[0]), .B(n5604), .Z(n5798)
         );
  ND2 U6435 ( .A(n5203), .B(n5623), .Z(n5605) );
  NR2 U6436 ( .A(n5605), .B(n5254), .Z(n5606) );
  NR2 U6437 ( .A(n5798), .B(n5606), .Z(n5607) );
  ND2 U6438 ( .A(n5623), .B(n10161), .Z(n5612) );
  ND2 U6439 ( .A(n10161), .B(n5610), .Z(n5611) );
  ND2 U6440 ( .A(n10396), .B(n5776), .Z(n5618) );
  ND4 U6441 ( .A(n5640), .B(n5622), .C(n5621), .D(n5147), .Z(n5626) );
  ND2 U6442 ( .A(n5702), .B(n5704), .Z(n5625) );
  NR2 U6443 ( .A(i_ahb_U_arb_U_gctrl_bc[1]), .B(i_ahb_U_arb_U_gctrl_bc[0]), 
        .Z(n5698) );
  ND2 U6444 ( .A(n5698), .B(n10780), .Z(n5685) );
  OR3 U6445 ( .A(n5699), .B(n10554), .C(n5647), .Z(n5624) );
  NR2 U6446 ( .A(n5625), .B(n5624), .Z(n5709) );
  AO7 U6447 ( .A(n5803), .B(n5626), .C(n5709), .Z(n5639) );
  ND2 U6448 ( .A(n5643), .B(n5642), .Z(n5637) );
  OR2P U6449 ( .A(n10174), .B(n10554), .Z(n5632) );
  ND3 U6450 ( .A(n5632), .B(n5641), .C(n5640), .Z(n5636) );
  NR2 U6451 ( .A(ex_i_ahb_AHB_Master_hresp[1]), .B(n5725), .Z(n5630) );
  AO3P U6452 ( .A(n5630), .B(n5805), .C(n5647), .D(n5702), .Z(n5690) );
  IVP U6453 ( .A(n5690), .Z(n5792) );
  AN3 U6454 ( .A(n5792), .B(n10174), .C(n5631), .Z(n5634) );
  IVP U6455 ( .A(n5632), .Z(n5633) );
  OR2P U6456 ( .A(n5634), .B(n5633), .Z(n5635) );
  AO7 U6457 ( .A(n5637), .B(n5636), .C(n5635), .Z(n5638) );
  AO7 U6458 ( .A(n5810), .B(n5639), .C(n5638), .Z(n4370) );
  ND2 U6459 ( .A(ex_i_ahb_AHB_Master_hgrant), .B(n5492), .Z(n5711) );
  ND2 U6460 ( .A(ex_i_ahb_AHB_Master_hresp[0]), .B(
        ex_i_ahb_AHB_Master_hresp[1]), .Z(n5646) );
  ND3 U6461 ( .A(i_ahb_pause), .B(n5647), .C(n5725), .Z(n5682) );
  IVP U6462 ( .A(n5673), .Z(n5680) );
  ND2 U6463 ( .A(n5680), .B(i_ahb_U_arb_U_gctrl_r_hmaster_d_0_), .Z(n5677) );
  B2IP U6464 ( .A(i_ahb_U_arb_U_arbif_r_hmaster_d_0_), .Z2(
        i_ahb_hmaster_data[0]) );
  AN2P U6465 ( .A(ex_i_ahb_AHB_Master_hresp[1]), .B(n5651), .Z(n5652) );
  ND2 U6466 ( .A(ex_i_ahb_AHB_Master_hresp[0]), .B(n5652), .Z(n5653) );
  NR2 U6467 ( .A(n4535), .B(n4864), .Z(n5675) );
  ND2 U6468 ( .A(ex_i_ahb_AHB_Slave_htrans[0]), .B(i_ahb_U_arb_U_gctrl_bbc[1]), 
        .Z(n5658) );
  IVP U6469 ( .A(n5663), .Z(n5657) );
  ND2 U6470 ( .A(n5162), .B(n5657), .Z(n5671) );
  AO3 U6471 ( .A(n5659), .B(n5658), .C(n5671), .D(n7653), .Z(n7657) );
  ND2 U6472 ( .A(ex_i_ahb_AHB_Master_hburst[2]), .B(
        ex_i_ahb_AHB_Master_hburst[1]), .Z(n5660) );
  NR2 U6473 ( .A(n5777), .B(n10754), .Z(n5661) );
  AO2 U6474 ( .A(n5662), .B(ex_i_ahb_AHB_Slave_htrans[1]), .C(
        ex_i_ahb_AHB_Slave_htrans[0]), .D(n5661), .Z(n5670) );
  NR2 U6475 ( .A(i_ahb_U_arb_U_gctrl_bbc[2]), .B(n5663), .Z(n5667) );
  ND2 U6476 ( .A(ex_i_ahb_AHB_Slave_htrans[0]), .B(i_ahb_U_arb_U_gctrl_bbc[3]), 
        .Z(n5664) );
  OR2P U6477 ( .A(n5667), .B(n5664), .Z(n5669) );
  NR2 U6478 ( .A(i_ahb_U_arb_U_gctrl_bbc[3]), .B(n5778), .Z(n5665) );
  ND2 U6479 ( .A(n5667), .B(n5666), .Z(n5668) );
  EN U6480 ( .A(n5671), .B(i_ahb_U_arb_U_gctrl_bbc[2]), .Z(n5672) );
  NR2 U6481 ( .A(ex_i_ahb_AHB_Master_hbusreq), .B(n5702), .Z(n5674) );
  ND4 U6482 ( .A(n5714), .B(n5713), .C(n10355), .D(n5712), .Z(n5710) );
  AN2P U6483 ( .A(n7751), .B(n5682), .Z(n5715) );
  OR2P U6484 ( .A(i_ahb_U_arb_U_gctrl_lock_sm[2]), .B(n5683), .Z(n7723) );
  ND2 U6485 ( .A(n5684), .B(n7723), .Z(n5707) );
  IVP U6486 ( .A(n5686), .Z(n5689) );
  NR2 U6487 ( .A(ex_i_ahb_AHB_Master_hresp[1]), .B(n5778), .Z(n5687) );
  ND2 U6488 ( .A(n5702), .B(n5687), .Z(n5688) );
  NR2 U6489 ( .A(n5695), .B(n5694), .Z(n5696) );
  ND4 U6490 ( .A(n5704), .B(n5703), .C(n5702), .D(n5697), .Z(n5793) );
  IVDA U6491 ( .A(n5698), .Y(n5700), .Z(n5697) );
  AN2P U6492 ( .A(i_ahb_U_arb_U_gctrl_bc[1]), .B(i_ahb_U_arb_U_gctrl_bc[0]), 
        .Z(n5701) );
  ND4 U6493 ( .A(n5704), .B(n5703), .C(n5702), .D(n5701), .Z(n5806) );
  OR2P U6494 ( .A(n5707), .B(n5709), .Z(n5708) );
  IVA U6495 ( .A(n5715), .Z(n5717) );
  ND2 U6496 ( .A(n5274), .B(n5492), .Z(n5716) );
  IVP U6497 ( .A(n7744), .Z(ex_i_ahb_AHB_Slave_hsize[2]) );
  AN2P U6498 ( .A(i_ahb_U_arb_U_arbif_r_hsel_arb_d), .B(
        i_ahb_U_arb_U_arbif_r_htrans_d_1_), .Z(n7832) );
  AN3 U6499 ( .A(n7832), .B(n5203), .C(n10959), .Z(n5745) );
  AO6 U6500 ( .A(n5203), .B(n5724), .C(n5171), .Z(n5727) );
  NR2 U6501 ( .A(n6293), .B(n5725), .Z(n5741) );
  OR2P U6502 ( .A(n5741), .B(n5745), .Z(n5726) );
  MUX21L U6503 ( .A(n10405), .B(n10076), .S(n11184), .Z(n5737) );
  IVP U6504 ( .A(n5737), .Z(n5761) );
  MUX21L U6505 ( .A(i_ahb_U_arb_U_arbif_r_haddr_d[6]), .B(
        ex_i_ahb_AHB_Slave_haddr[6]), .S(i_ahb_hready_resp_s0), .Z(n5758) );
  ND2 U6506 ( .A(n5761), .B(n5758), .Z(n5733) );
  MUX21L U6507 ( .A(i_ahb_U_arb_U_arbif_r_haddr_d[7]), .B(
        ex_i_ahb_AHB_Slave_haddr[7]), .S(i_ahb_hready_resp_s0), .Z(n5760) );
  MUX21L U6508 ( .A(n10446), .B(n5299), .S(i_ahb_hready_resp_s0), .Z(n5736) );
  MUX21L U6509 ( .A(n10428), .B(n10027), .S(i_ahb_hready_resp_s0), .Z(n5755)
         );
  IVP U6510 ( .A(n5755), .Z(n5731) );
  MUX21L U6511 ( .A(i_ahb_U_arb_U_arbif_r_haddr_d[3]), .B(
        ex_i_ahb_AHB_Slave_haddr[3]), .S(n11184), .Z(n5754) );
  ND4 U6512 ( .A(n5729), .B(n5736), .C(n5731), .D(n5754), .Z(n5730) );
  ND4 U6513 ( .A(n5768), .B(n5770), .C(n5769), .D(n4866), .Z(n8880) );
  ND4 U6514 ( .A(n5731), .B(n5760), .C(n5759), .D(n5754), .Z(n5732) );
  NR2 U6515 ( .A(n5733), .B(n5732), .Z(n5751) );
  ND2 U6516 ( .A(n8878), .B(i_ahb_U_arb_U_arbif_ipl1_int[1]), .Z(n5749) );
  IVP U6517 ( .A(n5754), .Z(n5756) );
  ND2 U6518 ( .A(n5756), .B(n5758), .Z(n5739) );
  ND4 U6519 ( .A(n5755), .B(n5737), .C(n5736), .D(n5760), .Z(n5738) );
  NR2 U6520 ( .A(n5739), .B(n5738), .Z(n8875) );
  ND2 U6521 ( .A(i_ahb_U_arb_ebtcount[1]), .B(n8875), .Z(n5740) );
  OR2P U6522 ( .A(n5752), .B(n5740), .Z(n5748) );
  NR2 U6523 ( .A(n5745), .B(n5171), .Z(n5746) );
  AN2P U6524 ( .A(n10004), .B(ex_i_ahb_AHB_Master_hsize[1]), .Z(
        ex_i_ahb_AHB_Slave_hsize[1]) );
  IVP U6525 ( .A(n10051), .Z(n5773) );
  AN2P U6526 ( .A(n5751), .B(i_ahb_U_arb_U_arbif_ipl1_int[0]), .Z(n5753) );
  ND2 U6527 ( .A(n5753), .B(n5157), .Z(n5767) );
  AN2P U6528 ( .A(i_ahb_U_arb_U_arbif_ebt), .B(n5754), .Z(n5757) );
  MUX31L U6529 ( .D0(i_ahb_U_arb_ebten), .D1(i_ahb_U_arb_def_mst_0_), .D2(
        n5757), .A(n5756), .B(n5755), .Z(n5764) );
  ND4 U6530 ( .A(n5762), .B(n5761), .C(n5760), .D(n5759), .Z(n5763) );
  NR2 U6531 ( .A(n5764), .B(n5763), .Z(n5765) );
  ND2 U6532 ( .A(n5157), .B(n5765), .Z(n5766) );
  AN2P U6533 ( .A(n5767), .B(n5766), .Z(n5772) );
  ND4 U6534 ( .A(n5770), .B(n8875), .C(n5769), .D(n5768), .Z(n8642) );
  OR2P U6535 ( .A(n10836), .B(n8642), .Z(n5771) );
  AO3 U6536 ( .A(n5773), .B(n10644), .C(n5772), .D(n5771), .Z(n4367) );
  B2I U6537 ( .A(n8823), .Z1(n5156), .Z2(n10421) );
  NR2 U6538 ( .A(n5795), .B(n7942), .Z(n5796) );
  AO7 U6539 ( .A(n5798), .B(n5797), .C(n5796), .Z(n5799) );
  AN2P U6540 ( .A(n5800), .B(n7442), .Z(n5801) );
  ND2 U6541 ( .A(n5802), .B(n5801), .Z(n5804) );
  B2IP U6542 ( .A(n5805), .Z1(n5810), .Z2(n10174) );
  ND2 U6543 ( .A(n5807), .B(n8940), .Z(n5809) );
  ND2 U6544 ( .A(i_ahb_U_arb_U_gctrl_bc[1]), .B(n5810), .Z(n5808) );
  AO7 U6545 ( .A(n10403), .B(n10593), .C(n4863), .Z(n4385) );
  IVP U6546 ( .A(n5814), .Z(ex_i_ahb_AHB_Slave_hburst[1]) );
  ENP U6547 ( .A(i_i2c_U_DW_apb_i2c_fifo_rx_push_flg_sync), .B(
        i_i2c_U_DW_apb_i2c_fifo_rx_push_flg_sync_q), .Z(n6507) );
  IVA U6548 ( .A(n5477), .Z(i_i2c_rx_push_sync) );
  AN2P U6549 ( .A(i_i2c_rx_push_sync), .B(n10542), .Z(n5822) );
  NR3P U6550 ( .A(i_apb_paddr[24]), .B(i_apb_paddr[19]), .C(i_apb_paddr[18]), 
        .Z(n5815) );
  NR2P U6551 ( .A(i_apb_paddr[25]), .B(i_apb_paddr[28]), .Z(n6354) );
  NR2P U6552 ( .A(i_apb_paddr[27]), .B(i_apb_paddr[26]), .Z(n6377) );
  AN3P U6553 ( .A(n5815), .B(n6354), .C(n6377), .Z(n6418) );
  NR2 U6554 ( .A(i_apb_pwrite), .B(i_apb_penable), .Z(n5817) );
  NR2 U6555 ( .A(i_apb_paddr[23]), .B(i_apb_paddr[22]), .Z(n5816) );
  AN2P U6556 ( .A(n5817), .B(n5816), .Z(n6508) );
  ND2 U6557 ( .A(i_apb_psel_en), .B(n10835), .Z(n5819) );
  NR2P U6558 ( .A(n5819), .B(n5818), .Z(n6506) );
  ND2 U6559 ( .A(i_apb_paddr[12]), .B(i_apb_paddr[16]), .Z(n5820) );
  NR2P U6560 ( .A(i_apb_paddr[21]), .B(n5820), .Z(n6417) );
  NR2P U6561 ( .A(i_apb_paddr[15]), .B(i_i2c_U_DW_apb_i2c_regfile_N402), .Z(
        n6416) );
  NR2P U6562 ( .A(n10849), .B(n10848), .Z(n6415) );
  AN3 U6563 ( .A(n6417), .B(n6416), .C(n6415), .Z(n5821) );
  ND4P U6564 ( .A(n6418), .B(n6508), .C(n6506), .D(n5821), .Z(n6426) );
  NR2P U6565 ( .A(i_i2c_reg_addr[1]), .B(i_i2c_reg_addr[0]), .Z(n6308) );
  AN2P U6566 ( .A(i_i2c_reg_addr[2]), .B(n6308), .Z(n6451) );
  ND2P U6567 ( .A(n6451), .B(n6392), .Z(n6515) );
  ND2P U6568 ( .A(n6518), .B(i_i2c_rx_full), .Z(n8063) );
  OR2P U6569 ( .A(n5112), .B(n7862), .Z(n7987) );
  MUX21L U6570 ( .A(n10989), .B(n10993), .S(n7987), .Z(n4011) );
  MUX21L U6571 ( .A(n10997), .B(n10999), .S(n7987), .Z(n4003) );
  OR2P U6572 ( .A(n5823), .B(n7862), .Z(n7986) );
  MUX21L U6573 ( .A(n10973), .B(n10816), .S(n7986), .Z(n4029) );
  NR2 U6574 ( .A(i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[1]), .B(
        i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[0]), .Z(n6530) );
  NR2 U6575 ( .A(i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[2]), .B(n5824), .Z(n5836)
         );
  NR3 U6576 ( .A(i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[2]), .B(
        i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[1]), .C(
        i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[3]), .Z(n5827) );
  NR2 U6577 ( .A(i_i2c_reg_addr[4]), .B(i_i2c_reg_addr[3]), .Z(n5825) );
  AN4P U6578 ( .A(i_i2c_reg_addr[2]), .B(n10524), .C(n6308), .D(n5825), .Z(
        n5826) );
  AN2P U6579 ( .A(n5477), .B(n5826), .Z(n6420) );
  NR2P U6580 ( .A(i_apb_paddr[27]), .B(i_apb_paddr[25]), .Z(n6390) );
  NR2P U6581 ( .A(i_apb_paddr[29]), .B(i_apb_paddr[28]), .Z(n5830) );
  NR2 U6582 ( .A(i_apb_paddr[26]), .B(i_apb_paddr[30]), .Z(n5829) );
  B2IP U6583 ( .A(i_apb_paddr_wr_0_), .Z2(n6397) );
  NR2 U6584 ( .A(i_apb_pwdata_int[0]), .B(n6397), .Z(n5833) );
  AO7 U6585 ( .A(i_apb_pwdata_int[16]), .B(n5831), .C(n10970), .Z(n5832) );
  OR2P U6586 ( .A(n5833), .B(n5832), .Z(n6811) );
  NR2P U6587 ( .A(i_i2c_reg_addr[5]), .B(n11045), .Z(n7529) );
  ND2 U6588 ( .A(n7529), .B(n4850), .Z(n5834) );
  B3IP U6589 ( .A(i_i2c_reg_addr[0]), .Z1(n5024), .Z2(n10021) );
  ND2P U6590 ( .A(i_i2c_reg_addr[1]), .B(n10021), .Z(n6825) );
  NR2P U6591 ( .A(n5834), .B(n6825), .Z(n6833) );
  ND2 U6592 ( .A(i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[1]), .B(
        i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[0]), .Z(n5835) );
  MUX21L U6593 ( .A(n6498), .B(n6283), .S(
        i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[0]), .Z(n6532) );
  AO7 U6594 ( .A(n6533), .B(n6532), .C(i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[2]), 
        .Z(n5845) );
  AN2P U6595 ( .A(n5478), .B(n7438), .Z(n5842) );
  OR2P U6596 ( .A(n7440), .B(n10410), .Z(n5840) );
  NR2 U6597 ( .A(n10575), .B(n5363), .Z(n5837) );
  ND2 U6598 ( .A(n5838), .B(n5837), .Z(n5839) );
  AO7 U6599 ( .A(n5842), .B(n5840), .C(n5839), .Z(n5841) );
  ND2 U6600 ( .A(n5841), .B(i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[2]), .Z(n5844)
         );
  ND2P U6601 ( .A(n6518), .B(i_i2c_rx_push_sync), .Z(n10350) );
  IVP U6602 ( .A(n10350), .Z(n6285) );
  ND3 U6603 ( .A(i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[2]), .B(n10350), .C(n6436), .Z(n5843) );
  ND4 U6604 ( .A(n5846), .B(n5845), .C(n5844), .D(n5843), .Z(n4050) );
  NR2P U6605 ( .A(n5848), .B(n5847), .Z(n5850) );
  NR2 U6606 ( .A(i_i2c_ic_sda_tx_hold_sync[2]), .B(
        i_i2c_ic_sda_tx_hold_sync[3]), .Z(n6061) );
  AN2P U6607 ( .A(n5850), .B(n6061), .Z(n6085) );
  IVP U6608 ( .A(n11037), .Z(n6042) );
  IVDAP U6609 ( .A(i_i2c_ic_sda_tx_hold_sync[7]), .Z(n6083) );
  NR2P U6610 ( .A(n6042), .B(n6083), .Z(n5943) );
  ND2P U6611 ( .A(n6085), .B(n4966), .Z(n5849) );
  EO U6612 ( .A(n6021), .B(n10485), .Z(n5857) );
  AN2P U6613 ( .A(n11035), .B(n11034), .Z(n5859) );
  ND4P U6614 ( .A(n5851), .B(n5850), .C(n5943), .D(n5859), .Z(n5856) );
  NR2P U6615 ( .A(i_i2c_ic_sda_tx_hold_sync[12]), .B(
        i_i2c_ic_sda_tx_hold_sync[11]), .Z(n5860) );
  NR2 U6616 ( .A(i_i2c_ic_sda_tx_hold_sync[15]), .B(
        i_i2c_ic_sda_tx_hold_sync[2]), .Z(n5854) );
  OR2P U6617 ( .A(i_i2c_ic_sda_tx_hold_sync[10]), .B(
        i_i2c_ic_sda_tx_hold_sync[9]), .Z(n5988) );
  IVAP U6618 ( .A(n5988), .Z(n5993) );
  IVAP U6619 ( .A(n11041), .Z(n5852) );
  NR2P U6620 ( .A(n5852), .B(i_i2c_ic_sda_tx_hold_sync[8]), .Z(n5853) );
  ND4 U6621 ( .A(n5860), .B(n5854), .C(n5993), .D(n5853), .Z(n5855) );
  NR2P U6622 ( .A(n5856), .B(n5855), .Z(n5986) );
  NR2P U6623 ( .A(n5986), .B(n6130), .Z(n5932) );
  IVAP U6624 ( .A(n5932), .Z(n6169) );
  MUX21LP U6625 ( .A(n5857), .B(n10485), .S(n6169), .Z(n6573) );
  ND2 U6626 ( .A(i_i2c_ic_spklen_o[3]), .B(i_i2c_ic_spklen_o[2]), .Z(n5870) );
  NR2 U6627 ( .A(n11036), .B(n5870), .Z(n5866) );
  ND2 U6628 ( .A(i_i2c_ic_spklen_o[5]), .B(n5866), .Z(n5873) );
  ND2 U6629 ( .A(i_i2c_ic_spklen_o[7]), .B(i_i2c_ic_spklen_o[6]), .Z(n5858) );
  OR2P U6630 ( .A(n5873), .B(n5858), .Z(n5961) );
  ND4 U6631 ( .A(n5860), .B(n5859), .C(n5993), .D(n10477), .Z(n5957) );
  NR2P U6632 ( .A(n5898), .B(n5861), .Z(n5862) );
  ND2P U6633 ( .A(n4945), .B(n5862), .Z(n5863) );
  AO3P U6634 ( .A(n5961), .B(n5957), .C(n10333), .D(n5863), .Z(n6120) );
  AO7 U6635 ( .A(n5873), .B(n10829), .C(n10831), .Z(n5864) );
  ND2 U6636 ( .A(n5961), .B(n5864), .Z(n5875) );
  IVP U6637 ( .A(n5875), .Z(n5865) );
  ND2P U6638 ( .A(n5865), .B(n10505), .Z(n5960) );
  IVP U6639 ( .A(n5960), .Z(n6110) );
  IVP U6640 ( .A(n5866), .Z(n5867) );
  ND2 U6641 ( .A(n10464), .B(n5867), .Z(n5868) );
  AN2P U6642 ( .A(n5873), .B(n5868), .Z(n5884) );
  IVP U6643 ( .A(i_i2c_ic_sda_tx_hold_sync[5]), .Z(n5902) );
  EO U6644 ( .A(n5870), .B(i_i2c_ic_spklen_o[4]), .Z(n5887) );
  ND2P U6645 ( .A(i_i2c_ic_sda_tx_hold_sync[4]), .B(n5887), .Z(n5869) );
  AO7P U6646 ( .A(n5884), .B(n5902), .C(n5869), .Z(n5891) );
  OR2P U6647 ( .A(i_i2c_ic_spklen_o[3]), .B(i_i2c_ic_spklen_o[2]), .Z(n8679)
         );
  ND2 U6648 ( .A(n5870), .B(n8679), .Z(n5888) );
  ND2 U6649 ( .A(i_i2c_ic_sda_tx_hold_sync[3]), .B(n5888), .Z(n5871) );
  ND2 U6650 ( .A(i_i2c_ic_spklen_o[2]), .B(i_i2c_ic_sda_tx_hold_sync[2]), .Z(
        n5910) );
  ND2 U6651 ( .A(n5871), .B(n5910), .Z(n5872) );
  IVP U6652 ( .A(n5873), .Z(n5874) );
  EN U6653 ( .A(n5874), .B(i_i2c_ic_spklen_o[6]), .Z(n5881) );
  AO2P U6654 ( .A(i_i2c_ic_sda_tx_hold_sync[7]), .B(n5875), .C(
        i_i2c_ic_sda_tx_hold_sync[6]), .D(n5881), .Z(n5893) );
  ND2 U6655 ( .A(n11089), .B(n10583), .Z(n5877) );
  ND2 U6656 ( .A(n8680), .B(i_i2c_ic_sda_tx_hold_sync[1]), .Z(n5876) );
  ND2P U6657 ( .A(n11040), .B(n4968), .Z(n5906) );
  OR2P U6658 ( .A(i_i2c_ic_sda_tx_hold_sync[1]), .B(n10832), .Z(n5909) );
  ND3 U6659 ( .A(n5878), .B(n5906), .C(n5909), .Z(n5879) );
  AN3 U6660 ( .A(n5880), .B(n5893), .C(n5879), .Z(n6112) );
  IVP U6661 ( .A(n5881), .Z(n5882) );
  ND2 U6662 ( .A(n5882), .B(n11037), .Z(n5886) );
  IVDA U6663 ( .A(i_i2c_ic_sda_tx_hold_sync[5]), .Y(n5883), .Z(n5848) );
  ND2 U6664 ( .A(n5884), .B(n5883), .Z(n5885) );
  AN2P U6665 ( .A(n5886), .B(n5885), .Z(n5896) );
  IVP U6666 ( .A(n5887), .Z(n5890) );
  IVP U6667 ( .A(n5888), .Z(n5889) );
  IVP U6668 ( .A(i_i2c_ic_sda_tx_hold_sync[3]), .Z(n5905) );
  AO2P U6669 ( .A(n5890), .B(n11038), .C(n5889), .D(n5905), .Z(n5892) );
  OR2P U6670 ( .A(n5892), .B(n5891), .Z(n5895) );
  IVP U6671 ( .A(n5893), .Z(n5894) );
  AO6P U6672 ( .A(n5896), .B(n5895), .C(n5894), .Z(n6111) );
  OR2P U6673 ( .A(n5898), .B(n5897), .Z(n5899) );
  ND2 U6674 ( .A(i_i2c_U_DW_apb_i2c_sync_ic_master_sync_inv), .B(n5899), .Z(
        n6109) );
  OR4 U6675 ( .A(n6110), .B(n6112), .C(n6111), .D(n6109), .Z(n5900) );
  ND2P U6676 ( .A(n6120), .B(n5900), .Z(n6060) );
  EOP U6677 ( .A(i_i2c_ic_sda_tx_hold_sync[6]), .B(i_i2c_ic_spklen_o[6]), .Z(
        n6045) );
  ND2P U6678 ( .A(n5902), .B(i_i2c_ic_spklen_o[5]), .Z(n6044) );
  NR2P U6679 ( .A(n6045), .B(n6044), .Z(n5919) );
  ND2P U6680 ( .A(n5903), .B(i_i2c_ic_spklen_o[4]), .Z(n6056) );
  EOP U6681 ( .A(i_i2c_ic_sda_tx_hold_sync[5]), .B(i_i2c_ic_spklen_o[5]), .Z(
        n6055) );
  NR2P U6682 ( .A(n6056), .B(n6055), .Z(n6046) );
  NR3 U6683 ( .A(n6083), .B(n10831), .C(i_i2c_ic_sda_tx_hold_sync[8]), .Z(
        n5904) );
  OR2P U6684 ( .A(i_i2c_ic_sda_tx_hold_sync[6]), .B(n10829), .Z(n6071) );
  EOP U6685 ( .A(i_i2c_ic_sda_tx_hold_sync[7]), .B(i_i2c_ic_spklen_o[7]), .Z(
        n6072) );
  NR2P U6686 ( .A(n6071), .B(n6072), .Z(n5947) );
  OR2P U6687 ( .A(i_i2c_ic_sda_tx_hold_sync[7]), .B(n10831), .Z(n5945) );
  AO7P U6688 ( .A(n5904), .B(n5947), .C(n5920), .Z(n5921) );
  ND2 U6689 ( .A(n5950), .B(n5921), .Z(n5924) );
  EOP U6690 ( .A(i_i2c_ic_sda_tx_hold_sync[3]), .B(i_i2c_ic_spklen_o[3]), .Z(
        n6145) );
  ND2 U6691 ( .A(n6145), .B(n4968), .Z(n6160) );
  IVDAP U6692 ( .A(i_i2c_ic_sda_tx_hold_sync[4]), .Y(n5912), .Z(n5847) );
  EOP U6693 ( .A(n5912), .B(n11036), .Z(n6158) );
  ND2P U6694 ( .A(n6159), .B(n6158), .Z(n5914) );
  ND2 U6695 ( .A(n6160), .B(n5914), .Z(n5917) );
  IVP U6696 ( .A(n5906), .Z(n5911) );
  NR2 U6697 ( .A(n11089), .B(n10583), .Z(n6113) );
  ND2 U6698 ( .A(i_i2c_ic_sda_tx_hold_sync[1]), .B(n8680), .Z(n5907) );
  ND2 U6699 ( .A(n6113), .B(n5907), .Z(n5908) );
  ND2 U6700 ( .A(n5909), .B(n5908), .Z(n6137) );
  AO7 U6701 ( .A(n5911), .B(n6137), .C(n5910), .Z(n6144) );
  EOP U6702 ( .A(n11038), .B(n11036), .Z(n5913) );
  NR2P U6703 ( .A(n6159), .B(n5913), .Z(n5915) );
  NR2P U6704 ( .A(n6145), .B(n4968), .Z(n6162) );
  AO7P U6705 ( .A(n5915), .B(n6162), .C(n5914), .Z(n5916) );
  AO7P U6706 ( .A(n5917), .B(n6144), .C(n5916), .Z(n5954) );
  ND2P U6707 ( .A(n6055), .B(n6056), .Z(n6047) );
  AO7P U6708 ( .A(n5919), .B(n6047), .C(n5918), .Z(n5951) );
  ND2 U6709 ( .A(n6072), .B(n6071), .Z(n5946) );
  ND2 U6710 ( .A(n5920), .B(n5946), .Z(n5922) );
  AO7P U6711 ( .A(n5951), .B(n5922), .C(n5921), .Z(n5923) );
  AO7P U6712 ( .A(n5924), .B(n5954), .C(n5923), .Z(n5973) );
  EOP U6713 ( .A(n6028), .B(n5925), .Z(n6624) );
  ND2P U6714 ( .A(n6564), .B(n6624), .Z(n6574) );
  ND2P U6715 ( .A(n5926), .B(n6574), .Z(n6607) );
  ND2 U6716 ( .A(n10723), .B(n6607), .Z(n5941) );
  B2I U6717 ( .A(i_i2c_ic_sda_tx_hold_sync[10]), .Z2(n5931) );
  IVDA U6718 ( .A(i_i2c_ic_sda_tx_hold_sync[9]), .Y(n5925), .Z(n5927) );
  EN U6719 ( .A(n5931), .B(n5927), .Z(n5930) );
  MUX21L U6720 ( .A(n5928), .B(n10504), .S(n6028), .Z(n5929) );
  B2IP U6721 ( .A(n6060), .Z1(n5901), .Z2(n6625) );
  ND2P U6722 ( .A(n5929), .B(n6625), .Z(n6611) );
  MUX21L U6723 ( .A(n5931), .B(n5930), .S(n6021), .Z(n5933) );
  B2IP U6724 ( .A(n5932), .Z1(n5122), .Z2(n6063) );
  ND2 U6725 ( .A(n9236), .B(n6615), .Z(n5942) );
  ND2 U6726 ( .A(n6611), .B(n5942), .Z(n5934) );
  ND2 U6727 ( .A(n10770), .B(n5934), .Z(n5940) );
  ND2P U6728 ( .A(n6564), .B(n5935), .Z(n6618) );
  IVP U6729 ( .A(n5993), .Z(n5974) );
  EN U6730 ( .A(i_i2c_ic_sda_tx_hold_sync[11]), .B(n5974), .Z(n5936) );
  MUX21L U6731 ( .A(i_i2c_ic_sda_tx_hold_sync[11]), .B(n5936), .S(n6021), .Z(
        n5937) );
  MUX21LP U6732 ( .A(n10487), .B(n5937), .S(n6063), .Z(n6619) );
  ND3P U6733 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[11]), .B(n6618), 
        .C(n5968), .Z(n6613) );
  ND3 U6734 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[10]), .B(n5942), 
        .C(n6611), .Z(n5938) );
  ND2 U6735 ( .A(n6613), .B(n5938), .Z(n5939) );
  ND3 U6736 ( .A(n6611), .B(n5942), .C(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[10]), .Z(n5966) );
  EO U6737 ( .A(n5943), .B(n10467), .Z(n5944) );
  MUX21L U6738 ( .A(n5123), .B(n10467), .S(n6169), .Z(n6630) );
  AO6 U6739 ( .A(n9236), .B(n6630), .C(n10724), .Z(n5965) );
  EN U6740 ( .A(n5949), .B(n5946), .Z(n5953) );
  IVP U6741 ( .A(n5947), .Z(n5948) );
  IVDA U6742 ( .A(n5950), .Z(n6073) );
  MUX21L U6743 ( .A(n5953), .B(n5952), .S(n6073), .Z(n5956) );
  MUX21L U6744 ( .A(n5953), .B(n5952), .S(n6075), .Z(n5955) );
  B2I U6745 ( .A(n5954), .Z1(n5497), .Z2(n6076) );
  MUX21L U6746 ( .A(n5956), .B(n5955), .S(n6076), .Z(n5964) );
  AN2P U6747 ( .A(n5961), .B(i_i2c_ic_sda_tx_hold_sync[8]), .Z(n5959) );
  OR2P U6748 ( .A(n9236), .B(n5957), .Z(n5958) );
  NR2P U6749 ( .A(n5959), .B(n5958), .Z(n6080) );
  AO6 U6750 ( .A(n5961), .B(n5960), .C(i_i2c_ic_sda_tx_hold_sync[8]), .Z(n5962) );
  AN3 U6751 ( .A(n6080), .B(n6079), .C(i_i2c_ic_sda_tx_hold_sync[8]), .Z(n5963) );
  AO6P U6752 ( .A(n5964), .B(n6625), .C(n5963), .Z(n6626) );
  ND2 U6753 ( .A(n5965), .B(n6626), .Z(n6577) );
  ND2 U6754 ( .A(n5966), .B(n6577), .Z(n5983) );
  AN2P U6755 ( .A(n5968), .B(n5967), .Z(n5969) );
  OR2P U6756 ( .A(n10333), .B(n6560), .Z(n5971) );
  ND2P U6757 ( .A(n5500), .B(n5971), .Z(n5972) );
  ND2P U6758 ( .A(n10460), .B(n5972), .Z(n6638) );
  IVDAP U6759 ( .A(n5973), .Y(n5498), .Z(n5990) );
  IVDAP U6760 ( .A(n5973), .Y(n6001), .Z(n6028) );
  EO U6761 ( .A(i_i2c_ic_sda_tx_hold_sync[12]), .B(
        i_i2c_ic_sda_tx_hold_sync[11]), .Z(n5975) );
  ND3P U6762 ( .A(n6625), .B(n5977), .C(n5976), .Z(n6602) );
  EN U6763 ( .A(i_i2c_ic_sda_tx_hold_sync[11]), .B(
        i_i2c_ic_sda_tx_hold_sync[12]), .Z(n5978) );
  MUX21H U6764 ( .A(i_i2c_ic_sda_tx_hold_sync[12]), .B(n5978), .S(n5993), .Z(
        n5979) );
  ND2P U6765 ( .A(n6600), .B(n10502), .Z(n5981) );
  ND2P U6766 ( .A(n10463), .B(n6036), .Z(n6594) );
  AO3 U6767 ( .A(n5983), .B(n5982), .C(n6638), .D(n6594), .Z(n5984) );
  OR2P U6768 ( .A(n5985), .B(n5984), .Z(n10096) );
  IVP U6769 ( .A(n10096), .Z(n6262) );
  B2I U6770 ( .A(n5986), .Z2(n6107) );
  ND2 U6771 ( .A(n6121), .B(n6107), .Z(n10095) );
  ND2 U6772 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_data_sda_prev_r), .B(n10581), .Z(
        n5987) );
  ND2 U6773 ( .A(n10095), .B(n5987), .Z(n6243) );
  NR2 U6774 ( .A(n6262), .B(n6243), .Z(n6039) );
  ND2 U6775 ( .A(n6130), .B(n6107), .Z(n6260) );
  OR3 U6776 ( .A(n5988), .B(i_i2c_ic_sda_tx_hold_sync[11]), .C(
        i_i2c_ic_sda_tx_hold_sync[12]), .Z(n6026) );
  IVP U6777 ( .A(n6026), .Z(n5989) );
  ND2P U6778 ( .A(n6023), .B(n5989), .Z(n5998) );
  MUX21LP U6779 ( .A(n5009), .B(n5008), .S(n5990), .Z(n6194) );
  IVP U6780 ( .A(n6194), .Z(n5991) );
  ND2P U6781 ( .A(n6625), .B(n5991), .Z(n6642) );
  NR2 U6782 ( .A(i_i2c_ic_sda_tx_hold_sync[11]), .B(
        i_i2c_ic_sda_tx_hold_sync[12]), .Z(n5994) );
  ND2 U6783 ( .A(n5994), .B(n5993), .Z(n6020) );
  MUX21L U6784 ( .A(n5992), .B(n5999), .S(n6020), .Z(n5995) );
  MUX21L U6785 ( .A(i_i2c_ic_sda_tx_hold_sync[14]), .B(n5995), .S(n6021), .Z(
        n5996) );
  MUX21L U6786 ( .A(n5996), .B(n5999), .S(n6169), .Z(n6554) );
  IVP U6787 ( .A(n6554), .Z(n5997) );
  ND2 U6788 ( .A(n6642), .B(n5997), .Z(n6215) );
  IVP U6789 ( .A(n6215), .Z(n6019) );
  IVP U6790 ( .A(n5998), .Z(n6000) );
  ND2 U6791 ( .A(n6000), .B(n5999), .Z(n6003) );
  AO3P U6792 ( .A(n6003), .B(n6002), .C(n6147), .D(
        i_i2c_ic_sda_tx_hold_sync[15]), .Z(n6013) );
  ND2P U6793 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[15]), .B(n6013), 
        .Z(n6640) );
  NR2 U6794 ( .A(i_i2c_ic_sda_tx_hold_sync[13]), .B(
        i_i2c_ic_sda_tx_hold_sync[14]), .Z(n6004) );
  EO U6795 ( .A(n6004), .B(n10477), .Z(n6005) );
  MUX21L U6796 ( .A(n6005), .B(n10477), .S(n6020), .Z(n6006) );
  MUX21L U6797 ( .A(i_i2c_ic_sda_tx_hold_sync[15]), .B(n6006), .S(n6021), .Z(
        n6007) );
  MUX21LP U6798 ( .A(n10477), .B(n6007), .S(n6063), .Z(n6555) );
  IVDA U6799 ( .A(n6013), .Y(n5126), .Z(n6009) );
  B2I U6800 ( .A(i_i2c_U_DW_apb_i2c_sync_ic_master_sync_inv), .Z2(n10333) );
  NR2 U6801 ( .A(n10619), .B(n10502), .Z(n6008) );
  ND2P U6802 ( .A(n6009), .B(n6008), .Z(n6201) );
  AO3P U6803 ( .A(n6640), .B(n6555), .C(n6201), .D(n6200), .Z(n6018) );
  ND2 U6804 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[15]), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[14]), .Z(n6219) );
  ND2 U6805 ( .A(n6219), .B(n10502), .Z(n6011) );
  IVP U6806 ( .A(n6555), .Z(n6218) );
  OR2P U6807 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[15]), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[14]), .Z(n6646) );
  IVDA U6808 ( .A(n6646), .Z(n6010) );
  B2I U6809 ( .A(n6013), .Z2(n6647) );
  AO3P U6810 ( .A(n6019), .B(n6018), .C(n6017), .D(n6016), .Z(n6599) );
  EN U6811 ( .A(n6020), .B(n6027), .Z(n6022) );
  MUX21L U6812 ( .A(n6027), .B(n6022), .S(n6021), .Z(n6024) );
  IVDA U6813 ( .A(i_i2c_ic_sda_tx_hold_sync[13]), .Y(n6023), .Z(n6027) );
  MUX21LP U6814 ( .A(n6024), .B(n6023), .S(n6169), .Z(n6591) );
  AO7 U6815 ( .A(n6625), .B(n6591), .C(n10463), .Z(n6025) );
  MUX21L U6816 ( .A(n5048), .B(n6023), .S(n5990), .Z(n6029) );
  ND2P U6817 ( .A(n6625), .B(n6029), .Z(n6592) );
  ND2 U6818 ( .A(n10333), .B(n6592), .Z(n6031) );
  AO6P U6819 ( .A(n6032), .B(n6031), .C(n6030), .Z(n6552) );
  NR2 U6820 ( .A(n6591), .B(n10769), .Z(n6033) );
  ND2 U6821 ( .A(n6033), .B(n6592), .Z(n6038) );
  NR2 U6822 ( .A(n10769), .B(n10502), .Z(n6035) );
  ND2 U6823 ( .A(n6035), .B(n6592), .Z(n6037) );
  ND3 U6824 ( .A(n6038), .B(n6037), .C(n6036), .Z(n6553) );
  ND2P U6825 ( .A(n6552), .B(n6553), .Z(n6585) );
  AN2P U6826 ( .A(n6039), .B(n5127), .Z(n6251) );
  IVDA U6827 ( .A(n6594), .Z(n6255) );
  IVDA U6828 ( .A(n6042), .Y(n6040), .Z(n6084) );
  NR2 U6829 ( .A(n6043), .B(n10333), .Z(n6054) );
  ND3 U6830 ( .A(n6080), .B(n6079), .C(n6084), .Z(n6053) );
  EN U6831 ( .A(n6048), .B(n6046), .Z(n6050) );
  EN U6832 ( .A(n6048), .B(n6047), .Z(n6049) );
  MUX21L U6833 ( .A(n6050), .B(n6049), .S(n6076), .Z(n6051) );
  ND2 U6834 ( .A(n6051), .B(n6625), .Z(n6052) );
  OR2P U6835 ( .A(n6054), .B(n6582), .Z(n6091) );
  IVP U6836 ( .A(n11039), .Z(n6070) );
  IVP U6837 ( .A(n6055), .Z(n6058) );
  EN U6838 ( .A(n6058), .B(n5125), .Z(n6059) );
  B2I U6839 ( .A(n6060), .Z1(n6067), .Z2(n6147) );
  EN U6840 ( .A(n5124), .B(n6070), .Z(n6062) );
  MUX21L U6841 ( .A(n6070), .B(n6062), .S(n6061), .Z(n6064) );
  MUX21L U6842 ( .A(n11039), .B(n6064), .S(n6063), .Z(n6065) );
  ND2 U6843 ( .A(n9236), .B(n6065), .Z(n6066) );
  AO7P U6844 ( .A(n6068), .B(n6067), .C(n6066), .Z(n6069) );
  AN2P U6845 ( .A(n6080), .B(n6079), .Z(n6173) );
  IVP U6846 ( .A(n6173), .Z(n6182) );
  MUX21LP U6847 ( .A(n6070), .B(n6069), .S(n6182), .Z(n6538) );
  EO U6848 ( .A(n6072), .B(n6071), .Z(n6074) );
  EN U6849 ( .A(n6073), .B(n6074), .Z(n6078) );
  MUX21L U6850 ( .A(n6078), .B(n6077), .S(n6076), .Z(n6082) );
  AN3 U6851 ( .A(n6080), .B(n6079), .C(n6083), .Z(n6081) );
  AO6P U6852 ( .A(n6564), .B(n6082), .C(n6081), .Z(n6092) );
  EN U6853 ( .A(n6084), .B(n6087), .Z(n6086) );
  MUX21L U6854 ( .A(n6087), .B(n6086), .S(n6085), .Z(n6088) );
  MUX21L U6855 ( .A(n6088), .B(n10505), .S(n6169), .Z(n6089) );
  ND2 U6856 ( .A(n9236), .B(n6089), .Z(n6093) );
  AO3 U6857 ( .A(n10771), .B(n6091), .C(n6090), .D(n6581), .Z(n6253) );
  IVP U6858 ( .A(n6091), .Z(n6095) );
  ND2 U6859 ( .A(n6093), .B(n6092), .Z(n6094) );
  ND2P U6860 ( .A(n10621), .B(n6094), .Z(n6590) );
  AO7P U6861 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[6]), .B(n6095), 
        .C(n6590), .Z(n6096) );
  AN2P U6862 ( .A(n6581), .B(n6096), .Z(n6252) );
  NR2P U6863 ( .A(n6097), .B(n6252), .Z(n6106) );
  ND2 U6864 ( .A(n10333), .B(n6098), .Z(n6099) );
  AO3 U6865 ( .A(n6630), .B(n5128), .C(n10724), .D(n6099), .Z(n6105) );
  IVDA U6866 ( .A(n6611), .Y(n6617) );
  ND2 U6867 ( .A(n6617), .B(n10770), .Z(n6637) );
  NR2 U6868 ( .A(n10333), .B(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[9]), 
        .Z(n6100) );
  ND2P U6869 ( .A(n6573), .B(n6100), .Z(n6631) );
  ND2 U6870 ( .A(n10770), .B(n9236), .Z(n6633) );
  AO3 U6871 ( .A(n6574), .B(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[9]), 
        .C(n6631), .D(n6102), .Z(n6103) );
  AN4P U6872 ( .A(n6105), .B(n6637), .C(n6104), .D(n6638), .Z(n6256) );
  AN2P U6873 ( .A(n6106), .B(n6256), .Z(n7412) );
  EN U6874 ( .A(n6107), .B(n6130), .Z(n6108) );
  NR2P U6875 ( .A(n6108), .B(n6625), .Z(n6133) );
  OR4P U6876 ( .A(n5501), .B(n6111), .C(n6110), .D(n6109), .Z(n6124) );
  IVDA U6877 ( .A(i_i2c_ic_spklen_o[1]), .Y(n8680), .Z(n8732) );
  EO U6878 ( .A(n8732), .B(n6130), .Z(n6114) );
  EN U6879 ( .A(n6114), .B(n6113), .Z(n6115) );
  OR2P U6880 ( .A(n6120), .B(n6115), .Z(n6116) );
  AO3P U6881 ( .A(n6124), .B(n6115), .C(n10333), .D(n6116), .Z(n6129) );
  ND2 U6882 ( .A(n6129), .B(n10426), .Z(n6128) );
  NR2 U6883 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[1]), .B(n11043), 
        .Z(n6118) );
  NR2 U6884 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[0]), .B(n11042), 
        .Z(n6117) );
  OR2P U6885 ( .A(n6118), .B(n6117), .Z(n6119) );
  ND2 U6886 ( .A(n6119), .B(n6173), .Z(n6127) );
  EN U6887 ( .A(i_i2c_ic_spklen_o[0]), .B(n6121), .Z(n6123) );
  EO1 U6888 ( .A(n6121), .B(n9236), .C(n6123), .D(n6120), .Z(n6122) );
  AO7 U6889 ( .A(n6124), .B(n6123), .C(n6122), .Z(n6125) );
  ND2 U6890 ( .A(n10503), .B(n6125), .Z(n6126) );
  AO3 U6891 ( .A(n6133), .B(n6128), .C(n6127), .D(n6126), .Z(n6135) );
  ND2 U6892 ( .A(n6173), .B(n6130), .Z(n6131) );
  AO3 U6893 ( .A(n6133), .B(n6132), .C(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[1]), .D(n6131), .Z(n6134)
         );
  ND2 U6894 ( .A(n6135), .B(n6134), .Z(n6143) );
  ND2 U6895 ( .A(n6143), .B(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[2]), 
        .Z(n6179) );
  B2I U6896 ( .A(i_i2c_ic_sda_tx_hold_sync[2]), .Z2(n6149) );
  EO U6897 ( .A(i_i2c_ic_spklen_o[2]), .B(n6149), .Z(n6136) );
  EN U6898 ( .A(n6137), .B(n6136), .Z(n6138) );
  ND2 U6899 ( .A(n6138), .B(n6564), .Z(n6142) );
  ND2 U6900 ( .A(n6149), .B(n6173), .Z(n6141) );
  EN U6901 ( .A(n6169), .B(n6149), .Z(n6139) );
  ND2 U6902 ( .A(n6139), .B(n9236), .Z(n6140) );
  ND3 U6903 ( .A(n6142), .B(n6141), .C(n6140), .Z(n6178) );
  AN2P U6904 ( .A(n6179), .B(n6178), .Z(n6548) );
  OR2P U6905 ( .A(n6143), .B(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[2]), 
        .Z(n6185) );
  IVDA U6906 ( .A(n6144), .Z(n6165) );
  EN U6907 ( .A(n6145), .B(n4968), .Z(n6146) );
  EN U6908 ( .A(n6165), .B(n6146), .Z(n6148) );
  ND2 U6909 ( .A(n6148), .B(n6147), .Z(n6181) );
  ND2 U6910 ( .A(n5852), .B(n6173), .Z(n6152) );
  MUX21L U6911 ( .A(n6150), .B(n11041), .S(n6169), .Z(n6151) );
  ND2 U6912 ( .A(n6151), .B(n9236), .Z(n6180) );
  ND4 U6913 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[4]), .B(n6181), 
        .C(n6152), .D(n6180), .Z(n6174) );
  ND2 U6914 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[4]), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[3]), .Z(n6153) );
  ND2 U6915 ( .A(n6174), .B(n6153), .Z(n6154) );
  ND2P U6916 ( .A(n6185), .B(n6154), .Z(n6547) );
  ND2P U6917 ( .A(n6538), .B(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[5]), 
        .Z(n6545) );
  ND2 U6918 ( .A(n6583), .B(n9236), .Z(n6155) );
  ND2 U6919 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[6]), .B(n6155), 
        .Z(n6156) );
  OR2P U6920 ( .A(n6156), .B(n6582), .Z(n6157) );
  EN U6921 ( .A(n6159), .B(n6158), .Z(n6161) );
  EN U6922 ( .A(n6161), .B(n6160), .Z(n6167) );
  IVP U6923 ( .A(n6162), .Z(n6163) );
  EN U6924 ( .A(n6164), .B(n6163), .Z(n6166) );
  MUX21L U6925 ( .A(n6167), .B(n6166), .S(n6165), .Z(n6168) );
  ND2 U6926 ( .A(n6564), .B(n6168), .Z(n6177) );
  EO U6927 ( .A(n6061), .B(n6170), .Z(n6171) );
  MUX21L U6928 ( .A(n6171), .B(n6170), .S(n5122), .Z(n6172) );
  AO2 U6929 ( .A(n6173), .B(n5124), .C(n6172), .D(n9236), .Z(n6176) );
  IVP U6930 ( .A(n6174), .Z(n6175) );
  ND2 U6931 ( .A(n6181), .B(n6180), .Z(n6183) );
  MUX21L U6932 ( .A(n5852), .B(n6183), .S(n6182), .Z(n6186) );
  OR2P U6933 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[3]), .B(n6186), 
        .Z(n6184) );
  ND2P U6934 ( .A(n6185), .B(n6184), .Z(n6541) );
  ND2P U6935 ( .A(n6189), .B(n6188), .Z(n6266) );
  IVP U6936 ( .A(n6266), .Z(n7413) );
  ND2P U6937 ( .A(n7412), .B(n7413), .Z(n6250) );
  ND2P U6938 ( .A(n6555), .B(n9236), .Z(n6644) );
  AN2P U6939 ( .A(n6260), .B(n6644), .Z(n6191) );
  NR2 U6940 ( .A(n6214), .B(n10619), .Z(n6190) );
  NR2 U6941 ( .A(n10333), .B(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[13]), 
        .Z(n6193) );
  NR2 U6942 ( .A(n10333), .B(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[14]), 
        .Z(n6192) );
  AO2 U6943 ( .A(n6591), .B(n6193), .C(n6554), .D(n6192), .Z(n6198) );
  NR2P U6944 ( .A(n6195), .B(n6194), .Z(n6196) );
  AO3 U6945 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[13]), .B(n6592), 
        .C(n6198), .D(n6197), .Z(n6595) );
  NR2 U6946 ( .A(n6199), .B(n6595), .Z(n6254) );
  IVP U6947 ( .A(n6254), .Z(n6227) );
  AO3 U6948 ( .A(n6640), .B(n6555), .C(n6201), .D(n6200), .Z(n6225) );
  ND2 U6949 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[4]), .B(n11036), .Z(n6203) );
  ND2 U6950 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[3]), .B(n10830), .Z(n6202) );
  AN2P U6951 ( .A(n6203), .B(n6202), .Z(n7577) );
  EO U6952 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[7]), .B(
        i_i2c_ic_spklen_o[7]), .Z(n6204) );
  NR2P U6953 ( .A(n6205), .B(n6204), .Z(n6206) );
  AN3 U6954 ( .A(n7577), .B(n7573), .C(n6206), .Z(n6213) );
  ND2 U6955 ( .A(i_i2c_ic_spklen_o[0]), .B(n10466), .Z(n6208) );
  ND2P U6956 ( .A(n8732), .B(n10470), .Z(n6207) );
  ND2P U6957 ( .A(i_i2c_ic_spklen_o[5]), .B(n10471), .Z(n7579) );
  AO2P U6958 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[1]), .B(n8680), .C(i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[2]), .D(n4968), .Z(n7576)
         );
  ND2P U6959 ( .A(i_i2c_ic_spklen_o[4]), .B(n10469), .Z(n7578) );
  ND2 U6960 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[0]), .B(n10583), .Z(n6210) );
  AN3 U6961 ( .A(n7576), .B(n7578), .C(n6210), .Z(n6211) );
  ND3P U6962 ( .A(n6213), .B(n6212), .C(n6211), .Z(n6855) );
  MUX21LP U6963 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_U_scl_sync_data_d_int_0_), 
        .B(n5052), .S(n6855), .Z(i_i2c_scl_int) );
  ND2 U6964 ( .A(n10114), .B(n6214), .Z(n6217) );
  ND2 U6965 ( .A(n6217), .B(n6215), .Z(n6224) );
  ND2 U6966 ( .A(n6260), .B(n6646), .Z(n6216) );
  ND2 U6967 ( .A(n6217), .B(n6216), .Z(n6223) );
  AO7 U6968 ( .A(n6218), .B(n10333), .C(n6647), .Z(n6221) );
  IVDA U6969 ( .A(n6219), .Y(n6014), .Z(n6220) );
  ND2 U6970 ( .A(n6221), .B(n6220), .Z(n6222) );
  ND2P U6971 ( .A(n6227), .B(n6226), .Z(n10097) );
  AN2P U6972 ( .A(i_i2c_mst_debug_cstate[1]), .B(i_i2c_mst_debug_cstate[2]), 
        .Z(n7453) );
  OR2P U6973 ( .A(n7400), .B(n10475), .Z(n7618) );
  NR2P U6974 ( .A(n7499), .B(n7618), .Z(n9613) );
  ND2 U6975 ( .A(i_i2c_ic_abort_sync), .B(
        i_i2c_U_DW_apb_i2c_mstfsm_ic_abort_chk_win), .Z(n6229) );
  ND2 U6976 ( .A(i_i2c_U_DW_apb_i2c_mstfsm_byte_waiting_q), .B(n6229), .Z(
        n7324) );
  NR2 U6977 ( .A(n10424), .B(n7324), .Z(n6230) );
  AN2P U6978 ( .A(n9613), .B(n6230), .Z(n11111) );
  AN2P U6979 ( .A(i_i2c_U_DW_apb_i2c_mstfsm_mst_gen_ack_en_r), .B(
        i_i2c_mst_rx_ack_vld), .Z(n6233) );
  OR2P U6980 ( .A(i_i2c_slv_debug_cstate[1]), .B(i_i2c_slv_debug_cstate[3]), 
        .Z(n8113) );
  NR2 U6981 ( .A(n10480), .B(n8113), .Z(n7479) );
  NR2 U6982 ( .A(i_i2c_s_det), .B(n6231), .Z(n6232) );
  ND2 U6983 ( .A(n7479), .B(n10479), .Z(n10327) );
  OR2P U6984 ( .A(i_i2c_slv_debug_cstate[0]), .B(i_i2c_slv_debug_cstate[2]), 
        .Z(n7263) );
  NR2P U6985 ( .A(i_i2c_slv_debug_cstate[3]), .B(n7263), .Z(n8115) );
  ND2P U6986 ( .A(i_i2c_slv_debug_cstate[1]), .B(n8115), .Z(n9135) );
  ND2 U6987 ( .A(n10327), .B(n9135), .Z(n10247) );
  EO1P U6988 ( .A(n11111), .B(n6233), .C(n6268), .D(n4903), .Z(n9081) );
  ND2 U6989 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_data_sda), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_slv_data_sda), .Z(n6234) );
  OR2P U6990 ( .A(n6235), .B(n6234), .Z(n10104) );
  ND2 U6991 ( .A(n6236), .B(i_i2c_U_DW_apb_i2c_tx_shift_stop_sda), .Z(n6237)
         );
  AN2P U6992 ( .A(n10097), .B(n6237), .Z(n6245) );
  NR2 U6993 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_stop_sda), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_stop_sda_gate_r), .Z(n6238) );
  ND3 U6994 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_re_start_sda), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_re_start_sda_r), .C(
        i_i2c_U_DW_apb_i2c_tx_shift_start_sda), .Z(n10094) );
  NR2 U6995 ( .A(n6238), .B(n10094), .Z(n6239) );
  AO7 U6996 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_stop_sda), .B(n10095), .C(n6239), 
        .Z(n6240) );
  AO6 U6997 ( .A(n6241), .B(n10104), .C(n6240), .Z(n6242) );
  AO3P U6998 ( .A(n6248), .B(n6250), .C(n6247), .D(n6246), .Z(n6249) );
  AO6P U6999 ( .A(n6251), .B(n6250), .C(n6249), .Z(n6282) );
  IVP U7000 ( .A(n6252), .Z(n6259) );
  AN2P U7001 ( .A(n6255), .B(n6254), .Z(n6257) );
  AN2P U7002 ( .A(n10114), .B(n10095), .Z(n6264) );
  ND3 U7003 ( .A(n6260), .B(n6599), .C(n6585), .Z(n6261) );
  AO7P U7004 ( .A(n6262), .B(n6261), .C(n10097), .Z(n6263) );
  AO3P U7005 ( .A(n6266), .B(n6265), .C(n6264), .D(n6263), .Z(n9917) );
  ND2 U7006 ( .A(n11111), .B(i_i2c_U_DW_apb_i2c_mstfsm_mst_gen_ack_en_r), .Z(
        n6267) );
  ND2 U7007 ( .A(n6268), .B(n6267), .Z(n10112) );
  OR2P U7008 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_mst_slv_ack_ext_r), .B(n10112), 
        .Z(n9916) );
  ND3 U7009 ( .A(i_i2c_slv_debug_cstate[0]), .B(i_i2c_slv_debug_cstate[2]), 
        .C(n10497), .Z(n7481) );
  OR2P U7010 ( .A(n10440), .B(n7481), .Z(n7549) );
  OR2P U7011 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_mst_arb_lost), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_slv_arb_lost), .Z(n8080) );
  NR2 U7012 ( .A(i_i2c_tx_fifo_data_buf[8]), .B(n8080), .Z(n7459) );
  ND2 U7013 ( .A(n7459), .B(n10549), .Z(n6269) );
  NR2 U7014 ( .A(n7549), .B(n6269), .Z(n8112) );
  NR2 U7015 ( .A(i_i2c_rx_scl_lcnt_en), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_data_scl_lcnt_en), .Z(n6271) );
  NR2 U7016 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_stop_scl_lcnt_en), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_re_start_scl_lcnt_en), .Z(n6270) );
  AN2P U7017 ( .A(n6271), .B(n6270), .Z(n10264) );
  OR2P U7018 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_re_scl_s_hld_en), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_st_scl_s_hld_en), .Z(n9332) );
  OR4 U7019 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_scl_hld_low_en_r), .B(
        i_i2c_scl_p_setup_en), .C(i_i2c_start_en), .D(i_i2c_scl_s_setup_en), 
        .Z(n6272) );
  NR2 U7020 ( .A(n9332), .B(n6272), .Z(n6273) );
  NR2 U7021 ( .A(i_i2c_rx_scl_hcnt_en), .B(i_i2c_scl_hcnt_en), .Z(n9692) );
  ND2 U7022 ( .A(i_i2c_scl_lcnt_cmplt), .B(i_i2c_scl_p_setup_cmplt), .Z(n7307)
         );
  ND4 U7023 ( .A(n10264), .B(n6273), .C(n9692), .D(n7307), .Z(n6274) );
  NR2 U7024 ( .A(n11051), .B(n6274), .Z(n6275) );
  ND2 U7025 ( .A(n9081), .B(n6275), .Z(n9922) );
  NR2 U7026 ( .A(n9916), .B(n9922), .Z(n6276) );
  ND2 U7027 ( .A(n9917), .B(n6276), .Z(n6281) );
  IVP U7028 ( .A(n8080), .Z(n9920) );
  IVA U7029 ( .A(n6276), .Z(n6277) );
  NR2 U7030 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_ic_data_oe_early), .B(n6277), .Z(
        n6278) );
  ND2 U7031 ( .A(n9917), .B(n6278), .Z(n6279) );
  ND2 U7032 ( .A(n9920), .B(n6279), .Z(n6280) );
  NR2 U7033 ( .A(i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[2]), .B(
        i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[1]), .Z(n6284) );
  NR2 U7034 ( .A(n6284), .B(n6283), .Z(n6286) );
  NR2P U7035 ( .A(n6286), .B(n6529), .Z(n6290) );
  ND2 U7036 ( .A(n6532), .B(i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[3]), .Z(n6289)
         );
  ND2 U7037 ( .A(n6287), .B(i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[2]), .Z(n6288)
         );
  ND2 U7038 ( .A(n6293), .B(n10483), .Z(n6294) );
  ND2 U7039 ( .A(i_apb_U_DW_apb_ahbsif_state[2]), .B(n10432), .Z(n8816) );
  ND2P U7040 ( .A(n6674), .B(n4796), .Z(n8415) );
  ND2 U7041 ( .A(n8415), .B(n8816), .Z(n8457) );
  AN2P U7042 ( .A(i_apb_U_DW_apb_ahbsif_state[0]), .B(
        i_apb_U_DW_apb_ahbsif_state[1]), .Z(n8421) );
  ND2 U7043 ( .A(n8421), .B(n8817), .Z(n6297) );
  IVP U7044 ( .A(n6300), .Z(n6304) );
  ND2 U7045 ( .A(n8421), .B(i_apb_U_DW_apb_ahbsif_pipeline_c), .Z(n6956) );
  ND2 U7046 ( .A(ex_i_ahb_AHB_Slave_haddr[16]), .B(n8631), .Z(n6303) );
  ND2 U7047 ( .A(n6943), .B(n6942), .Z(n8636) );
  ND2 U7048 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[16]), .B(n8636), .Z(n6301) );
  AN2P U7049 ( .A(n7529), .B(i_i2c_reg_addr[2]), .Z(n7629) );
  NR2P U7050 ( .A(n10512), .B(n6825), .Z(n8035) );
  NR2P U7051 ( .A(i_i2c_reg_addr[5]), .B(i_i2c_reg_addr[4]), .Z(n6454) );
  OR2P U7052 ( .A(n8027), .B(n7530), .Z(n8212) );
  NR2 U7053 ( .A(n11114), .B(n8212), .Z(n6307) );
  ND2 U7054 ( .A(i_i2c_ic_raw_intr_stat[3]), .B(i_i2c_ic_intr_mask[3]), .Z(
        n7473) );
  NR2 U7055 ( .A(n8027), .B(n7473), .Z(n6305) );
  AN2P U7056 ( .A(n8035), .B(n6305), .Z(n6306) );
  NR2 U7057 ( .A(n6307), .B(n6306), .Z(n6324) );
  AN2P U7058 ( .A(n6308), .B(i_i2c_reg_addr[3]), .Z(n10336) );
  AN2P U7059 ( .A(n6454), .B(i_i2c_reg_addr[2]), .Z(n8034) );
  ND2P U7060 ( .A(n10336), .B(n8034), .Z(n8164) );
  ND2 U7061 ( .A(i_i2c_ic_intr_mask[3]), .B(n8285), .Z(n6323) );
  NR2 U7062 ( .A(i_i2c_rx_rd_addr[0]), .B(i_i2c_rx_rd_addr[2]), .Z(n6314) );
  AN2P U7063 ( .A(n6314), .B(i_i2c_rx_rd_addr[1]), .Z(n8220) );
  IVA U7064 ( .A(n8220), .Z(n8147) );
  AN3P U7065 ( .A(n10519), .B(n10444), .C(i_i2c_rx_rd_addr[0]), .Z(n8219) );
  ND2 U7066 ( .A(n8219), .B(i_i2c_U_dff_rx_mem[49]), .Z(n6309) );
  AO7 U7067 ( .A(n10993), .B(n8147), .C(n6309), .Z(n6320) );
  ND2P U7068 ( .A(i_i2c_rx_rd_addr[0]), .B(i_i2c_rx_rd_addr[1]), .Z(n7726) );
  OR2P U7069 ( .A(n10519), .B(n7726), .Z(n10358) );
  IVP U7070 ( .A(n10358), .Z(n8222) );
  ND2 U7071 ( .A(n8222), .B(i_i2c_U_dff_rx_mem[3]), .Z(n6311) );
  AN3 U7072 ( .A(i_i2c_rx_rd_addr[2]), .B(i_i2c_rx_rd_addr[0]), .C(n10444), 
        .Z(n8221) );
  ND2 U7073 ( .A(n8221), .B(i_i2c_U_dff_rx_mem[19]), .Z(n6310) );
  ND2 U7074 ( .A(n6311), .B(n6310), .Z(n6319) );
  ND2 U7075 ( .A(i_i2c_rx_rd_addr[2]), .B(i_i2c_rx_rd_addr[1]), .Z(n10362) );
  NR2 U7076 ( .A(i_i2c_rx_rd_addr[0]), .B(n10362), .Z(n8224) );
  ND2 U7077 ( .A(n8224), .B(i_i2c_U_dff_rx_mem[11]), .Z(n6313) );
  NR2 U7078 ( .A(i_i2c_rx_rd_addr[2]), .B(n7726), .Z(n8223) );
  ND2 U7079 ( .A(n8223), .B(i_i2c_U_dff_rx_mem[35]), .Z(n6312) );
  ND2 U7080 ( .A(n6313), .B(n6312), .Z(n6318) );
  AN2P U7081 ( .A(n6314), .B(n10444), .Z(n8218) );
  IVA U7082 ( .A(n8218), .Z(n8145) );
  OR2P U7083 ( .A(i_i2c_rx_rd_addr[1]), .B(i_i2c_rx_rd_addr[0]), .Z(n6315) );
  NR2P U7084 ( .A(n10519), .B(n6315), .Z(n8217) );
  ND2 U7085 ( .A(n8217), .B(i_i2c_U_dff_rx_mem[27]), .Z(n6316) );
  AO7 U7086 ( .A(n10992), .B(n8145), .C(n6316), .Z(n6317) );
  OR4 U7087 ( .A(n6320), .B(n6319), .C(n6318), .D(n6317), .Z(n6321) );
  ND2 U7088 ( .A(n5025), .B(n6321), .Z(n6322) );
  AN3 U7089 ( .A(n6324), .B(n6323), .C(n6322), .Z(n6327) );
  NR2P U7090 ( .A(n10021), .B(n11044), .Z(n6328) );
  AN2P U7091 ( .A(i_i2c_reg_addr[3]), .B(n6328), .Z(n7564) );
  AN2P U7092 ( .A(n7629), .B(n7564), .Z(n8284) );
  ND2 U7093 ( .A(n8284), .B(i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[3]), .Z(n6325)
         );
  ND3 U7094 ( .A(i_i2c_reg_addr[5]), .B(i_i2c_reg_addr[4]), .C(
        i_i2c_reg_addr[2]), .Z(n7900) );
  IVP U7095 ( .A(n7900), .Z(n7667) );
  ND2 U7096 ( .A(n7667), .B(n7564), .Z(n7996) );
  AN2P U7097 ( .A(n6325), .B(n4976), .Z(n6326) );
  IVP U7098 ( .A(n8027), .Z(n6819) );
  ND2P U7099 ( .A(n10512), .B(n6328), .Z(n8029) );
  IVAP U7100 ( .A(n8029), .Z(n8295) );
  OR2P U7101 ( .A(n5064), .B(n8332), .Z(n6346) );
  OR3P U7102 ( .A(n10530), .B(i_i2c_reg_addr[3]), .C(i_i2c_reg_addr[1]), .Z(
        n6329) );
  NR2 U7103 ( .A(n8027), .B(n6329), .Z(n6734) );
  ND2 U7104 ( .A(n8158), .B(i_i2c_ic_tar[3]), .Z(n6332) );
  ND2P U7105 ( .A(n8034), .B(n8295), .Z(n8289) );
  OR2P U7106 ( .A(n10994), .B(n8289), .Z(n6331) );
  ND3 U7107 ( .A(n11045), .B(i_i2c_reg_addr[2]), .C(i_i2c_reg_addr[5]), .Z(
        n7732) );
  IVA U7108 ( .A(n7732), .Z(n6826) );
  IVP U7109 ( .A(n8269), .Z(n8325) );
  ND2 U7110 ( .A(i_i2c_ic_sda_setup[3]), .B(n8325), .Z(n6330) );
  ND2P U7111 ( .A(n8255), .B(n8034), .Z(n8067) );
  ND2 U7112 ( .A(i_i2c_ic_hcnt[3]), .B(n7994), .Z(n6340) );
  OR2P U7113 ( .A(n6334), .B(n7530), .Z(n7858) );
  IVP U7114 ( .A(n7858), .Z(n8247) );
  ND2 U7115 ( .A(i_i2c_ic_tx_abrt_source[3]), .B(n8247), .Z(n6339) );
  IVP U7116 ( .A(n6334), .Z(n6335) );
  ND2 U7117 ( .A(n10336), .B(n6335), .Z(n6336) );
  IVP U7118 ( .A(n6336), .Z(n8279) );
  ND2 U7119 ( .A(i_i2c_ic_spklen_o[3]), .B(n8279), .Z(n6338) );
  AN2P U7120 ( .A(i_i2c_reg_addr[3]), .B(i_i2c_reg_addr[0]), .Z(n6848) );
  ND2 U7121 ( .A(n6848), .B(n11044), .Z(n7899) );
  IVP U7122 ( .A(n7899), .Z(n10342) );
  ND2 U7123 ( .A(n10342), .B(n8034), .Z(n8216) );
  OR2P U7124 ( .A(n8216), .B(n10574), .Z(n6337) );
  ND4 U7125 ( .A(n6340), .B(n6339), .C(n6338), .D(n6337), .Z(n6341) );
  IVP U7126 ( .A(n6341), .Z(n6345) );
  AN2P U7127 ( .A(n7629), .B(n10342), .Z(n8244) );
  ND2 U7128 ( .A(n8244), .B(i_i2c_U_DW_apb_i2c_regfile_ic_txflr[3]), .Z(n6343)
         );
  AN2P U7129 ( .A(n7629), .B(n10336), .Z(n8267) );
  ND2 U7130 ( .A(n10417), .B(n8267), .Z(n6342) );
  AN2P U7131 ( .A(n6343), .B(n6342), .Z(n6344) );
  ND4 U7132 ( .A(n6346), .B(n6333), .C(n6345), .D(n6344), .Z(n6347) );
  NR2 U7133 ( .A(n6348), .B(n6347), .Z(n6386) );
  NR2 U7134 ( .A(i_apb_paddr[27]), .B(i_apb_paddr[29]), .Z(n6350) );
  NR2 U7135 ( .A(i_apb_paddr[31]), .B(i_apb_paddr[26]), .Z(n6349) );
  AN2P U7136 ( .A(n6350), .B(n6349), .Z(n6363) );
  NR2 U7137 ( .A(i_apb_pwrite), .B(n11046), .Z(n6351) );
  AN2P U7138 ( .A(n6364), .B(n6351), .Z(n6362) );
  ND2 U7139 ( .A(n6352), .B(n6391), .Z(n6356) );
  NR2 U7140 ( .A(n5474), .B(i_apb_paddr[20]), .Z(n6353) );
  ND2 U7141 ( .A(n6354), .B(n6353), .Z(n6355) );
  NR2 U7142 ( .A(n6356), .B(n6355), .Z(n6361) );
  NR2 U7143 ( .A(i_apb_paddr[15]), .B(i_apb_paddr[17]), .Z(n6358) );
  AN3 U7144 ( .A(n6359), .B(n6358), .C(n6357), .Z(n6360) );
  ND4P U7145 ( .A(n6363), .B(n6362), .C(n6361), .D(n6360), .Z(n8135) );
  IVP U7146 ( .A(n8135), .Z(n8215) );
  ND2 U7147 ( .A(n8215), .B(n10970), .Z(n7672) );
  IVP U7148 ( .A(n8058), .Z(n6385) );
  NR2 U7149 ( .A(n4815), .B(n11046), .Z(n6365) );
  AN2P U7150 ( .A(n6365), .B(n6364), .Z(n6381) );
  NR2 U7151 ( .A(i_apb_paddr[23]), .B(i_apb_paddr[19]), .Z(n6367) );
  NR2 U7152 ( .A(i_apb_paddr[20]), .B(i_apb_paddr[21]), .Z(n6366) );
  ND2 U7153 ( .A(n6367), .B(n6366), .Z(n6371) );
  NR2 U7154 ( .A(i_apb_paddr[28]), .B(i_apb_paddr[30]), .Z(n6369) );
  NR2 U7155 ( .A(i_apb_paddr[25]), .B(i_apb_paddr[29]), .Z(n6368) );
  ND2 U7156 ( .A(n6369), .B(n6368), .Z(n6370) );
  NR2 U7157 ( .A(n6371), .B(n6370), .Z(n6380) );
  NR2 U7158 ( .A(i_apb_paddr[22]), .B(i_apb_paddr[24]), .Z(n6373) );
  NR2 U7159 ( .A(i_apb_paddr[18]), .B(i_apb_paddr[15]), .Z(n6372) );
  ND4 U7160 ( .A(n6374), .B(n6373), .C(n6372), .D(
        i_i2c_U_DW_apb_i2c_regfile_N402), .Z(n6375) );
  IVA U7161 ( .A(n6375), .Z(n6379) );
  NR2 U7162 ( .A(i_apb_paddr[31]), .B(i_apb_pwrite), .Z(n6376) );
  AN2P U7163 ( .A(n6377), .B(n6376), .Z(n6378) );
  IVP U7164 ( .A(n6843), .Z(n8292) );
  ND2 U7165 ( .A(n8292), .B(n5510), .Z(n8136) );
  B2I U7166 ( .A(n8215), .Z1(n5132), .Z2(n8008) );
  OR2P U7167 ( .A(n8008), .B(n10406), .Z(n6382) );
  AO7 U7168 ( .A(n8136), .B(n10990), .C(n6382), .Z(n6383) );
  AO7 U7169 ( .A(n6386), .B(n6385), .C(n6384), .Z(n3955) );
  NR2 U7170 ( .A(i_apb_paddr[30]), .B(i_apb_paddr[28]), .Z(n6387) );
  ND2 U7171 ( .A(n4970), .B(n6452), .Z(n7758) );
  ND4 U7172 ( .A(n7756), .B(n7755), .C(n10412), .D(n10970), .Z(n6393) );
  OR2P U7173 ( .A(n7758), .B(n6393), .Z(n8331) );
  NR2P U7174 ( .A(n8067), .B(n8331), .Z(n6394) );
  B2IP U7175 ( .A(n6394), .Z1(n5136), .Z2(n10058) );
  B2I U7176 ( .A(n6394), .Z2(n10059) );
  MUX21LP U7177 ( .A(i_apb_pwdata_int[9]), .B(i_apb_pwdata_int[25]), .S(n6397), 
        .Z(n10031) );
  AN4P U7178 ( .A(n8344), .B(n8343), .C(n10031), .D(n7708), .Z(n6400) );
  MUX21LP U7179 ( .A(n5003), .B(n4894), .S(n6396), .Z(n7713) );
  B4I U7180 ( .A(n7713), .Z(n8345) );
  AN2P U7181 ( .A(n9989), .B(n8345), .Z(n6809) );
  MUX21LP U7182 ( .A(i_apb_pwdata_int[11]), .B(i_apb_pwdata_int[27]), .S(n6397), .Z(n10029) );
  MUX21LP U7183 ( .A(i_apb_pwdata_int[10]), .B(i_apb_pwdata_int[26]), .S(n6397), .Z(n10030) );
  ND4 U7184 ( .A(n10029), .B(n10030), .C(n8189), .D(n8193), .Z(n6398) );
  MUX21LP U7185 ( .A(n4973), .B(n4984), .S(n6397), .Z(n6733) );
  NR2 U7186 ( .A(n6398), .B(n6733), .Z(n6399) );
  AO2 U7187 ( .A(n5136), .B(n10984), .C(n10059), .D(n4962), .Z(n4439) );
  NR2P U7188 ( .A(n5506), .B(n8331), .Z(n8188) );
  MUX21L U7189 ( .A(n10983), .B(n6395), .S(n8190), .Z(n4503) );
  IVP U7190 ( .A(n6401), .Z(n6882) );
  NR2P U7191 ( .A(n10417), .B(n5477), .Z(n6438) );
  IVA U7192 ( .A(n6438), .Z(n6431) );
  NR2P U7193 ( .A(n6507), .B(n5019), .Z(n6402) );
  ND2P U7194 ( .A(n6402), .B(n6515), .Z(n6439) );
  ND2P U7195 ( .A(n6431), .B(n6439), .Z(n6427) );
  ND2P U7196 ( .A(n6402), .B(n6426), .Z(n6441) );
  ND2 U7197 ( .A(i_i2c_U_DW_apb_i2c_fifo_wrdc_rx_unconn[1]), .B(n6441), .Z(
        n6411) );
  OR2P U7198 ( .A(n10417), .B(i_i2c_U_DW_apb_i2c_fifo_wrdc_rx_unconn[1]), .Z(
        n6404) );
  ND2 U7199 ( .A(n10442), .B(i_i2c_U_DW_apb_i2c_fifo_wrdc_rx_unconn[1]), .Z(
        n6403) );
  ND2 U7200 ( .A(n6404), .B(n6403), .Z(n6405) );
  AO6 U7201 ( .A(n6507), .B(n10416), .C(n6405), .Z(n6406) );
  AO7P U7202 ( .A(i_i2c_U_DW_apb_i2c_fifo_wrdc_rx_unconn[1]), .B(n6420), .C(
        n6406), .Z(n6407) );
  IVA U7203 ( .A(n6407), .Z(n6410) );
  IVDAP U7204 ( .A(n6426), .Y(n7438), .Z(n6408) );
  ND2P U7205 ( .A(n10546), .B(n6408), .Z(n6409) );
  AO3P U7206 ( .A(n6427), .B(n6411), .C(n6410), .D(n6409), .Z(n6412) );
  EOP U7207 ( .A(n6412), .B(i_i2c_U_DW_apb_i2c_fifo_wrdc_rx_unconn[2]), .Z(
        n6883) );
  IVP U7208 ( .A(n6883), .Z(n6413) );
  OR2P U7209 ( .A(i_i2c_U_DW_apb_i2c_fifo_wrdc_rx_unconn[1]), .B(n10416), .Z(
        n6422) );
  AN3 U7210 ( .A(n6417), .B(n6416), .C(n6415), .Z(n6512) );
  AN2P U7211 ( .A(n6506), .B(n6512), .Z(n6421) );
  IVDA U7212 ( .A(n6418), .Z(n6505) );
  AN2P U7213 ( .A(n10417), .B(n6508), .Z(n6419) );
  ND4P U7214 ( .A(n6421), .B(n5478), .C(n6505), .D(n6419), .Z(n6430) );
  MUX21L U7215 ( .A(n6414), .B(n6422), .S(n6430), .Z(n6423) );
  NR2P U7216 ( .A(n6423), .B(n7440), .Z(n6872) );
  ND4 U7217 ( .A(n6451), .B(n6424), .C(n5477), .D(n6454), .Z(n6425) );
  OR2P U7218 ( .A(n6426), .B(n6425), .Z(n6440) );
  IVP U7219 ( .A(n6440), .Z(n6444) );
  IVP U7220 ( .A(n6427), .Z(n6428) );
  ND2 U7221 ( .A(n6428), .B(n6441), .Z(n6443) );
  ND2 U7222 ( .A(n10416), .B(i_i2c_U_DW_apb_i2c_fifo_wrdc_rx_unconn[1]), .Z(
        n6434) );
  OR2P U7223 ( .A(n6444), .B(n6432), .Z(n6871) );
  AN3P U7224 ( .A(n6872), .B(n6433), .C(n6871), .Z(n10520) );
  IVP U7225 ( .A(n10520), .Z(n6445) );
  OR2P U7226 ( .A(n6434), .B(n4972), .Z(n6435) );
  AO7 U7227 ( .A(n10350), .B(n6435), .C(n5018), .Z(n6437) );
  ND2 U7228 ( .A(n6437), .B(n6436), .Z(n7704) );
  IVDA U7229 ( .A(n7440), .Y(n10352), .Z(n6401) );
  NR2 U7230 ( .A(n10416), .B(n6438), .Z(n6442) );
  ND4 U7231 ( .A(n6442), .B(n6441), .C(n6439), .D(n6440), .Z(n6867) );
  ND3 U7232 ( .A(n10352), .B(n6867), .C(n6866), .Z(n7750) );
  ND4 U7233 ( .A(n8066), .B(n6445), .C(n7704), .D(n7750), .Z(
        i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N33) );
  ND2 U7234 ( .A(n10418), .B(n10420), .Z(n6446) );
  OR3 U7235 ( .A(n5442), .B(n10458), .C(n6446), .Z(n6449) );
  AN2P U7236 ( .A(i_i2c_U_DW_apb_i2c_regfile_fifo_rst_n_int), .B(
        i_i2c_ic_enable[0]), .Z(n6448) );
  EN U7237 ( .A(i_i2c_U_DW_apb_i2c_intctl_slv_clr_leftover_flg_sync), .B(
        i_i2c_U_DW_apb_i2c_intctl_slv_clr_leftover_flg_sync_q), .Z(n6447) );
  NR2 U7238 ( .A(n6449), .B(n7931), .Z(n6450) );
  NR2 U7239 ( .A(n7931), .B(n10535), .Z(n6453) );
  ND2 U7240 ( .A(n6455), .B(n6454), .Z(n6469) );
  ND2 U7241 ( .A(n10418), .B(n10419), .Z(n6457) );
  ND2 U7242 ( .A(n10458), .B(n6465), .Z(n6460) );
  NR2 U7243 ( .A(i_i2c_ic_tx_tl[2]), .B(n7931), .Z(n6459) );
  ND2 U7244 ( .A(i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_empty_n), .B(n10413), .Z(
        n6462) );
  IVDA U7245 ( .A(n6480), .Z(n6466) );
  OR2P U7246 ( .A(n6469), .B(n6468), .Z(n6471) );
  NR2 U7247 ( .A(n10418), .B(n10420), .Z(n6477) );
  NR2 U7248 ( .A(i_i2c_ic_tx_tl[0]), .B(n7931), .Z(n6478) );
  OR2P U7249 ( .A(n6478), .B(n6476), .Z(n6479) );
  AN2P U7250 ( .A(n7934), .B(n6479), .Z(n6483) );
  ND2P U7251 ( .A(n5476), .B(n6482), .Z(n7933) );
  AN2P U7252 ( .A(n6483), .B(n7933), .Z(n6488) );
  ND2 U7253 ( .A(n10420), .B(n10418), .Z(n6484) );
  ND2 U7254 ( .A(n5476), .B(n6484), .Z(n6487) );
  ND2 U7255 ( .A(n10418), .B(n6485), .Z(n6486) );
  ND2 U7256 ( .A(n6487), .B(n6486), .Z(n7932) );
  AO3P U7257 ( .A(n6474), .B(n6476), .C(n6488), .D(n7932), .Z(n6490) );
  AO6P U7258 ( .A(n6491), .B(n6490), .C(n6489), .Z(n11088) );
  ND2 U7259 ( .A(n5135), .B(n6493), .Z(n6496) );
  ND2 U7260 ( .A(n5161), .B(i_i2c_U_DW_apb_i2c_fifo_wrdc_tx_unconn_2_), .Z(
        n6494) );
  OR2P U7261 ( .A(n5476), .B(n6494), .Z(n6495) );
  AO3P U7262 ( .A(n7931), .B(n6497), .C(n6496), .D(n6495), .Z(n11112) );
  IVDA U7263 ( .A(n6498), .Y(n6499) );
  NR2 U7264 ( .A(n10839), .B(n5477), .Z(n6503) );
  ND2 U7265 ( .A(n8063), .B(n6503), .Z(n6504) );
  ND2 U7266 ( .A(n10352), .B(n6504), .Z(n8099) );
  AO6 U7267 ( .A(n6506), .B(n6505), .C(n10547), .Z(n6514) );
  NR2 U7268 ( .A(n10542), .B(n5477), .Z(n6511) );
  IVP U7269 ( .A(n6508), .Z(n6509) );
  ND2 U7270 ( .A(i_i2c_rx_full), .B(n6509), .Z(n6510) );
  AO3 U7271 ( .A(n10547), .B(n6512), .C(n6511), .D(n6510), .Z(n6513) );
  NR2 U7272 ( .A(n6514), .B(n6513), .Z(n6517) );
  ND2 U7273 ( .A(i_i2c_rx_full), .B(n6515), .Z(n6516) );
  ND2 U7274 ( .A(n10625), .B(n8094), .Z(n6519) );
  AN3 U7275 ( .A(i_i2c_rx_push_sync), .B(i_i2c_rx_wr_addr[1]), .C(n10840), .Z(
        n6522) );
  ND2 U7276 ( .A(n8185), .B(n6522), .Z(n6521) );
  ND2 U7277 ( .A(n6519), .B(n6521), .Z(n6520) );
  NR2 U7278 ( .A(n10012), .B(n6520), .Z(i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N42)
         );
  ND2 U7279 ( .A(n10589), .B(n6521), .Z(n6524) );
  IVP U7280 ( .A(n6522), .Z(n7715) );
  NR2 U7281 ( .A(n10589), .B(n7715), .Z(n6523) );
  ND2 U7282 ( .A(n6524), .B(n8102), .Z(n6525) );
  NR2 U7283 ( .A(n10012), .B(n6525), .Z(i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N43)
         );
  MUX21L U7284 ( .A(n6395), .B(n10588), .S(n8338), .Z(n3939) );
  ND2 U7285 ( .A(n6531), .B(n6530), .Z(n6536) );
  ND2 U7286 ( .A(i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[1]), .B(n6532), .Z(n6535)
         );
  ND2 U7287 ( .A(n6533), .B(i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[0]), .Z(n6534)
         );
  ND4 U7288 ( .A(n6537), .B(n6536), .C(n6535), .D(n6534), .Z(n4051) );
  OR2P U7289 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[5]), .B(n6538), 
        .Z(n6542) );
  ND2 U7290 ( .A(n6542), .B(n6539), .Z(n6540) );
  NR2P U7291 ( .A(n6541), .B(n6540), .Z(n6551) );
  IVP U7292 ( .A(n6542), .Z(n6543) );
  AO7 U7293 ( .A(n6544), .B(n6543), .C(n6545), .Z(n6550) );
  AO3P U7294 ( .A(n6548), .B(n6547), .C(n6546), .D(n6545), .Z(n6549) );
  AO7P U7295 ( .A(n6551), .B(n6550), .C(n6549), .Z(n6660) );
  IVP U7296 ( .A(n6552), .Z(n6572) );
  IVP U7297 ( .A(n6553), .Z(n6571) );
  IVP U7298 ( .A(n10620), .Z(n9927) );
  ND2 U7299 ( .A(n6554), .B(n9236), .Z(n6641) );
  ND3 U7300 ( .A(n6642), .B(n9927), .C(n6641), .Z(n6558) );
  AN2P U7301 ( .A(n9236), .B(n6555), .Z(n6556) );
  OR2P U7302 ( .A(n6640), .B(n6556), .Z(n6557) );
  ND2P U7303 ( .A(n6558), .B(n6557), .Z(n6580) );
  NR2 U7304 ( .A(n9236), .B(n10460), .Z(n6561) );
  OR2P U7305 ( .A(n6561), .B(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[11]), 
        .Z(n6559) );
  AO3P U7306 ( .A(n6561), .B(n6560), .C(n6559), .D(n6618), .Z(n6616) );
  ND2 U7307 ( .A(n6581), .B(n6616), .Z(n6562) );
  NR2 U7308 ( .A(n6580), .B(n6562), .Z(n6570) );
  NR2 U7309 ( .A(n4980), .B(i_i2c_U_DW_apb_i2c_sync_ic_master_sync_inv), .Z(
        n6563) );
  ND3 U7310 ( .A(n6564), .B(n10771), .C(n6624), .Z(n6565) );
  AO6 U7311 ( .A(n6615), .B(n9236), .C(n10770), .Z(n6567) );
  ND2 U7312 ( .A(n6567), .B(n6611), .Z(n6576) );
  AN3 U7313 ( .A(n6568), .B(n6577), .C(n6576), .Z(n6569) );
  AO3 U7314 ( .A(n6572), .B(n6571), .C(n6570), .D(n6569), .Z(n6589) );
  ND2 U7315 ( .A(n6575), .B(n6574), .Z(n6578) );
  ND3 U7316 ( .A(n6578), .B(n6577), .C(n6576), .Z(n6579) );
  NR2P U7317 ( .A(n6580), .B(n6579), .Z(n6588) );
  AN2P U7318 ( .A(n6616), .B(n6581), .Z(n6587) );
  AO6 U7319 ( .A(n6583), .B(n9236), .C(n6582), .Z(n6584) );
  ND2 U7320 ( .A(n6590), .B(n6584), .Z(n6586) );
  ND4P U7321 ( .A(n6588), .B(n6587), .C(n6586), .D(n6585), .Z(n6657) );
  ND2 U7322 ( .A(n6589), .B(n6657), .Z(n6659) );
  AN2P U7323 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[6]), .B(n6590), 
        .Z(n6656) );
  AO6P U7324 ( .A(n9236), .B(n6591), .C(n10769), .Z(n6593) );
  AN2P U7325 ( .A(n6593), .B(n6592), .Z(n6606) );
  NR2P U7326 ( .A(n6606), .B(n6594), .Z(n6596) );
  OR3 U7327 ( .A(n6597), .B(n6596), .C(n6595), .Z(n6598) );
  ND2 U7328 ( .A(n6599), .B(n6598), .Z(n6655) );
  ND2 U7329 ( .A(n10333), .B(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[12]), 
        .Z(n6604) );
  IVP U7330 ( .A(n6600), .Z(n6601) );
  ND2 U7331 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[12]), .B(n6601), 
        .Z(n6603) );
  IVDA U7332 ( .A(n6602), .Y(n5496) );
  NR2 U7333 ( .A(n5494), .B(n6605), .Z(n6653) );
  AN2P U7334 ( .A(n6615), .B(n9236), .Z(n6609) );
  ND2 U7335 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[10]), .B(n6611), 
        .Z(n6608) );
  AO3P U7336 ( .A(n6609), .B(n6608), .C(n6607), .D(n6613), .Z(n6623) );
  AN2P U7337 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[10]), .B(n10333), .Z(n6610) );
  ND2 U7338 ( .A(n6611), .B(n6610), .Z(n6614) );
  IVP U7339 ( .A(n6615), .Z(n6634) );
  ND3 U7340 ( .A(n6611), .B(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[10]), 
        .C(n6634), .Z(n6612) );
  ND4 U7341 ( .A(n10723), .B(n6614), .C(n6613), .D(n6612), .Z(n6622) );
  AO3 U7342 ( .A(n6615), .B(n6617), .C(n10770), .D(n6616), .Z(n6621) );
  ND4P U7343 ( .A(n6623), .B(n6622), .C(n6621), .D(n6620), .Z(n6652) );
  ND2 U7344 ( .A(n6625), .B(n10723), .Z(n6627) );
  AO4 U7345 ( .A(n6628), .B(n6627), .C(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[8]), .D(n6626), .Z(n6636)
         );
  NR2 U7346 ( .A(n10333), .B(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[8]), 
        .Z(n6629) );
  ND2 U7347 ( .A(n6630), .B(n6629), .Z(n6632) );
  AO3 U7348 ( .A(n6634), .B(n6633), .C(n6632), .D(n6631), .Z(n6635) );
  NR2 U7349 ( .A(n6636), .B(n6635), .Z(n6639) );
  IVP U7350 ( .A(n6640), .Z(n6643) );
  AO2P U7351 ( .A(n6643), .B(n6644), .C(n6642), .D(n6641), .Z(n6649) );
  OR2P U7352 ( .A(n6644), .B(n9927), .Z(n6645) );
  AO3 U7353 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[14]), .B(n6647), 
        .C(n6646), .D(n6645), .Z(n6648) );
  OR2P U7354 ( .A(n6649), .B(n6648), .Z(n6650) );
  ND4P U7355 ( .A(n6653), .B(n6652), .C(n6651), .D(n6650), .Z(n6654) );
  AO3P U7356 ( .A(n6657), .B(n6656), .C(n6655), .D(n6654), .Z(n6658) );
  AO6P U7357 ( .A(n6660), .B(n6659), .C(n6658), .Z(n6663) );
  OR2P U7358 ( .A(n6663), .B(n6661), .Z(n6662) );
  B4IP U7359 ( .A(n6662), .Z(n10091) );
  IVA U7360 ( .A(n10091), .Z(n6665) );
  ND2 U7361 ( .A(n6663), .B(n10114), .Z(n9962) );
  IVAP U7362 ( .A(n9962), .Z(n10044) );
  IVP U7363 ( .A(n10044), .Z(n6664) );
  MUX21L U7364 ( .A(n6665), .B(n6664), .S(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[0]), .Z(n4099) );
  ND2 U7365 ( .A(i_apb_U_DW_apb_ahbsif_state[1]), .B(n4763), .Z(n6667) );
  NR2 U7366 ( .A(n6667), .B(n5342), .Z(n6668) );
  OR2P U7367 ( .A(n5160), .B(n8816), .Z(n10131) );
  AN2P U7368 ( .A(n6671), .B(n10432), .Z(n8460) );
  OR2P U7369 ( .A(n8414), .B(n10131), .Z(n6676) );
  AO2P U7370 ( .A(n6680), .B(n6679), .C(n10781), .D(n6678), .Z(n3942) );
  NR2P U7371 ( .A(n10169), .B(n6681), .Z(ex_i_ahb_AHB_Slave_haddr[12]) );
  AN2P U7372 ( .A(i_apb_U_DW_apb_ahbsif_nextstate_1_), .B(n8822), .Z(n6932) );
  ND2 U7373 ( .A(n8460), .B(i_apb_U_DW_apb_ahbsif_use_saved_data), .Z(n6683)
         );
  ND2 U7374 ( .A(n6932), .B(n6683), .Z(n6682) );
  B2I U7375 ( .A(n6706), .Z2(n6925) );
  AN2P U7376 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[20]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[20]) );
  ND2 U7377 ( .A(i_apb_pwdata_int[20]), .B(n6729), .Z(n6685) );
  ND2 U7378 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[20]), .B(n6939), .Z(
        n6684) );
  AN2P U7379 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[3]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[3]) );
  IVP U7380 ( .A(ex_i_ahb_AHB_Slave_hwdata[3]), .Z(n8477) );
  ND2 U7381 ( .A(i_apb_pwdata_int[3]), .B(n6926), .Z(n6687) );
  ND2 U7382 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[3]), .B(n6939), .Z(
        n6686) );
  B2I U7383 ( .A(n6706), .Z2(n6929) );
  AN2P U7384 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[23]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[23]) );
  B2I U7385 ( .A(n10070), .Z2(n6926) );
  ND2 U7386 ( .A(i_apb_pwdata_int[23]), .B(n6926), .Z(n6689) );
  ND2 U7387 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[23]), .B(n6939), .Z(
        n6688) );
  AN2P U7388 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[4]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[4]) );
  ND2 U7389 ( .A(i_apb_pwdata_int[4]), .B(n6726), .Z(n6691) );
  ND2 U7390 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[4]), .B(n6939), .Z(
        n6690) );
  AN2P U7391 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[9]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[9]) );
  ND2 U7392 ( .A(i_apb_pwdata_int[9]), .B(n6926), .Z(n6693) );
  ND2 U7393 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[9]), .B(n6939), .Z(
        n6692) );
  AN2P U7394 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[19]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[19]) );
  B2I U7395 ( .A(n10070), .Z2(n6726) );
  AN2P U7396 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[28]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[28]) );
  ND2 U7397 ( .A(i_apb_pwdata_int[28]), .B(n6926), .Z(n6695) );
  ND2 U7398 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[28]), .B(n6939), .Z(
        n6694) );
  AN2P U7399 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[7]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[7]) );
  ND2 U7400 ( .A(i_apb_pwdata_int[7]), .B(n10070), .Z(n6697) );
  ND2 U7401 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[7]), .B(n6939), .Z(
        n6696) );
  AN2P U7402 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[14]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[14]) );
  B2I U7403 ( .A(n10070), .Z2(n6729) );
  ND2 U7404 ( .A(i_apb_pwdata_int[14]), .B(n6729), .Z(n6699) );
  ND2 U7405 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[14]), .B(n6939), .Z(
        n6698) );
  AN2P U7406 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[12]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[12]) );
  ND2 U7407 ( .A(i_apb_pwdata_int[12]), .B(n4767), .Z(n6701) );
  ND2 U7408 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[12]), .B(n6939), .Z(
        n6700) );
  AN2P U7409 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[15]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[15]) );
  ND2 U7410 ( .A(i_apb_pwdata_int[15]), .B(n6729), .Z(n6703) );
  ND2 U7411 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[15]), .B(n6939), .Z(
        n6702) );
  AN2P U7412 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[22]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[22]) );
  ND2 U7413 ( .A(i_apb_pwdata_int[22]), .B(n10070), .Z(n6705) );
  ND2 U7414 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[22]), .B(n6939), .Z(
        n6704) );
  B2I U7415 ( .A(n6706), .Z2(n6935) );
  AN2P U7416 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[24]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[24]) );
  ND2 U7417 ( .A(i_apb_pwdata_int[24]), .B(n6729), .Z(n6708) );
  ND2 U7418 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[24]), .B(n6939), .Z(
        n6707) );
  AN2P U7419 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[10]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[10]) );
  ND2 U7420 ( .A(i_apb_pwdata_int[10]), .B(n6726), .Z(n6710) );
  ND2 U7421 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[10]), .B(n6939), .Z(
        n6709) );
  AN2P U7422 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[25]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[25]) );
  ND2 U7423 ( .A(i_apb_pwdata_int[25]), .B(n10070), .Z(n6712) );
  ND2 U7424 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[25]), .B(n6939), .Z(
        n6711) );
  AN2P U7425 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[8]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[8]) );
  ND2 U7426 ( .A(i_apb_pwdata_int[8]), .B(n6729), .Z(n6714) );
  ND2 U7427 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[8]), .B(n6939), .Z(
        n6713) );
  AN2P U7428 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[0]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[0]) );
  ND2 U7429 ( .A(i_apb_pwdata_int[0]), .B(n6926), .Z(n6716) );
  ND2 U7430 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[0]), .B(n6939), .Z(
        n6715) );
  AN2P U7431 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[17]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[17]) );
  ND2 U7432 ( .A(i_apb_pwdata_int[17]), .B(n4767), .Z(n6718) );
  ND2 U7433 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[17]), .B(n6939), .Z(
        n6717) );
  AN2P U7434 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[18]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[18]) );
  ND2 U7435 ( .A(i_apb_pwdata_int[18]), .B(n6926), .Z(n6720) );
  ND2 U7436 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[18]), .B(n6939), .Z(
        n6719) );
  AN2P U7437 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[13]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[13]) );
  ND2 U7438 ( .A(i_apb_pwdata_int[13]), .B(n6726), .Z(n6722) );
  ND2 U7439 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[13]), .B(n6939), .Z(
        n6721) );
  AN2P U7440 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[27]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[27]) );
  ND2 U7441 ( .A(i_apb_pwdata_int[27]), .B(n6726), .Z(n6725) );
  ND2 U7442 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[27]), .B(n6939), .Z(
        n6724) );
  AN2P U7443 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[31]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[31]) );
  ND2 U7444 ( .A(i_apb_pwdata_int[31]), .B(n6726), .Z(n6728) );
  ND2 U7445 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[31]), .B(n6939), .Z(
        n6727) );
  AN2P U7446 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[30]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[30]) );
  ND2 U7447 ( .A(i_apb_pwdata_int[30]), .B(n6729), .Z(n6731) );
  ND2 U7448 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[30]), .B(n6939), .Z(
        n6730) );
  AN2P U7449 ( .A(n10412), .B(n10970), .Z(n6807) );
  AN2P U7450 ( .A(n6807), .B(n8158), .Z(n6732) );
  OR2P U7451 ( .A(n8264), .B(n8331), .Z(n8337) );
  AO7 U7452 ( .A(n5137), .B(n10772), .C(n6735), .Z(n4409) );
  OR2P U7453 ( .A(i_i2c_U_DW_apb_i2c_regfile_ic_txflr[0]), .B(
        i_i2c_U_DW_apb_i2c_regfile_ic_txflr[1]), .Z(n8071) );
  OR2P U7454 ( .A(n6736), .B(n7931), .Z(n6737) );
  AO7 U7455 ( .A(n7888), .B(n6737), .C(i_i2c_U_DW_apb_i2c_regfile_ic_txflr[2]), 
        .Z(n6745) );
  ND2 U7456 ( .A(n5020), .B(n10544), .Z(n6738) );
  NR2 U7457 ( .A(n7931), .B(n6738), .Z(n6739) );
  ND3P U7458 ( .A(n5101), .B(n7888), .C(n7891), .Z(n8077) );
  IVP U7459 ( .A(n8077), .Z(n6744) );
  ND2 U7460 ( .A(i_i2c_U_DW_apb_i2c_regfile_ic_txflr[0]), .B(
        i_i2c_U_DW_apb_i2c_regfile_ic_txflr[1]), .Z(n8072) );
  NR3 U7461 ( .A(n7931), .B(n10544), .C(n5020), .Z(n6740) );
  ND2 U7462 ( .A(n6741), .B(n6740), .Z(n7895) );
  OR2P U7463 ( .A(n7895), .B(n8071), .Z(n6742) );
  AO3 U7464 ( .A(n7891), .B(n8072), .C(n10414), .D(n6742), .Z(n6743) );
  OR3 U7465 ( .A(n7891), .B(n6746), .C(n10414), .Z(n6747) );
  ND2 U7466 ( .A(n6748), .B(n6747), .Z(n4064) );
  ND2 U7467 ( .A(i_ahb_U_arb_ebtcount[2]), .B(n8875), .Z(n6749) );
  OR2P U7468 ( .A(n8471), .B(n4978), .Z(n6757) );
  IVDA U7469 ( .A(ex_i_ahb_AHB_Slave_hwdata[13]), .Y(n6723), .Z(n6754) );
  ND2 U7470 ( .A(n8459), .B(n6755), .Z(n6756) );
  AO3 U7471 ( .A(n8459), .B(n4977), .C(n6757), .D(n6756), .Z(n4589) );
  IVP U7472 ( .A(n10404), .Z(n6759) );
  IVAP U7473 ( .A(n6781), .Z(n10373) );
  ND2 U7474 ( .A(n10396), .B(ex_i_ahb_AHB_Slave_hrdata[1]), .Z(n6760) );
  AO3P U7475 ( .A(n10643), .B(n6762), .C(n6761), .D(n6760), .Z(
        ex_i_ahb_AHB_Master_hrdata[1]) );
  AN2P U7476 ( .A(i_i2c_U_DW_apb_i2c_regfile_N402), .B(n6763), .Z(n6777) );
  ND2 U7477 ( .A(i_apb_prdata_apb_dslcr[12]), .B(n6777), .Z(n6765) );
  ND2 U7478 ( .A(n6797), .B(ex_i_ahb_AHB_Slave_hrdata[28]), .Z(n6764) );
  AO3P U7479 ( .A(n10633), .B(n6762), .C(n6765), .D(n6764), .Z(
        ex_i_ahb_AHB_Master_hrdata[28]) );
  ND2 U7480 ( .A(i_apb_prdata_apb_dslcr[0]), .B(n6777), .Z(n6767) );
  ND2 U7481 ( .A(n10396), .B(ex_i_ahb_AHB_Slave_hrdata[16]), .Z(n6766) );
  AO3P U7482 ( .A(n10638), .B(n6762), .C(n6767), .D(n6766), .Z(
        ex_i_ahb_AHB_Master_hrdata[16]) );
  ND2 U7483 ( .A(n10396), .B(ex_i_ahb_AHB_Slave_hrdata[20]), .Z(n6769) );
  ND2 U7484 ( .A(n6777), .B(i_apb_prdata_apb_dslcr[4]), .Z(n6768) );
  AO3P U7485 ( .A(n10637), .B(n5503), .C(n6769), .D(n6768), .Z(
        ex_i_ahb_AHB_Master_hrdata[20]) );
  ND2 U7486 ( .A(n10396), .B(ex_i_ahb_AHB_Slave_hrdata[21]), .Z(n6772) );
  ND2 U7487 ( .A(n6777), .B(i_apb_prdata_apb_dslcr[5]), .Z(n6771) );
  AO3P U7488 ( .A(n10634), .B(n5503), .C(n6772), .D(n6771), .Z(
        ex_i_ahb_AHB_Master_hrdata[21]) );
  ND2 U7489 ( .A(n10396), .B(ex_i_ahb_AHB_Slave_hrdata[25]), .Z(n6775) );
  ND2 U7490 ( .A(n6777), .B(i_apb_prdata_apb_dslcr[9]), .Z(n6774) );
  AO3P U7491 ( .A(n10636), .B(n5503), .C(n6775), .D(n6774), .Z(
        ex_i_ahb_AHB_Master_hrdata[25]) );
  ND2 U7492 ( .A(n10396), .B(ex_i_ahb_AHB_Slave_hrdata[29]), .Z(n6779) );
  ND2 U7493 ( .A(n6777), .B(i_apb_prdata_apb_dslcr[13]), .Z(n6778) );
  AO3P U7494 ( .A(n10635), .B(n6762), .C(n6779), .D(n6778), .Z(
        ex_i_ahb_AHB_Master_hrdata[29]) );
  ND2 U7495 ( .A(n6797), .B(ex_i_ahb_AHB_Slave_hrdata[0]), .Z(n6784) );
  ND2 U7496 ( .A(n10373), .B(n6782), .Z(n6783) );
  ND2 U7497 ( .A(i_apb_prdata_apb_dslcr[2]), .B(n10373), .Z(n6786) );
  ND2 U7498 ( .A(n10396), .B(ex_i_ahb_AHB_Slave_hrdata[2]), .Z(n6785) );
  AO3P U7499 ( .A(n10624), .B(n5503), .C(n6786), .D(n6785), .Z(
        ex_i_ahb_AHB_Master_hrdata[2]) );
  ND2 U7500 ( .A(i_apb_prdata_apb_dslcr[3]), .B(n10373), .Z(n6788) );
  ND2 U7501 ( .A(n6797), .B(ex_i_ahb_AHB_Slave_hrdata[3]), .Z(n6787) );
  AO3P U7502 ( .A(n10642), .B(n5503), .C(n6788), .D(n6787), .Z(
        ex_i_ahb_AHB_Master_hrdata[3]) );
  ND2 U7503 ( .A(i_apb_prdata_apb_dslcr[4]), .B(n10373), .Z(n6790) );
  ND2 U7504 ( .A(n10396), .B(ex_i_ahb_AHB_Slave_hrdata[4]), .Z(n6789) );
  AO3P U7505 ( .A(n10649), .B(n6762), .C(n6790), .D(n6789), .Z(
        ex_i_ahb_AHB_Master_hrdata[4]) );
  ND2 U7506 ( .A(i_apb_prdata_apb_dslcr[5]), .B(n10373), .Z(n6792) );
  ND2 U7507 ( .A(n10396), .B(ex_i_ahb_AHB_Slave_hrdata[5]), .Z(n6791) );
  AO3P U7508 ( .A(n10648), .B(n6762), .C(n6792), .D(n6791), .Z(
        ex_i_ahb_AHB_Master_hrdata[5]) );
  ND2 U7509 ( .A(i_apb_prdata_apb_dslcr[6]), .B(n10373), .Z(n6794) );
  ND2 U7510 ( .A(n6797), .B(ex_i_ahb_AHB_Slave_hrdata[6]), .Z(n6793) );
  AO3P U7511 ( .A(n10647), .B(n5503), .C(n6794), .D(n6793), .Z(
        ex_i_ahb_AHB_Master_hrdata[6]) );
  ND2 U7512 ( .A(i_apb_prdata_apb_dslcr[7]), .B(n10373), .Z(n6796) );
  ND2 U7513 ( .A(n10396), .B(ex_i_ahb_AHB_Slave_hrdata[7]), .Z(n6795) );
  AO3P U7514 ( .A(n10646), .B(n5503), .C(n6796), .D(n6795), .Z(
        ex_i_ahb_AHB_Master_hrdata[7]) );
  ND2 U7515 ( .A(i_apb_prdata_apb_dslcr[8]), .B(n10373), .Z(n6799) );
  ND2 U7516 ( .A(n10396), .B(ex_i_ahb_AHB_Slave_hrdata[8]), .Z(n6798) );
  AO3P U7517 ( .A(n10641), .B(n6762), .C(n6799), .D(n6798), .Z(
        ex_i_ahb_AHB_Master_hrdata[8]) );
  ND2 U7518 ( .A(i_apb_prdata_apb_dslcr[9]), .B(n10373), .Z(n6801) );
  ND2 U7519 ( .A(n10396), .B(ex_i_ahb_AHB_Slave_hrdata[9]), .Z(n6800) );
  AO3P U7520 ( .A(n10645), .B(n6762), .C(n6801), .D(n6800), .Z(
        ex_i_ahb_AHB_Master_hrdata[9]) );
  ND2 U7521 ( .A(n10373), .B(i_apb_prdata_apb_dslcr[12]), .Z(n6803) );
  ND2 U7522 ( .A(n10396), .B(ex_i_ahb_AHB_Slave_hrdata[12]), .Z(n6802) );
  AO3P U7523 ( .A(n10640), .B(n5503), .C(n6803), .D(n6802), .Z(
        ex_i_ahb_AHB_Master_hrdata[12]) );
  ND2 U7524 ( .A(n10373), .B(i_apb_prdata_apb_dslcr[13]), .Z(n6806) );
  ND2 U7525 ( .A(n10396), .B(ex_i_ahb_AHB_Slave_hrdata[13]), .Z(n6805) );
  AO3P U7526 ( .A(n10639), .B(n5503), .C(n6806), .D(n6805), .Z(
        ex_i_ahb_AHB_Master_hrdata[13]) );
  ND2P U7527 ( .A(n7650), .B(n6807), .Z(n7470) );
  MUX21L U7528 ( .A(i_apb_pwdata_int[1]), .B(i_apb_pwdata_int[17]), .S(n6397), 
        .Z(n7711) );
  ND3P U7529 ( .A(n6809), .B(n6808), .C(n10146), .Z(n7864) );
  NR2P U7530 ( .A(n7712), .B(n7864), .Z(n6812) );
  AO6 U7531 ( .A(n6812), .B(n6395), .C(n6336), .Z(n6810) );
  AN2P U7532 ( .A(n8324), .B(n6810), .Z(n8356) );
  ND2P U7533 ( .A(n8279), .B(n8324), .Z(n8355) );
  AO2 U7534 ( .A(n8356), .B(n6811), .C(n10583), .D(n8355), .Z(n4480) );
  AN2P U7535 ( .A(n8035), .B(n8034), .Z(n8248) );
  IVP U7536 ( .A(n8248), .Z(n6813) );
  NR2P U7537 ( .A(n6813), .B(n7748), .Z(n7867) );
  MUX21L U7538 ( .A(n10439), .B(n6814), .S(n7867), .Z(n4472) );
  ND2 U7539 ( .A(n8034), .B(n7564), .Z(n8213) );
  NR2P U7540 ( .A(n8213), .B(n7748), .Z(n7865) );
  MUX21L U7541 ( .A(n10775), .B(n6814), .S(n7865), .Z(n4464) );
  EO U7542 ( .A(n8080), .B(i_i2c_tx_abrt_source[12]), .Z(n3879) );
  ND2 U7543 ( .A(n10004), .B(n6815), .Z(ex_i_ahb_AHB_Slave_hprot[1]) );
  ND2 U7544 ( .A(n10004), .B(n6816), .Z(ex_i_ahb_AHB_Slave_hprot[0]) );
  AN2P U7545 ( .A(i_i2c_tx_fifo_data_buf[8]), .B(
        i_i2c_U_DW_apb_i2c_sync_ic_rstrt_en_sync_inv), .Z(n7081) );
  NR2P U7546 ( .A(i_i2c_mst_debug_cstate[1]), .B(n10472), .Z(n7283) );
  NR2 U7547 ( .A(i_i2c_mst_debug_cstate[4]), .B(n10473), .Z(n6817) );
  AN2P U7548 ( .A(n7283), .B(n6817), .Z(n7518) );
  AN2P U7549 ( .A(i_i2c_mst_debug_cstate[0]), .B(n7518), .Z(n7346) );
  AN2P U7550 ( .A(n7081), .B(n7346), .Z(n7300) );
  EO U7551 ( .A(n7300), .B(i_i2c_tx_abrt_source[10]), .Z(n4244) );
  ND2 U7552 ( .A(n6818), .B(n7588), .Z(i_i2c_U_DW_apb_i2c_slvfsm_N284) );
  IVP U7553 ( .A(n8216), .Z(n8050) );
  ND2 U7554 ( .A(n8035), .B(n6819), .Z(n8241) );
  IVP U7555 ( .A(n8241), .Z(n8052) );
  AN2P U7556 ( .A(i_i2c_ic_raw_intr_stat[1]), .B(i_i2c_ic_intr_mask[1]), .Z(
        n10630) );
  AO2 U7557 ( .A(i_i2c_ic_raw_intr_stat[1]), .B(n8050), .C(n8052), .D(n10630), 
        .Z(n6824) );
  AO2 U7558 ( .A(i_i2c_ic_hcnt[1]), .B(n7994), .C(n8325), .D(
        i_i2c_ic_sda_setup[1]), .Z(n6823) );
  AO2 U7559 ( .A(n8247), .B(i_i2c_ic_tx_abrt_source[1]), .C(n8244), .D(
        i_i2c_U_DW_apb_i2c_regfile_ic_txflr[1]), .Z(n6821) );
  AO2 U7560 ( .A(i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[1]), .B(n8284), .C(
        i_i2c_ic_tx_tl[1]), .D(n8248), .Z(n6820) );
  AN2P U7561 ( .A(n6821), .B(n6820), .Z(n6822) );
  ND3 U7562 ( .A(n6824), .B(n6823), .C(n6822), .Z(n6842) );
  NR2 U7563 ( .A(i_i2c_reg_addr[3]), .B(n6825), .Z(n7635) );
  ND2 U7564 ( .A(n6826), .B(n7635), .Z(n8231) );
  IVP U7565 ( .A(n8231), .Z(n6827) );
  AO2 U7566 ( .A(i_i2c_slv_rx_aborted_sync), .B(n6827), .C(n8267), .D(n10535), 
        .Z(n6829) );
  ND2 U7567 ( .A(n8158), .B(i_i2c_ic_tar[1]), .Z(n6828) );
  AN2P U7568 ( .A(n6829), .B(n6828), .Z(n6840) );
  AO2 U7569 ( .A(i_i2c_ic_rx_tl[1]), .B(n6830), .C(n8285), .D(
        i_i2c_ic_intr_mask[1]), .Z(n6832) );
  OR2P U7570 ( .A(n8289), .B(n10838), .Z(n6831) );
  AN2P U7571 ( .A(n6832), .B(n6831), .Z(n6839) );
  AN2P U7572 ( .A(n8212), .B(n7996), .Z(n6835) );
  AO2 U7573 ( .A(n6833), .B(i_i2c_ic_enable[1]), .C(i_i2c_ic_spklen_o[1]), .D(
        n8279), .Z(n6834) );
  AO3 U7574 ( .A(n8332), .B(n10837), .C(n6835), .D(n6834), .Z(n6836) );
  IVA U7575 ( .A(n6836), .Z(n6838) );
  ND2 U7576 ( .A(i_i2c_ic_sda_hold[1]), .B(n5509), .Z(n6837) );
  IVP U7577 ( .A(n8136), .Z(n8010) );
  AO6 U7578 ( .A(n8010), .B(i_i2c_ic_sda_hold[17]), .C(n8134), .Z(n6852) );
  AN2P U7579 ( .A(n7438), .B(n5025), .Z(n11092) );
  AO2 U7580 ( .A(n8218), .B(i_i2c_U_dff_rx_mem[55]), .C(n8217), .D(
        i_i2c_U_dff_rx_mem[25]), .Z(n6847) );
  AO2 U7581 ( .A(n8220), .B(i_i2c_U_dff_rx_mem[41]), .C(n8219), .D(
        i_i2c_U_dff_rx_mem[47]), .Z(n6846) );
  AO2 U7582 ( .A(n8222), .B(i_i2c_U_dff_rx_mem[1]), .C(n8221), .D(
        i_i2c_U_dff_rx_mem[17]), .Z(n6845) );
  AO2 U7583 ( .A(n8224), .B(i_i2c_U_dff_rx_mem[9]), .C(n8223), .D(
        i_i2c_U_dff_rx_mem[33]), .Z(n6844) );
  ND4 U7584 ( .A(n6847), .B(n6846), .C(n6845), .D(n6844), .Z(n6850) );
  ND2 U7585 ( .A(n7667), .B(n6848), .Z(n7853) );
  NR2P U7586 ( .A(n6843), .B(n7853), .Z(n8320) );
  NR2 U7587 ( .A(n8008), .B(n10407), .Z(n6849) );
  AO1P U7588 ( .A(n11092), .B(n6850), .C(n8320), .D(n6849), .Z(n6851) );
  AO3 U7589 ( .A(n6853), .B(n8138), .C(n6852), .D(n6851), .Z(n3957) );
  ND2 U7590 ( .A(n10482), .B(n10430), .Z(n6854) );
  OR2P U7591 ( .A(n6855), .B(n6854), .Z(n6893) );
  NR2 U7592 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_hcnt_cmplt_int), .B(n5052), 
        .Z(n6856) );
  ND2 U7593 ( .A(n6856), .B(n6855), .Z(n6892) );
  AN2P U7594 ( .A(i_i2c_mst_tx_ack_vld), .B(n10437), .Z(n6858) );
  AO7 U7595 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_hcnt_cmplt_int), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_int_d), .C(i_i2c_scl_lcnt_cmplt), .Z(
        n6857) );
  AO6 U7596 ( .A(n9692), .B(n10430), .C(n6857), .Z(n6891) );
  ND4 U7597 ( .A(n6893), .B(n6892), .C(n6858), .D(n6891), .Z(n6859) );
  ND2 U7598 ( .A(i_i2c_ic_tar[11]), .B(n10881), .Z(n7316) );
  OR2P U7599 ( .A(i_i2c_mst_debug_cstate[0]), .B(n7400), .Z(n7078) );
  NR2 U7600 ( .A(n7316), .B(n7078), .Z(n7450) );
  ND2 U7601 ( .A(n5087), .B(n7450), .Z(n7246) );
  EN U7602 ( .A(n7246), .B(i_i2c_tx_abrt_source[4]), .Z(n4230) );
  AO2 U7603 ( .A(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[1]), .B(n10439), .C(
        n10517), .D(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[0]), .Z(n6863) );
  AO4 U7604 ( .A(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[1]), .B(n10439), .C(
        n10533), .D(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[2]), .Z(n6862) );
  NR4 U7605 ( .A(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[6]), .B(
        i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[4]), .C(
        i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[5]), .D(
        i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[3]), .Z(n6861) );
  AO6 U7606 ( .A(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[2]), .B(n10533), .C(
        i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[7]), .Z(n6860) );
  MUX21L U7607 ( .A(i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_almost_empty_n), .B(
        n6864), .S(i_i2c_tx_empty_ctrl), .Z(n6865) );
  ND2 U7608 ( .A(i_i2c_ic_en), .B(n6865), .Z(n8260) );
  NR2 U7609 ( .A(n8260), .B(n11003), .Z(n11105) );
  ND2 U7610 ( .A(n6867), .B(n6866), .Z(n6875) );
  AO7P U7611 ( .A(n6875), .B(n6868), .C(n10775), .Z(n6870) );
  ND2 U7612 ( .A(i_i2c_ic_rx_tl[0]), .B(i_i2c_ic_rx_tl[1]), .Z(n7486) );
  ND2 U7613 ( .A(n10985), .B(n7486), .Z(n6880) );
  ND2P U7614 ( .A(n6883), .B(n6880), .Z(n6869) );
  AO7P U7615 ( .A(n10520), .B(n6870), .C(n6869), .Z(n6888) );
  AN2P U7616 ( .A(n6872), .B(n6871), .Z(n6879) );
  ND2 U7617 ( .A(i_i2c_ic_rx_tl[0]), .B(n10985), .Z(n6873) );
  AO7 U7618 ( .A(n7440), .B(n6873), .C(i_i2c_ic_rx_tl[1]), .Z(n6878) );
  AO7 U7619 ( .A(i_i2c_ic_rx_tl[2]), .B(n10556), .C(i_i2c_ic_rx_tl[1]), .Z(
        n6874) );
  ND2 U7620 ( .A(n6876), .B(n6875), .Z(n6877) );
  AO7 U7621 ( .A(n6879), .B(n6878), .C(n6877), .Z(n6887) );
  IVA U7622 ( .A(n6880), .Z(n6881) );
  ND2 U7623 ( .A(n6882), .B(n6881), .Z(n6884) );
  OR2P U7624 ( .A(n6884), .B(n6883), .Z(n6885) );
  AO3 U7625 ( .A(n6888), .B(n6887), .C(n6886), .D(n6885), .Z(
        i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N36) );
  ND2 U7626 ( .A(i_i2c_mst_debug_cstate[1]), .B(n10472), .Z(n7079) );
  NR3 U7627 ( .A(i_i2c_mst_debug_cstate[3]), .B(i_i2c_mst_debug_cstate[4]), 
        .C(i_i2c_mst_debug_cstate[0]), .Z(n7517) );
  AN2P U7628 ( .A(n7282), .B(n7517), .Z(n7274) );
  NR2 U7629 ( .A(n7338), .B(n7316), .Z(n6890) );
  AN3P U7630 ( .A(n6893), .B(n6891), .C(n6892), .Z(n8541) );
  ND2 U7631 ( .A(n5068), .B(n10495), .Z(n6889) );
  ND2P U7632 ( .A(n8541), .B(n6889), .Z(n7337) );
  ND2 U7633 ( .A(n6890), .B(n7337), .Z(n7364) );
  OR2P U7634 ( .A(n10424), .B(n7364), .Z(n7273) );
  EN U7635 ( .A(n7273), .B(i_i2c_tx_abrt_source[5]), .Z(n4058) );
  ND4 U7636 ( .A(n6893), .B(n6892), .C(n6891), .D(i_i2c_mst_tx_ack_vld), .Z(
        n7084) );
  ND2P U7637 ( .A(n6894), .B(i_i2c_ack_det), .Z(n7466) );
  IVP U7638 ( .A(n7466), .Z(n7371) );
  IVP U7639 ( .A(n7316), .Z(n7275) );
  NR2P U7640 ( .A(n7275), .B(n7078), .Z(n7390) );
  ND2 U7641 ( .A(n7371), .B(n7390), .Z(n7247) );
  EN U7642 ( .A(n7247), .B(i_i2c_tx_abrt_source[7]), .Z(n4231) );
  AN2P U7643 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[21]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[21]) );
  AN2P U7644 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[5]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[5]) );
  ND2 U7645 ( .A(i_apb_pwdata_int[5]), .B(n10070), .Z(n6897) );
  ND2 U7646 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[5]), .B(n6939), .Z(
        n6896) );
  NR2 U7647 ( .A(i_i2c_scl_int), .B(n5053), .Z(n7049) );
  OR2P U7648 ( .A(i_ahb_U_arb_U_ebt_int_count[0]), .B(
        i_ahb_U_arb_U_ebt_int_count[1]), .Z(n6904) );
  AO6 U7649 ( .A(i_ahb_U_arb_U_ebt_int_count[1]), .B(
        i_ahb_U_arb_U_ebt_int_count[0]), .C(n6898), .Z(n6903) );
  NR2 U7650 ( .A(i_ahb_U_arb_U_ebt_int_count[2]), .B(n6904), .Z(n6910) );
  OR2P U7651 ( .A(i_ahb_U_arb_U_ebt_int_count[7]), .B(n6916), .Z(n8544) );
  OR2P U7652 ( .A(i_ahb_U_arb_U_ebt_int_count[8]), .B(n8544), .Z(n8372) );
  NR2 U7653 ( .A(n6899), .B(i_ahb_U_arb_U_gctrl_ihlock), .Z(n6900) );
  AN2P U7654 ( .A(ex_i_ahb_AHB_Slave_htrans[0]), .B(n6900), .Z(n8551) );
  AO7 U7655 ( .A(i_ahb_U_arb_U_ebt_int_count[9]), .B(n8372), .C(n8551), .Z(
        n6901) );
  B2I U7656 ( .A(n6901), .Z2(n8549) );
  IVP U7657 ( .A(n8551), .Z(n8522) );
  ND2 U7658 ( .A(i_ahb_U_arb_ebtcount[1]), .B(n8522), .Z(n6902) );
  AO7 U7659 ( .A(n6903), .B(n8549), .C(n6902), .Z(n4383) );
  EO U7660 ( .A(n6904), .B(i_ahb_U_arb_U_ebt_int_count[2]), .Z(n6906) );
  ND2 U7661 ( .A(i_ahb_U_arb_ebtcount[2]), .B(n8522), .Z(n6905) );
  AO7 U7662 ( .A(n8549), .B(n6906), .C(n6905), .Z(n4382) );
  EO U7663 ( .A(n6909), .B(i_ahb_U_arb_U_ebt_int_count[4]), .Z(n6908) );
  ND2 U7664 ( .A(i_ahb_U_arb_ebtcount[4]), .B(n8522), .Z(n6907) );
  AO7 U7665 ( .A(n8549), .B(n6908), .C(n6907), .Z(n4380) );
  NR2 U7666 ( .A(n6910), .B(n10869), .Z(n6911) );
  NR2 U7667 ( .A(n6912), .B(n6911), .Z(n6914) );
  ND2 U7668 ( .A(i_ahb_U_arb_ebtcount[3]), .B(n8522), .Z(n6913) );
  AO7 U7669 ( .A(n6914), .B(n8549), .C(n6913), .Z(n4381) );
  AO6 U7670 ( .A(i_ahb_U_arb_U_ebt_int_count[7]), .B(n6916), .C(n6915), .Z(
        n6918) );
  ND2 U7671 ( .A(i_ahb_U_arb_ebtcount[7]), .B(n8522), .Z(n6917) );
  AO7 U7672 ( .A(n6918), .B(n8549), .C(n6917), .Z(n4377) );
  EO U7673 ( .A(n8548), .B(i_ahb_U_arb_U_ebt_int_count[6]), .Z(n6920) );
  ND2 U7674 ( .A(i_ahb_U_arb_ebtcount[6]), .B(n8522), .Z(n6919) );
  AO7 U7675 ( .A(n8549), .B(n6920), .C(n6919), .Z(n4378) );
  AN2P U7676 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[11]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[11]) );
  ND2 U7677 ( .A(i_apb_pwdata_int[11]), .B(n6926), .Z(n6922) );
  ND2 U7678 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[11]), .B(n6939), .Z(
        n6921) );
  AN2P U7679 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[26]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[26]) );
  ND2 U7680 ( .A(i_apb_pwdata_int[26]), .B(n4767), .Z(n6924) );
  ND2 U7681 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[26]), .B(n6939), .Z(
        n6923) );
  AN2P U7682 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[16]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[16]) );
  ND2 U7683 ( .A(i_apb_pwdata_int[16]), .B(n6926), .Z(n6928) );
  ND2 U7684 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[16]), .B(n6939), .Z(
        n6927) );
  AN2P U7685 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[1]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[1]) );
  IVP U7686 ( .A(ex_i_ahb_AHB_Slave_hwdata[1]), .Z(n10127) );
  ND2 U7687 ( .A(i_apb_pwdata_int[1]), .B(n4767), .Z(n6931) );
  ND2 U7688 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[1]), .B(n6939), .Z(
        n6930) );
  AO3 U7689 ( .A(n6938), .B(n10127), .C(n6931), .D(n6930), .Z(n3917) );
  AN2P U7690 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[6]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[6]) );
  ND2P U7691 ( .A(n5388), .B(n6932), .Z(n10158) );
  ND2 U7692 ( .A(i_apb_pwdata_int[6]), .B(n10159), .Z(n6934) );
  ND2 U7693 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[6]), .B(n6939), .Z(
        n6933) );
  AN2P U7694 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[2]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[2]) );
  IVP U7695 ( .A(ex_i_ahb_AHB_Slave_hwdata[2]), .Z(n10125) );
  ND2 U7696 ( .A(i_apb_pwdata_int[2]), .B(n6729), .Z(n6937) );
  ND2 U7697 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[2]), .B(n6939), .Z(
        n6936) );
  AN2P U7698 ( .A(i_ahb_hmaster_data[0]), .B(ex_i_ahb_AHB_Master_hwdata[29]), 
        .Z(ex_i_ahb_AHB_Slave_hwdata[29]) );
  ND2 U7699 ( .A(i_apb_pwdata_int[29]), .B(n10159), .Z(n6941) );
  ND2 U7700 ( .A(i_apb_U_DW_apb_ahbsif_saved_hwdata32_c[29]), .B(n6939), .Z(
        n6940) );
  AN2P U7701 ( .A(n6943), .B(n6942), .Z(n8800) );
  ND2 U7702 ( .A(i_apb_U_DW_apb_ahbsif_piped_haddr_c[1]), .B(n6997), .Z(n6947)
         );
  AN2P U7703 ( .A(n11154), .B(n8631), .Z(n6945) );
  AO3 U7704 ( .A(n5121), .B(n8800), .C(n6947), .D(n6946), .Z(n4630) );
  ND2 U7705 ( .A(i_apb_U_DW_apb_ahbsif_piped_haddr_c[6]), .B(n6997), .Z(n6951)
         );
  AN2P U7706 ( .A(ex_i_ahb_AHB_Slave_haddr[6]), .B(n8631), .Z(n6949) );
  AO3 U7707 ( .A(n4971), .B(n8800), .C(n6951), .D(n6950), .Z(n4625) );
  ND2 U7708 ( .A(i_apb_U_DW_apb_ahbsif_piped_haddr_c[2]), .B(n6997), .Z(n6954)
         );
  AN2P U7709 ( .A(ex_i_ahb_AHB_Slave_haddr[2]), .B(n8631), .Z(n6952) );
  AO3 U7710 ( .A(n5027), .B(n8800), .C(n6954), .D(n6953), .Z(n4629) );
  NR2P U7711 ( .A(n10169), .B(n6955), .Z(ex_i_ahb_AHB_Slave_haddr[13]) );
  ND2P U7712 ( .A(n5791), .B(n10004), .Z(n10020) );
  B2I U7713 ( .A(n8792), .Z1(n6300), .Z2(n8797) );
  ND2 U7714 ( .A(n8797), .B(i_apb_U_DW_apb_ahbsif_saved_haddr_c[31]), .Z(n6961) );
  NR2P U7715 ( .A(n10169), .B(n6958), .Z(ex_i_ahb_AHB_Slave_haddr[31]) );
  NR2 U7716 ( .A(n5047), .B(n6976), .Z(n6959) );
  ND2 U7717 ( .A(n8800), .B(n6959), .Z(n6960) );
  ND2 U7718 ( .A(n6961), .B(n6960), .Z(n4604) );
  AN2P U7719 ( .A(n6970), .B(n5217), .Z(n8612) );
  IVP U7720 ( .A(n8814), .Z(n6962) );
  ND2 U7721 ( .A(n10432), .B(n5034), .Z(n8812) );
  OR2P U7722 ( .A(n5014), .B(n6963), .Z(n8813) );
  AN2P U7723 ( .A(n8812), .B(n8813), .Z(n6964) );
  IVP U7724 ( .A(n4819), .Z(n6966) );
  NR2P U7725 ( .A(n10169), .B(n6966), .Z(ex_i_ahb_AHB_Slave_haddr[28]) );
  ND3 U7726 ( .A(i_apb_U_DW_apb_ahbsif_nextstate_1_), .B(
        i_apb_U_DW_apb_ahbsif_use_saved_c), .C(n8822), .Z(n6969) );
  ND2 U7727 ( .A(n8414), .B(n10432), .Z(n8416) );
  ND2 U7728 ( .A(n5034), .B(n10483), .Z(n6967) );
  OR2P U7729 ( .A(n8416), .B(n6967), .Z(n6968) );
  AO7P U7730 ( .A(n6971), .B(n6969), .C(n6968), .Z(n10023) );
  B2I U7731 ( .A(n10023), .Z2(n10081) );
  ND2 U7732 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[28]), .B(n10081), .Z(
        n6973) );
  B2IP U7733 ( .A(n10157), .Z1(n5152), .Z2(n10156) );
  AO3 U7734 ( .A(n10028), .B(n8798), .C(n6973), .D(n6972), .Z(n11064) );
  B2I U7735 ( .A(n10023), .Z2(n10073) );
  ND2 U7736 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[31]), .B(n10073), .Z(
        n6975) );
  AO3 U7737 ( .A(n10028), .B(n6976), .C(n6975), .D(n6974), .Z(n11061) );
  NR2P U7738 ( .A(n10169), .B(n6977), .Z(ex_i_ahb_AHB_Slave_haddr[30]) );
  ND2 U7739 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[30]), .B(n10073), .Z(
        n6979) );
  NR2P U7740 ( .A(n10169), .B(n6980), .Z(ex_i_ahb_AHB_Slave_haddr[25]) );
  IVP U7741 ( .A(n4818), .Z(n6982) );
  NR2P U7742 ( .A(n10169), .B(n6982), .Z(ex_i_ahb_AHB_Slave_haddr[26]) );
  ND2 U7743 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[26]), .B(n10081), .Z(
        n6984) );
  IVP U7744 ( .A(n4820), .Z(n6986) );
  NR2P U7745 ( .A(n10169), .B(n6986), .Z(ex_i_ahb_AHB_Slave_haddr[29]) );
  ND2 U7746 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[29]), .B(n10081), .Z(
        n6988) );
  NR2P U7747 ( .A(n10169), .B(n5175), .Z(ex_i_ahb_AHB_Slave_haddr[27]) );
  ND2 U7748 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[27]), .B(n10073), .Z(
        n6990) );
  AO3 U7749 ( .A(n10028), .B(n8651), .C(n6990), .D(n6989), .Z(n11065) );
  ND2 U7750 ( .A(i_apb_U_DW_apb_ahbsif_piped_haddr_c[7]), .B(n6997), .Z(n6993)
         );
  AN2P U7751 ( .A(n8631), .B(ex_i_ahb_AHB_Slave_haddr[7]), .Z(n6991) );
  AO3 U7752 ( .A(n8800), .B(n4855), .C(n6993), .D(n6992), .Z(n4624) );
  ND2 U7753 ( .A(i_apb_U_DW_apb_ahbsif_piped_haddr_c[4]), .B(n6997), .Z(n6996)
         );
  AN2P U7754 ( .A(n8631), .B(ex_i_ahb_AHB_Slave_haddr[4]), .Z(n6994) );
  AO3 U7755 ( .A(n8800), .B(n4853), .C(n6996), .D(n6995), .Z(n4627) );
  ND2 U7756 ( .A(i_apb_U_DW_apb_ahbsif_piped_haddr_c[12]), .B(n6997), .Z(n7000) );
  AN2P U7757 ( .A(n8631), .B(ex_i_ahb_AHB_Slave_haddr[12]), .Z(n6998) );
  ND2 U7758 ( .A(n5151), .B(n6998), .Z(n6999) );
  AO3 U7759 ( .A(n8800), .B(n5042), .C(n7000), .D(n6999), .Z(n4623) );
  ND2 U7760 ( .A(i_apb_U_DW_apb_ahbsif_piped_haddr_c[5]), .B(n6997), .Z(n7003)
         );
  AN2P U7761 ( .A(n8631), .B(ex_i_ahb_AHB_Slave_haddr[5]), .Z(n7001) );
  ND2 U7762 ( .A(n5151), .B(n7001), .Z(n7002) );
  AO3 U7763 ( .A(n8800), .B(n10842), .C(n7003), .D(n7002), .Z(n4626) );
  ND2 U7764 ( .A(i_apb_U_DW_apb_ahbsif_piped_haddr_c[3]), .B(n6997), .Z(n7006)
         );
  AN2P U7765 ( .A(n8631), .B(ex_i_ahb_AHB_Slave_haddr[3]), .Z(n7004) );
  AO3 U7766 ( .A(n8800), .B(n4989), .C(n7006), .D(n7005), .Z(n4628) );
  ND2 U7767 ( .A(n10051), .B(i_ahb_hrdata_s0[8]), .Z(n7007) );
  AO3 U7768 ( .A(n10054), .B(n10961), .C(n10053), .D(n7007), .Z(n4359) );
  OR2P U7769 ( .A(i_i2c_s_det), .B(i_i2c_p_det), .Z(n8103) );
  NR2 U7770 ( .A(i_i2c_slv_rxbyte_rdy), .B(n8103), .Z(n8090) );
  OR2P U7771 ( .A(i_i2c_slv_debug_cstate[1]), .B(n7481), .Z(n10364) );
  ND2 U7772 ( .A(n9135), .B(n10364), .Z(n7008) );
  ND2 U7773 ( .A(n8090), .B(n7008), .Z(n7662) );
  NR2 U7774 ( .A(n8103), .B(n10478), .Z(n10322) );
  OR2P U7775 ( .A(n10322), .B(n10327), .Z(n7661) );
  AN2P U7776 ( .A(n7662), .B(n7661), .Z(n8975) );
  ND2 U7777 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[5]), .B(n4950), 
        .Z(n7040) );
  ND2 U7778 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[7]), .B(
        i_i2c_ic_sar[3]), .Z(n7009) );
  AO7 U7779 ( .A(i_i2c_ic_sar[2]), .B(n7009), .C(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[5]), .Z(n7010) );
  ND2 U7780 ( .A(n7040), .B(n7010), .Z(n7011) );
  MUX21L U7781 ( .A(n10496), .B(n7011), .S(i_i2c_ic_sar[4]), .Z(n7023) );
  EN U7782 ( .A(i_i2c_ic_sar[1]), .B(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[2]), .Z(n7015) );
  EN U7783 ( .A(i_i2c_ic_sar[3]), .B(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[4]), .Z(n7014) );
  EN U7784 ( .A(i_i2c_ic_sar[0]), .B(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[1]), .Z(n7013) );
  EN U7785 ( .A(i_i2c_ic_sar[6]), .B(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[7]), .Z(n7012) );
  ND4 U7786 ( .A(n7015), .B(n7014), .C(n7013), .D(n7012), .Z(n7022) );
  NR2 U7787 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[1]), .B(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[6]), .Z(n7018) );
  NR2 U7788 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[7]), .B(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[2]), .Z(n7017) );
  NR2 U7789 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[4]), .B(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[3]), .Z(n7016) );
  ND4 U7790 ( .A(n7018), .B(n7017), .C(n7016), .D(n10496), .Z(n9138) );
  EN U7791 ( .A(i_i2c_ic_sar[2]), .B(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[3]), .Z(n7020) );
  EN U7792 ( .A(i_i2c_ic_sar[5]), .B(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[6]), .Z(n7019) );
  ND4 U7793 ( .A(n9138), .B(n7020), .C(n7019), .D(n11114), .Z(n7021) );
  OR3 U7794 ( .A(n7023), .B(n7022), .C(n7021), .Z(n9145) );
  AN2P U7795 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[7]), .B(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[6]), .Z(n7024) );
  ND4 U7796 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[5]), .B(n7024), 
        .C(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[4]), .D(n10441), .Z(
        n7030) );
  EN U7797 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[1]), .B(
        i_i2c_ic_sar[8]), .Z(n7026) );
  EN U7798 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[2]), .B(
        i_i2c_ic_sar[9]), .Z(n7025) );
  ND3 U7799 ( .A(i_i2c_ic_10bit_slv), .B(n7026), .C(n7025), .Z(n7027) );
  NR2 U7800 ( .A(n7030), .B(n7027), .Z(n9141) );
  ND2 U7801 ( .A(i_i2c_rx_slv_read), .B(n10608), .Z(n7028) );
  ND2 U7802 ( .A(n9141), .B(n7028), .Z(n7029) );
  NR2 U7803 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_bit_count_2to0[2]), .B(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_bit_count_2to0[1]), .Z(n8963) );
  ND3 U7804 ( .A(n8963), .B(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_bit_count_3_), 
        .C(n10518), .Z(n9142) );
  NR2 U7805 ( .A(n7661), .B(n9142), .Z(n9133) );
  AO6 U7806 ( .A(n9145), .B(n7029), .C(n9148), .Z(n7051) );
  NR2 U7807 ( .A(i_i2c_ic_10bit_slv), .B(n7030), .Z(n7031) );
  NR2 U7808 ( .A(n9141), .B(n7031), .Z(n8936) );
  ND2 U7809 ( .A(n8936), .B(n9145), .Z(n7032) );
  ND2 U7810 ( .A(n9133), .B(n7032), .Z(n7033) );
  NR2 U7811 ( .A(n11050), .B(n7033), .Z(n7035) );
  ND2 U7812 ( .A(i_i2c_sda_vld), .B(n10499), .Z(n9131) );
  OR2P U7813 ( .A(n11050), .B(n9131), .Z(n8966) );
  ND2 U7814 ( .A(n7034), .B(n8966), .Z(n9153) );
  OR2P U7815 ( .A(n7035), .B(n9153), .Z(n8938) );
  AO7 U7816 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[5]), .B(n4950), 
        .C(i_i2c_ic_10bit_slv), .Z(n7036) );
  NR2 U7817 ( .A(n9142), .B(n7036), .Z(n7048) );
  EN U7818 ( .A(i_i2c_ic_sar[3]), .B(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[3]), .Z(n7039) );
  EN U7819 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[7]), .B(
        i_i2c_ic_sar[7]), .Z(n7038) );
  EN U7820 ( .A(i_i2c_ic_sar[1]), .B(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[1]), .Z(n7037) );
  ND4 U7821 ( .A(n7040), .B(n7039), .C(n7038), .D(n7037), .Z(n7046) );
  EN U7822 ( .A(i_i2c_ic_sar[4]), .B(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[4]), .Z(n7044) );
  EN U7823 ( .A(i_i2c_ic_sar[6]), .B(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[6]), .Z(n7043) );
  EN U7824 ( .A(i_i2c_ic_sar[2]), .B(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[2]), .Z(n7042) );
  EN U7825 ( .A(i_i2c_ic_sar[0]), .B(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[0]), .Z(n7041) );
  ND4 U7826 ( .A(n7044), .B(n7043), .C(n7042), .D(n7041), .Z(n7045) );
  NR2 U7827 ( .A(n7046), .B(n7045), .Z(n7047) );
  AN3 U7828 ( .A(n8091), .B(n7048), .C(n7047), .Z(n9144) );
  AO2 U7829 ( .A(n7051), .B(n8938), .C(n9144), .D(n7050), .Z(n7054) );
  ND2 U7830 ( .A(i_i2c_rx_addr_match), .B(n7052), .Z(n7053) );
  AO7 U7831 ( .A(n8975), .B(n7054), .C(n7053), .Z(n4300) );
  NR2 U7832 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_U_scl_sync_data_d_int_0_), .B(
        n5052), .Z(n7060) );
  NR2 U7833 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[4]), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[2]), .Z(n7058) );
  NR2 U7834 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[6]), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[3]), .Z(n7057) );
  NR2 U7835 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[7]), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[5]), .Z(n7056) );
  NR2 U7836 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[1]), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[0]), .Z(n7055) );
  ND4 U7837 ( .A(n7058), .B(n7057), .C(n7056), .D(n7055), .Z(n7059) );
  AN2P U7838 ( .A(n7060), .B(n7059), .Z(n10199) );
  AO2 U7839 ( .A(i_i2c_ic_spklen_o[7]), .B(n10489), .C(i_i2c_ic_spklen_o[6]), 
        .D(n10434), .Z(n7541) );
  AO2 U7840 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[1]), .B(n8680), 
        .C(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[2]), .D(n4968), .Z(
        n7534) );
  ND2 U7841 ( .A(n7541), .B(n7534), .Z(n7064) );
  AO2 U7842 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[6]), .B(n10829), .C(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[5]), .D(n10464), .Z(n7540)
         );
  AO2 U7843 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[3]), .B(n10830), .C(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[4]), .D(n11036), .Z(n7061)
         );
  ND2 U7844 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[7]), .B(n10831), .Z(n7545) );
  ND3 U7845 ( .A(n7540), .B(n7061), .C(n7545), .Z(n7533) );
  AO2 U7846 ( .A(n8732), .B(n10490), .C(i_i2c_ic_spklen_o[0]), .D(n10425), .Z(
        n7537) );
  AO2 U7847 ( .A(i_i2c_ic_spklen_o[3]), .B(n10491), .C(i_i2c_ic_spklen_o[2]), 
        .D(n5051), .Z(n7535) );
  AO2 U7848 ( .A(i_i2c_ic_spklen_o[5]), .B(n10492), .C(i_i2c_ic_spklen_o[4]), 
        .D(n10435), .Z(n7543) );
  ND2 U7849 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[0]), .B(n10583), .Z(n7062) );
  ND4 U7850 ( .A(n7537), .B(n7535), .C(n7543), .D(n7062), .Z(n7063) );
  MUX21L U7851 ( .A(n10548), .B(i_i2c_U_DW_apb_i2c_rx_filter_sda_data_int), 
        .S(n7065), .Z(n8506) );
  NR2 U7852 ( .A(i_i2c_ic_sda_rx_hold_sync[1]), .B(
        i_i2c_ic_sda_rx_hold_sync[2]), .Z(n7069) );
  NR2 U7853 ( .A(i_i2c_ic_sda_rx_hold_sync[3]), .B(
        i_i2c_ic_sda_rx_hold_sync[4]), .Z(n7068) );
  NR2 U7854 ( .A(i_i2c_ic_sda_rx_hold_sync[5]), .B(
        i_i2c_ic_sda_rx_hold_sync[6]), .Z(n7067) );
  NR2 U7855 ( .A(i_i2c_ic_sda_rx_hold_sync[7]), .B(
        i_i2c_ic_sda_rx_hold_sync[0]), .Z(n7066) );
  ND4 U7856 ( .A(n7069), .B(n7068), .C(n7067), .D(n7066), .Z(n8503) );
  ND2 U7857 ( .A(i_i2c_scl_int), .B(n8503), .Z(n7070) );
  MUX21LP U7858 ( .A(n10545), .B(n8506), .S(n7070), .Z(i_i2c_sda_int) );
  OR2P U7859 ( .A(n9692), .B(n10511), .Z(n7071) );
  AO7P U7860 ( .A(i_i2c_scl_int), .B(n7071), .C(n10430), .Z(n10254) );
  OR2P U7861 ( .A(n10532), .B(n10254), .Z(n10263) );
  NR3 U7862 ( .A(i_i2c_mst_rx_bit_count[2]), .B(i_i2c_mst_rx_bit_count[1]), 
        .C(i_i2c_mst_rx_bit_count[0]), .Z(n8478) );
  OR2P U7863 ( .A(i_i2c_scl_lcnt_cmplt), .B(i_i2c_mst_rx_bit_count[3]), .Z(
        n10252) );
  AO2 U7864 ( .A(i_i2c_mst_rx_bit_count[3]), .B(n7072), .C(n10254), .D(n10252), 
        .Z(n8837) );
  AN2P U7865 ( .A(i_i2c_rx_scl_hcnt_en), .B(i_i2c_rx_scl_lcnt_en), .Z(n7073)
         );
  ND2 U7866 ( .A(n8478), .B(i_i2c_mst_rx_bit_count[3]), .Z(n8563) );
  AN2P U7867 ( .A(n9613), .B(n10534), .Z(n11109) );
  AO7 U7868 ( .A(n7436), .B(n8563), .C(n11109), .Z(n8538) );
  OR2P U7869 ( .A(n8946), .B(n8538), .Z(n10266) );
  OR2P U7870 ( .A(n8837), .B(n10266), .Z(n10269) );
  AN2P U7871 ( .A(n10263), .B(n10269), .Z(n10271) );
  AO2 U7872 ( .A(n10271), .B(n7075), .C(n7074), .D(n4891), .Z(n4049) );
  NR2 U7873 ( .A(
        i_i2c_U_DW_apb_i2c_rx_filter_delay_re_start_en_or_split_start_en[0]), 
        .B(i_i2c_U_DW_apb_i2c_rx_filter_delay_re_start_en_or_split_start_en[3]), .Z(n7077) );
  NR2 U7874 ( .A(
        i_i2c_U_DW_apb_i2c_rx_filter_delay_re_start_en_or_split_start_en[1]), 
        .B(i_i2c_U_DW_apb_i2c_rx_filter_delay_re_start_en_or_split_start_en[2]), .Z(n7076) );
  AN3 U7875 ( .A(n7077), .B(n7076), .C(n8103), .Z(n7097) );
  ND2 U7876 ( .A(i_i2c_mst_rx_ack_vld), .B(n11109), .Z(n10255) );
  ND2 U7877 ( .A(n7390), .B(n10534), .Z(n7089) );
  NR2 U7878 ( .A(i_i2c_mst_debug_cstate[4]), .B(i_i2c_mst_debug_cstate[0]), 
        .Z(n7267) );
  ND2 U7879 ( .A(n7283), .B(n7267), .Z(n7621) );
  AN2P U7880 ( .A(i_i2c_mst_debug_cstate[0]), .B(i_i2c_mst_debug_cstate[3]), 
        .Z(n7093) );
  NR2 U7881 ( .A(i_i2c_mst_debug_cstate[4]), .B(n7079), .Z(n7080) );
  ND2 U7882 ( .A(n7093), .B(n7080), .Z(n7327) );
  ND2 U7883 ( .A(n7621), .B(n7327), .Z(n7402) );
  NR2 U7884 ( .A(n7334), .B(n7402), .Z(n7083) );
  IVDAP U7885 ( .A(n7346), .Y(n5086), .Z(n9480) );
  AO6 U7886 ( .A(n7083), .B(n7990), .C(i_i2c_byte_wait_scl), .Z(n7085) );
  ND2 U7887 ( .A(n7085), .B(n8432), .Z(n7088) );
  ND2 U7888 ( .A(n7450), .B(n10534), .Z(n7086) );
  OR2P U7889 ( .A(n5088), .B(n7086), .Z(n7087) );
  AO3P U7890 ( .A(n7089), .B(n7466), .C(n7088), .D(n7087), .Z(n7090) );
  ND2 U7891 ( .A(n10495), .B(n11052), .Z(n7092) );
  ND2 U7892 ( .A(i_i2c_scl_int), .B(n5053), .Z(n10297) );
  NR2 U7893 ( .A(i_i2c_sda_int), .B(n10297), .Z(n7091) );
  AN2P U7894 ( .A(i_i2c_sda_int), .B(n8408), .Z(n8410) );
  MUX21L U7895 ( .A(n7091), .B(n8410), .S(i_i2c_ic_data_oe), .Z(n10299) );
  AO6 U7896 ( .A(n10255), .B(n7092), .C(n10299), .Z(n7096) );
  NR2 U7897 ( .A(i_i2c_mst_debug_cstate[4]), .B(n10475), .Z(n7279) );
  AN3 U7898 ( .A(n7283), .B(n7279), .C(n10473), .Z(n7297) );
  AN2P U7899 ( .A(n7093), .B(n10465), .Z(n7281) );
  ND2 U7900 ( .A(n7453), .B(n7281), .Z(n7308) );
  AO7 U7901 ( .A(i_i2c_U_DW_apb_i2c_mstfsm_delay_stop_en), .B(n7094), .C(n7308), .Z(n7095) );
  AN2P U7902 ( .A(n10534), .B(n7095), .Z(n11110) );
  AO3 U7903 ( .A(n7097), .B(n7096), .C(n10429), .D(n7943), .Z(n7099) );
  ND2 U7904 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_mst_arb_lost), .B(n10297), .Z(
        n7098) );
  AO6 U7905 ( .A(n7099), .B(n7098), .C(n10768), .Z(n4057) );
  ND2 U7906 ( .A(i_i2c_ic_lcnt[1]), .B(i_i2c_ic_lcnt[0]), .Z(n7133) );
  OR2P U7907 ( .A(n7133), .B(n5061), .Z(n7136) );
  NR2 U7908 ( .A(n10994), .B(n7136), .Z(n7128) );
  AN2P U7909 ( .A(i_i2c_ic_lcnt[4]), .B(n7128), .Z(n7146) );
  ND2 U7910 ( .A(i_i2c_ic_lcnt[5]), .B(n7146), .Z(n7150) );
  OR2P U7911 ( .A(n5058), .B(n7150), .Z(n7157) );
  ND2 U7912 ( .A(i_i2c_ic_lcnt[8]), .B(i_i2c_ic_lcnt[7]), .Z(n7100) );
  OR2P U7913 ( .A(n7157), .B(n7100), .Z(n7124) );
  NR2 U7914 ( .A(n11023), .B(n7124), .Z(n7119) );
  AN2P U7915 ( .A(i_i2c_ic_lcnt[10]), .B(n7119), .Z(n7118) );
  AN2P U7916 ( .A(i_i2c_ic_lcnt[11]), .B(n7118), .Z(n7109) );
  ND2 U7917 ( .A(i_i2c_ic_lcnt[12]), .B(n7109), .Z(n7111) );
  OR2P U7918 ( .A(n7111), .B(n11025), .Z(n7103) );
  ND2 U7919 ( .A(n7111), .B(n11025), .Z(n7101) );
  ND2 U7920 ( .A(n7103), .B(n7101), .Z(n7112) );
  AN2P U7921 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[13]), .B(n7112), 
        .Z(n7175) );
  OR2P U7922 ( .A(n7103), .B(n11029), .Z(n7102) );
  EO U7923 ( .A(n7102), .B(i_i2c_ic_lcnt[15]), .Z(n7107) );
  ND2 U7924 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[15]), .B(n7107), .Z(
        n7115) );
  EN U7925 ( .A(n7103), .B(i_i2c_ic_lcnt[14]), .Z(n7106) );
  IVP U7926 ( .A(n7106), .Z(n7104) );
  ND2 U7927 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[14]), .B(n7104), .Z(
        n7105) );
  ND2 U7928 ( .A(n7115), .B(n7105), .Z(n8440) );
  NR2 U7929 ( .A(n7175), .B(n8440), .Z(n7117) );
  ND2 U7930 ( .A(n7106), .B(n10568), .Z(n7108) );
  OR2P U7931 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[15]), .B(n7107), 
        .Z(n8441) );
  ND2 U7932 ( .A(n7108), .B(n8441), .Z(n7116) );
  IVP U7933 ( .A(n7109), .Z(n7173) );
  ND2 U7934 ( .A(n10882), .B(n7173), .Z(n7110) );
  ND2 U7935 ( .A(n7111), .B(n7110), .Z(n7176) );
  NR2 U7936 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[12]), .B(n7176), .Z(
        n7114) );
  NR2 U7937 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[13]), .B(n7112), .Z(
        n7113) );
  OR2P U7938 ( .A(n7113), .B(n7116), .Z(n8443) );
  OR2P U7939 ( .A(n7114), .B(n8443), .Z(n8453) );
  AO3 U7940 ( .A(n7117), .B(n7116), .C(n7115), .D(n8453), .Z(n7182) );
  IVP U7941 ( .A(n7118), .Z(n7171) );
  IVP U7942 ( .A(n7119), .Z(n7122) );
  ND2 U7943 ( .A(n4892), .B(n7122), .Z(n7120) );
  ND2 U7944 ( .A(n7171), .B(n7120), .Z(n7170) );
  ND2 U7945 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[10]), .B(n7170), .Z(
        n8447) );
  ND2 U7946 ( .A(n11023), .B(n7124), .Z(n7121) );
  ND2 U7947 ( .A(n7122), .B(n7121), .Z(n7127) );
  OR2P U7948 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[9]), .B(n7127), .Z(
        n7126) );
  AO7 U7949 ( .A(n7157), .B(n5059), .C(n10883), .Z(n7123) );
  ND2 U7950 ( .A(n7124), .B(n7123), .Z(n7163) );
  OR2P U7951 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[8]), .B(n7163), .Z(
        n7125) );
  AN2P U7952 ( .A(n7126), .B(n7125), .Z(n7169) );
  ND2 U7953 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[9]), .B(n7127), .Z(
        n7165) );
  IVP U7954 ( .A(n7146), .Z(n7131) );
  IVP U7955 ( .A(n7128), .Z(n7129) );
  ND2 U7956 ( .A(n5060), .B(n7129), .Z(n7130) );
  AN2P U7957 ( .A(n7131), .B(n7130), .Z(n7145) );
  IVP U7958 ( .A(n7145), .Z(n7149) );
  ND2 U7959 ( .A(n7133), .B(n5061), .Z(n7132) );
  ND2 U7960 ( .A(n7136), .B(n7132), .Z(n7140) );
  OR2P U7961 ( .A(i_i2c_ic_lcnt[1]), .B(i_i2c_ic_lcnt[0]), .Z(n9702) );
  ND2 U7962 ( .A(n7133), .B(n9702), .Z(n9704) );
  AO4 U7963 ( .A(i_i2c_ic_lcnt[0]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[0]), .C(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[1]), .D(n9704), .Z(n7135) );
  ND2 U7964 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[2]), .B(n7140), .Z(
        n7134) );
  AO3 U7965 ( .A(i_i2c_ic_lcnt[1]), .B(n10474), .C(n7135), .D(n7134), .Z(n7139) );
  IVP U7966 ( .A(n7136), .Z(n7137) );
  EO U7967 ( .A(n7137), .B(i_i2c_ic_lcnt[3]), .Z(n7141) );
  ND2 U7968 ( .A(n7141), .B(n10692), .Z(n7138) );
  AO3 U7969 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[2]), .B(n7140), .C(
        n7139), .D(n7138), .Z(n7144) );
  IVP U7970 ( .A(n7141), .Z(n7142) );
  ND2 U7971 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[3]), .B(n7142), .Z(
        n7143) );
  AO3 U7972 ( .A(n7145), .B(n10691), .C(n7144), .D(n7143), .Z(n7148) );
  EO U7973 ( .A(n7146), .B(i_i2c_ic_lcnt[5]), .Z(n7152) );
  ND2 U7974 ( .A(n7152), .B(n10690), .Z(n7147) );
  AO3 U7975 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[4]), .B(n7149), .C(
        n7148), .D(n7147), .Z(n7156) );
  ND2 U7976 ( .A(n5058), .B(n7150), .Z(n7151) );
  ND2 U7977 ( .A(n7157), .B(n7151), .Z(n7158) );
  ND2 U7978 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[6]), .B(n7158), .Z(
        n7155) );
  IVP U7979 ( .A(n7152), .Z(n7153) );
  ND2 U7980 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[5]), .B(n7153), .Z(
        n7154) );
  AN3 U7981 ( .A(n7156), .B(n7155), .C(n7154), .Z(n7162) );
  EO U7982 ( .A(n7157), .B(i_i2c_ic_lcnt[7]), .Z(n7159) );
  AO4 U7983 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[6]), .B(n7158), .C(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[7]), .D(n7159), .Z(n7161) );
  ND2 U7984 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[7]), .B(n7159), .Z(
        n7160) );
  AO7 U7985 ( .A(n7162), .B(n7161), .C(n7160), .Z(n7167) );
  ND2 U7986 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[8]), .B(n7163), .Z(
        n7164) );
  ND2 U7987 ( .A(n7165), .B(n7164), .Z(n7166) );
  AO4P U7988 ( .A(n7169), .B(n7168), .C(n7167), .D(n7166), .Z(n8448) );
  NR2 U7989 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[10]), .B(n7170), .Z(
        n8449) );
  ND2 U7990 ( .A(n10884), .B(n7171), .Z(n7172) );
  ND2 U7991 ( .A(n7173), .B(n7172), .Z(n7174) );
  NR2 U7992 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[11]), .B(n7174), .Z(
        n8444) );
  AO1P U7993 ( .A(n8447), .B(n8448), .C(n8449), .D(n8444), .Z(n7180) );
  AN2P U7994 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[11]), .B(n7174), 
        .Z(n8445) );
  ND2 U7995 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[12]), .B(n7176), .Z(
        n7177) );
  ND2 U7996 ( .A(n7178), .B(n7177), .Z(n7179) );
  OR2P U7997 ( .A(n8440), .B(n7179), .Z(n8455) );
  OR3 U7998 ( .A(n7180), .B(n8445), .C(n8455), .Z(n7181) );
  AN2P U7999 ( .A(n7182), .B(n7181), .Z(n7186) );
  NR2 U8000 ( .A(i_i2c_s_det), .B(n10447), .Z(n7184) );
  AN3 U8001 ( .A(i_i2c_sda_int), .B(n7184), .C(i_i2c_scl_int), .Z(n7183) );
  B2I U8002 ( .A(n7207), .Z2(n7430) );
  AN3 U8003 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_count_en), .B(n7184), .C(
        i_i2c_scl_int), .Z(n7185) );
  AN2P U8004 ( .A(i_i2c_sda_int), .B(n7185), .Z(n7188) );
  ND2P U8005 ( .A(n7188), .B(n7187), .Z(n7223) );
  IVP U8006 ( .A(n7223), .Z(n7221) );
  EN U8007 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[2]), .B(n10692), .Z(
        n7189) );
  ND2 U8008 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[1]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[0]), .Z(n7232) );
  MUX21H U8009 ( .A(n7189), .B(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[3]), 
        .S(n7232), .Z(n7190) );
  ND2 U8010 ( .A(n7221), .B(n7190), .Z(n7191) );
  AO7 U8011 ( .A(n7430), .B(n10692), .C(n7191), .Z(n4316) );
  EN U8012 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[4]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[5]), .Z(n7193) );
  ND2 U8013 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[2]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[3]), .Z(n7192) );
  NR2 U8014 ( .A(n7192), .B(n7232), .Z(n7214) );
  MUX21L U8015 ( .A(n7193), .B(n10690), .S(n7236), .Z(n7194) );
  ND2 U8016 ( .A(n7221), .B(n7194), .Z(n7195) );
  AO7 U8017 ( .A(n7430), .B(n10690), .C(n7195), .Z(n4314) );
  ND2 U8018 ( .A(n7221), .B(n7196), .Z(n7197) );
  AO7 U8019 ( .A(n7430), .B(n10474), .C(n7197), .Z(n4318) );
  EN U8020 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[10]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[11]), .Z(n7198) );
  ND2 U8021 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[8]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[9]), .Z(n7239) );
  ND2 U8022 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[4]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[5]), .Z(n7224) );
  ND2 U8023 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[6]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[7]), .Z(n7200) );
  NR2 U8024 ( .A(n7224), .B(n7200), .Z(n7201) );
  ND2 U8025 ( .A(n7201), .B(n7214), .Z(n7426) );
  MUX21L U8026 ( .A(n7199), .B(n10759), .S(n7426), .Z(n7202) );
  ND2 U8027 ( .A(n7221), .B(n7202), .Z(n7203) );
  AO7 U8028 ( .A(n7430), .B(n10759), .C(n7203), .Z(n4308) );
  EN U8029 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[8]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[9]), .Z(n7204) );
  MUX21L U8030 ( .A(n7204), .B(n10760), .S(n7426), .Z(n7205) );
  ND2 U8031 ( .A(n7221), .B(n7205), .Z(n7206) );
  AO7 U8032 ( .A(n7430), .B(n10760), .C(n7206), .Z(n4310) );
  B2I U8033 ( .A(n7207), .Z2(n9314) );
  ND2 U8034 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[13]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[12]), .Z(n7422) );
  EO U8035 ( .A(n7422), .B(n10568), .Z(n7209) );
  ND2 U8036 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[10]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[11]), .Z(n7208) );
  NR2 U8037 ( .A(n7239), .B(n7208), .Z(n7424) );
  MUX21L U8038 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[14]), .B(n7209), 
        .S(n7424), .Z(n7210) );
  MUX21L U8039 ( .A(n7210), .B(n10568), .S(n7426), .Z(n7211) );
  ND2 U8040 ( .A(n7221), .B(n7211), .Z(n7212) );
  AO7 U8041 ( .A(n9314), .B(n10568), .C(n7212), .Z(n4305) );
  EN U8042 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[6]), .B(n10762), .Z(
        n7213) );
  MUX21L U8043 ( .A(n7213), .B(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[7]), 
        .S(n7224), .Z(n7215) );
  MUX21L U8044 ( .A(n10762), .B(n7215), .S(n7214), .Z(n7216) );
  ND2 U8045 ( .A(n7221), .B(n7216), .Z(n7217) );
  AO7 U8046 ( .A(n7430), .B(n10762), .C(n7217), .Z(n4312) );
  MUX21L U8047 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[13]), .B(n7218), 
        .S(n7424), .Z(n7219) );
  MUX21L U8048 ( .A(n7219), .B(n10758), .S(n7426), .Z(n7220) );
  ND2 U8049 ( .A(n7221), .B(n7220), .Z(n7222) );
  AO7 U8050 ( .A(n7430), .B(n10758), .C(n7222), .Z(n4306) );
  EN U8051 ( .A(n7225), .B(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[6]), .Z(
        n7226) );
  MUX21L U8052 ( .A(n7226), .B(n10689), .S(n7236), .Z(n7227) );
  ND2 U8053 ( .A(n9313), .B(n7227), .Z(n7228) );
  AO7 U8054 ( .A(n9314), .B(n10689), .C(n7228), .Z(n4313) );
  EN U8055 ( .A(n7424), .B(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[12]), .Z(
        n7229) );
  MUX21L U8056 ( .A(n7229), .B(n10687), .S(n7426), .Z(n7230) );
  ND2 U8057 ( .A(n9313), .B(n7230), .Z(n7231) );
  AO7 U8058 ( .A(n9314), .B(n10687), .C(n7231), .Z(n4307) );
  EN U8059 ( .A(n7233), .B(n10763), .Z(n7234) );
  ND2 U8060 ( .A(n9313), .B(n7234), .Z(n7235) );
  AO7 U8061 ( .A(n9314), .B(n10763), .C(n7235), .Z(n4317) );
  EO U8062 ( .A(n7236), .B(n10691), .Z(n7237) );
  ND2 U8063 ( .A(n9313), .B(n7237), .Z(n7238) );
  AO7 U8064 ( .A(n9314), .B(n10691), .C(n7238), .Z(n4315) );
  EN U8065 ( .A(n7240), .B(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[10]), .Z(
        n7241) );
  MUX21L U8066 ( .A(n7241), .B(n10688), .S(n7426), .Z(n7242) );
  ND2 U8067 ( .A(n9313), .B(n7242), .Z(n7243) );
  AO7 U8068 ( .A(n9314), .B(n10688), .C(n7243), .Z(n4309) );
  EO U8069 ( .A(n7426), .B(n10761), .Z(n7244) );
  ND2 U8070 ( .A(n9313), .B(n7244), .Z(n7245) );
  AO7 U8071 ( .A(n9314), .B(n10761), .C(n7245), .Z(n4311) );
  ND2 U8072 ( .A(n7247), .B(n7246), .Z(n7367) );
  OR2P U8073 ( .A(n7402), .B(n7518), .Z(i_i2c_U_DW_apb_i2c_mstfsm_N399) );
  ND2 U8074 ( .A(i_i2c_ic_tar[11]), .B(i_i2c_ic_tar[10]), .Z(n7871) );
  AO7 U8075 ( .A(n10516), .B(n7871), .C(n9236), .Z(n7872) );
  ND2 U8076 ( .A(n7517), .B(n10494), .Z(n7399) );
  MUX21L U8077 ( .A(n10436), .B(n5099), .S(
        i_i2c_U_DW_apb_i2c_mstfsm_mst_tx_flush), .Z(n7248) );
  ND3 U8078 ( .A(i_i2c_ic_bus_idle), .B(n10493), .C(n7248), .Z(n7343) );
  ND2 U8079 ( .A(n7344), .B(n7249), .Z(n7250) );
  OR2P U8080 ( .A(n7402), .B(n7250), .Z(n7875) );
  NR2 U8081 ( .A(n7251), .B(n7875), .Z(n7255) );
  OR2P U8082 ( .A(n7402), .B(n7399), .Z(i_i2c_U_DW_apb_i2c_mstfsm_N457) );
  IVP U8083 ( .A(i_i2c_U_DW_apb_i2c_mstfsm_N457), .Z(n9617) );
  AO7 U8084 ( .A(i_i2c_mst_activity), .B(n4905), .C(i_i2c_ic_abort_sync), .Z(
        n7252) );
  OR2P U8085 ( .A(i_i2c_U_DW_apb_i2c_mstfsm_N457), .B(n7252), .Z(n7844) );
  AO3 U8086 ( .A(n9920), .B(n9617), .C(n7844), .D(n7253), .Z(n7254) );
  NR2 U8087 ( .A(n7255), .B(n7254), .Z(n7256) );
  AO3 U8088 ( .A(n7257), .B(n5088), .C(n7256), .D(n7273), .Z(n7258) );
  OR2P U8089 ( .A(n7367), .B(n7258), .Z(n9083) );
  NR2 U8090 ( .A(i_i2c_rx_gen_call), .B(n10540), .Z(n7259) );
  ND4 U8091 ( .A(n10322), .B(i_i2c_rx_slv_read), .C(i_i2c_rx_addr_match), .D(
        n7259), .Z(n7260) );
  NR2 U8092 ( .A(n10327), .B(n7260), .Z(n8079) );
  ND4 U8093 ( .A(n10324), .B(n7459), .C(i_i2c_slv_tx_cmplt), .D(n10551), .Z(
        n7261) );
  NR2 U8094 ( .A(n7549), .B(n7261), .Z(n7632) );
  AO7 U8095 ( .A(n8079), .B(n7632), .C(
        i_i2c_U_DW_apb_i2c_sync_tx_empty_int_inv), .Z(n7762) );
  ND2 U8096 ( .A(i_i2c_slv_debug_cstate[3]), .B(n10440), .Z(n7262) );
  OR2P U8097 ( .A(n7263), .B(n7262), .Z(n10246) );
  AO6 U8098 ( .A(n10246), .B(n7549), .C(n8103), .Z(n7550) );
  ND2 U8099 ( .A(n7550), .B(n8118), .Z(n7264) );
  ND2 U8100 ( .A(n7762), .B(n7264), .Z(n10251) );
  OR2P U8101 ( .A(n9083), .B(n10251), .Z(i_i2c_U_DW_apb_i2c_toggle_tx_abrt) );
  NR2 U8102 ( .A(i_i2c_U_DW_apb_i2c_mstfsm_N362), .B(n10484), .Z(n7378) );
  ND4 U8103 ( .A(i_i2c_mst_debug_cstate[4]), .B(i_i2c_mst_debug_cstate[0]), 
        .C(n7283), .D(n10473), .Z(n7620) );
  NR2 U8104 ( .A(n7378), .B(n7620), .Z(n7349) );
  NR2 U8105 ( .A(n7307), .B(n7308), .Z(n7266) );
  OR2P U8106 ( .A(n7349), .B(n7266), .Z(n4667) );
  NR2 U8107 ( .A(n4667), .B(i_i2c_start_en), .Z(n7409) );
  NR2 U8108 ( .A(n7268), .B(n10473), .Z(n7320) );
  ND2 U8109 ( .A(i_i2c_scl_s_setup_cmplt), .B(i_i2c_scl_s_hld_cmplt), .Z(n8430) );
  AN2P U8110 ( .A(i_i2c_mst_debug_cstate[1]), .B(n8430), .Z(n7269) );
  ND2 U8111 ( .A(n7320), .B(n7269), .Z(n7381) );
  ND2 U8112 ( .A(n7517), .B(n7466), .Z(n7270) );
  AO6 U8113 ( .A(n7381), .B(n7270), .C(n10472), .Z(n7306) );
  ND2 U8114 ( .A(n7274), .B(n7316), .Z(n7294) );
  EO U8115 ( .A(i_i2c_tx_fifo_data_buf[8]), .B(
        i_i2c_U_DW_apb_i2c_mstfsm_old_is_read), .Z(n7292) );
  AO7 U8116 ( .A(n7317), .B(n10515), .C(n10438), .Z(n7271) );
  NR2 U8117 ( .A(n7294), .B(n7271), .Z(n7272) );
  ND2 U8118 ( .A(n7272), .B(n7337), .Z(n7311) );
  OR2P U8119 ( .A(i_i2c_U_DW_apb_i2c_mstfsm_addr_1byte_sent), .B(n7311), .Z(
        n7373) );
  ND2 U8120 ( .A(n7373), .B(n7273), .Z(n7305) );
  AO6 U8121 ( .A(n7292), .B(i_i2c_U_DW_apb_i2c_sync_ic_rstrt_en_sync_inv), .C(
        n10536), .Z(n7290) );
  ND2 U8122 ( .A(n7274), .B(i_i2c_U_DW_apb_i2c_sync_ic_10bit_mst_sync_inv), 
        .Z(n7319) );
  NR2 U8123 ( .A(n7275), .B(n7319), .Z(n7276) );
  ND2 U8124 ( .A(n7276), .B(n7337), .Z(n7360) );
  NR2 U8125 ( .A(i_i2c_mst_debug_cstate[1]), .B(i_i2c_mst_debug_cstate[2]), 
        .Z(n7280) );
  NR2 U8126 ( .A(i_i2c_mst_debug_cstate[3]), .B(n7277), .Z(n7278) );
  ND2 U8127 ( .A(n7279), .B(n7278), .Z(n7878) );
  OR2P U8128 ( .A(n10484), .B(n7878), .Z(n7451) );
  NR2 U8129 ( .A(n4938), .B(n7451), .Z(n7286) );
  ND2 U8130 ( .A(n7281), .B(n7280), .Z(n7351) );
  ND2 U8131 ( .A(n7282), .B(n7320), .Z(n7380) );
  AO6 U8132 ( .A(n7351), .B(n7380), .C(n8430), .Z(n7285) );
  ND2 U8133 ( .A(n7518), .B(n10475), .Z(n9466) );
  AN2P U8134 ( .A(n7283), .B(n7517), .Z(n9481) );
  ND2 U8135 ( .A(i_i2c_tx_fifo_data_buf[8]), .B(n9481), .Z(n7448) );
  ND3 U8136 ( .A(n9466), .B(n7620), .C(n7448), .Z(n7284) );
  NR4 U8137 ( .A(n7390), .B(n7286), .C(n7285), .D(n7284), .Z(n7289) );
  ND2 U8138 ( .A(i_i2c_ack_det), .B(i_i2c_U_DW_apb_i2c_sync_tx_empty_int_inv), 
        .Z(n7287) );
  NR2 U8139 ( .A(i_i2c_ic_abort_sync), .B(n7287), .Z(n7328) );
  NR2 U8140 ( .A(n7328), .B(n9473), .Z(n7350) );
  ND2 U8141 ( .A(n6894), .B(n7350), .Z(n7288) );
  AO3 U8142 ( .A(n7290), .B(n7360), .C(n7289), .D(n7288), .Z(n7304) );
  NR2 U8143 ( .A(i_i2c_U_DW_apb_i2c_sync_ic_10bit_mst_sync_inv), .B(n10515), 
        .Z(n7291) );
  ND2 U8144 ( .A(n7292), .B(n7291), .Z(n7293) );
  NR2 U8145 ( .A(n7294), .B(n7293), .Z(n7295) );
  ND2 U8146 ( .A(n7295), .B(n7337), .Z(n7385) );
  OR2P U8147 ( .A(i_i2c_tx_fifo_data_buf[8]), .B(
        i_i2c_U_DW_apb_i2c_sync_ic_rstrt_en_sync_inv), .Z(n7325) );
  NR2 U8148 ( .A(n7324), .B(n7325), .Z(n7296) );
  NR2 U8149 ( .A(n7296), .B(n7618), .Z(n7301) );
  ND2 U8150 ( .A(n7297), .B(n7307), .Z(n7298) );
  ND2 U8151 ( .A(n7308), .B(n7298), .Z(n7299) );
  NR4 U8152 ( .A(n9613), .B(n7301), .C(n7300), .D(n7299), .Z(n7303) );
  ND2 U8153 ( .A(n9480), .B(n7466), .Z(n7302) );
  AO3 U8154 ( .A(n10516), .B(n7385), .C(n7303), .D(n7302), .Z(n7366) );
  OR4P U8155 ( .A(n7306), .B(n7305), .C(n7304), .D(n7366), .Z(n10279) );
  IVP U8156 ( .A(n10279), .Z(n7370) );
  NR2 U8157 ( .A(n7309), .B(n7308), .Z(n7312) );
  ND2 U8158 ( .A(n9326), .B(n8432), .Z(n7310) );
  AO7P U8159 ( .A(n10536), .B(n7311), .C(n7310), .Z(n7362) );
  NR2 U8160 ( .A(n7312), .B(n7362), .Z(n7395) );
  ND2 U8161 ( .A(i_i2c_tx_fifo_data_buf[8]), .B(
        i_i2c_U_DW_apb_i2c_mstfsm_addr_2byte_sent), .Z(n7313) );
  NR2 U8162 ( .A(n7317), .B(n7313), .Z(n7374) );
  ND2 U8163 ( .A(n10039), .B(n7374), .Z(n7447) );
  AN3 U8164 ( .A(n7314), .B(n7990), .C(n7447), .Z(n7315) );
  NR2 U8165 ( .A(n7315), .B(n7466), .Z(n7340) );
  AO3 U8166 ( .A(i_i2c_U_DW_apb_i2c_sync_ic_rstrt_en_sync_inv), .B(n7317), .C(
        i_i2c_U_DW_apb_i2c_mstfsm_addr_1byte_sent), .D(n7316), .Z(n7318) );
  NR2 U8167 ( .A(n7319), .B(n7318), .Z(n7323) );
  AO3 U8168 ( .A(n7455), .B(n7321), .C(n7381), .D(n7451), .Z(n7322) );
  NR2 U8169 ( .A(n7323), .B(n7322), .Z(n7333) );
  NR2 U8170 ( .A(n7618), .B(n7324), .Z(n7458) );
  IVA U8171 ( .A(n7325), .Z(n7326) );
  ND2 U8172 ( .A(i_i2c_U_DW_apb_i2c_sync_ic_10bit_mst_sync_inv), .B(n7326), 
        .Z(n7330) );
  B2I U8173 ( .A(n7327), .Z1(n9326), .Z2(n9473) );
  NR2 U8174 ( .A(n9473), .B(n7329), .Z(n7463) );
  AO1P U8175 ( .A(n7458), .B(n7330), .C(n9613), .D(n7463), .Z(n7332) );
  MUX21L U8176 ( .A(n7390), .B(n7450), .S(i_i2c_ack_det), .Z(n7331) );
  AN3 U8177 ( .A(n7333), .B(n7332), .C(n7331), .Z(n7336) );
  ND2 U8178 ( .A(n7334), .B(n8432), .Z(n7335) );
  AO3 U8179 ( .A(n7338), .B(n7337), .C(n7336), .D(n7335), .Z(n7339) );
  OR2P U8180 ( .A(n7340), .B(n7339), .Z(n9614) );
  OR2P U8181 ( .A(n7364), .B(i_i2c_tx_fifo_data_buf[8]), .Z(n7391) );
  ND2 U8182 ( .A(n7385), .B(n7391), .Z(n7341) );
  NR2 U8183 ( .A(n9614), .B(n7341), .Z(n7342) );
  AN2P U8184 ( .A(n7395), .B(n7342), .Z(n9620) );
  NR2 U8185 ( .A(n7343), .B(n7872), .Z(n7345) );
  ND2 U8186 ( .A(n7345), .B(n7344), .Z(n7357) );
  NR2 U8187 ( .A(i_i2c_scl_s_hld_cmplt), .B(n7878), .Z(n7348) );
  NR2 U8188 ( .A(i_i2c_tx_fifo_data_buf[8]), .B(n5086), .Z(n7347) );
  NR4 U8189 ( .A(n7350), .B(n7349), .C(n7348), .D(n7347), .Z(n7356) );
  ND2 U8190 ( .A(n7352), .B(n8430), .Z(n7377) );
  ND2 U8191 ( .A(n7353), .B(i_i2c_U_DW_apb_i2c_sync_ic_10bit_mst_sync_inv), 
        .Z(n7354) );
  AN2P U8192 ( .A(n7377), .B(n7354), .Z(n7355) );
  AO3 U8193 ( .A(n7402), .B(n7357), .C(n7356), .D(n7355), .Z(n7358) );
  AO6 U8194 ( .A(n7359), .B(n6894), .C(n7358), .Z(n7369) );
  IVP U8195 ( .A(n7360), .Z(n7361) );
  IVP U8196 ( .A(n7362), .Z(n7363) );
  ND3 U8197 ( .A(n7364), .B(n7393), .C(n7363), .Z(n7365) );
  NR3 U8198 ( .A(n7367), .B(n7366), .C(n7365), .Z(n7368) );
  ND2 U8199 ( .A(n7369), .B(n7368), .Z(n10280) );
  AN3P U8200 ( .A(n7370), .B(n9620), .C(n10280), .Z(n9624) );
  AO2 U8201 ( .A(n7458), .B(n7499), .C(n10038), .D(n7371), .Z(n7372) );
  NR2 U8202 ( .A(i_i2c_tx_fifo_data_buf[8]), .B(n7372), .Z(n7398) );
  IVP U8203 ( .A(n7373), .Z(n7389) );
  ND2 U8204 ( .A(i_i2c_ack_det), .B(n7375), .Z(n7376) );
  AO6 U8205 ( .A(n6894), .B(n7376), .C(n9466), .Z(n7388) );
  OR3 U8206 ( .A(i_i2c_U_DW_apb_i2c_sync_ic_10bit_mst_sync_inv), .B(n7620), 
        .C(n7379), .Z(n7382) );
  ND3 U8207 ( .A(n7382), .B(n7381), .C(n7380), .Z(n7383) );
  NR2 U8208 ( .A(n7384), .B(n7383), .Z(n7386) );
  ND2 U8209 ( .A(n7386), .B(n7385), .Z(n7387) );
  OR3 U8210 ( .A(n7389), .B(n7388), .C(n7387), .Z(n7397) );
  MUX21H U8211 ( .A(n9319), .B(n7990), .S(n5088), .Z(n7392) );
  AN3 U8212 ( .A(n7393), .B(n7392), .C(n7391), .Z(n7394) );
  ND2 U8213 ( .A(n7395), .B(n7394), .Z(n7396) );
  OR3 U8214 ( .A(n7398), .B(n7397), .C(n7396), .Z(n9621) );
  IVP U8215 ( .A(n9621), .Z(n9458) );
  ND2 U8216 ( .A(n9624), .B(n9458), .Z(n7408) );
  ND2 U8217 ( .A(n7400), .B(n7399), .Z(n7401) );
  NR2 U8218 ( .A(n7402), .B(n7401), .Z(n9622) );
  NR2 U8219 ( .A(i_i2c_mst_debug_cstate[0]), .B(n9622), .Z(n7406) );
  AO2 U8220 ( .A(i_i2c_scl_s_hld_cmplt), .B(i_i2c_U_DW_apb_i2c_mstfsm_N362), 
        .C(n10429), .D(n10457), .Z(n7403) );
  AN2P U8221 ( .A(n4667), .B(n7404), .Z(n7405) );
  OR2P U8222 ( .A(n7406), .B(n7405), .Z(n7407) );
  ND2 U8223 ( .A(n7411), .B(n7410), .Z(n7414) );
  ND2 U8224 ( .A(n7414), .B(n10101), .Z(n7416) );
  ND2 U8225 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_stop_sda_gate_r), .B(n10095), .Z(
        n7415) );
  ND4 U8226 ( .A(i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[6]), .B(
        i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[7]), .C(
        i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[5]), .D(
        i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[4]), .Z(n7418) );
  ND4 U8227 ( .A(i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[3]), .B(
        i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[2]), .C(
        i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[1]), .D(
        i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[0]), .Z(n7417) );
  NR2 U8228 ( .A(n7418), .B(n7417), .Z(n7421) );
  OR2P U8229 ( .A(n8103), .B(n10246), .Z(n7420) );
  ND3 U8230 ( .A(i_i2c_slv_debug_cstate[1]), .B(i_i2c_slv_debug_cstate[2]), 
        .C(n10497), .Z(n8083) );
  OR2P U8231 ( .A(i_i2c_slv_debug_cstate[0]), .B(n8103), .Z(n7419) );
  OR2P U8232 ( .A(n8083), .B(n7419), .Z(n7515) );
  AO3 U8233 ( .A(n7421), .B(n7549), .C(n7420), .D(n7515), .Z(
        i_i2c_scl_hld_low_en) );
  EN U8234 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[15]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[14]), .Z(n7423) );
  MUX21L U8235 ( .A(n7423), .B(n10764), .S(n7422), .Z(n7425) );
  MUX21L U8236 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[15]), .B(n7425), 
        .S(n7424), .Z(n7427) );
  MUX21L U8237 ( .A(n7427), .B(n10764), .S(n7426), .Z(n7428) );
  ND2 U8238 ( .A(n9313), .B(n7428), .Z(n7429) );
  IVP U8239 ( .A(n8289), .Z(n7999) );
  AO2 U8240 ( .A(i_i2c_ic_hcnt[12]), .B(n7994), .C(i_i2c_ic_lcnt[12]), .D(
        n7999), .Z(n7432) );
  AO2 U8241 ( .A(n5509), .B(i_i2c_ic_sda_hold[12]), .C(n8247), .D(
        i_i2c_ic_tx_abrt_source[12]), .Z(n7431) );
  AN2P U8242 ( .A(n7432), .B(n7431), .Z(n7434) );
  AO7 U8243 ( .A(n7434), .B(n8138), .C(n7433), .Z(n3946) );
  ND2 U8244 ( .A(n11109), .B(n7435), .Z(n10253) );
  NR2 U8245 ( .A(n7436), .B(n10253), .Z(n4056) );
  NR2 U8246 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_st_scl_s_hld_en), .B(
        i_i2c_start_en), .Z(n4127) );
  NR2 U8247 ( .A(i_i2c_p_det), .B(i_i2c_U_DW_apb_i2c_clk_gen_count_en), .Z(
        n7437) );
  NR2 U8248 ( .A(i_i2c_s_det), .B(n7437), .Z(n3928) );
  ND2 U8249 ( .A(n10429), .B(n10537), .Z(i_i2c_U_DW_apb_i2c_toggle_N27) );
  EO U8250 ( .A(n10357), .B(i_i2c_rx_rd_addr[0]), .Z(n7441) );
  NR2 U8251 ( .A(n10357), .B(n10962), .Z(n7439) );
  OR2P U8252 ( .A(n7440), .B(n7439), .Z(n10359) );
  OR3 U8253 ( .A(n7446), .B(n5678), .C(n7444), .Z(n11090) );
  ND2 U8254 ( .A(n7448), .B(n7447), .Z(n9322) );
  ND2 U8255 ( .A(i_i2c_U_DW_apb_i2c_sync_tx_empty_int_inv), .B(n9322), .Z(
        n7449) );
  NR2 U8256 ( .A(n7466), .B(n7449), .Z(n9611) );
  NR2 U8257 ( .A(i_i2c_ic_tar[11]), .B(n7451), .Z(n7457) );
  AO7 U8258 ( .A(i_i2c_U_DW_apb_i2c_sync_tx_empty_sync_r), .B(n10864), .C(
        i_i2c_U_DW_apb_i2c_sync_tx_empty_int_inv), .Z(n8081) );
  ND2 U8259 ( .A(n7453), .B(n7452), .Z(n7454) );
  AO4 U8260 ( .A(n7515), .B(n8081), .C(n7455), .D(n7454), .Z(n7456) );
  NR2 U8261 ( .A(n7457), .B(n7456), .Z(n7462) );
  AN3 U8262 ( .A(i_i2c_tx_fifo_data_buf[8]), .B(n7458), .C(
        i_i2c_U_DW_apb_i2c_sync_tx_empty_int_inv), .Z(n9612) );
  ND2 U8263 ( .A(n7499), .B(n9612), .Z(n7461) );
  ND4 U8264 ( .A(n7459), .B(n10324), .C(i_i2c_slv_tx_cmplt), .D(
        i_i2c_slv_ack_det), .Z(n7460) );
  NR2 U8265 ( .A(n7549), .B(n7460), .Z(n8078) );
  ND2 U8266 ( .A(i_i2c_U_DW_apb_i2c_sync_tx_empty_int_inv), .B(n8078), .Z(
        n8109) );
  AN3 U8267 ( .A(n7462), .B(n7461), .C(n8109), .Z(n7465) );
  ND2 U8268 ( .A(n6894), .B(n7463), .Z(n7464) );
  AO3 U8269 ( .A(n7467), .B(n7466), .C(n7465), .D(n7464), .Z(n7468) );
  OR2P U8270 ( .A(n9611), .B(n7468), .Z(n9116) );
  ND2 U8271 ( .A(n10056), .B(n7999), .Z(n7469) );
  NR2P U8272 ( .A(n7470), .B(n7469), .Z(n10009) );
  OR2P U8273 ( .A(n7470), .B(n8289), .Z(n10001) );
  AO2 U8274 ( .A(n10009), .B(n8345), .C(n10994), .D(n10001), .Z(n4454) );
  IVP U8275 ( .A(i_i2c_ic_rst_n), .Z(n7472) );
  IVP U8276 ( .A(n7472), .Z(n11059) );
  ND2 U8277 ( .A(i_i2c_ic_raw_intr_stat[0]), .B(i_i2c_ic_intr_mask[0]), .Z(
        n8240) );
  ND2 U8278 ( .A(i_i2c_ic_raw_intr_stat[7]), .B(i_i2c_ic_intr_mask[7]), .Z(
        n7904) );
  NR2 U8279 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_sda_cnt_0_), .B(n5054), .Z(n4668) );
  EO U8280 ( .A(i_i2c_rx_push_flg), .B(i_i2c_rx_push), .Z(n3834) );
  EO U8281 ( .A(i_i2c_tx_pop_flg), .B(i_i2c_tx_pop), .Z(n3870) );
  EO U8282 ( .A(i_i2c_set_tx_empty_en_flg), .B(i_i2c_set_tx_empty_en), .Z(
        n3808) );
  EO U8283 ( .A(i_i2c_p_det_flg), .B(i_i2c_p_det_intr), .Z(n3872) );
  ND2 U8284 ( .A(i_i2c_ic_raw_intr_stat[6]), .B(i_i2c_ic_intr_mask[6]), .Z(
        n7958) );
  ND2 U8285 ( .A(i_i2c_U_DW_apb_i2c_slvfsm_ic_enable_sync_vld), .B(
        i_i2c_slv_rx_ack_vld), .Z(n7474) );
  ND2 U8286 ( .A(n10447), .B(n7474), .Z(n4296) );
  OR2P U8287 ( .A(i_i2c_mst_activity_sync), .B(i_i2c_slv_activity_sync), .Z(
        i_i2c_activity) );
  ND2 U8288 ( .A(n7562), .B(n10412), .Z(i_i2c_U_DW_apb_i2c_intctl_N4) );
  NR2 U8289 ( .A(i_i2c_U_DW_apb_i2c_toggle_rx_gen_call_r), .B(n10564), .Z(
        n7475) );
  EO U8290 ( .A(n7475), .B(i_i2c_rx_gen_call_flg), .Z(n3873) );
  EO U8291 ( .A(i_i2c_s_det_flg), .B(i_i2c_s_det), .Z(n3880) );
  ND2 U8292 ( .A(i_i2c_slv_rx_2addr), .B(i_i2c_U_DW_apb_i2c_slvfsm_N284), .Z(
        n7476) );
  ND2 U8293 ( .A(n7476), .B(n9135), .Z(n4302) );
  ND2 U8294 ( .A(i_ahb_U_arb_U_ebt_current_state[0]), .B(n10594), .Z(n10177)
         );
  ND3 U8295 ( .A(ex_i_ahb_AHB_Slave_htrans[0]), .B(n10593), .C(n10177), .Z(
        n7477) );
  AO3 U8296 ( .A(i_ahb_U_arb_U_ebt_current_state[0]), .B(n10594), .C(
        i_ahb_U_arb_ebten), .D(n7477), .Z(n7478) );
  NR2 U8297 ( .A(n7479), .B(i_i2c_slv_rx_aborted), .Z(n7480) );
  AO6 U8298 ( .A(n7480), .B(n9135), .C(i_i2c_ic_enable_sync), .Z(n4303) );
  ND3 U8299 ( .A(n7618), .B(n7481), .C(n7327), .Z(
        i_i2c_U_DW_apb_i2c_toggle_N28) );
  ND2 U8300 ( .A(i_i2c_ic_enable[0]), .B(n5103), .Z(n7526) );
  EN U8301 ( .A(i_i2c_U_DW_apb_i2c_regfile_ic_txflr[0]), .B(
        i_i2c_abrt_in_rcve_trns), .Z(n7482) );
  EON1 U8302 ( .A(n7526), .B(n7482), .C(n7524), .D(
        i_i2c_U_DW_apb_i2c_regfile_ic_txflr_flushed[0]), .Z(n3806) );
  OR2P U8303 ( .A(n8072), .B(n11022), .Z(n7522) );
  ND2 U8304 ( .A(i_i2c_U_DW_apb_i2c_regfile_ic_txflr[0]), .B(
        i_i2c_abrt_in_rcve_trns), .Z(n7483) );
  ND2 U8305 ( .A(n10626), .B(n7483), .Z(n7484) );
  ND2 U8306 ( .A(n7522), .B(n7484), .Z(n7485) );
  EON1 U8307 ( .A(n7526), .B(n7485), .C(n7524), .D(
        i_i2c_U_DW_apb_i2c_regfile_ic_txflr_flushed[1]), .Z(n3805) );
  OR2P U8308 ( .A(n7486), .B(n10985), .Z(n7488) );
  ND2 U8309 ( .A(n7488), .B(n10409), .Z(n7487) );
  AO3 U8310 ( .A(n7488), .B(n5019), .C(i_i2c_ic_en), .D(n7487), .Z(n8263) );
  NR2 U8311 ( .A(n8263), .B(n10588), .Z(n11098) );
  ND3 U8312 ( .A(i_i2c_U_DW_apb_i2c_mstfsm_byte_waiting_q), .B(
        i_i2c_ic_abort_sync), .C(i_i2c_U_DW_apb_i2c_mstfsm_ic_abort_chk_win), 
        .Z(n7489) );
  AO4 U8313 ( .A(n7490), .B(n11022), .C(n7618), .D(n7489), .Z(n4062) );
  NR2 U8314 ( .A(n7499), .B(i_i2c_slv_rxbyte_rdy), .Z(n7506) );
  AO2 U8315 ( .A(n7507), .B(i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg[7]), 
        .C(i_i2c_rx_push_data[7]), .D(n7506), .Z(n7492) );
  NR2 U8316 ( .A(n7499), .B(n10478), .Z(n7508) );
  ND2 U8317 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[7]), .B(n7508), 
        .Z(n7491) );
  ND2 U8318 ( .A(n7492), .B(n7491), .Z(n3795) );
  AO2 U8319 ( .A(n7507), .B(i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg[3]), 
        .C(i_i2c_rx_push_data[3]), .D(n7506), .Z(n7494) );
  ND2 U8320 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[3]), .B(n7508), 
        .Z(n7493) );
  ND2 U8321 ( .A(n7494), .B(n7493), .Z(n3799) );
  AO2 U8322 ( .A(n7507), .B(i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg[4]), 
        .C(i_i2c_rx_push_data[4]), .D(n7506), .Z(n7496) );
  ND2 U8323 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[4]), .B(n7508), 
        .Z(n7495) );
  ND2 U8324 ( .A(n7496), .B(n7495), .Z(n3798) );
  AO2 U8325 ( .A(n7507), .B(i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg[2]), 
        .C(i_i2c_rx_push_data[2]), .D(n7506), .Z(n7498) );
  ND2 U8326 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[2]), .B(n7508), 
        .Z(n7497) );
  ND2 U8327 ( .A(n7498), .B(n7497), .Z(n3800) );
  AO2 U8328 ( .A(n7499), .B(i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg[0]), 
        .C(i_i2c_rx_push_data[0]), .D(n7506), .Z(n7501) );
  ND2 U8329 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[0]), .B(n7508), 
        .Z(n7500) );
  ND2 U8330 ( .A(n7501), .B(n7500), .Z(n3802) );
  AO2 U8331 ( .A(n7507), .B(i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg[5]), 
        .C(i_i2c_rx_push_data[5]), .D(n7506), .Z(n7503) );
  ND2 U8332 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[5]), .B(n7508), 
        .Z(n7502) );
  ND2 U8333 ( .A(n7503), .B(n7502), .Z(n3797) );
  AO2 U8334 ( .A(n7507), .B(i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg[6]), 
        .C(i_i2c_rx_push_data[6]), .D(n7506), .Z(n7505) );
  ND2 U8335 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[6]), .B(n7508), 
        .Z(n7504) );
  ND2 U8336 ( .A(n7505), .B(n7504), .Z(n3796) );
  AO2 U8337 ( .A(n7507), .B(i_i2c_U_DW_apb_i2c_rx_shift_mst_rx_shift_reg[1]), 
        .C(i_i2c_rx_push_data[1]), .D(n7506), .Z(n7510) );
  ND2 U8338 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[1]), .B(n7508), 
        .Z(n7509) );
  ND2 U8339 ( .A(n7510), .B(n7509), .Z(n3801) );
  EO U8340 ( .A(n7522), .B(i_i2c_U_DW_apb_i2c_regfile_ic_txflr[2]), .Z(n7512)
         );
  ND2 U8341 ( .A(n7524), .B(i_i2c_U_DW_apb_i2c_regfile_ic_txflr_flushed[2]), 
        .Z(n7511) );
  AO7 U8342 ( .A(n7526), .B(n7512), .C(n7511), .Z(n3804) );
  AO7 U8343 ( .A(i_i2c_ic_enable_sync), .B(i_i2c_slv_activity), .C(
        i_i2c_ic_slave_en_sync), .Z(n8120) );
  ND2 U8344 ( .A(n7513), .B(n10332), .Z(n7514) );
  NR2 U8345 ( .A(n7515), .B(n7514), .Z(i_i2c_U_DW_apb_i2c_slvfsm_N39) );
  AO4 U8346 ( .A(n7618), .B(n10774), .C(n7516), .D(n10364), .Z(
        i_i2c_U_DW_apb_i2c_rx_shift_N29) );
  AO3 U8347 ( .A(n10472), .B(n7521), .C(n7520), .D(n7519), .Z(
        i_i2c_U_DW_apb_i2c_toggle_N29) );
  NR2 U8348 ( .A(n10414), .B(n7522), .Z(n7523) );
  EN U8349 ( .A(n7523), .B(i_i2c_U_DW_apb_i2c_regfile_ic_txflr[3]), .Z(n7527)
         );
  ND2 U8350 ( .A(n7524), .B(i_i2c_U_DW_apb_i2c_regfile_ic_txflr_flushed[3]), 
        .Z(n7525) );
  AO7 U8351 ( .A(n7527), .B(n7526), .C(n7525), .Z(n3803) );
  ND2 U8352 ( .A(i_i2c_tx_fifo_data_buf[8]), .B(n7550), .Z(n7528) );
  EN U8353 ( .A(n7528), .B(i_i2c_tx_abrt_source[15]), .Z(n4253) );
  IVP U8354 ( .A(n7529), .Z(n7563) );
  NR2 U8355 ( .A(n7530), .B(n7563), .Z(n7554) );
  EN U8356 ( .A(i_i2c_U_DW_apb_i2c_intctl_ic_rd_req_flg_sync), .B(
        i_i2c_U_DW_apb_i2c_intctl_ic_rd_req_flg_sync_q), .Z(n7531) );
  AO6 U8357 ( .A(n7532), .B(n7531), .C(n10555), .Z(n4077) );
  AO7 U8358 ( .A(n7537), .B(n7536), .C(n7535), .Z(n7538) );
  ND2 U8359 ( .A(n7539), .B(n7538), .Z(n7547) );
  AO7 U8360 ( .A(n7543), .B(n7542), .C(n7541), .Z(n7544) );
  ND2 U8361 ( .A(n7545), .B(n7544), .Z(n7546) );
  ND2 U8362 ( .A(n7547), .B(n7546), .Z(n10200) );
  OR2P U8363 ( .A(n10199), .B(n10200), .Z(n7548) );
  MUX21L U8364 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_U_sda_sync_data_d_int_0_), 
        .B(n10794), .S(n7548), .Z(n4346) );
  IVP U8365 ( .A(n7549), .Z(n10245) );
  AO3 U8366 ( .A(n10245), .B(n10424), .C(n7550), .D(n8080), .Z(n7551) );
  EN U8367 ( .A(n7551), .B(i_i2c_tx_abrt_source[14]), .Z(n3976) );
  AO7 U8368 ( .A(n5369), .B(n10886), .C(n5101), .Z(n10294) );
  OR2P U8369 ( .A(n5369), .B(n10893), .Z(n10291) );
  OR2P U8370 ( .A(n10584), .B(n10291), .Z(n10290) );
  ND2 U8371 ( .A(n10584), .B(n10291), .Z(n7552) );
  AN3 U8372 ( .A(n7553), .B(n10290), .C(n7552), .Z(
        i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N45) );
  EO U8373 ( .A(n7632), .B(i_i2c_rx_done_flg), .Z(n4254) );
  ND2 U8374 ( .A(n7629), .B(n8295), .Z(n8307) );
  AN2P U8375 ( .A(n7554), .B(n10415), .Z(n10337) );
  NR2 U8376 ( .A(n7555), .B(n10337), .Z(n7556) );
  EN U8377 ( .A(i_i2c_U_DW_apb_i2c_intctl_rx_done_flg_sync), .B(
        i_i2c_U_DW_apb_i2c_intctl_rx_done_flg_sync_q), .Z(n7557) );
  AO6 U8378 ( .A(n7558), .B(n7557), .C(n10555), .Z(n4246) );
  ND2 U8379 ( .A(n7635), .B(n7629), .Z(n8304) );
  NR2 U8380 ( .A(n7559), .B(n10337), .Z(n7560) );
  AO6 U8381 ( .A(n7562), .B(n7561), .C(n10555), .Z(n4245) );
  NR2P U8382 ( .A(i_i2c_reg_addr[2]), .B(n7563), .Z(n8297) );
  ND2 U8383 ( .A(n8297), .B(n7564), .Z(n8230) );
  NR2 U8384 ( .A(n10337), .B(n7565), .Z(n7566) );
  EO U8385 ( .A(i_i2c_U_DW_apb_i2c_intctl_rx_gen_call_flg_sync), .B(
        i_i2c_U_DW_apb_i2c_intctl_rx_gen_call_flg_sync_q), .Z(n7567) );
  ND2 U8386 ( .A(i_i2c_ic_ack_general_call), .B(n7567), .Z(n7568) );
  AO6 U8387 ( .A(n7569), .B(n7568), .C(n10555), .Z(n4249) );
  NR2 U8388 ( .A(n10543), .B(n10451), .Z(n10286) );
  ND2P U8389 ( .A(n5020), .B(n10413), .Z(n7764) );
  IVP U8390 ( .A(n7735), .Z(n7570) );
  ND2 U8391 ( .A(n10286), .B(n7570), .Z(n7571) );
  NR2 U8392 ( .A(n7767), .B(n7571), .Z(n7572) );
  MUX21L U8393 ( .A(n5167), .B(n10948), .S(n7729), .Z(n4166) );
  AO6 U8394 ( .A(n7576), .B(n7575), .C(n7574), .Z(n7581) );
  AO3 U8395 ( .A(n7581), .B(n7580), .C(n7579), .D(n7578), .Z(n7582) );
  AO2 U8396 ( .A(i_i2c_ic_spklen_o[6]), .B(n7584), .C(n7583), .D(n7582), .Z(
        n7587) );
  AO4 U8397 ( .A(i_i2c_ic_spklen_o[6]), .B(n7584), .C(i_i2c_ic_spklen_o[7]), 
        .D(n10650), .Z(n7586) );
  OR2P U8398 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[7]), .B(
        n10831), .Z(n7585) );
  AO7 U8399 ( .A(n7587), .B(n7586), .C(n7585), .Z(n10183) );
  MUX21L U8400 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_U_scl_sync_data_d_int_0_), 
        .B(n5052), .S(n10183), .Z(n4349) );
  ND2 U8401 ( .A(n7588), .B(n10440), .Z(n7589) );
  ND2 U8402 ( .A(n8083), .B(n7589), .Z(n8114) );
  IVP U8403 ( .A(n8114), .Z(n7614) );
  AO2 U8404 ( .A(n10245), .B(n7590), .C(
        i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[2]), .D(n7614), .Z(n7603)
         );
  ND2 U8405 ( .A(i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[5]), .B(n10898), 
        .Z(n7599) );
  AO2 U8406 ( .A(i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[3]), .B(n4886), 
        .C(i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[2]), .D(n10986), .Z(
        n7594) );
  ND2 U8407 ( .A(i_i2c_ic_sda_setup[1]), .B(n10448), .Z(n7592) );
  AO3 U8408 ( .A(i_i2c_ic_sda_setup[1]), .B(n10448), .C(i_i2c_ic_sda_setup[0]), 
        .D(n10541), .Z(n7591) );
  AO3 U8409 ( .A(i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[2]), .B(n10986), 
        .C(n7592), .D(n7591), .Z(n7593) );
  AO2 U8410 ( .A(n7594), .B(n7593), .C(i_i2c_ic_sda_setup[3]), .D(n10552), .Z(
        n7597) );
  NR2 U8411 ( .A(i_i2c_ic_sda_setup[4]), .B(n10452), .Z(n7596) );
  AO2 U8412 ( .A(i_i2c_ic_sda_setup[4]), .B(n10452), .C(i_i2c_ic_sda_setup[5]), 
        .D(n10553), .Z(n7595) );
  AO7 U8413 ( .A(n7597), .B(n7596), .C(n7595), .Z(n7598) );
  AO2 U8414 ( .A(i_i2c_ic_sda_setup[6]), .B(n10586), .C(n7599), .D(n7598), .Z(
        n7602) );
  AO4 U8415 ( .A(i_i2c_ic_sda_setup[6]), .B(n10586), .C(i_i2c_ic_sda_setup[7]), 
        .D(n10459), .Z(n7601) );
  ND2 U8416 ( .A(i_i2c_ic_sda_setup[7]), .B(n10459), .Z(n7600) );
  AO3 U8417 ( .A(n7602), .B(n7601), .C(n10245), .D(n7600), .Z(n7843) );
  ND2 U8418 ( .A(n7603), .B(n7843), .Z(n4279) );
  MUX21L U8419 ( .A(n10245), .B(n7614), .S(
        i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[0]), .Z(n7604) );
  ND2 U8420 ( .A(n7843), .B(n7604), .Z(n4281) );
  HA1 U8421 ( .A(n7605), .B(i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[2]), 
        .CO(n7613), .S(n7590) );
  AO2 U8422 ( .A(n10245), .B(n7606), .C(
        i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[4]), .D(n7614), .Z(n7607)
         );
  ND2 U8423 ( .A(n7607), .B(n7843), .Z(n4277) );
  HA1 U8424 ( .A(i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[0]), .B(
        i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[1]), .CO(n7605), .S(n7608)
         );
  AO2 U8425 ( .A(n10245), .B(n7608), .C(
        i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[1]), .D(n7614), .Z(n7609)
         );
  ND2 U8426 ( .A(n7609), .B(n7843), .Z(n4280) );
  HA1 U8427 ( .A(n7610), .B(i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[4]), 
        .CO(n7640), .S(n7606) );
  AO2 U8428 ( .A(n10245), .B(n7611), .C(
        i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[5]), .D(n7614), .Z(n7612)
         );
  ND2 U8429 ( .A(n7612), .B(n7843), .Z(n4276) );
  HA1 U8430 ( .A(n7613), .B(i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[3]), 
        .CO(n7610), .S(n7615) );
  AO2 U8431 ( .A(n10245), .B(n7615), .C(
        i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[3]), .D(n7614), .Z(n7616)
         );
  ND2 U8432 ( .A(n7616), .B(n7843), .Z(n4278) );
  ND2 U8433 ( .A(i_i2c_U_DW_apb_i2c_mstfsm_addr_2byte_sent), .B(n7620), .Z(
        n7617) );
  AO7 U8434 ( .A(n9617), .B(n7617), .C(n5086), .Z(n4241) );
  ND2 U8435 ( .A(i_i2c_U_DW_apb_i2c_mstfsm_old_is_read), .B(n9473), .Z(n7619)
         );
  AO7 U8436 ( .A(n9617), .B(n7619), .C(n7618), .Z(n4243) );
  ND2 U8437 ( .A(i_i2c_U_DW_apb_i2c_mstfsm_addr_1byte_sent), .B(n7620), .Z(
        n7622) );
  AO7 U8438 ( .A(n9617), .B(n7622), .C(n7621), .Z(n4242) );
  ND3 U8439 ( .A(i_i2c_U_DW_apb_i2c_fifo_rx_pop_dly), .B(
        i_i2c_U_DW_apb_i2c_fifo_rx_error_ir), .C(n10449), .Z(n7625) );
  NR2 U8440 ( .A(n8255), .B(n10337), .Z(n7623) );
  ND2 U8441 ( .A(n8008), .B(n4852), .Z(n10335) );
  AO7 U8442 ( .A(n7623), .B(n10335), .C(i_i2c_ic_raw_intr_stat[0]), .Z(n7624)
         );
  AO6 U8443 ( .A(n7625), .B(n7624), .C(n10555), .Z(n4054) );
  ND3 U8444 ( .A(i_i2c_U_DW_apb_i2c_fifo_rx_error_ir), .B(
        i_i2c_U_DW_apb_i2c_fifo_rx_push_sync_dly), .C(n10958), .Z(n7628) );
  ND2 U8445 ( .A(n5024), .B(n10512), .Z(n7626) );
  AO7 U8446 ( .A(n10335), .B(n7626), .C(i_i2c_ic_raw_intr_stat[1]), .Z(n7627)
         );
  AO6 U8447 ( .A(n7628), .B(n7627), .C(n10555), .Z(n4055) );
  ND2 U8448 ( .A(n7629), .B(n8255), .Z(n8303) );
  ND2 U8449 ( .A(n10767), .B(n8303), .Z(n7630) );
  ND2 U8450 ( .A(n10352), .B(n7630), .Z(n7631) );
  ND2 U8451 ( .A(i_i2c_ic_enable[0]), .B(n7631), .Z(
        i_i2c_U_DW_apb_i2c_regfile_fix_c) );
  ND2 U8452 ( .A(i_i2c_U_DW_apb_i2c_sync_tx_empty_int_inv), .B(n7632), .Z(
        n7633) );
  EN U8453 ( .A(n7633), .B(i_i2c_slv_clr_leftover_flg), .Z(n4079) );
  OR2P U8454 ( .A(i_i2c_rx_wr_addr[1]), .B(i_i2c_rx_wr_addr[2]), .Z(n8064) );
  OR2P U8455 ( .A(n8064), .B(n8094), .Z(n7869) );
  MUX21L U8456 ( .A(n11021), .B(n11018), .S(n7869), .Z(n3978) );
  NR2 U8457 ( .A(n7634), .B(n10403), .Z(n4374) );
  ND3 U8458 ( .A(i_i2c_U_DW_apb_i2c_fifo_tx_error_ir), .B(
        i_i2c_U_DW_apb_i2c_fifo_tx_push_dly), .C(n4906), .Z(n7639) );
  ND2 U8459 ( .A(n8297), .B(n7635), .Z(n8299) );
  NR2 U8460 ( .A(n7636), .B(n10337), .Z(n7637) );
  AO6 U8461 ( .A(n7639), .B(n7638), .C(n10555), .Z(n4200) );
  HA1 U8462 ( .A(n7640), .B(i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[5]), 
        .CO(n7839), .S(n7611) );
  ND2 U8463 ( .A(n10245), .B(n7641), .Z(n7642) );
  AO3 U8464 ( .A(n10586), .B(n8114), .C(n7843), .D(n7642), .Z(n4275) );
  NR2 U8465 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_mst_tx_bwen), .B(
        i_i2c_mst_rx_bwen), .Z(n7643) );
  OR3 U8466 ( .A(n11110), .B(n7643), .C(i_i2c_U_DW_apb_i2c_toggle_N27), .Z(
        n7644) );
  NR2 U8467 ( .A(i_i2c_scl_int), .B(n7644), .Z(
        i_i2c_U_DW_apb_i2c_tx_shift_byte_wait_en) );
  NR2 U8468 ( .A(i_i2c_U_DW_apb_i2c_sync_ic_10bit_slv_sync_inv), .B(n10454), 
        .Z(n7645) );
  AO6 U8469 ( .A(i_i2c_slv_rx_2addr), .B(n7645), .C(i_i2c_slv_addressed), .Z(
        n7648) );
  MUX21L U8470 ( .A(n9135), .B(n7661), .S(
        i_i2c_U_DW_apb_i2c_sync_ic_10bit_slv_sync_inv), .Z(n7646) );
  ND2 U8471 ( .A(i_i2c_rx_addr_match), .B(n7646), .Z(n7647) );
  AO6 U8472 ( .A(n7648), .B(n7647), .C(n8103), .Z(n4299) );
  OR2P U8473 ( .A(i_i2c_tx_wr_addr[1]), .B(i_i2c_tx_wr_addr[2]), .Z(n7846) );
  NR2 U8474 ( .A(n7846), .B(n10845), .Z(n7651) );
  AO4 U8475 ( .A(n7652), .B(n7658), .C(n10174), .D(n10754), .Z(n4386) );
  OR2P U8476 ( .A(n5174), .B(n7653), .Z(n7654) );
  AN2P U8477 ( .A(n7655), .B(n7654), .Z(n7656) );
  AO4 U8478 ( .A(n7656), .B(n7658), .C(n10174), .D(n10756), .Z(n4387) );
  AO4 U8479 ( .A(n5164), .B(n7658), .C(n10174), .D(n10755), .Z(n4388) );
  OR3 U8480 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_scl_hl_edg_cntr[2]), .B(
        i_i2c_U_DW_apb_i2c_rx_shift_scl_hl_edg_cntr[1]), .C(
        i_i2c_U_DW_apb_i2c_rx_shift_scl_hl_edg_cntr[3]), .Z(n7659) );
  ND2 U8481 ( .A(n4924), .B(n7659), .Z(n7660) );
  OR2P U8482 ( .A(n7661), .B(n7660), .Z(n8366) );
  AO7 U8483 ( .A(n4924), .B(n7662), .C(n8366), .Z(n4293) );
  ND2 U8484 ( .A(n5453), .B(n10337), .Z(n7663) );
  AO6 U8485 ( .A(n5104), .B(n7664), .C(n10555), .Z(n4063) );
  AO4 U8486 ( .A(n4947), .B(n8281), .C(n11029), .D(n8043), .Z(n7666) );
  AO4 U8487 ( .A(n8167), .B(n11031), .C(n7858), .D(n11030), .Z(n7665) );
  NR2 U8488 ( .A(n7666), .B(n7665), .Z(n7669) );
  ND2 U8489 ( .A(n8035), .B(n7667), .Z(n7957) );
  OR2P U8490 ( .A(n6843), .B(n7957), .Z(n8132) );
  AO3 U8491 ( .A(n7669), .B(n8138), .C(n8132), .D(n7668), .Z(n3944) );
  AO4 U8492 ( .A(n11026), .B(n8281), .C(n11025), .D(n8043), .Z(n7671) );
  AO4 U8493 ( .A(n5506), .B(n11028), .C(n7858), .D(n11027), .Z(n7670) );
  NR2 U8494 ( .A(n7671), .B(n7670), .Z(n7674) );
  AO7 U8495 ( .A(n7674), .B(n6385), .C(n7673), .Z(n3945) );
  AO4 U8496 ( .A(n5002), .B(n8281), .C(n4858), .D(n8043), .Z(n7676) );
  AO4 U8497 ( .A(n8167), .B(n11033), .C(n7858), .D(n11032), .Z(n7675) );
  NR2 U8498 ( .A(n7676), .B(n7675), .Z(n7678) );
  AO7 U8499 ( .A(n7678), .B(n6385), .C(n7677), .Z(n3943) );
  IVDA U8500 ( .A(n7679), .Y(n5528), .Z(n7680) );
  IVP U8501 ( .A(ex_i_ahb_AHB_Slave_hsel), .Z(n7741) );
  ND3 U8502 ( .A(n10174), .B(n10163), .C(n7741), .Z(n10173) );
  ND2 U8503 ( .A(i_ahb_hready_resp_none), .B(n10173), .Z(i_ahb_U_dfltslv_N4)
         );
  AO7 U8504 ( .A(n10337), .B(n8306), .C(n8215), .Z(n9991) );
  IVP U8505 ( .A(n9991), .Z(n7703) );
  EO U8506 ( .A(i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[10]), .B(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[10]), .Z(n7681) );
  NR2 U8507 ( .A(i_i2c_ic_tx_abrt_source[10]), .B(n7681), .Z(n7682) );
  NR2 U8508 ( .A(n7703), .B(n7682), .Z(n3965) );
  EO U8509 ( .A(i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[12]), .B(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[12]), .Z(n7683) );
  NR2 U8510 ( .A(i_i2c_ic_tx_abrt_source[12]), .B(n7683), .Z(n7684) );
  NR2 U8511 ( .A(n7703), .B(n7684), .Z(n3963) );
  EO U8512 ( .A(i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[3]), .B(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[3]), .Z(n7685) );
  NR2 U8513 ( .A(i_i2c_ic_tx_abrt_source[3]), .B(n7685), .Z(n7686) );
  NR2 U8514 ( .A(n7703), .B(n7686), .Z(n3972) );
  EO U8515 ( .A(i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[2]), .B(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[2]), .Z(n7687) );
  NR2 U8516 ( .A(i_i2c_ic_tx_abrt_source[2]), .B(n7687), .Z(n7688) );
  NR2 U8517 ( .A(n7703), .B(n7688), .Z(n3973) );
  EO U8518 ( .A(i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[5]), .B(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[5]), .Z(n7689) );
  NR2 U8519 ( .A(i_i2c_ic_tx_abrt_source[5]), .B(n7689), .Z(n7690) );
  NR2 U8520 ( .A(n7703), .B(n7690), .Z(n3970) );
  EO U8521 ( .A(i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[7]), .B(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[7]), .Z(n7691) );
  NR2 U8522 ( .A(i_i2c_ic_tx_abrt_source[7]), .B(n7691), .Z(n7692) );
  NR2 U8523 ( .A(n7703), .B(n7692), .Z(n3968) );
  EO U8524 ( .A(i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[1]), .B(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[1]), .Z(n7693) );
  NR2 U8525 ( .A(i_i2c_ic_tx_abrt_source[1]), .B(n7693), .Z(n7694) );
  NR2 U8526 ( .A(n7703), .B(n7694), .Z(n3974) );
  EO U8527 ( .A(i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[11]), .B(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[11]), .Z(n7695) );
  NR2 U8528 ( .A(i_i2c_ic_tx_abrt_source[11]), .B(n7695), .Z(n7696) );
  NR2 U8529 ( .A(n7703), .B(n7696), .Z(n3964) );
  EO U8530 ( .A(i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[9]), .B(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[9]), .Z(n7697) );
  NR2 U8531 ( .A(i_i2c_ic_tx_abrt_source[9]), .B(n7697), .Z(n7698) );
  NR2 U8532 ( .A(n7703), .B(n7698), .Z(n3966) );
  EO U8533 ( .A(i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[0]), .B(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[0]), .Z(n7699) );
  NR2 U8534 ( .A(i_i2c_ic_tx_abrt_source[0]), .B(n7699), .Z(n7700) );
  NR2 U8535 ( .A(n7703), .B(n7700), .Z(n3975) );
  EO U8536 ( .A(i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[4]), .B(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[4]), .Z(n7701) );
  NR2 U8537 ( .A(i_i2c_ic_tx_abrt_source[4]), .B(n7701), .Z(n7702) );
  NR2 U8538 ( .A(n7703), .B(n7702), .Z(n3971) );
  IVDA U8539 ( .A(n7704), .Y(n10521), .Z(n6886) );
  ND2 U8540 ( .A(n7776), .B(n5101), .Z(n7772) );
  OR2P U8541 ( .A(n10535), .B(n7772), .Z(n7706) );
  OR2P U8542 ( .A(i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_empty_n), .B(n7931), .Z(
        n7705) );
  MUX21L U8543 ( .A(n7706), .B(n7705), .S(n5442), .Z(
        i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N38) );
  ND2 U8544 ( .A(i_i2c_U_DW_apb_i2c_mstfsm_abrt_in_idle), .B(n7878), .Z(n7707)
         );
  ND2 U8545 ( .A(n7844), .B(n7707), .Z(n4237) );
  NR2 U8546 ( .A(n10543), .B(n10845), .Z(n7765) );
  NR2 U8547 ( .A(i_i2c_tx_wr_addr[2]), .B(n7709), .Z(n10105) );
  AN2P U8548 ( .A(n7764), .B(n10105), .Z(n7710) );
  ND2P U8549 ( .A(n7776), .B(n7710), .Z(n7714) );
  MUX21L U8550 ( .A(n10150), .B(n10889), .S(n7714), .Z(n4131) );
  IVP U8551 ( .A(n7712), .Z(n10147) );
  MUX21L U8552 ( .A(n10147), .B(n10924), .S(n7714), .Z(n4187) );
  MUX21L U8553 ( .A(n6395), .B(n10931), .S(n7714), .Z(n4179) );
  MUX21L U8554 ( .A(n10146), .B(n10938), .S(n7714), .Z(n4147) );
  IVP U8555 ( .A(n7713), .Z(n10149) );
  MUX21L U8556 ( .A(n10149), .B(n10902), .S(n7714), .Z(n4171) );
  MUX21L U8557 ( .A(n5166), .B(n10909), .S(n7714), .Z(n4139) );
  MUX21L U8558 ( .A(n5167), .B(n10945), .S(n7714), .Z(n4163) );
  IVP U8559 ( .A(n8357), .Z(n10148) );
  MUX21L U8560 ( .A(n10148), .B(n10916), .S(n7714), .Z(n4155) );
  OR2P U8561 ( .A(n8185), .B(n11016), .Z(n7719) );
  NR2 U8562 ( .A(n11021), .B(n7716), .Z(n7717) );
  ND2 U8563 ( .A(n8185), .B(n7717), .Z(n7718) );
  AO3 U8564 ( .A(n8186), .B(n11016), .C(n7719), .D(n7718), .Z(n3980) );
  MUX21L U8565 ( .A(n10788), .B(n7720), .S(n10403), .Z(n4569) );
  MUX21L U8566 ( .A(n4992), .B(n10082), .S(n10403), .Z(n4559) );
  ND2 U8567 ( .A(n7721), .B(n7744), .Z(n7722) );
  AO4 U8568 ( .A(n10786), .B(n10403), .C(n5743), .D(n7722), .Z(n4555) );
  MUX21L U8569 ( .A(n10428), .B(n10027), .S(n10403), .Z(n4558) );
  MUX21L U8570 ( .A(n10865), .B(n7723), .S(n10403), .Z(n4394) );
  NR2P U8571 ( .A(n10169), .B(n7724), .Z(ex_i_ahb_AHB_Slave_hsize[0]) );
  MUX21L U8572 ( .A(n10787), .B(n7725), .S(n10403), .Z(n4568) );
  MUX21L U8573 ( .A(n10446), .B(n5299), .S(n10403), .Z(n4560) );
  MUX21L U8574 ( .A(n10455), .B(n7945), .S(n10403), .Z(n4557) );
  OR2P U8575 ( .A(n7726), .B(n10357), .Z(n10361) );
  AO7 U8576 ( .A(n10592), .B(n10357), .C(n10444), .Z(n7727) );
  ND2 U8577 ( .A(n10361), .B(n7727), .Z(n7728) );
  NR2 U8578 ( .A(n10359), .B(n7728), .Z(i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N45)
         );
  B2IP U8579 ( .A(n7729), .Z2(n7730) );
  MUX21L U8580 ( .A(n10147), .B(n10927), .S(n7730), .Z(n4190) );
  MUX21L U8581 ( .A(n10146), .B(n10941), .S(n7730), .Z(n4150) );
  MUX21L U8582 ( .A(n10149), .B(n10905), .S(n7730), .Z(n4174) );
  MUX21L U8583 ( .A(n5166), .B(n10912), .S(n7730), .Z(n4142) );
  MUX21L U8584 ( .A(n6395), .B(n10934), .S(n7730), .Z(n4182) );
  MUX21L U8585 ( .A(n10148), .B(n10919), .S(n7730), .Z(n4158) );
  MUX21L U8586 ( .A(n7649), .B(n10955), .S(n7730), .Z(n4198) );
  MUX21L U8587 ( .A(n10150), .B(n10892), .S(n7730), .Z(n4134) );
  NR2 U8588 ( .A(n4893), .B(n7748), .Z(n7731) );
  MUX21L U8589 ( .A(n10412), .B(n7649), .S(n7731), .Z(n4506) );
  OR2P U8590 ( .A(n8029), .B(n7732), .Z(n8238) );
  NR2 U8591 ( .A(n8238), .B(n7748), .Z(n7733) );
  MUX21L U8592 ( .A(n10969), .B(n7649), .S(n7733), .Z(n4507) );
  ND2 U8593 ( .A(i_i2c_tx_wr_addr[1]), .B(n10451), .Z(n7736) );
  IVDA U8594 ( .A(n7767), .Y(n5056), .Z(n7734) );
  OR2P U8595 ( .A(n7736), .B(n10282), .Z(n8184) );
  MUX21L U8596 ( .A(n5167), .B(n10947), .S(n8184), .Z(n4162) );
  MUX21L U8597 ( .A(n6395), .B(n10933), .S(n8184), .Z(n4178) );
  OR2P U8598 ( .A(n8422), .B(n8415), .Z(n7947) );
  ND2 U8599 ( .A(n4883), .B(n7947), .Z(n4651) );
  ND2 U8600 ( .A(n4889), .B(n7947), .Z(n4647) );
  MUX21L U8601 ( .A(n11021), .B(n11020), .S(n8102), .Z(n3984) );
  ND2P U8602 ( .A(n7738), .B(n7739), .Z(n7740) );
  MUX21L U8603 ( .A(n10973), .B(n10971), .S(n7740), .Z(n4030) );
  MUX21L U8604 ( .A(n10965), .B(n10963), .S(n7740), .Z(n4038) );
  MUX21L U8605 ( .A(n10997), .B(n10995), .S(n7740), .Z(n4006) );
  MUX21L U8606 ( .A(n11014), .B(n11011), .S(n7740), .Z(n3990) );
  MUX21L U8607 ( .A(n10980), .B(n10975), .S(n7740), .Z(n4022) );
  MUX21L U8608 ( .A(n11010), .B(n11005), .S(n7740), .Z(n3998) );
  MUX21L U8609 ( .A(n11021), .B(n11017), .S(n7740), .Z(n3982) );
  MUX21L U8610 ( .A(n10989), .B(n10987), .S(n7740), .Z(n4014) );
  MUX21L U8611 ( .A(n7742), .B(n7741), .S(n10403), .Z(n4662) );
  MUX21L U8612 ( .A(n10405), .B(n10076), .S(n10403), .Z(n4561) );
  IVP U8613 ( .A(ex_i_ahb_AHB_Slave_haddr[6]), .Z(n10064) );
  MUX21L U8614 ( .A(n10748), .B(n10064), .S(n10403), .Z(n4562) );
  MUX21L U8615 ( .A(n10959), .B(n7946), .S(n10403), .Z(n4567) );
  MUX21L U8616 ( .A(n10565), .B(n7743), .S(n10403), .Z(n4556) );
  MUX21L U8617 ( .A(n10789), .B(n7744), .S(n10403), .Z(n4570) );
  MUX21L U8618 ( .A(n10785), .B(n7936), .S(n10403), .Z(n4565) );
  MUX21L U8619 ( .A(n10450), .B(n10169), .S(n10403), .Z(n4603) );
  MUX21L U8620 ( .A(n10784), .B(n7745), .S(n10403), .Z(n4564) );
  AO6 U8621 ( .A(n8078), .B(n10436), .C(n8079), .Z(n7879) );
  EN U8622 ( .A(n7879), .B(i_i2c_ic_rd_req_flg), .Z(n4078) );
  ND2 U8623 ( .A(n6833), .B(i_i2c_ic_enable[0]), .Z(n8246) );
  OR2P U8624 ( .A(n8246), .B(n10147), .Z(n7747) );
  OR2P U8625 ( .A(n7748), .B(n7747), .Z(n7749) );
  MUX21L U8626 ( .A(n7749), .B(n5103), .S(i_i2c_ic_enable[1]), .Z(n4239) );
  ND2 U8627 ( .A(n7754), .B(n7753), .Z(n4390) );
  ND3 U8628 ( .A(n7756), .B(n7755), .C(n10412), .Z(n7757) );
  NR2 U8629 ( .A(n7758), .B(n7757), .Z(n7759) );
  NR2 U8630 ( .A(n10970), .B(n8167), .Z(n7760) );
  ND2P U8631 ( .A(n7759), .B(n7760), .Z(n7761) );
  MUX21L U8632 ( .A(n7649), .B(n10563), .S(n7761), .Z(n4483) );
  MUX21L U8633 ( .A(n6395), .B(n10981), .S(n7761), .Z(n4485) );
  MUX21L U8634 ( .A(n5166), .B(n10875), .S(n7761), .Z(n4482) );
  MUX21L U8635 ( .A(n8345), .B(n10990), .S(n7761), .Z(n4486) );
  MUX21L U8636 ( .A(n10055), .B(n10877), .S(n7761), .Z(n4484) );
  MUX21L U8637 ( .A(n5167), .B(n11004), .S(n7761), .Z(n4487) );
  MUX21L U8638 ( .A(n9989), .B(n10876), .S(n7761), .Z(n4488) );
  MUX21L U8639 ( .A(n10146), .B(n11015), .S(n7761), .Z(n4489) );
  EN U8640 ( .A(n7762), .B(i_i2c_tx_abrt_source[13]), .Z(n4080) );
  B3IP U8641 ( .A(n10001), .Z2(n10005) );
  MUX21L U8642 ( .A(n8193), .B(n11025), .S(n10005), .Z(n4444) );
  IVP U8643 ( .A(n8211), .Z(n7763) );
  ND2 U8644 ( .A(n7763), .B(n10543), .Z(n7770) );
  AO6 U8645 ( .A(n10283), .B(i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_wr_addr_at_max), 
        .C(n7931), .Z(n10285) );
  ND2 U8646 ( .A(n7765), .B(n7764), .Z(n7766) );
  NR2 U8647 ( .A(n7767), .B(n7766), .Z(n7769) );
  AN3 U8648 ( .A(n7770), .B(n10285), .C(n10151), .Z(
        i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N42) );
  EO U8649 ( .A(i_i2c_U_DW_apb_i2c_intctl_set_tx_empty_en_flg_sync), .B(
        i_i2c_U_DW_apb_i2c_intctl_set_tx_empty_en_flg_sync_q), .Z(n7774) );
  OR2P U8650 ( .A(n7931), .B(n7771), .Z(n7777) );
  AN2P U8651 ( .A(n5101), .B(n7777), .Z(n7773) );
  ND2P U8652 ( .A(n7773), .B(n7772), .Z(n7829) );
  NR2 U8653 ( .A(n7774), .B(n7931), .Z(n7775) );
  ND2 U8654 ( .A(n5475), .B(n10733), .Z(n7779) );
  IVP U8655 ( .A(n7777), .Z(n7826) );
  ND2 U8656 ( .A(n7826), .B(n10733), .Z(n7778) );
  AO3 U8657 ( .A(n7829), .B(n10733), .C(n7779), .D(n7778), .Z(n4074) );
  EN U8658 ( .A(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[2]), .B(
        i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[3]), .Z(n7780) );
  ND2 U8659 ( .A(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[1]), .B(
        i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[0]), .Z(n7792) );
  MUX21L U8660 ( .A(n7780), .B(n10732), .S(n7792), .Z(n7781) );
  ND2 U8661 ( .A(n5475), .B(n7781), .Z(n7785) );
  EN U8662 ( .A(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[2]), .B(n10732), .Z(
        n7782) );
  NR2 U8663 ( .A(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[1]), .B(
        i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[0]), .Z(n7795) );
  MUX21L U8664 ( .A(n10732), .B(n7782), .S(n7795), .Z(n7783) );
  ND2 U8665 ( .A(n7826), .B(n7783), .Z(n7784) );
  AO3 U8666 ( .A(n7829), .B(n10732), .C(n7785), .D(n7784), .Z(n4071) );
  EN U8667 ( .A(n7786), .B(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[2]), .Z(
        n7787) );
  ND2 U8668 ( .A(n7826), .B(n7787), .Z(n7791) );
  EN U8669 ( .A(n7788), .B(n10746), .Z(n7789) );
  ND2 U8670 ( .A(n7789), .B(n5475), .Z(n7790) );
  AO3 U8671 ( .A(n7829), .B(n10746), .C(n7791), .D(n7790), .Z(n4072) );
  ND2 U8672 ( .A(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[2]), .B(
        i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[3]), .Z(n7793) );
  NR2 U8673 ( .A(n7793), .B(n7792), .Z(n7819) );
  EN U8674 ( .A(n7819), .B(n10731), .Z(n7794) );
  ND2 U8675 ( .A(n5475), .B(n7794), .Z(n7799) );
  NR2 U8676 ( .A(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[2]), .B(
        i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[3]), .Z(n7796) );
  ND2 U8677 ( .A(n7796), .B(n7795), .Z(n7823) );
  EN U8678 ( .A(n7823), .B(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[4]), .Z(
        n7797) );
  ND2 U8679 ( .A(n7826), .B(n7797), .Z(n7798) );
  AO3 U8680 ( .A(n7829), .B(n10731), .C(n7799), .D(n7798), .Z(n4070) );
  EN U8681 ( .A(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[6]), .B(n10734), .Z(
        n7800) );
  ND2 U8682 ( .A(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[4]), .B(
        i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[5]), .Z(n7818) );
  MUX21L U8683 ( .A(n7800), .B(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[7]), 
        .S(n7818), .Z(n7801) );
  MUX21L U8684 ( .A(n10734), .B(n7801), .S(n7819), .Z(n7802) );
  ND2 U8685 ( .A(n5475), .B(n7802), .Z(n7807) );
  EN U8686 ( .A(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[6]), .B(
        i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[7]), .Z(n7803) );
  NR2 U8687 ( .A(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[4]), .B(
        i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[5]), .Z(n7822) );
  MUX21L U8688 ( .A(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[7]), .B(n7803), 
        .S(n7822), .Z(n7804) );
  MUX21L U8689 ( .A(n7804), .B(n10734), .S(n7823), .Z(n7805) );
  ND2 U8690 ( .A(n7826), .B(n7805), .Z(n7806) );
  AO3 U8691 ( .A(n7829), .B(n10734), .C(n7807), .D(n7806), .Z(n4075) );
  MUX21L U8692 ( .A(n10730), .B(n7808), .S(n7819), .Z(n7809) );
  ND2 U8693 ( .A(n5475), .B(n7809), .Z(n7813) );
  MUX21L U8694 ( .A(n7810), .B(n10730), .S(n7823), .Z(n7811) );
  ND2 U8695 ( .A(n7826), .B(n7811), .Z(n7812) );
  AO3 U8696 ( .A(n7829), .B(n10730), .C(n7813), .D(n7812), .Z(n4069) );
  ND2 U8697 ( .A(n5475), .B(n7814), .Z(n7817) );
  ND2 U8698 ( .A(n7826), .B(n7815), .Z(n7816) );
  AO3 U8699 ( .A(n7829), .B(n10773), .C(n7817), .D(n7816), .Z(n4073) );
  EO U8700 ( .A(n7818), .B(i_i2c_U_DW_apb_i2c_fifo_tx_fifo_cmd_cntr[6]), .Z(
        n7820) );
  MUX21L U8701 ( .A(n10729), .B(n7820), .S(n7819), .Z(n7821) );
  ND2 U8702 ( .A(n5475), .B(n7821), .Z(n7828) );
  EO U8703 ( .A(n7822), .B(n10729), .Z(n7824) );
  MUX21L U8704 ( .A(n7824), .B(n10729), .S(n7823), .Z(n7825) );
  ND2 U8705 ( .A(n7826), .B(n7825), .Z(n7827) );
  AO3 U8706 ( .A(n7829), .B(n10729), .C(n7828), .D(n7827), .Z(n4068) );
  NR2 U8707 ( .A(i_ahb_U_arb_U_arbif_r_haddr_d[7]), .B(n10959), .Z(n7830) );
  NR2 U8708 ( .A(ex_i_ahb_AHB_Slave_hwdata[3]), .B(
        ex_i_ahb_AHB_Slave_hwdata[2]), .Z(n8126) );
  NR3 U8709 ( .A(ex_i_ahb_AHB_Master_hwdata[1]), .B(
        ex_i_ahb_AHB_Master_hwdata[0]), .C(n10450), .Z(n7837) );
  NR2 U8710 ( .A(i_ahb_U_arb_U_arbif_r_hsize_d[2]), .B(
        i_ahb_U_arb_U_arbif_r_hsize_d[1]), .Z(n8197) );
  AO7 U8711 ( .A(i_ahb_U_arb_U_arbif_r_hsize_d[0]), .B(n10565), .C(n10455), 
        .Z(n7834) );
  AN2P U8712 ( .A(n8197), .B(n7834), .Z(n8362) );
  NR2 U8713 ( .A(i_ahb_U_arb_U_arbif_r_haddr_d[2]), .B(
        i_ahb_U_arb_U_arbif_r_haddr_d[6]), .Z(n7835) );
  ND4 U8714 ( .A(n7835), .B(n10446), .C(n10405), .D(n4992), .Z(n7836) );
  AO1P U8715 ( .A(n8126), .B(n7837), .C(n8362), .D(n7836), .Z(n7838) );
  ND2 U8716 ( .A(n8196), .B(n7838), .Z(n7845) );
  MUX21L U8717 ( .A(n10127), .B(n10792), .S(n7845), .Z(n4552) );
  MUX21L U8718 ( .A(n8477), .B(n10793), .S(n7845), .Z(n4554) );
  MUX21L U8719 ( .A(n10125), .B(n10791), .S(n7845), .Z(n4551) );
  HA1 U8720 ( .A(n7839), .B(i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[6]), 
        .CO(n7840), .S(n7641) );
  EO U8721 ( .A(n7840), .B(i_i2c_U_DW_apb_i2c_slvfsm_stretch_scl_count[7]), 
        .Z(n7841) );
  ND2 U8722 ( .A(n10245), .B(n7841), .Z(n7842) );
  AO3 U8723 ( .A(n10459), .B(n8114), .C(n7843), .D(n7842), .Z(n4274) );
  EN U8724 ( .A(n7844), .B(i_i2c_tx_abrt_source[16]), .Z(n4238) );
  MUX21L U8725 ( .A(n10123), .B(n10790), .S(n7845), .Z(n4553) );
  OR2P U8726 ( .A(i_i2c_tx_wr_addr[1]), .B(n10451), .Z(n8209) );
  MUX21L U8727 ( .A(n6395), .B(n10929), .S(n7848), .Z(n4180) );
  MUX21L U8728 ( .A(n7649), .B(n10950), .S(n7848), .Z(n4196) );
  MUX21L U8729 ( .A(n10147), .B(n10923), .S(n7847), .Z(n4184) );
  MUX21L U8730 ( .A(n6395), .B(n10930), .S(n7847), .Z(n4176) );
  MUX21L U8731 ( .A(n10149), .B(n10901), .S(n7847), .Z(n4168) );
  MUX21L U8732 ( .A(n5167), .B(n10943), .S(n7848), .Z(n4164) );
  MUX21L U8733 ( .A(n7649), .B(n10951), .S(n7847), .Z(n4192) );
  MUX21L U8734 ( .A(n10150), .B(n10887), .S(n7848), .Z(n4132) );
  MUX21L U8735 ( .A(n5167), .B(n10944), .S(n7847), .Z(n4160) );
  MUX21L U8736 ( .A(n5166), .B(n10907), .S(n7848), .Z(n4140) );
  MUX21L U8737 ( .A(n10146), .B(n10937), .S(n7847), .Z(n4144) );
  MUX21L U8738 ( .A(n10146), .B(n10936), .S(n7848), .Z(n4148) );
  MUX21L U8739 ( .A(n10148), .B(n10915), .S(n7847), .Z(n4152) );
  MUX21L U8740 ( .A(n10148), .B(n10914), .S(n7848), .Z(n4156) );
  MUX21L U8741 ( .A(n5166), .B(n10908), .S(n7847), .Z(n4136) );
  MUX21L U8742 ( .A(n10149), .B(n10900), .S(n7848), .Z(n4172) );
  MUX21L U8743 ( .A(n10150), .B(n10888), .S(n7847), .Z(n4128) );
  MUX21L U8744 ( .A(n10147), .B(n10922), .S(n7848), .Z(n4188) );
  AO6 U8745 ( .A(n7999), .B(i_i2c_ic_lcnt[8]), .C(n7849), .Z(n7851) );
  IVP U8746 ( .A(n8212), .Z(n8326) );
  AO2 U8747 ( .A(n8326), .B(i_i2c_tx_empty_ctrl), .C(i_i2c_ic_sda_hold[8]), 
        .D(n5507), .Z(n7850) );
  ND2 U8748 ( .A(n7851), .B(n7850), .Z(n7857) );
  AN2P U8749 ( .A(i_i2c_ic_intr_mask[8]), .B(i_i2c_ic_raw_intr_stat[8]), .Z(
        n11096) );
  AO2 U8750 ( .A(n8052), .B(n11096), .C(n8050), .D(i_i2c_ic_raw_intr_stat[8]), 
        .Z(n7855) );
  AO2 U8751 ( .A(i_i2c_ic_hcnt[8]), .B(n7994), .C(n8204), .D(i_i2c_ic_sar[8]), 
        .Z(n7854) );
  ND2 U8752 ( .A(i_i2c_ic_tar[8]), .B(n8158), .Z(n7852) );
  ND4 U8753 ( .A(n7855), .B(n7854), .C(n7853), .D(n7852), .Z(n7856) );
  NR2 U8754 ( .A(n7857), .B(n7856), .Z(n7861) );
  ND2 U8755 ( .A(n8247), .B(n8292), .Z(n8278) );
  IVP U8756 ( .A(n8278), .Z(n7982) );
  ND2 U8757 ( .A(n7982), .B(i_i2c_U_DW_apb_i2c_regfile_ic_txflr_flushed[1]), 
        .Z(n7859) );
  AO3 U8758 ( .A(n7861), .B(n6385), .C(n7860), .D(n7859), .Z(n3950) );
  AN2P U8759 ( .A(i_i2c_rx_wr_addr[1]), .B(i_i2c_rx_wr_addr[2]), .Z(n8098) );
  OR2P U8760 ( .A(n5170), .B(n7862), .Z(n7863) );
  MUX21L U8761 ( .A(n11010), .B(n11009), .S(n7863), .Z(n3999) );
  MUX21L U8762 ( .A(n10980), .B(n10979), .S(n7863), .Z(n4023) );
  MUX21L U8763 ( .A(n10973), .B(n10817), .S(n7863), .Z(n4031) );
  MUX21L U8764 ( .A(n10997), .B(n10826), .S(n7863), .Z(n4007) );
  MUX21L U8765 ( .A(n10989), .B(n10822), .S(n7863), .Z(n4015) );
  MUX21L U8766 ( .A(n10965), .B(n10811), .S(n7863), .Z(n4039) );
  MUX21L U8767 ( .A(n11014), .B(n11013), .S(n7863), .Z(n3991) );
  MUX21L U8768 ( .A(n11021), .B(n11019), .S(n7863), .Z(n3983) );
  IVA U8769 ( .A(n7649), .Z(n8181) );
  NR2 U8770 ( .A(n8181), .B(n7864), .Z(n7868) );
  MUX21L U8771 ( .A(n10556), .B(n7868), .S(n7865), .Z(n4465) );
  NR2 U8772 ( .A(n8340), .B(n7864), .Z(n7866) );
  MUX21L U8773 ( .A(n10985), .B(n7866), .S(n7865), .Z(n4463) );
  MUX21L U8774 ( .A(n10533), .B(n7866), .S(n7867), .Z(n4471) );
  MUX21L U8775 ( .A(n10517), .B(n7868), .S(n7867), .Z(n4473) );
  MUX21L U8776 ( .A(n10150), .B(n10890), .S(n7948), .Z(n4129) );
  MUX21L U8777 ( .A(n10965), .B(n10964), .S(n7869), .Z(n4034) );
  MUX21L U8778 ( .A(n11014), .B(n11012), .S(n7869), .Z(n3986) );
  MUX21L U8779 ( .A(n11010), .B(n11006), .S(n7869), .Z(n3994) );
  MUX21L U8780 ( .A(n10980), .B(n10976), .S(n7869), .Z(n4018) );
  MUX21L U8781 ( .A(n10997), .B(n10996), .S(n7869), .Z(n4002) );
  MUX21L U8782 ( .A(n10973), .B(n10972), .S(n7869), .Z(n4026) );
  MUX21L U8783 ( .A(n10989), .B(n10988), .S(n7869), .Z(n4010) );
  NR2 U8784 ( .A(n9236), .B(n7875), .Z(n7870) );
  EO U8785 ( .A(n7870), .B(i_i2c_tx_abrt_source[11]), .Z(n4059) );
  IVP U8786 ( .A(n7871), .Z(n7873) );
  ND2 U8787 ( .A(n7873), .B(n7872), .Z(n7874) );
  NR2 U8788 ( .A(n7875), .B(n7874), .Z(n7876) );
  EO U8789 ( .A(n7876), .B(i_i2c_tx_abrt_source[9]), .Z(n4060) );
  ND2 U8790 ( .A(i_i2c_U_DW_apb_i2c_sync_tx_empty_int_inv), .B(
        i_i2c_U_DW_apb_i2c_sync_tx_empty_sync_r), .Z(n7877) );
  OR2P U8791 ( .A(i_i2c_U_DW_apb_i2c_mstfsm_N457), .B(n7877), .Z(n7880) );
  ND3 U8792 ( .A(i_i2c_ic_enable_sync), .B(n7879), .C(n7878), .Z(n9084) );
  AO6 U8793 ( .A(n5099), .B(n7880), .C(n9084), .Z(n4076) );
  AO2 U8794 ( .A(i_i2c_ic_lcnt[11]), .B(n7999), .C(i_i2c_ic_tar[11]), .D(n8158), .Z(n7884) );
  AO2 U8795 ( .A(i_i2c_ic_hcnt[11]), .B(n7994), .C(n8285), .D(
        i_i2c_ic_intr_mask[11]), .Z(n7883) );
  AO2 U8796 ( .A(n5507), .B(i_i2c_ic_sda_hold[11]), .C(n8247), .D(
        i_i2c_ic_tx_abrt_source[11]), .Z(n7882) );
  AN2P U8797 ( .A(i_i2c_ic_raw_intr_stat[11]), .B(i_i2c_ic_intr_mask[11]), .Z(
        n10631) );
  AO2 U8798 ( .A(i_i2c_ic_raw_intr_stat[11]), .B(n8050), .C(n8052), .D(n10631), 
        .Z(n7881) );
  ND4 U8799 ( .A(n7884), .B(n7883), .C(n7882), .D(n7881), .Z(n7885) );
  ND2 U8800 ( .A(n8058), .B(n7885), .Z(n7886) );
  ND2 U8801 ( .A(n7887), .B(n7886), .Z(n3947) );
  NR2 U8802 ( .A(i_i2c_U_DW_apb_i2c_regfile_ic_txflr[2]), .B(n8071), .Z(n7896)
         );
  OR3 U8803 ( .A(n7896), .B(n7888), .C(n7931), .Z(n7889) );
  ND2 U8804 ( .A(n7895), .B(n7889), .Z(n8074) );
  NR2 U8805 ( .A(n8075), .B(n8074), .Z(n7890) );
  MUX21L U8806 ( .A(n7890), .B(n8077), .S(
        i_i2c_U_DW_apb_i2c_regfile_ic_txflr[0]), .Z(n4066) );
  NR2 U8807 ( .A(n8072), .B(n10414), .Z(n7894) );
  IVDA U8808 ( .A(n7891), .Y(n8075), .Z(n7892) );
  IVP U8809 ( .A(n7892), .Z(n7893) );
  ND2 U8810 ( .A(n7894), .B(n7893), .Z(n7898) );
  OR2P U8811 ( .A(n7896), .B(n7895), .Z(n7897) );
  AO3 U8812 ( .A(n8077), .B(n10544), .C(n7898), .D(n7897), .Z(n4067) );
  AO2 U8813 ( .A(n8247), .B(i_i2c_ic_tx_abrt_source[7]), .C(n8050), .D(
        i_i2c_ic_raw_intr_stat[7]), .Z(n7903) );
  OR2P U8814 ( .A(n7900), .B(n7899), .Z(n8286) );
  AO6 U8815 ( .A(n8158), .B(i_i2c_ic_tar[7]), .C(n7901), .Z(n7902) );
  AO3 U8816 ( .A(n8241), .B(n7904), .C(n7903), .D(n7902), .Z(n7912) );
  EO1 U8817 ( .A(i_i2c_p_det_ifaddr), .B(n8326), .C(n8289), .D(n5059), .Z(
        n7910) );
  AO2 U8818 ( .A(i_i2c_ic_spklen_o[7]), .B(n8279), .C(i_i2c_ic_hcnt[7]), .D(
        n7994), .Z(n7909) );
  AO2 U8819 ( .A(n8285), .B(i_i2c_ic_intr_mask[7]), .C(n8325), .D(
        i_i2c_ic_sda_setup[7]), .Z(n7906) );
  OR2P U8820 ( .A(n8332), .B(n10834), .Z(n7905) );
  AN2P U8821 ( .A(n7906), .B(n7905), .Z(n7908) );
  ND2 U8822 ( .A(i_i2c_ic_sda_hold[7]), .B(n5507), .Z(n7907) );
  ND4 U8823 ( .A(n7910), .B(n7909), .C(n7908), .D(n7907), .Z(n7911) );
  NR2 U8824 ( .A(n7912), .B(n7911), .Z(n7920) );
  AO2 U8825 ( .A(n8218), .B(i_i2c_U_dff_rx_mem[59]), .C(n8217), .D(
        i_i2c_U_dff_rx_mem[31]), .Z(n7916) );
  AO2 U8826 ( .A(n8220), .B(i_i2c_U_dff_rx_mem[45]), .C(n8219), .D(
        i_i2c_U_dff_rx_mem[53]), .Z(n7915) );
  AO2 U8827 ( .A(n8222), .B(i_i2c_U_dff_rx_mem[7]), .C(n8221), .D(
        i_i2c_U_dff_rx_mem[23]), .Z(n7914) );
  AO2 U8828 ( .A(n8224), .B(i_i2c_U_dff_rx_mem[15]), .C(n8223), .D(
        i_i2c_U_dff_rx_mem[39]), .Z(n7913) );
  ND4 U8829 ( .A(n7916), .B(n7915), .C(n7914), .D(n7913), .Z(n7917) );
  AO2 U8830 ( .A(n8010), .B(i_i2c_ic_sda_hold[23]), .C(n11092), .D(n7917), .Z(
        n7918) );
  AO3 U8831 ( .A(n7920), .B(n8138), .C(n7919), .D(n7918), .Z(n3951) );
  AO2 U8832 ( .A(n5509), .B(i_i2c_ic_sda_hold[9]), .C(n8285), .D(
        i_i2c_ic_intr_mask[9]), .Z(n7922) );
  AO2 U8833 ( .A(n8247), .B(i_i2c_ic_tx_abrt_source[9]), .C(
        i_i2c_ic_raw_intr_stat[9]), .D(n8050), .Z(n7921) );
  ND2 U8834 ( .A(n7922), .B(n7921), .Z(n7928) );
  AN2P U8835 ( .A(i_i2c_ic_raw_intr_stat[9]), .B(i_i2c_ic_intr_mask[9]), .Z(
        n11103) );
  AO3 U8836 ( .A(n8241), .B(n7923), .C(n8286), .D(n7996), .Z(n7926) );
  EON1 U8837 ( .A(n4951), .B(n8332), .C(i_i2c_ic_tar[9]), .D(n8158), .Z(n7925)
         );
  AO4 U8838 ( .A(n11024), .B(n8281), .C(n11023), .D(n8289), .Z(n7924) );
  OR3 U8839 ( .A(n7926), .B(n7925), .C(n7924), .Z(n7927) );
  AO7 U8840 ( .A(n7928), .B(n7927), .C(n8058), .Z(n7929) );
  ND2 U8841 ( .A(n7930), .B(n7929), .Z(n3949) );
  ND4 U8842 ( .A(n7934), .B(n5161), .C(n7933), .D(n7932), .Z(n8207) );
  IVP U8843 ( .A(n8207), .Z(n11113) );
  NR2 U8844 ( .A(ex_i_ahb_AHB_Master_haddr[1]), .B(n7935), .Z(n7938) );
  NR2 U8845 ( .A(ex_i_ahb_AHB_Slave_haddr[0]), .B(ex_i_ahb_AHB_Slave_haddr[8]), 
        .Z(n7937) );
  ND4 U8846 ( .A(n7939), .B(n7938), .C(n7937), .D(n7936), .Z(n7940) );
  OR2P U8847 ( .A(n10145), .B(n7940), .Z(n10353) );
  ND2 U8848 ( .A(i_ahb_U_arb_U_arbif_ebt), .B(n10353), .Z(n7941) );
  ND2 U8849 ( .A(n7942), .B(n7941), .Z(n4368) );
  NR2 U8850 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_stop_scl_lcnt_en), .B(n8432), .Z(
        n7944) );
  NR2 U8851 ( .A(n7944), .B(n7943), .Z(n4101) );
  MUX21L U8852 ( .A(n7945), .B(n4942), .S(n7947), .Z(n4658) );
  MUX21L U8853 ( .A(n7946), .B(n10783), .S(n7947), .Z(n4659) );
  MUX21L U8854 ( .A(n10076), .B(n4986), .S(n7947), .Z(n4654) );
  MUX21L U8855 ( .A(n10082), .B(n4926), .S(n7947), .Z(n4656) );
  MUX21L U8856 ( .A(n5299), .B(n4900), .S(n7947), .Z(n4655) );
  MUX21L U8857 ( .A(n10032), .B(n4912), .S(n7947), .Z(n4652) );
  MUX21L U8858 ( .A(n10027), .B(n4920), .S(n7947), .Z(n4657) );
  MUX21L U8859 ( .A(n10064), .B(n4907), .S(n7947), .Z(n4653) );
  MUX21L U8860 ( .A(n5167), .B(n10946), .S(n7948), .Z(n4161) );
  MUX21L U8861 ( .A(n6395), .B(n10932), .S(n7948), .Z(n4177) );
  MUX21L U8862 ( .A(n5166), .B(n10910), .S(n7948), .Z(n4137) );
  MUX21L U8863 ( .A(n10147), .B(n10925), .S(n7948), .Z(n4185) );
  MUX21L U8864 ( .A(n10149), .B(n10903), .S(n7948), .Z(n4169) );
  MUX21L U8865 ( .A(n10148), .B(n10917), .S(n7948), .Z(n4153) );
  MUX21L U8866 ( .A(n10146), .B(n10939), .S(n7948), .Z(n4145) );
  AO2 U8867 ( .A(n8218), .B(i_i2c_U_dff_rx_mem[58]), .C(n8217), .D(
        i_i2c_U_dff_rx_mem[30]), .Z(n7952) );
  AO2 U8868 ( .A(n8220), .B(i_i2c_U_dff_rx_mem[44]), .C(n8219), .D(
        i_i2c_U_dff_rx_mem[52]), .Z(n7951) );
  AO2 U8869 ( .A(n8222), .B(i_i2c_U_dff_rx_mem[6]), .C(n8221), .D(
        i_i2c_U_dff_rx_mem[22]), .Z(n7950) );
  AO2 U8870 ( .A(n8224), .B(i_i2c_U_dff_rx_mem[14]), .C(n8223), .D(
        i_i2c_U_dff_rx_mem[38]), .Z(n7949) );
  ND4 U8871 ( .A(n7952), .B(n7951), .C(n7950), .D(n7949), .Z(n7955) );
  AO3 U8872 ( .A(n8136), .B(n11015), .C(n8132), .D(n7953), .Z(n7954) );
  AO6 U8873 ( .A(n11092), .B(n7955), .C(n7954), .Z(n7973) );
  AO2 U8874 ( .A(n8050), .B(i_i2c_ic_raw_intr_stat[6]), .C(n8267), .D(
        i_i2c_U_DW_apb_i2c_regfile_slv_activity_r), .Z(n7961) );
  ND2 U8875 ( .A(i_i2c_ic_tar[6]), .B(n8158), .Z(n7956) );
  AO3 U8876 ( .A(n8241), .B(n7958), .C(n7957), .D(n7956), .Z(n7959) );
  ND2 U8877 ( .A(n7961), .B(n7960), .Z(n7971) );
  ND2 U8878 ( .A(n7999), .B(i_i2c_ic_lcnt[6]), .Z(n7963) );
  ND2 U8879 ( .A(n8204), .B(i_i2c_ic_sar[6]), .Z(n7962) );
  AN2P U8880 ( .A(n7963), .B(n7962), .Z(n7969) );
  AO2 U8881 ( .A(i_i2c_ic_sda_setup[6]), .B(n8325), .C(n8285), .D(
        i_i2c_ic_intr_mask[6]), .Z(n7965) );
  AO2 U8882 ( .A(i_i2c_ic_spklen_o[6]), .B(n8279), .C(i_i2c_ic_hcnt[6]), .D(
        n7994), .Z(n7964) );
  AN2P U8883 ( .A(n7965), .B(n7964), .Z(n7968) );
  ND2 U8884 ( .A(i_i2c_U_DW_apb_i2c_regfile_ic_con_pre_6_), .B(n8326), .Z(
        n7967) );
  ND2 U8885 ( .A(i_i2c_ic_sda_hold[6]), .B(n5509), .Z(n7966) );
  AO7 U8886 ( .A(n7971), .B(n7970), .C(n8058), .Z(n7972) );
  ND2 U8887 ( .A(n7973), .B(n7972), .Z(n3952) );
  AO2 U8888 ( .A(i_i2c_ic_hcnt[10]), .B(n7994), .C(i_i2c_ic_lcnt[10]), .D(
        n7999), .Z(n7976) );
  ND2 U8889 ( .A(i_i2c_ic_sda_hold[10]), .B(n5509), .Z(n7975) );
  ND2 U8890 ( .A(i_i2c_ic_intr_mask[10]), .B(n8285), .Z(n7974) );
  ND3 U8891 ( .A(n7976), .B(n7975), .C(n7974), .Z(n7981) );
  AO2 U8892 ( .A(n8247), .B(i_i2c_ic_tx_abrt_source[10]), .C(
        i_i2c_ic_raw_intr_stat[10]), .D(n8050), .Z(n7979) );
  AN2P U8893 ( .A(i_i2c_ic_raw_intr_stat[10]), .B(i_i2c_ic_intr_mask[10]), .Z(
        n11102) );
  ND2 U8894 ( .A(n8052), .B(n11102), .Z(n7978) );
  ND2 U8895 ( .A(i_i2c_ic_tar[10]), .B(n8158), .Z(n7977) );
  ND4 U8896 ( .A(n7979), .B(n8286), .C(n7978), .D(n7977), .Z(n7980) );
  AO7 U8897 ( .A(n7981), .B(n7980), .C(n8058), .Z(n7985) );
  ND2 U8898 ( .A(n7982), .B(i_i2c_U_DW_apb_i2c_regfile_ic_txflr_flushed[3]), 
        .Z(n7984) );
  ND4 U8899 ( .A(n8132), .B(n7985), .C(n7984), .D(n7983), .Z(n3948) );
  MUX21L U8900 ( .A(n10965), .B(n10810), .S(n7986), .Z(n4037) );
  MUX21L U8901 ( .A(n10980), .B(n10978), .S(n7986), .Z(n4021) );
  MUX21L U8902 ( .A(n11014), .B(n5091), .S(n7986), .Z(n3989) );
  MUX21L U8903 ( .A(n11021), .B(n5093), .S(n7986), .Z(n3981) );
  MUX21L U8904 ( .A(n10973), .B(n10815), .S(n7987), .Z(n4027) );
  MUX21L U8905 ( .A(n11021), .B(n5092), .S(n7987), .Z(n3979) );
  MUX21L U8906 ( .A(n11014), .B(n5090), .S(n7987), .Z(n3987) );
  MUX21L U8907 ( .A(n10989), .B(n10821), .S(n7986), .Z(n4013) );
  MUX21L U8908 ( .A(n10997), .B(n10825), .S(n7986), .Z(n4005) );
  MUX21L U8909 ( .A(n11010), .B(n11008), .S(n7986), .Z(n3997) );
  MUX21L U8910 ( .A(n10965), .B(n10809), .S(n7987), .Z(n4035) );
  MUX21L U8911 ( .A(n10980), .B(n10977), .S(n7987), .Z(n4019) );
  MUX21L U8912 ( .A(n11010), .B(n11007), .S(n7987), .Z(n3995) );
  ND2 U8913 ( .A(n9326), .B(n5087), .Z(n7988) );
  EN U8914 ( .A(n7988), .B(i_i2c_tx_abrt_source[3]), .Z(n4235) );
  ND2 U8915 ( .A(n10039), .B(n5087), .Z(n7989) );
  EN U8916 ( .A(n7989), .B(i_i2c_tx_abrt_source[1]), .Z(n4234) );
  ND2 U8917 ( .A(n7991), .B(n5087), .Z(n7992) );
  EN U8918 ( .A(n7992), .B(i_i2c_tx_abrt_source[2]), .Z(n4232) );
  ND2 U8919 ( .A(n10038), .B(n5087), .Z(n7993) );
  EN U8920 ( .A(n7993), .B(i_i2c_tx_abrt_source[0]), .Z(n4236) );
  AO2 U8921 ( .A(n8050), .B(i_i2c_ic_raw_intr_stat[5]), .C(n8267), .D(
        i_i2c_U_DW_apb_i2c_regfile_mst_activity_r), .Z(n7998) );
  AO2 U8922 ( .A(i_i2c_ic_sar[5]), .B(n8204), .C(n7994), .D(i_i2c_ic_hcnt[5]), 
        .Z(n7997) );
  ND2 U8923 ( .A(i_i2c_ic_tar[5]), .B(n8158), .Z(n7995) );
  ND4 U8924 ( .A(n7998), .B(n7997), .C(n7996), .D(n7995), .Z(n8007) );
  AO2 U8925 ( .A(i_i2c_ic_spklen_o[5]), .B(n8279), .C(i_i2c_ic_lcnt[5]), .D(
        n7999), .Z(n8005) );
  AN2P U8926 ( .A(i_i2c_ic_raw_intr_stat[5]), .B(i_i2c_ic_intr_mask[5]), .Z(
        n10736) );
  AO2 U8927 ( .A(n8247), .B(i_i2c_ic_tx_abrt_source[5]), .C(n8052), .D(n10736), 
        .Z(n8004) );
  AO2 U8928 ( .A(n8285), .B(i_i2c_ic_intr_mask[5]), .C(n8325), .D(
        i_i2c_ic_sda_setup[5]), .Z(n8001) );
  ND2 U8929 ( .A(i_i2c_ic_rstrt_en), .B(n8326), .Z(n8000) );
  AN2P U8930 ( .A(n8001), .B(n8000), .Z(n8003) );
  ND2 U8931 ( .A(i_i2c_ic_sda_hold[5]), .B(n5507), .Z(n8002) );
  ND4 U8932 ( .A(n8005), .B(n8004), .C(n8003), .D(n8002), .Z(n8006) );
  NR2 U8933 ( .A(n8007), .B(n8006), .Z(n8018) );
  NR2 U8934 ( .A(n8008), .B(n10408), .Z(n8009) );
  AO1P U8935 ( .A(n8010), .B(i_i2c_ic_sda_hold[21]), .C(n8134), .D(n8009), .Z(
        n8017) );
  AO2 U8936 ( .A(n8218), .B(i_i2c_U_dff_rx_mem[57]), .C(n8217), .D(
        i_i2c_U_dff_rx_mem[29]), .Z(n8014) );
  AO2 U8937 ( .A(n8220), .B(i_i2c_U_dff_rx_mem[43]), .C(n8219), .D(
        i_i2c_U_dff_rx_mem[51]), .Z(n8013) );
  AO2 U8938 ( .A(n8222), .B(i_i2c_U_dff_rx_mem[5]), .C(n8221), .D(
        i_i2c_U_dff_rx_mem[21]), .Z(n8012) );
  AO2 U8939 ( .A(n8224), .B(i_i2c_U_dff_rx_mem[13]), .C(n8223), .D(
        i_i2c_U_dff_rx_mem[37]), .Z(n8011) );
  ND4 U8940 ( .A(n8014), .B(n8013), .C(n8012), .D(n8011), .Z(n8015) );
  ND2 U8941 ( .A(n11092), .B(n8015), .Z(n8016) );
  AO3 U8942 ( .A(n8018), .B(n6385), .C(n8017), .D(n8016), .Z(n3953) );
  AO2 U8943 ( .A(n8218), .B(i_i2c_U_dff_rx_mem[56]), .C(n8217), .D(
        i_i2c_U_dff_rx_mem[26]), .Z(n8022) );
  AO2 U8944 ( .A(n8220), .B(i_i2c_U_dff_rx_mem[42]), .C(n8219), .D(
        i_i2c_U_dff_rx_mem[48]), .Z(n8021) );
  AO2 U8945 ( .A(n8222), .B(i_i2c_U_dff_rx_mem[2]), .C(n8221), .D(
        i_i2c_U_dff_rx_mem[18]), .Z(n8020) );
  AO2 U8946 ( .A(n8224), .B(i_i2c_U_dff_rx_mem[10]), .C(n8223), .D(
        i_i2c_U_dff_rx_mem[34]), .Z(n8019) );
  ND4 U8947 ( .A(n8022), .B(n8021), .C(n8020), .D(n8019), .Z(n8023) );
  ND2 U8948 ( .A(n11092), .B(n8023), .Z(n8025) );
  OR2P U8949 ( .A(n8136), .B(n10981), .Z(n8024) );
  AN3 U8950 ( .A(n8026), .B(n8025), .C(n8024), .Z(n8062) );
  OR2P U8951 ( .A(n8027), .B(n10982), .Z(n8028) );
  NR2 U8952 ( .A(n8029), .B(n8028), .Z(n8041) );
  ND2 U8953 ( .A(n8244), .B(i_i2c_U_DW_apb_i2c_regfile_ic_txflr[2]), .Z(n8031)
         );
  ND2 U8954 ( .A(n8267), .B(n10735), .Z(n8030) );
  ND2 U8955 ( .A(n8031), .B(n8030), .Z(n8040) );
  ND2 U8956 ( .A(n8247), .B(i_i2c_ic_tx_abrt_source[2]), .Z(n8033) );
  ND2 U8957 ( .A(n8284), .B(i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[2]), .Z(n8032)
         );
  ND2 U8958 ( .A(n8033), .B(n8032), .Z(n8039) );
  IVDA U8959 ( .A(n8290), .Y(n5510), .Z(n8167) );
  AO3 U8960 ( .A(n10983), .B(n5508), .C(n8036), .D(n8037), .Z(n8038) );
  OR4 U8961 ( .A(n8041), .B(n8040), .C(n8039), .D(n8038), .Z(n8060) );
  AO7 U8962 ( .A(n10984), .B(n8281), .C(n8286), .Z(n8045) );
  ND2 U8963 ( .A(i_i2c_ic_spklen_o[2]), .B(n8279), .Z(n8042) );
  AO7 U8964 ( .A(n8043), .B(n5061), .C(n8042), .Z(n8044) );
  NR2 U8965 ( .A(n8045), .B(n8044), .Z(n8057) );
  ND2 U8966 ( .A(n10843), .B(n8158), .Z(n8046) );
  AO7 U8967 ( .A(n10985), .B(n8213), .C(n8046), .Z(n8049) );
  ND2 U8968 ( .A(n8285), .B(i_i2c_ic_intr_mask[2]), .Z(n8047) );
  AO7 U8969 ( .A(n10986), .B(n8269), .C(n8047), .Z(n8048) );
  NR2 U8970 ( .A(n8049), .B(n8048), .Z(n8056) );
  ND2 U8971 ( .A(n8051), .B(n8050), .Z(n8055) );
  NR2 U8972 ( .A(n8263), .B(n10588), .Z(n8053) );
  ND2 U8973 ( .A(n8053), .B(n8052), .Z(n8054) );
  ND4 U8974 ( .A(n8057), .B(n8056), .C(n8055), .D(n8054), .Z(n8059) );
  AO7 U8975 ( .A(n8060), .B(n8059), .C(n8058), .Z(n8061) );
  ND2 U8976 ( .A(n8062), .B(n8061), .Z(n3956) );
  MUX21L U8977 ( .A(n10989), .B(n10992), .S(n8065), .Z(n4009) );
  MUX21L U8978 ( .A(n11010), .B(n5111), .S(n8065), .Z(n3993) );
  MUX21L U8979 ( .A(n11014), .B(n5110), .S(n8065), .Z(n3985) );
  MUX21L U8980 ( .A(n10980), .B(n5109), .S(n8065), .Z(n4017) );
  MUX21L U8981 ( .A(n10965), .B(n10812), .S(n8065), .Z(n4033) );
  MUX21L U8982 ( .A(n10997), .B(n10998), .S(n8065), .Z(n4001) );
  MUX21L U8983 ( .A(n11021), .B(n5108), .S(n8065), .Z(n3977) );
  MUX21L U8984 ( .A(n10973), .B(n10818), .S(n8065), .Z(n4025) );
  IVP U8985 ( .A(n8066), .Z(n11101) );
  NR2 U8986 ( .A(n10055), .B(n6395), .Z(n8070) );
  IVP U8987 ( .A(n8331), .Z(n8069) );
  AO3P U8988 ( .A(n8070), .B(n10056), .C(n8069), .D(n8068), .Z(n8101) );
  AO4 U8989 ( .A(n10059), .B(n11001), .C(n5167), .D(n8101), .Z(n4437) );
  AO4 U8990 ( .A(n10059), .B(n5045), .C(n7649), .D(n8101), .Z(n4441) );
  AO4 U8991 ( .A(n10059), .B(n4859), .C(n9989), .D(n8101), .Z(n4436) );
  AO4 U8992 ( .A(n10059), .B(n4958), .C(n10150), .D(n8101), .Z(n4433) );
  AO4 U8993 ( .A(n10058), .B(n10744), .C(n10146), .D(n8101), .Z(n4435) );
  AO4 U8994 ( .A(n10058), .B(n4956), .C(n5166), .D(n8101), .Z(n4434) );
  ND2 U8995 ( .A(n8072), .B(n8071), .Z(n8073) );
  MUX21L U8996 ( .A(n8075), .B(n8074), .S(n8073), .Z(n8076) );
  AO7 U8997 ( .A(n10626), .B(n8077), .C(n8076), .Z(n4065) );
  NR2 U8998 ( .A(n8079), .B(n8078), .Z(n8087) );
  AN2P U8999 ( .A(n10424), .B(n8080), .Z(n8084) );
  ND2 U9000 ( .A(n10480), .B(n8081), .Z(n8082) );
  AO4 U9001 ( .A(n8084), .B(n10246), .C(n8083), .D(n8082), .Z(n8085) );
  AO7 U9002 ( .A(n11051), .B(n8085), .C(n10324), .Z(n8086) );
  ND2 U9003 ( .A(n8087), .B(n8086), .Z(n10330) );
  ND4 U9004 ( .A(n10322), .B(i_i2c_ic_data_oe), .C(n10564), .D(n10454), .Z(
        n8088) );
  NR2 U9005 ( .A(n10327), .B(n8088), .Z(n8108) );
  NR2 U9006 ( .A(i_i2c_U_DW_apb_i2c_sync_ic_10bit_slv_sync_inv), .B(n10675), 
        .Z(n8089) );
  AO2 U9007 ( .A(n8091), .B(n8090), .C(n8108), .D(n8089), .Z(n8092) );
  AO6 U9008 ( .A(n8093), .B(n8092), .C(n8120), .Z(
        i_i2c_U_DW_apb_i2c_slvfsm_N37) );
  IVDAP U9009 ( .A(n8094), .Y(n7739), .Z(n8097) );
  ND2 U9010 ( .A(n8095), .B(n10542), .Z(n8096) );
  ND2 U9011 ( .A(n8097), .B(n8096), .Z(n10013) );
  ND2 U9012 ( .A(n8098), .B(n5133), .Z(n8100) );
  NR2 U9013 ( .A(n10013), .B(n8100), .Z(i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N40)
         );
  AO4 U9014 ( .A(n10058), .B(n10878), .C(n8345), .D(n8101), .Z(n4438) );
  MUX21L U9015 ( .A(n10965), .B(n10813), .S(n8102), .Z(n4040) );
  ND3 U9016 ( .A(i_i2c_ic_data_oe), .B(i_i2c_ic_ack_general_call_sync), .C(
        i_i2c_rx_gen_call), .Z(n10320) );
  AO6 U9017 ( .A(i_i2c_slv_rxbyte_rdy), .B(n10320), .C(n8103), .Z(n8107) );
  ND2 U9018 ( .A(i_i2c_ic_enable_sync), .B(i_i2c_s_det), .Z(n8104) );
  AO1P U9019 ( .A(n10479), .B(n8104), .C(i_i2c_slv_debug_cstate[0]), .D(n8113), 
        .Z(n8105) );
  AO6 U9020 ( .A(n8107), .B(n8106), .C(n8105), .Z(n8110) );
  ND3 U9021 ( .A(i_i2c_rx_addr_match), .B(n8108), .C(
        i_i2c_U_DW_apb_i2c_sync_ic_10bit_slv_sync_inv), .Z(n10325) );
  AN3 U9022 ( .A(n8110), .B(n8109), .C(n10325), .Z(n8122) );
  ND2 U9023 ( .A(i_i2c_slv_rxbyte_rdy), .B(i_i2c_rx_addr_match), .Z(n8111) );
  AO7 U9024 ( .A(n9135), .B(n8111), .C(n10364), .Z(n10323) );
  AO3 U9025 ( .A(n8115), .B(n8114), .C(i_i2c_s_det), .D(n8113), .Z(n8116) );
  AO3 U9026 ( .A(n8118), .B(n10246), .C(n8117), .D(n8116), .Z(n8119) );
  AO7 U9027 ( .A(n10323), .B(n8119), .C(n10567), .Z(n8121) );
  AO6 U9028 ( .A(n8122), .B(n8121), .C(n8120), .Z(
        i_i2c_U_DW_apb_i2c_slvfsm_N36) );
  ND4 U9029 ( .A(i_ahb_U_arb_U_arbif_r_haddr_d[6]), .B(n10428), .C(n10446), 
        .D(n10405), .Z(n8123) );
  NR2 U9030 ( .A(n8362), .B(n8123), .Z(n8124) );
  AN2P U9031 ( .A(n8196), .B(n8124), .Z(n8128) );
  ND2 U9032 ( .A(n8128), .B(n4992), .Z(n8125) );
  MUX21L U9033 ( .A(n10123), .B(n10751), .S(n8125), .Z(n4540) );
  NR2 U9034 ( .A(ex_i_ahb_AHB_Master_hwdata[1]), .B(n10123), .Z(n8127) );
  ND2 U9035 ( .A(n8127), .B(n8126), .Z(n8130) );
  ND2 U9036 ( .A(i_ahb_U_arb_U_arbif_r_haddr_d[3]), .B(n8128), .Z(n8129) );
  MUX21L U9037 ( .A(n8130), .B(n10750), .S(n8129), .Z(n4539) );
  MUX21L U9038 ( .A(n10029), .B(n10884), .S(n10005), .Z(n4446) );
  MUX21L U9039 ( .A(n10146), .B(n5058), .S(n10001), .Z(n4451) );
  MUX21L U9040 ( .A(n10031), .B(n11023), .S(n10001), .Z(n4448) );
  MUX21L U9041 ( .A(n8189), .B(n11029), .S(n10001), .Z(n4443) );
  NR2 U9042 ( .A(n8138), .B(n8241), .Z(n8131) );
  ND2 U9043 ( .A(n11105), .B(n8131), .Z(n8180) );
  IVP U9044 ( .A(n8132), .Z(n8133) );
  NR2 U9045 ( .A(n8134), .B(n8133), .Z(n8139) );
  OR2P U9046 ( .A(n8136), .B(n11004), .Z(n8137) );
  ND4 U9047 ( .A(n8139), .B(n8138), .C(n5130), .D(n8137), .Z(n8178) );
  NR2 U9048 ( .A(n8260), .B(n8216), .Z(n8141) );
  AO7 U9049 ( .A(n8212), .B(i_i2c_U_DW_apb_i2c_sync_U_ic_10bit_mst_1_sync_N2), 
        .C(n6843), .Z(n8140) );
  NR2 U9050 ( .A(n8141), .B(n8140), .Z(n8143) );
  OR2P U9051 ( .A(n8289), .B(n5060), .Z(n8142) );
  AN2P U9052 ( .A(n8143), .B(n8142), .Z(n8176) );
  ND2 U9053 ( .A(n8217), .B(i_i2c_U_dff_rx_mem[28]), .Z(n8144) );
  AO7 U9054 ( .A(n10998), .B(n8145), .C(n8144), .Z(n8149) );
  ND2 U9055 ( .A(n8219), .B(i_i2c_U_dff_rx_mem[50]), .Z(n8146) );
  AO7 U9056 ( .A(n10999), .B(n8147), .C(n8146), .Z(n8148) );
  NR2 U9057 ( .A(n8149), .B(n8148), .Z(n8157) );
  ND2 U9058 ( .A(n8222), .B(i_i2c_U_dff_rx_mem[4]), .Z(n8151) );
  ND2 U9059 ( .A(n8221), .B(i_i2c_U_dff_rx_mem[20]), .Z(n8150) );
  ND2 U9060 ( .A(n8151), .B(n8150), .Z(n8155) );
  ND2 U9061 ( .A(n8224), .B(i_i2c_U_dff_rx_mem[12]), .Z(n8153) );
  ND2 U9062 ( .A(n8223), .B(i_i2c_U_dff_rx_mem[36]), .Z(n8152) );
  ND2 U9063 ( .A(n10844), .B(n8158), .Z(n8160) );
  ND2 U9064 ( .A(n8247), .B(i_i2c_ic_tx_abrt_source[4]), .Z(n8159) );
  ND2 U9065 ( .A(n8160), .B(n8159), .Z(n8161) );
  NR2 U9066 ( .A(n8162), .B(n8161), .Z(n8175) );
  NR2 U9067 ( .A(n11001), .B(n8281), .Z(n8166) );
  ND2 U9068 ( .A(i_i2c_ic_spklen_o[4]), .B(n8279), .Z(n8163) );
  AO3 U9069 ( .A(n11003), .B(n8164), .C(n8163), .D(n5130), .Z(n8165) );
  NR2 U9070 ( .A(n8166), .B(n8165), .Z(n8174) );
  NR2 U9071 ( .A(n8290), .B(n11000), .Z(n8169) );
  AN2P U9072 ( .A(n8325), .B(i_i2c_ic_sda_setup[4]), .Z(n8168) );
  NR2 U9073 ( .A(n8169), .B(n8168), .Z(n8172) );
  ND2 U9074 ( .A(i_i2c_rx_full), .B(n8267), .Z(n8171) );
  ND2 U9075 ( .A(i_i2c_ic_sar[4]), .B(n8204), .Z(n8170) );
  AN3 U9076 ( .A(n8172), .B(n8171), .C(n8170), .Z(n8173) );
  ND4 U9077 ( .A(n8176), .B(n8175), .C(n8174), .D(n8173), .Z(n8177) );
  ND2 U9078 ( .A(n8178), .B(n8177), .Z(n8179) );
  ND2 U9079 ( .A(n8180), .B(n8179), .Z(n3954) );
  ND2 U9080 ( .A(i_i2c_ic_lcnt[0]), .B(n10001), .Z(n8183) );
  ND2 U9081 ( .A(n8181), .B(n10009), .Z(n8182) );
  ND2 U9082 ( .A(n8183), .B(n8182), .Z(n4457) );
  MUX21L U9083 ( .A(n10150), .B(n10891), .S(n8184), .Z(n4130) );
  MUX21L U9084 ( .A(n10149), .B(n10904), .S(n8184), .Z(n4170) );
  MUX21L U9085 ( .A(n10148), .B(n10918), .S(n8184), .Z(n4154) );
  MUX21L U9086 ( .A(n5166), .B(n10911), .S(n8184), .Z(n4138) );
  MUX21L U9087 ( .A(n10147), .B(n10926), .S(n8184), .Z(n4186) );
  MUX21L U9088 ( .A(n10146), .B(n10940), .S(n8184), .Z(n4146) );
  MUX21L U9089 ( .A(n7649), .B(n10954), .S(n8184), .Z(n4194) );
  MUX21L U9090 ( .A(n10965), .B(n10808), .S(n8187), .Z(n4036) );
  MUX21L U9091 ( .A(n10989), .B(n10820), .S(n8187), .Z(n4012) );
  MUX21L U9092 ( .A(n11014), .B(n5115), .S(n8187), .Z(n3988) );
  MUX21L U9093 ( .A(n11010), .B(n5114), .S(n8187), .Z(n3996) );
  MUX21L U9094 ( .A(n10980), .B(n5113), .S(n8187), .Z(n4020) );
  MUX21L U9095 ( .A(n10997), .B(n10824), .S(n8187), .Z(n4004) );
  MUX21L U9096 ( .A(n10973), .B(n10814), .S(n8187), .Z(n4028) );
  MUX21L U9097 ( .A(n5044), .B(n9989), .S(n8190), .Z(n4500) );
  MUX21L U9098 ( .A(n4947), .B(n8189), .S(n10059), .Z(n4427) );
  MUX21L U9099 ( .A(n10895), .B(n10029), .S(n8190), .Z(n4494) );
  MUX21L U9100 ( .A(n10991), .B(n8345), .S(n8190), .Z(n4502) );
  MUX21L U9101 ( .A(n10879), .B(n8344), .S(n10059), .Z(n4429) );
  MUX21L U9102 ( .A(n4959), .B(n10030), .S(n10058), .Z(n4431) );
  B2IP U9103 ( .A(n8188), .Z2(n8203) );
  MUX21L U9104 ( .A(n11033), .B(n8343), .S(n8203), .Z(n4490) );
  MUX21L U9105 ( .A(n11000), .B(n5167), .S(n8203), .Z(n4501) );
  MUX21L U9106 ( .A(n5036), .B(n10030), .S(n8190), .Z(n4495) );
  MUX21L U9107 ( .A(n5013), .B(n10055), .S(n8190), .Z(n4504) );
  MUX21L U9108 ( .A(n5046), .B(n10146), .S(n8203), .Z(n4499) );
  MUX21L U9109 ( .A(n5049), .B(n10031), .S(n8203), .Z(n4496) );
  MUX21L U9110 ( .A(n10896), .B(n8344), .S(n8203), .Z(n4493) );
  MUX21L U9111 ( .A(n11031), .B(n8189), .S(n8190), .Z(n4491) );
  MUX21L U9112 ( .A(n5040), .B(n5166), .S(n8190), .Z(n4498) );
  MUX21L U9113 ( .A(n11028), .B(n8193), .S(n8203), .Z(n4492) );
  MUX21L U9114 ( .A(n4967), .B(n10150), .S(n8203), .Z(n4497) );
  ND2 U9115 ( .A(i_i2c_scl_p_setup_cmplt), .B(n8432), .Z(n8360) );
  AO7 U9116 ( .A(i_i2c_scl_p_setup_en), .B(i_i2c_scl_int), .C(
        i_i2c_scl_lcnt_cmplt), .Z(n8192) );
  AO7 U9117 ( .A(i_i2c_scl_p_setup_en), .B(n8432), .C(n11110), .Z(n8191) );
  AO6 U9118 ( .A(n8360), .B(n8192), .C(n8191), .Z(n4104) );
  MUX21L U9119 ( .A(n5002), .B(n8343), .S(n10058), .Z(n4426) );
  MUX21L U9120 ( .A(n11024), .B(n10031), .S(n10058), .Z(n4432) );
  MUX21L U9121 ( .A(n11026), .B(n8193), .S(n10058), .Z(n4428) );
  MUX21L U9122 ( .A(n4961), .B(n10029), .S(n10058), .Z(n4430) );
  ND2 U9123 ( .A(i_ahb_U_arb_U_arbif_r_haddr_d[4]), .B(
        i_ahb_U_arb_U_arbif_r_haddr_d[3]), .Z(n8194) );
  NR4 U9124 ( .A(i_ahb_U_arb_U_arbif_r_haddr_d[6]), .B(n10428), .C(n10405), 
        .D(n8194), .Z(n8195) );
  AN2P U9125 ( .A(n8196), .B(n8195), .Z(n8364) );
  NR2 U9126 ( .A(i_ahb_U_arb_U_arbif_r_haddr_d[0]), .B(
        i_ahb_U_arb_U_arbif_r_hsize_d[0]), .Z(n8198) );
  AO7 U9127 ( .A(i_ahb_U_arb_U_arbif_r_haddr_d[1]), .B(n8198), .C(n8197), .Z(
        n8199) );
  ND2 U9128 ( .A(n8364), .B(n8199), .Z(n8200) );
  MUX21L U9129 ( .A(n10138), .B(n10873), .S(n8200), .Z(n4541) );
  MUX21L U9130 ( .A(n10121), .B(n10961), .S(n8200), .Z(n4542) );
  ND2 U9131 ( .A(i_i2c_slv_ack_det), .B(n4923), .Z(n8202) );
  ND2 U9132 ( .A(i_i2c_slv_tx_ack_vld), .B(i_i2c_sda_vld), .Z(n8201) );
  MUX21L U9133 ( .A(i_i2c_sda_int), .B(n8202), .S(n8201), .Z(n4261) );
  MUX21L U9134 ( .A(n10968), .B(n7649), .S(n8203), .Z(n4505) );
  AN2P U9135 ( .A(n8204), .B(n8324), .Z(n8330) );
  MUX21L U9136 ( .A(n8205), .B(n10055), .S(n8330), .Z(n4424) );
  MUX21L U9137 ( .A(n4950), .B(n9989), .S(n8330), .Z(n4420) );
  MUX21L U9138 ( .A(n4951), .B(n10031), .S(n8330), .Z(n4416) );
  NR2 U9139 ( .A(n11060), .B(n6473), .Z(n8208) );
  IVP U9140 ( .A(n11112), .Z(n8206) );
  ND3 U9141 ( .A(n8208), .B(n8207), .C(n8206), .Z(
        i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N33) );
  MUX21L U9142 ( .A(n10149), .B(n10899), .S(n5464), .Z(n4173) );
  MUX21L U9143 ( .A(n5166), .B(n10906), .S(n5464), .Z(n4141) );
  MUX21L U9144 ( .A(n10147), .B(n10921), .S(n5464), .Z(n4189) );
  MUX21L U9145 ( .A(n10146), .B(n10935), .S(n5464), .Z(n4149) );
  MUX21L U9146 ( .A(n7649), .B(n10949), .S(n5464), .Z(n4197) );
  MUX21L U9147 ( .A(n10150), .B(n10885), .S(n5464), .Z(n4133) );
  MUX21L U9148 ( .A(n10148), .B(n10913), .S(n5464), .Z(n4157) );
  MUX21L U9149 ( .A(n5167), .B(n10942), .S(n5464), .Z(n4165) );
  NR2 U9150 ( .A(i_i2c_U_DW_apb_i2c_sync_U_ic_master_1_sync_N2), .B(n8212), 
        .Z(n8214) );
  NR2 U9151 ( .A(n8214), .B(n5065), .Z(n8237) );
  NR2 U9152 ( .A(n10422), .B(n8215), .Z(n8315) );
  NR2 U9153 ( .A(n8315), .B(n5116), .Z(n8236) );
  AO2 U9154 ( .A(n8218), .B(i_i2c_U_dff_rx_mem[54]), .C(n8217), .D(
        i_i2c_U_dff_rx_mem[24]), .Z(n8228) );
  AO2 U9155 ( .A(n8220), .B(i_i2c_U_dff_rx_mem[40]), .C(n8219), .D(
        i_i2c_U_dff_rx_mem[46]), .Z(n8227) );
  AO2 U9156 ( .A(n8222), .B(i_i2c_U_dff_rx_mem[0]), .C(n8221), .D(
        i_i2c_U_dff_rx_mem[16]), .Z(n8226) );
  AO2 U9157 ( .A(n8224), .B(i_i2c_U_dff_rx_mem[8]), .C(n8223), .D(
        i_i2c_U_dff_rx_mem[32]), .Z(n8225) );
  ND4 U9158 ( .A(n8228), .B(n8227), .C(n8226), .D(n8225), .Z(n8229) );
  ND2 U9159 ( .A(n8229), .B(n11092), .Z(n8235) );
  NR2 U9160 ( .A(n10576), .B(n8230), .Z(n8233) );
  NR2 U9161 ( .A(n10555), .B(n8231), .Z(n8232) );
  NR2 U9162 ( .A(n8233), .B(n8232), .Z(n8234) );
  ND4 U9163 ( .A(n8237), .B(n8236), .C(n8235), .D(n8234), .Z(n8277) );
  OR2P U9164 ( .A(n8238), .B(n10969), .Z(n8239) );
  OR2P U9165 ( .A(n8241), .B(n8240), .Z(n8242) );
  AO7P U9166 ( .A(n8290), .B(n10968), .C(n8242), .Z(n8243) );
  IVA U9167 ( .A(n8243), .Z(n8254) );
  ND2 U9168 ( .A(i_i2c_U_DW_apb_i2c_regfile_ic_txflr[0]), .B(n8244), .Z(n8245)
         );
  ND2 U9169 ( .A(n8246), .B(n8245), .Z(n8252) );
  ND2 U9170 ( .A(n8247), .B(i_i2c_ic_tx_abrt_source[0]), .Z(n8250) );
  ND2 U9171 ( .A(i_i2c_ic_tx_tl[0]), .B(n8248), .Z(n8249) );
  ND2 U9172 ( .A(n8250), .B(n8249), .Z(n8251) );
  NR2 U9173 ( .A(n8252), .B(n8251), .Z(n8253) );
  ND3 U9174 ( .A(n8239), .B(n8254), .C(n8253), .Z(n8276) );
  AO2 U9175 ( .A(n8255), .B(i_i2c_ic_raw_intr_stat[0]), .C(n10336), .D(
        i_i2c_ic_raw_intr_stat[9]), .Z(n8257) );
  ND2 U9176 ( .A(n10342), .B(i_i2c_ic_raw_intr_stat[10]), .Z(n8256) );
  AO6 U9177 ( .A(n8257), .B(n8256), .C(n4851), .Z(n8258) );
  NR4 U9178 ( .A(i_i2c_ic_raw_intr_stat[3]), .B(i_i2c_ic_raw_intr_stat[6]), 
        .C(i_i2c_ic_raw_intr_stat[8]), .D(i_i2c_ic_raw_intr_stat[0]), .Z(n8262) );
  OR3 U9179 ( .A(i_i2c_ic_raw_intr_stat[7]), .B(i_i2c_ic_raw_intr_stat[1]), 
        .C(i_i2c_ic_raw_intr_stat[11]), .Z(n8259) );
  NR3 U9180 ( .A(i_i2c_ic_raw_intr_stat[10]), .B(i_i2c_ic_raw_intr_stat[9]), 
        .C(n8259), .Z(n8261) );
  ND4 U9181 ( .A(n8263), .B(n8262), .C(n8261), .D(n8260), .Z(n8266) );
  NR2 U9182 ( .A(n10920), .B(n8264), .Z(n8265) );
  AO6 U9183 ( .A(n10337), .B(n8266), .C(n8265), .Z(n8273) );
  ND2 U9184 ( .A(n8267), .B(i_i2c_U_DW_apb_i2c_regfile_activity_r), .Z(n8268)
         );
  AO7 U9185 ( .A(n4882), .B(n8269), .C(n8268), .Z(n8270) );
  ND4 U9186 ( .A(n8274), .B(n8273), .C(n8272), .D(n8271), .Z(n8275) );
  NR3 U9187 ( .A(n8277), .B(n8276), .C(n8275), .Z(n8323) );
  NR2 U9188 ( .A(n10966), .B(n8332), .Z(n8283) );
  NR2 U9189 ( .A(n10967), .B(n8278), .Z(n8318) );
  ND2 U9190 ( .A(i_i2c_ic_spklen_o[0]), .B(n8279), .Z(n8280) );
  AO7 U9191 ( .A(n5045), .B(n8281), .C(n8280), .Z(n8282) );
  NR3 U9192 ( .A(n8283), .B(n8318), .C(n8282), .Z(n8314) );
  ND2 U9193 ( .A(i_i2c_U_DW_apb_i2c_regfile_ic_rxflr[0]), .B(n8284), .Z(n8288)
         );
  ND2 U9194 ( .A(n8285), .B(i_i2c_ic_intr_mask[0]), .Z(n8287) );
  ND3 U9195 ( .A(n8288), .B(n8287), .C(n8286), .Z(n8294) );
  NR2 U9196 ( .A(n5062), .B(n8289), .Z(n8293) );
  NR2 U9197 ( .A(n8290), .B(n10563), .Z(n8291) );
  AN2P U9198 ( .A(n8292), .B(n8291), .Z(n8319) );
  NR3 U9199 ( .A(n8294), .B(n8293), .C(n8319), .Z(n8313) );
  AN2P U9200 ( .A(n8295), .B(i_i2c_ic_raw_intr_stat[1]), .Z(n8296) );
  ND2 U9201 ( .A(n8297), .B(n8296), .Z(n8298) );
  AO7 U9202 ( .A(n10574), .B(n8299), .C(n8298), .Z(n8300) );
  IVP U9203 ( .A(n8300), .Z(n8302) );
  MUX21L U9204 ( .A(n10841), .B(n8302), .S(n8301), .Z(n8311) );
  ND3 U9205 ( .A(n8303), .B(n8307), .C(n8304), .Z(n8310) );
  NR2 U9206 ( .A(n8307), .B(i_i2c_ic_raw_intr_stat[7]), .Z(n8305) );
  MUX21L U9207 ( .A(n10411), .B(n8305), .S(n8304), .Z(n8309) );
  AO3 U9208 ( .A(n8311), .B(n8310), .C(n8309), .D(n8308), .Z(n8312) );
  AN3 U9209 ( .A(n8314), .B(n8313), .C(n8312), .Z(n8322) );
  IVP U9210 ( .A(n8315), .Z(n8316) );
  ND2 U9211 ( .A(n7672), .B(n8316), .Z(n8317) );
  NR4 U9212 ( .A(n8320), .B(n8319), .C(n8318), .D(n8317), .Z(n8321) );
  AO6 U9213 ( .A(n8323), .B(n8322), .C(n8321), .Z(n3958) );
  AN2P U9214 ( .A(n8325), .B(n8324), .Z(n9990) );
  MUX21L U9215 ( .A(n4888), .B(n5167), .S(n9990), .Z(n3883) );
  MUX21L U9216 ( .A(n4882), .B(n7649), .S(n9990), .Z(n3886) );
  MUX21L U9217 ( .A(n4886), .B(n8345), .S(n9990), .Z(n3884) );
  MUX21L U9218 ( .A(n4885), .B(n10055), .S(n9990), .Z(n3885) );
  MUX21L U9219 ( .A(n10798), .B(n5166), .S(n9990), .Z(n3882) );
  MUX21L U9220 ( .A(n10880), .B(n10146), .S(n8330), .Z(n4419) );
  MUX21L U9221 ( .A(n10966), .B(n7649), .S(n8330), .Z(n4425) );
  MUX21L U9222 ( .A(n10982), .B(n6395), .S(n8330), .Z(n4423) );
  MUX21L U9223 ( .A(n11010), .B(n4911), .S(n8102), .Z(n4000) );
  MUX21L U9224 ( .A(n10989), .B(n10823), .S(n8102), .Z(n4016) );
  MUX21L U9225 ( .A(n11014), .B(n4914), .S(n8102), .Z(n3992) );
  MUX21L U9226 ( .A(n10973), .B(n10819), .S(n8102), .Z(n4032) );
  MUX21L U9227 ( .A(n10997), .B(n10827), .S(n8102), .Z(n4008) );
  MUX21L U9228 ( .A(n10980), .B(n4910), .S(n8102), .Z(n4024) );
  ND2P U9229 ( .A(n8326), .B(n8324), .Z(n8335) );
  MUX21L U9230 ( .A(n10150), .B(n10800), .S(n8335), .Z(n4395) );
  MUX21L U9231 ( .A(n5166), .B(n4941), .S(n8335), .Z(n4396) );
  NR2 U9232 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_bit_count[1]), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_bit_count[2]), .Z(n8601) );
  ND2 U9233 ( .A(n8601), .B(n10562), .Z(n8592) );
  ND2 U9234 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_ready_dly1), .B(
        i_i2c_slv_tx_ready_unconn), .Z(n8464) );
  NR2 U9235 ( .A(n8464), .B(n10587), .Z(n8327) );
  ND2 U9236 ( .A(n8328), .B(n8327), .Z(n10242) );
  AN3 U9237 ( .A(n11051), .B(n11050), .C(n8329), .Z(n4260) );
  OR2P U9238 ( .A(n8332), .B(n8331), .Z(n8336) );
  AO4 U9239 ( .A(n8330), .B(n5064), .C(n8345), .D(n8336), .Z(n4422) );
  AO4 U9240 ( .A(n8330), .B(n5063), .C(n10150), .D(n8336), .Z(n4417) );
  AO4 U9241 ( .A(n8330), .B(n8333), .C(n5166), .D(n8336), .Z(n4418) );
  ND3 U9242 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_scl_int_q), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_sda_int_q), .C(i_i2c_scl_int), .Z(n8334)
         );
  NR2 U9243 ( .A(i_i2c_sda_int), .B(n8334), .Z(
        i_i2c_U_DW_apb_i2c_rx_filter_s_det_int) );
  MUX21L U9244 ( .A(n7649), .B(i_i2c_U_DW_apb_i2c_sync_U_ic_master_1_sync_N2), 
        .S(n8335), .Z(n4403) );
  MUX21L U9245 ( .A(n10146), .B(
        i_i2c_U_DW_apb_i2c_sync_U_ic_slave_en_1_sync_N2), .S(n8335), .Z(n4397)
         );
  MUX21L U9246 ( .A(n8345), .B(n11114), .S(n8335), .Z(n4400) );
  MUX21L U9247 ( .A(n9989), .B(i_i2c_U_DW_apb_i2c_sync_U_ic_rstrt_en_1_sync_N2), .S(n8335), .Z(n4398) );
  MUX21L U9248 ( .A(n5167), .B(
        i_i2c_U_DW_apb_i2c_sync_U_ic_10bit_mst_1_sync_N2), .S(n8335), .Z(n4399) );
  AO4 U9249 ( .A(n8330), .B(n11002), .C(n5167), .D(n8336), .Z(n4421) );
  AO4 U9250 ( .A(n5137), .B(n10920), .C(n7649), .D(n8337), .Z(n4415) );
  MUX21L U9251 ( .A(n10150), .B(n10807), .S(n8339), .Z(n3922) );
  MUX21L U9252 ( .A(n10030), .B(n4915), .S(n8339), .Z(n3920) );
  MUX21L U9253 ( .A(n10031), .B(n10801), .S(n8339), .Z(n3921) );
  MUX21L U9254 ( .A(n6395), .B(n4968), .S(n8355), .Z(n4478) );
  MUX21L U9255 ( .A(n10055), .B(n10832), .S(n8355), .Z(n4479) );
  MUX21L U9256 ( .A(n10029), .B(n10806), .S(n8339), .Z(n3933) );
  MUX21L U9257 ( .A(n10149), .B(n10799), .S(n8339), .Z(n3938) );
  MUX21L U9258 ( .A(n10146), .B(n10956), .S(n8339), .Z(n3935) );
  MUX21L U9259 ( .A(n7649), .B(n10802), .S(n8339), .Z(n3941) );
  MUX21L U9260 ( .A(n10147), .B(n10803), .S(n8339), .Z(n3940) );
  MUX21L U9261 ( .A(n10148), .B(n10805), .S(n8339), .Z(n3936) );
  MUX21L U9262 ( .A(n5166), .B(n10804), .S(n8339), .Z(n3934) );
  MUX21L U9263 ( .A(n5167), .B(n11003), .S(n8339), .Z(n3937) );
  ND2 U9264 ( .A(i_i2c_ic_lcnt[2]), .B(n10005), .Z(n8342) );
  ND2 U9265 ( .A(n10009), .B(n8340), .Z(n8341) );
  ND2 U9266 ( .A(n8342), .B(n8341), .Z(n4455) );
  MUX21L U9267 ( .A(n10030), .B(n4892), .S(n10005), .Z(n4447) );
  MUX21L U9268 ( .A(n8343), .B(n4858), .S(n10005), .Z(n4442) );
  MUX21L U9269 ( .A(n8344), .B(n10882), .S(n10005), .Z(n4445) );
  MUX21L U9270 ( .A(n10150), .B(n10883), .S(n10005), .Z(n4449) );
  MUX21L U9271 ( .A(n9989), .B(n10743), .S(n10005), .Z(n4452) );
  ND2 U9272 ( .A(i_i2c_ic_spklen_o[3]), .B(n8355), .Z(n8347) );
  ND2 U9273 ( .A(n7713), .B(n8356), .Z(n8346) );
  ND2 U9274 ( .A(n8347), .B(n8346), .Z(n4477) );
  ND2 U9275 ( .A(i_i2c_ic_spklen_o[7]), .B(n8355), .Z(n8349) );
  ND2 U9276 ( .A(n10008), .B(n8356), .Z(n8348) );
  ND2 U9277 ( .A(n8349), .B(n8348), .Z(n4481) );
  ND2 U9278 ( .A(i_i2c_ic_spklen_o[4]), .B(n8355), .Z(n8351) );
  ND2 U9279 ( .A(n5012), .B(n8356), .Z(n8350) );
  ND2 U9280 ( .A(n8351), .B(n8350), .Z(n4476) );
  ND2 U9281 ( .A(i_i2c_ic_spklen_o[6]), .B(n8355), .Z(n8354) );
  ND2 U9282 ( .A(n8352), .B(n8356), .Z(n8353) );
  ND2 U9283 ( .A(n8354), .B(n8353), .Z(n4474) );
  ND2 U9284 ( .A(i_i2c_ic_spklen_o[5]), .B(n8355), .Z(n8359) );
  ND2 U9285 ( .A(n8357), .B(n8356), .Z(n8358) );
  ND2 U9286 ( .A(n8359), .B(n8358), .Z(n4475) );
  AN2P U9287 ( .A(n11110), .B(n8360), .Z(n8402) );
  ND2 U9288 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_stop_sda), .B(n6894), .Z(n8361)
         );
  ND2 U9289 ( .A(n8402), .B(n8361), .Z(n4102) );
  MUX21L U9290 ( .A(n8477), .B(n10868), .S(n8365), .Z(n4547) );
  MUX21L U9291 ( .A(n10127), .B(n10866), .S(n8365), .Z(n4549) );
  MUX21L U9292 ( .A(n8475), .B(n10872), .S(n8365), .Z(n4543) );
  MUX21L U9293 ( .A(n8472), .B(n10960), .S(n8365), .Z(n4545) );
  MUX21L U9294 ( .A(n8476), .B(n10870), .S(n8365), .Z(n4546) );
  MUX21L U9295 ( .A(n10130), .B(n10871), .S(n8365), .Z(n4544) );
  MUX21L U9296 ( .A(n10125), .B(n10867), .S(n8365), .Z(n4548) );
  MUX21L U9297 ( .A(n10123), .B(n10836), .S(n8365), .Z(n4550) );
  NR2 U9298 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_scl_hl_edg_cntr[1]), .B(n8366), 
        .Z(n8370) );
  OR3 U9299 ( .A(n8975), .B(n8367), .C(n10627), .Z(n8368) );
  ND2 U9300 ( .A(n8369), .B(n8368), .Z(n4292) );
  OR3 U9301 ( .A(n8975), .B(n8370), .C(n10628), .Z(n8371) );
  ND2 U9302 ( .A(n8370), .B(n10628), .Z(n10223) );
  ND2 U9303 ( .A(n8371), .B(n10223), .Z(n4291) );
  ND2 U9304 ( .A(i_ahb_U_arb_U_ebt_int_count[9]), .B(n8372), .Z(n8373) );
  MUX21L U9305 ( .A(n10873), .B(n8373), .S(n8551), .Z(n4375) );
  NR2 U9306 ( .A(i_i2c_ic_sda_rx_hold_sync[0]), .B(
        i_i2c_ic_sda_rx_hold_sync[1]), .Z(n8379) );
  NR2 U9307 ( .A(i_i2c_ic_sda_rx_hold_sync[3]), .B(
        i_i2c_ic_sda_rx_hold_sync[2]), .Z(n8374) );
  ND2 U9308 ( .A(n8379), .B(n8374), .Z(n8394) );
  EN U9309 ( .A(n8394), .B(i_i2c_ic_sda_rx_hold_sync[4]), .Z(n8490) );
  EN U9310 ( .A(n8482), .B(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[4]), 
        .Z(n8378) );
  EN U9311 ( .A(i_i2c_ic_sda_rx_hold_sync[2]), .B(n10498), .Z(n8375) );
  MUX21L U9312 ( .A(n10498), .B(n8375), .S(n8379), .Z(n8491) );
  EN U9313 ( .A(n8376), .B(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[3]), 
        .Z(n8377) );
  NR2 U9314 ( .A(n8378), .B(n8377), .Z(n8387) );
  EN U9315 ( .A(n8380), .B(i_i2c_ic_sda_rx_hold_sync[2]), .Z(n8489) );
  EN U9316 ( .A(n8381), .B(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[2]), 
        .Z(n8385) );
  EN U9317 ( .A(i_i2c_ic_sda_rx_hold_sync[0]), .B(n10507), .Z(n8484) );
  EO U9318 ( .A(n8484), .B(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[1]), 
        .Z(n8383) );
  ND2 U9319 ( .A(n8383), .B(n8382), .Z(n8384) );
  NR2 U9320 ( .A(n8385), .B(n8384), .Z(n8386) );
  ND2 U9321 ( .A(n8387), .B(n8386), .Z(n8399) );
  MUX21L U9322 ( .A(n8388), .B(n10539), .S(n8394), .Z(n8481) );
  EN U9323 ( .A(n8483), .B(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[5]), 
        .Z(n8391) );
  NR2 U9324 ( .A(i_i2c_ic_sda_rx_hold_sync[5]), .B(
        i_i2c_ic_sda_rx_hold_sync[4]), .Z(n8392) );
  EO U9325 ( .A(n8392), .B(n10514), .Z(n8389) );
  MUX21L U9326 ( .A(n8389), .B(n10514), .S(n8394), .Z(n8480) );
  EN U9327 ( .A(n8499), .B(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[6]), 
        .Z(n8390) );
  NR2 U9328 ( .A(n8391), .B(n8390), .Z(n8397) );
  EN U9329 ( .A(i_i2c_ic_sda_rx_hold_sync[6]), .B(i_i2c_ic_sda_rx_hold_sync[7]), .Z(n8393) );
  MUX21L U9330 ( .A(i_i2c_ic_sda_rx_hold_sync[7]), .B(n8393), .S(n8392), .Z(
        n8395) );
  MUX21L U9331 ( .A(n8395), .B(n10550), .S(n8394), .Z(n8500) );
  ND2 U9332 ( .A(n8397), .B(n8396), .Z(n8398) );
  NR2 U9333 ( .A(n8399), .B(n8398), .Z(n8400) );
  OR2P U9334 ( .A(n10216), .B(n8400), .Z(n8401) );
  MUX21L U9335 ( .A(n10545), .B(n8506), .S(n8401), .Z(n4345) );
  AN2P U9336 ( .A(n11110), .B(n5067), .Z(n8404) );
  AO2 U9337 ( .A(n8404), .B(n6894), .C(n8402), .D(n10532), .Z(n4103) );
  NR2 U9338 ( .A(n8406), .B(n5490), .Z(n8407) );
  MUX21L U9339 ( .A(n8407), .B(n10874), .S(n5505), .Z(n4391) );
  AO7 U9340 ( .A(i_i2c_ack_det), .B(n8408), .C(i_i2c_mst_tx_ack_vld), .Z(n8409) );
  NR2 U9341 ( .A(n8410), .B(n8409), .Z(n3815) );
  OR2P U9342 ( .A(n8414), .B(n4789), .Z(n8412) );
  IVP U9343 ( .A(n8412), .Z(n8424) );
  AO2 U9344 ( .A(n8423), .B(n8424), .C(n8411), .D(n5014), .Z(n8429) );
  AO7 U9345 ( .A(i_apb_U_DW_apb_ahbsif_state[0]), .B(n8416), .C(
        i_apb_U_DW_apb_ahbsif_state[2]), .Z(n8420) );
  AN3 U9346 ( .A(n8421), .B(i_apb_U_DW_apb_ahbsif_piped_hwrite_c), .C(n8414), 
        .Z(n8418) );
  AO6 U9347 ( .A(i_apb_U_DW_apb_ahbsif_state[0]), .B(n8416), .C(n8415), .Z(
        n8417) );
  MUX21L U9348 ( .A(n8418), .B(n8417), .S(n8422), .Z(n8419) );
  AN2P U9349 ( .A(n8420), .B(n8419), .Z(n8427) );
  AO3P U9350 ( .A(n10421), .B(n8413), .C(n8427), .D(n8426), .Z(n8428) );
  MUX21L U9351 ( .A(n8429), .B(n10483), .S(n8428), .Z(n4631) );
  NR2 U9352 ( .A(n10532), .B(n8430), .Z(n8431) );
  ND2 U9353 ( .A(n8431), .B(n8432), .Z(n8517) );
  ND2 U9354 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_re_start_scl_lcnt_en), .B(
        i_i2c_re_start_en), .Z(n8436) );
  NR2 U9355 ( .A(i_i2c_scl_s_hld_cmplt), .B(n10537), .Z(n8433) );
  ND2 U9356 ( .A(n8433), .B(n8432), .Z(n8435) );
  AN2P U9357 ( .A(n8434), .B(n10590), .Z(n8882) );
  OR2P U9358 ( .A(n10532), .B(n8435), .Z(n9107) );
  AO3 U9359 ( .A(n8437), .B(n8436), .C(n8519), .D(n9107), .Z(n4126) );
  ND2 U9360 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_re_start_sda), .B(n8517), .Z(
        n8438) );
  AO3 U9361 ( .A(n8439), .B(n8438), .C(i_i2c_re_start_en), .D(n8519), .Z(n4082) );
  ND2 U9362 ( .A(n8441), .B(n8440), .Z(n8442) );
  ND2 U9363 ( .A(n8443), .B(n8442), .Z(n8454) );
  AO3 U9364 ( .A(n8449), .B(n8448), .C(n8447), .D(n8446), .Z(n8450) );
  ND2 U9365 ( .A(n8451), .B(n8450), .Z(n8452) );
  EO1 U9366 ( .A(n8455), .B(n8454), .C(n8453), .D(n8452), .Z(n8456) );
  NR2 U9367 ( .A(n8456), .B(n10447), .Z(i_i2c_U_DW_apb_i2c_clk_gen_N13) );
  ND2 U9368 ( .A(n5014), .B(n8457), .Z(n8458) );
  ND2 U9369 ( .A(n8459), .B(n8458), .Z(n8463) );
  AO7 U9370 ( .A(n8461), .B(n5165), .C(i_apb_U_DW_apb_ahbsif_use_saved_c), .Z(
        n8462) );
  ND2 U9371 ( .A(n8463), .B(n8462), .Z(n4664) );
  NR2 U9372 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_bit_count[3]), .B(n8464), 
        .Z(n8593) );
  ND2 U9373 ( .A(n11050), .B(n8593), .Z(n8467) );
  AN2P U9374 ( .A(n10562), .B(n8467), .Z(n8465) );
  AO7 U9375 ( .A(n10562), .B(n8467), .C(n11051), .Z(n8515) );
  NR2 U9376 ( .A(n8465), .B(n8515), .Z(n4259) );
  AN2P U9377 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_bit_count[0]), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_bit_count[1]), .Z(n8598) );
  AN2P U9378 ( .A(n8598), .B(i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_bit_count[2]), 
        .Z(n8539) );
  IVP U9379 ( .A(n8539), .Z(n8603) );
  ND2 U9380 ( .A(n11051), .B(n8466), .Z(n8514) );
  AO7 U9381 ( .A(n8603), .B(n8467), .C(n11051), .Z(n8512) );
  AO4 U9382 ( .A(n8603), .B(n8514), .C(n8512), .D(n10587), .Z(n4263) );
  IVDA U9383 ( .A(n8468), .Y(n8469) );
  AN2P U9384 ( .A(n8469), .B(n11090), .Z(n11148) );
  EON1 U9385 ( .A(n10752), .B(n10403), .C(n8470), .D(n11148), .Z(n4392) );
  MUX21L U9386 ( .A(n8472), .B(n4991), .S(n10165), .Z(n4597) );
  MUX21L U9387 ( .A(n8473), .B(n4901), .S(n10165), .Z(n4582) );
  MUX21L U9388 ( .A(n8474), .B(n4895), .S(n10165), .Z(n4583) );
  MUX21L U9389 ( .A(n8475), .B(n4948), .S(n10165), .Z(n4595) );
  MUX21L U9390 ( .A(n8476), .B(n4960), .S(n10165), .Z(n4598) );
  MUX21L U9391 ( .A(n8477), .B(n5004), .S(n10165), .Z(n4599) );
  IVP U9392 ( .A(i_i2c_sda_int), .Z(n10237) );
  AN2P U9393 ( .A(n11109), .B(n8946), .Z(n9064) );
  ND2 U9394 ( .A(n9064), .B(n8478), .Z(n8479) );
  MUX21L U9395 ( .A(n10237), .B(n5083), .S(n8479), .Z(n4041) );
  AO2 U9396 ( .A(n8481), .B(n10456), .C(n8480), .D(n10653), .Z(n8498) );
  AO2 U9397 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[5]), .B(n8483), .C(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[4]), .D(n8482), .Z(n8496)
         );
  AO3 U9398 ( .A(n8485), .B(n10427), .C(n10523), .D(n10443), .Z(n8487) );
  ND2 U9399 ( .A(n8485), .B(n10427), .Z(n8486) );
  ND2 U9400 ( .A(n8487), .B(n8486), .Z(n8488) );
  AO6 U9401 ( .A(n8489), .B(n10651), .C(n8488), .Z(n8494) );
  AO4 U9402 ( .A(n8491), .B(n10461), .C(n8489), .D(n10651), .Z(n8493) );
  AO2 U9403 ( .A(n8491), .B(n10461), .C(n8490), .D(n10652), .Z(n8492) );
  AO7 U9404 ( .A(n8494), .B(n8493), .C(n8492), .Z(n8495) );
  ND2 U9405 ( .A(n8496), .B(n8495), .Z(n8497) );
  AO2 U9406 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[6]), .B(n8499), .C(n8498), .D(n8497), .Z(n8505) );
  AN2P U9407 ( .A(n8500), .B(n10566), .Z(n8504) );
  ND2 U9408 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[7]), .B(n8501), .Z(n8502) );
  AO3 U9409 ( .A(n8505), .B(n8504), .C(n8503), .D(n8502), .Z(n8508) );
  EN U9410 ( .A(n8506), .B(i_i2c_U_DW_apb_i2c_rx_filter_sda_post_hold_done), 
        .Z(n8507) );
  ND2 U9411 ( .A(n8507), .B(i_i2c_scl_int), .Z(n8509) );
  OR2P U9412 ( .A(n8508), .B(n8509), .Z(n8590) );
  OR2P U9413 ( .A(n8510), .B(n8509), .Z(n8591) );
  MUX21L U9414 ( .A(n8590), .B(n8591), .S(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[0]), .Z(n4344) );
  OR2P U9415 ( .A(n8511), .B(n8514), .Z(n8513) );
  MUX21L U9416 ( .A(n8513), .B(n8512), .S(
        i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_bit_count[2]), .Z(n4257) );
  OR2P U9417 ( .A(n10562), .B(n8514), .Z(n8516) );
  MUX21L U9418 ( .A(n8516), .B(n8515), .S(
        i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_bit_count[1]), .Z(n4258) );
  AN2P U9419 ( .A(i_i2c_re_start_en), .B(n8517), .Z(n8518) );
  ND2 U9420 ( .A(n8518), .B(n9107), .Z(n8881) );
  ND2 U9421 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_re_start_scl), .B(n8519), .Z(
        n8520) );
  ND2 U9422 ( .A(n8521), .B(n8520), .Z(n4083) );
  ND2 U9423 ( .A(i_ahb_U_arb_ebtcount[0]), .B(n8522), .Z(n8523) );
  AO7 U9424 ( .A(i_ahb_U_arb_U_ebt_int_count[0]), .B(n8549), .C(n8523), .Z(
        n4384) );
  MUX21L U9425 ( .A(n4983), .B(n8525), .S(n10117), .Z(n4581) );
  MUX21L U9426 ( .A(n4890), .B(n8526), .S(n10117), .Z(n4571) );
  AN2P U9427 ( .A(n10564), .B(n8527), .Z(n8528) );
  NR2 U9428 ( .A(n8528), .B(n9153), .Z(n4298) );
  ND2 U9429 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[30]), .B(n6944), .Z(n8532) );
  OR2P U9430 ( .A(n8636), .B(n8530), .Z(n8531) );
  ND2 U9431 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[14]), .B(n8797), .Z(n8534) );
  ND3 U9432 ( .A(n8639), .B(ex_i_ahb_AHB_Slave_haddr[14]), .C(n8637), .Z(n8533) );
  ND2 U9433 ( .A(n8534), .B(n8533), .Z(n4621) );
  ND2 U9434 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[24]), .B(n8797), .Z(n8537) );
  NR2P U9435 ( .A(n10169), .B(n8535), .Z(ex_i_ahb_AHB_Slave_haddr[24]) );
  ND3 U9436 ( .A(n8639), .B(ex_i_ahb_AHB_Slave_haddr[24]), .C(n8637), .Z(n8536) );
  ND2 U9437 ( .A(n8537), .B(n8536), .Z(n4611) );
  AN2P U9438 ( .A(i_i2c_mst_rx_bit_count[1]), .B(i_i2c_mst_rx_bit_count[0]), 
        .Z(n8945) );
  ND2 U9439 ( .A(n9064), .B(n8945), .Z(n8854) );
  OR2P U9440 ( .A(n10585), .B(n8854), .Z(n8929) );
  AO7 U9441 ( .A(n8538), .B(n10765), .C(n8929), .Z(n4105) );
  ND4 U9442 ( .A(n11050), .B(n11051), .C(n8539), .D(n10587), .Z(n8543) );
  AN2P U9443 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_data_scl_lcnt_en), .B(
        i_i2c_scl_hcnt_en), .Z(n8540) );
  AN2P U9444 ( .A(n8541), .B(n8540), .Z(n9073) );
  AN2P U9445 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_tx_bit_count[1]), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_tx_bit_count[2]), .Z(n8844) );
  AN3 U9446 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_tx_bit_count[0]), .B(n8844), .C(
        n10445), .Z(n9076) );
  ND3 U9447 ( .A(n9326), .B(n9073), .C(n9076), .Z(n8542) );
  AO3 U9448 ( .A(n8929), .B(n10424), .C(n8543), .D(n8542), .Z(
        i_i2c_U_DW_apb_i2c_tx_shift_N73) );
  EO U9449 ( .A(n8544), .B(i_ahb_U_arb_U_ebt_int_count[8]), .Z(n8545) );
  AO4 U9450 ( .A(n8551), .B(n10961), .C(n8549), .D(n8545), .Z(n4376) );
  ND2 U9451 ( .A(i_ahb_U_arb_U_ebt_int_count[5]), .B(n8546), .Z(n8547) );
  AN2P U9452 ( .A(n8548), .B(n8547), .Z(n8550) );
  AO4 U9453 ( .A(n8551), .B(n10960), .C(n8550), .D(n8549), .Z(n4379) );
  ND2 U9454 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[21]), .B(n8797), .Z(n8555) );
  IVP U9455 ( .A(n4816), .Z(n8552) );
  NR2P U9456 ( .A(n10169), .B(n8552), .Z(ex_i_ahb_AHB_Slave_haddr[21]) );
  ND3 U9457 ( .A(n8639), .B(n8553), .C(n8637), .Z(n8554) );
  ND2 U9458 ( .A(n8555), .B(n8554), .Z(n4614) );
  ND2 U9459 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[13]), .B(n8797), .Z(n8557) );
  ND3 U9460 ( .A(n8639), .B(ex_i_ahb_AHB_Slave_haddr[13]), .C(n8637), .Z(n8556) );
  ND2 U9461 ( .A(n8557), .B(n8556), .Z(n4622) );
  B2I U9462 ( .A(n8792), .Z1(n5151), .Z2(n8628) );
  ND2 U9463 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[18]), .B(n8628), .Z(n8561) );
  NR2P U9464 ( .A(n10169), .B(n8558), .Z(ex_i_ahb_AHB_Slave_haddr[18]) );
  ND3 U9465 ( .A(n8639), .B(n8559), .C(n8637), .Z(n8560) );
  ND2 U9466 ( .A(n8561), .B(n8560), .Z(n4617) );
  IVP U9467 ( .A(n4813), .Z(n8562) );
  NR2P U9468 ( .A(n10169), .B(n8562), .Z(ex_i_ahb_AHB_Slave_haddr[19]) );
  NR2 U9469 ( .A(n10263), .B(n8563), .Z(n8565) );
  NR2 U9470 ( .A(i_i2c_rx_scl_hcnt_en), .B(n8564), .Z(n8567) );
  AO7 U9471 ( .A(n8565), .B(i_i2c_mst_rx_bwen), .C(n10252), .Z(n8566) );
  NR2 U9472 ( .A(n8567), .B(n8566), .Z(n3807) );
  NR2 U9473 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_tx_bit_count[2]), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_tx_bit_count[1]), .Z(n8845) );
  NR2 U9474 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_tx_bit_count[0]), .B(n10445), .Z(
        n8568) );
  ND2 U9475 ( .A(n8845), .B(n8568), .Z(n9069) );
  NR2 U9476 ( .A(n10263), .B(n9069), .Z(n8571) );
  NR2 U9477 ( .A(i_i2c_scl_hcnt_en), .B(n8569), .Z(n8573) );
  ND2 U9478 ( .A(n10532), .B(n10445), .Z(n8570) );
  OR2P U9479 ( .A(n10254), .B(n8570), .Z(n8851) );
  AO7 U9480 ( .A(n8571), .B(i_i2c_U_DW_apb_i2c_tx_shift_mst_tx_bwen), .C(n8851), .Z(n8572) );
  NR2 U9481 ( .A(n8573), .B(n8572), .Z(n3835) );
  ND2 U9482 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[2]), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[3]), .Z(n8575) );
  ND2 U9483 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[1]), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[0]), .Z(n8588) );
  NR2 U9484 ( .A(n8575), .B(n8588), .Z(n8583) );
  MUX21H U9485 ( .A(n10456), .B(n8574), .S(n8583), .Z(n8576) );
  AO4 U9486 ( .A(n10456), .B(n8591), .C(n8590), .D(n8576), .Z(n4339) );
  EN U9487 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[6]), .B(n10566), .Z(n8577) );
  ND2 U9488 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[4]), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[5]), .Z(n8582) );
  MUX21L U9489 ( .A(n8577), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[7]), .S(n8582), .Z(
        n8578) );
  MUX21H U9490 ( .A(n10566), .B(n8578), .S(n8583), .Z(n8579) );
  AO4 U9491 ( .A(n10566), .B(n8591), .C(n8590), .D(n8579), .Z(n4337) );
  AO4 U9492 ( .A(n10427), .B(n8591), .C(n8590), .D(n8580), .Z(n4343) );
  AO4 U9493 ( .A(n10652), .B(n8591), .C(n8590), .D(n8581), .Z(n4340) );
  EO U9494 ( .A(n8582), .B(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[6]), 
        .Z(n8584) );
  MUX21H U9495 ( .A(n10653), .B(n8584), .S(n8583), .Z(n8585) );
  AO4 U9496 ( .A(n10653), .B(n8591), .C(n8590), .D(n8585), .Z(n4338) );
  AO4 U9497 ( .A(n10651), .B(n8591), .C(n8590), .D(n8587), .Z(n4342) );
  EN U9498 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[2]), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_rx_hold_cnt[3]), .Z(n8589) );
  AO4 U9499 ( .A(n10461), .B(n8591), .C(n8590), .D(n5057), .Z(n4341) );
  ND2 U9500 ( .A(n8593), .B(n8592), .Z(n8594) );
  OR2P U9501 ( .A(n11050), .B(n8594), .Z(n8604) );
  ND2 U9502 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_slv_data_sda), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_ready_dly1), .Z(n8610) );
  ND2 U9503 ( .A(i_i2c_tx_fifo_data_buf[7]), .B(n10728), .Z(n8595) );
  AN3 U9504 ( .A(n11051), .B(n8595), .C(n10242), .Z(n8609) );
  ND2 U9505 ( .A(i_i2c_tx_fifo_data_buf[1]), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_bit_count[1]), .Z(n8596) );
  MUX21L U9506 ( .A(n4925), .B(n8596), .S(
        i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_bit_count[2]), .Z(n8597) );
  AO1P U9507 ( .A(i_i2c_tx_fifo_data_buf[3]), .B(n10573), .C(
        i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_bit_count[0]), .D(n8597), .Z(n8607)
         );
  ND2 U9508 ( .A(n8598), .B(n4928), .Z(n8600) );
  ND3 U9509 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_bit_count[0]), .B(n4929), 
        .C(n10573), .Z(n8599) );
  MUX21L U9510 ( .A(n8600), .B(n8599), .S(
        i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_bit_count[2]), .Z(n8606) );
  ND2 U9511 ( .A(n8601), .B(n4930), .Z(n8602) );
  AO7 U9512 ( .A(i_i2c_tx_fifo_data_buf[0]), .B(n8603), .C(n8602), .Z(n8605)
         );
  OR4 U9513 ( .A(n8607), .B(n8606), .C(n8605), .D(n8604), .Z(n8608) );
  AO3 U9514 ( .A(n8611), .B(n8610), .C(n8609), .D(n8608), .Z(n4256) );
  ND2 U9515 ( .A(ex_i_ahb_AHB_Slave_haddr[13]), .B(n10065), .Z(n8615) );
  ND2 U9516 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[13]), .B(n10073), .Z(
        n8614) );
  ND3 U9517 ( .A(n10075), .B(n10849), .C(n4767), .Z(n8613) );
  ND3 U9518 ( .A(n8615), .B(n8614), .C(n8613), .Z(n11079) );
  ND2 U9519 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[22]), .B(n8628), .Z(n8619) );
  IVP U9520 ( .A(n4817), .Z(n8616) );
  NR2P U9521 ( .A(n10169), .B(n8616), .Z(ex_i_ahb_AHB_Slave_haddr[22]) );
  ND3 U9522 ( .A(n8639), .B(n8617), .C(n8637), .Z(n8618) );
  ND2 U9523 ( .A(n8619), .B(n8618), .Z(n4613) );
  ND2 U9524 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[19]), .B(n8628), .Z(n8621) );
  ND3 U9525 ( .A(n8639), .B(ex_i_ahb_AHB_Slave_haddr[19]), .C(n8637), .Z(n8620) );
  ND2 U9526 ( .A(n8621), .B(n8620), .Z(n4616) );
  ND2 U9527 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[17]), .B(n8628), .Z(n8623) );
  ND3 U9528 ( .A(n8639), .B(ex_i_ahb_AHB_Slave_haddr[17]), .C(n8637), .Z(n8622) );
  ND2 U9529 ( .A(n8623), .B(n8622), .Z(n4618) );
  ND2 U9530 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[23]), .B(n8636), .Z(n8627) );
  NR2P U9531 ( .A(n10169), .B(n8624), .Z(ex_i_ahb_AHB_Slave_haddr[23]) );
  ND3 U9532 ( .A(n8639), .B(n8625), .C(n8637), .Z(n8626) );
  ND2 U9533 ( .A(n8627), .B(n8626), .Z(n4612) );
  ND2 U9534 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[25]), .B(n8628), .Z(n8630) );
  ND3 U9535 ( .A(n8639), .B(ex_i_ahb_AHB_Slave_haddr[25]), .C(n8631), .Z(n8629) );
  ND2 U9536 ( .A(n8630), .B(n8629), .Z(n4610) );
  ND2 U9537 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[26]), .B(n8636), .Z(n8633) );
  ND3 U9538 ( .A(n8639), .B(ex_i_ahb_AHB_Slave_haddr[26]), .C(n8631), .Z(n8632) );
  ND2 U9539 ( .A(n8633), .B(n8632), .Z(n4609) );
  ND2 U9540 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[15]), .B(n8636), .Z(n8635) );
  NR2P U9541 ( .A(n10169), .B(n5487), .Z(ex_i_ahb_AHB_Slave_haddr[15]) );
  ND3 U9542 ( .A(n8639), .B(ex_i_ahb_AHB_Slave_haddr[15]), .C(n8637), .Z(n8634) );
  ND2 U9543 ( .A(n8635), .B(n8634), .Z(n4620) );
  ND2 U9544 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[20]), .B(n8636), .Z(n8641) );
  NR2P U9545 ( .A(n10169), .B(n5176), .Z(ex_i_ahb_AHB_Slave_haddr[20]) );
  ND3 U9546 ( .A(n8639), .B(n8638), .C(n8637), .Z(n8640) );
  ND2 U9547 ( .A(n8641), .B(n8640), .Z(n4615) );
  ND2 U9548 ( .A(n10051), .B(i_ahb_hrdata_s0[4]), .Z(n8644) );
  ND2 U9549 ( .A(i_ahb_U_arb_ebtcount[4]), .B(n4996), .Z(n8643) );
  ND2 U9550 ( .A(n8644), .B(n8643), .Z(n4363) );
  ND2 U9551 ( .A(n10051), .B(i_ahb_hrdata_s0[6]), .Z(n8646) );
  ND2 U9552 ( .A(i_ahb_U_arb_ebtcount[6]), .B(n4996), .Z(n8645) );
  ND2 U9553 ( .A(n8646), .B(n8645), .Z(n4361) );
  ND2 U9554 ( .A(n10051), .B(i_ahb_hrdata_s0[21]), .Z(n8647) );
  ND2 U9555 ( .A(n10053), .B(n8647), .Z(n4353) );
  ND2 U9556 ( .A(n10051), .B(i_ahb_hrdata_s0[12]), .Z(n8648) );
  ND2 U9557 ( .A(n10053), .B(n8648), .Z(n4357) );
  ND2 U9558 ( .A(n10051), .B(i_ahb_hrdata_s0[16]), .Z(n8649) );
  ND2 U9559 ( .A(n10053), .B(n8649), .Z(n4355) );
  ND2 U9560 ( .A(n10051), .B(i_ahb_hrdata_s0[28]), .Z(n8650) );
  ND2 U9561 ( .A(n10053), .B(n8650), .Z(n4351) );
  ND2 U9562 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[27]), .B(n8628), .Z(n8654) );
  NR2 U9563 ( .A(n5047), .B(n8651), .Z(n8652) );
  ND2 U9564 ( .A(n8800), .B(n8652), .Z(n8653) );
  ND2 U9565 ( .A(n8654), .B(n8653), .Z(n4608) );
  OR2P U9566 ( .A(i_i2c_ic_hcnt[0]), .B(i_i2c_ic_hcnt[1]), .Z(n8681) );
  NR2 U9567 ( .A(i_i2c_ic_hcnt[2]), .B(n8681), .Z(n8683) );
  ND2 U9568 ( .A(n8683), .B(n10878), .Z(n8673) );
  OR2P U9569 ( .A(i_i2c_ic_hcnt[4]), .B(n8673), .Z(n8675) );
  ND2 U9570 ( .A(n4859), .B(n10744), .Z(n8655) );
  NR2 U9571 ( .A(n8675), .B(n8655), .Z(n8684) );
  ND2 U9572 ( .A(n8684), .B(n4956), .Z(n8692) );
  IVP U9573 ( .A(n8692), .Z(n8656) );
  ND2 U9574 ( .A(n8656), .B(n4958), .Z(n8694) );
  IVP U9575 ( .A(n8694), .Z(n8667) );
  ND2 U9576 ( .A(n8667), .B(n11024), .Z(n8664) );
  OR2P U9577 ( .A(i_i2c_ic_hcnt[10]), .B(n8664), .Z(n8666) );
  OR2P U9578 ( .A(i_i2c_ic_hcnt[11]), .B(n8666), .Z(n8663) );
  IVP U9579 ( .A(n8663), .Z(n8657) );
  ND2 U9580 ( .A(n8657), .B(n10879), .Z(n8661) );
  IVP U9581 ( .A(n8661), .Z(n8658) );
  ND2 U9582 ( .A(n8658), .B(n11026), .Z(n8697) );
  ND2 U9583 ( .A(i_i2c_ic_hcnt[13]), .B(n8661), .Z(n8659) );
  ND2 U9584 ( .A(n8697), .B(n8659), .Z(n9669) );
  IVP U9585 ( .A(n9669), .Z(n8696) );
  ND2 U9586 ( .A(i_i2c_ic_hcnt[12]), .B(n8663), .Z(n8660) );
  AN2P U9587 ( .A(n8661), .B(n8660), .Z(n9673) );
  ND2 U9588 ( .A(i_i2c_ic_hcnt[11]), .B(n8666), .Z(n8662) );
  ND2 U9589 ( .A(n8663), .B(n8662), .Z(n9666) );
  IVP U9590 ( .A(n9666), .Z(n9674) );
  ND2 U9591 ( .A(i_i2c_ic_hcnt[10]), .B(n8664), .Z(n8665) );
  AN2P U9592 ( .A(n8666), .B(n8665), .Z(n9664) );
  EO U9593 ( .A(n8667), .B(i_i2c_ic_hcnt[9]), .Z(n9657) );
  AO7 U9594 ( .A(i_i2c_ic_hcnt[5]), .B(n8675), .C(i_i2c_ic_hcnt[6]), .Z(n8668)
         );
  IVP U9595 ( .A(n8668), .Z(n8669) );
  NR2 U9596 ( .A(n8684), .B(n8669), .Z(n9646) );
  AO7 U9597 ( .A(i_i2c_ic_spklen_o[2]), .B(n8732), .C(i_i2c_ic_spklen_o[3]), 
        .Z(n8678) );
  OR2P U9598 ( .A(n11036), .B(n8678), .Z(n8677) );
  NR2 U9599 ( .A(n10464), .B(n8677), .Z(n8670) );
  ND2 U9600 ( .A(i_i2c_ic_spklen_o[6]), .B(n8670), .Z(n8688) );
  AO7 U9601 ( .A(i_i2c_ic_spklen_o[6]), .B(n8670), .C(n8688), .Z(n8722) );
  EN U9602 ( .A(n8675), .B(n4859), .Z(n9647) );
  IVP U9603 ( .A(n8670), .Z(n8672) );
  ND2 U9604 ( .A(n10464), .B(n8677), .Z(n8671) );
  ND2 U9605 ( .A(n8672), .B(n8671), .Z(n8712) );
  ND2 U9606 ( .A(i_i2c_ic_hcnt[4]), .B(n8673), .Z(n8674) );
  AN2P U9607 ( .A(n8675), .B(n8674), .Z(n9639) );
  ND2 U9608 ( .A(n11036), .B(n8678), .Z(n8676) );
  ND2 U9609 ( .A(n8677), .B(n8676), .Z(n8714) );
  EN U9610 ( .A(n8683), .B(i_i2c_ic_hcnt[3]), .Z(n9638) );
  AO7 U9611 ( .A(n8732), .B(n8679), .C(n8678), .Z(n8718) );
  EN U9612 ( .A(i_i2c_ic_spklen_o[2]), .B(n8680), .Z(n8728) );
  AN2P U9613 ( .A(i_i2c_ic_hcnt[2]), .B(n8681), .Z(n8682) );
  NR2 U9614 ( .A(n8683), .B(n8682), .Z(n9635) );
  EO U9615 ( .A(i_i2c_ic_hcnt[0]), .B(i_i2c_ic_hcnt[1]), .Z(n9629) );
  NR2 U9616 ( .A(i_i2c_ic_spklen_o[0]), .B(n5045), .Z(n8731) );
  IVP U9617 ( .A(n8684), .Z(n8685) );
  ND2 U9618 ( .A(i_i2c_ic_hcnt[7]), .B(n8685), .Z(n8686) );
  AN2P U9619 ( .A(n8692), .B(n8686), .Z(n9651) );
  AN2P U9620 ( .A(n8689), .B(n9651), .Z(n8746) );
  IVP U9621 ( .A(n8688), .Z(n8687) );
  ND2 U9622 ( .A(i_i2c_ic_spklen_o[7]), .B(n8687), .Z(n8751) );
  AN2P U9623 ( .A(n10831), .B(n8688), .Z(n8749) );
  IVP U9624 ( .A(n8689), .Z(n8691) );
  IVP U9625 ( .A(n9651), .Z(n8690) );
  ND2 U9626 ( .A(n8691), .B(n8690), .Z(n8748) );
  AO2 U9627 ( .A(n8746), .B(n8751), .C(n8749), .D(n8748), .Z(n8704) );
  ND2 U9628 ( .A(i_i2c_ic_hcnt[8]), .B(n8692), .Z(n8693) );
  AN2P U9629 ( .A(n8694), .B(n8693), .Z(n8707) );
  OR2P U9630 ( .A(n8748), .B(n8751), .Z(n8703) );
  ND2 U9631 ( .A(n8707), .B(n8703), .Z(n8695) );
  AN2P U9632 ( .A(n8704), .B(n8695), .Z(n8702) );
  ND2 U9633 ( .A(n9657), .B(n8702), .Z(n8762) );
  OR2P U9634 ( .A(n9664), .B(n8762), .Z(n8767) );
  OR2P U9635 ( .A(n9674), .B(n8767), .Z(n8772) );
  OR2P U9636 ( .A(n9673), .B(n8772), .Z(n8777) );
  NR2 U9637 ( .A(n8696), .B(n8777), .Z(n8780) );
  IVP U9638 ( .A(n8697), .Z(n8698) );
  EO U9639 ( .A(n8698), .B(i_i2c_ic_hcnt[14]), .Z(n9684) );
  ND2 U9640 ( .A(n8780), .B(n9684), .Z(n8700) );
  ND2 U9641 ( .A(n8698), .B(n4947), .Z(n8699) );
  EN U9642 ( .A(n8699), .B(i_i2c_ic_hcnt[15]), .Z(n9683) );
  EN U9643 ( .A(n8700), .B(n9683), .Z(n9303) );
  IVA U9644 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[15]), .Z(n8787) );
  EN U9645 ( .A(n8780), .B(n9684), .Z(n9295) );
  NR2 U9646 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[14]), .B(n9295), 
        .Z(n8701) );
  AO6 U9647 ( .A(n9303), .B(n8787), .C(n8701), .Z(n8790) );
  EN U9648 ( .A(n8702), .B(n9657), .Z(n9278) );
  NR2 U9649 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[9]), .B(n9278), .Z(
        n8710) );
  IVP U9650 ( .A(n8703), .Z(n8706) );
  IVP U9651 ( .A(n8704), .Z(n8705) );
  OR2P U9652 ( .A(n8706), .B(n8705), .Z(n8708) );
  IVP U9653 ( .A(n8707), .Z(n9656) );
  EO U9654 ( .A(n8708), .B(n9656), .Z(n9273) );
  NR2 U9655 ( .A(n9273), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[8]), .Z(
        n8709) );
  NR2 U9656 ( .A(n8710), .B(n8709), .Z(n8761) );
  FA1A U9657 ( .A(n9647), .B(n8712), .CI(n8711), .CO(n8721), .S(n9246) );
  NR2 U9658 ( .A(n9246), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[5]), .Z(
        n8716) );
  FA1A U9659 ( .A(n9639), .B(n8714), .CI(n8713), .CO(n8711), .S(n9241) );
  NR2 U9660 ( .A(n9241), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[4]), .Z(
        n8715) );
  NR2 U9661 ( .A(n8716), .B(n8715), .Z(n8742) );
  ND2 U9662 ( .A(n9241), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[4]), .Z(
        n8720) );
  FA1A U9663 ( .A(n9638), .B(n8718), .CI(n8717), .CO(n8713), .S(n9251) );
  ND2 U9664 ( .A(n9251), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[3]), .Z(
        n8719) );
  ND2 U9665 ( .A(n8720), .B(n8719), .Z(n8726) );
  FA1A U9666 ( .A(n9646), .B(n8722), .CI(n8721), .CO(n8689), .S(n9265) );
  ND2 U9667 ( .A(n9265), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[6]), .Z(
        n8724) );
  ND2 U9668 ( .A(n9246), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[5]), .Z(
        n8723) );
  ND2 U9669 ( .A(n8724), .B(n8723), .Z(n8725) );
  AO6 U9670 ( .A(n8742), .B(n8726), .C(n8725), .Z(n8745) );
  NR2 U9671 ( .A(n9251), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[3]), .Z(
        n8730) );
  FA1A U9672 ( .A(n8728), .B(n9635), .CI(n8727), .CO(n8717), .S(n9255) );
  NR2 U9673 ( .A(n9255), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[2]), .Z(
        n8729) );
  NR2 U9674 ( .A(n8730), .B(n8729), .Z(n8741) );
  FA1A U9675 ( .A(n8732), .B(n9629), .CI(n8731), .CO(n8727), .S(n9254) );
  EN U9676 ( .A(i_i2c_ic_spklen_o[0]), .B(i_i2c_ic_hcnt[0]), .Z(n8735) );
  ND2 U9677 ( .A(n9254), .B(n8735), .Z(n9258) );
  ND2 U9678 ( .A(n9254), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[0]), .Z(
        n8734) );
  ND2 U9679 ( .A(n9255), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[2]), .Z(
        n8733) );
  AN3 U9680 ( .A(n9258), .B(n8734), .C(n8733), .Z(n8739) );
  IVP U9681 ( .A(n8735), .Z(n8737) );
  IVP U9682 ( .A(n9254), .Z(n8736) );
  ND2 U9683 ( .A(n8737), .B(n8736), .Z(n9259) );
  AO7 U9684 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[0]), .B(n9259), .C(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[1]), .Z(n8738) );
  ND2 U9685 ( .A(n8739), .B(n8738), .Z(n8740) );
  ND3 U9686 ( .A(n8742), .B(n8741), .C(n8740), .Z(n8744) );
  NR2 U9687 ( .A(n9265), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[6]), .Z(
        n8743) );
  IVP U9688 ( .A(n8746), .Z(n8747) );
  ND2 U9689 ( .A(n8748), .B(n8747), .Z(n8753) );
  IVP U9690 ( .A(n8749), .Z(n8750) );
  ND2 U9691 ( .A(n8751), .B(n8750), .Z(n8752) );
  EO U9692 ( .A(n8753), .B(n8752), .Z(n9269) );
  ND2 U9693 ( .A(n9269), .B(n8754), .Z(n8756) );
  NR2 U9694 ( .A(n9269), .B(n8754), .Z(n8755) );
  AO6 U9695 ( .A(n8757), .B(n8756), .C(n8755), .Z(n8759) );
  ND2 U9696 ( .A(n9273), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[8]), .Z(
        n8758) );
  ND2 U9697 ( .A(n8759), .B(n8758), .Z(n8760) );
  ND2 U9698 ( .A(n8761), .B(n8760), .Z(n8766) );
  ND2 U9699 ( .A(n9664), .B(n8762), .Z(n8763) );
  ND2 U9700 ( .A(n8767), .B(n8763), .Z(n9282) );
  ND2 U9701 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[10]), .B(n9282), 
        .Z(n8765) );
  ND2 U9702 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[9]), .B(n9278), .Z(
        n8764) );
  AN3 U9703 ( .A(n8766), .B(n8765), .C(n8764), .Z(n8771) );
  ND2 U9704 ( .A(n9674), .B(n8767), .Z(n8768) );
  ND2 U9705 ( .A(n8772), .B(n8768), .Z(n9286) );
  NR2 U9706 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[11]), .B(n9286), 
        .Z(n8770) );
  NR2 U9707 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[10]), .B(n9282), 
        .Z(n8769) );
  OR3 U9708 ( .A(n8771), .B(n8770), .C(n8769), .Z(n8776) );
  ND2 U9709 ( .A(n9673), .B(n8772), .Z(n8773) );
  ND2 U9710 ( .A(n8777), .B(n8773), .Z(n9285) );
  ND2 U9711 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[12]), .B(n9285), 
        .Z(n8775) );
  ND2 U9712 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[11]), .B(n9286), 
        .Z(n8774) );
  AN3 U9713 ( .A(n8776), .B(n8775), .C(n8774), .Z(n8786) );
  IVP U9714 ( .A(n8777), .Z(n8778) );
  NR2 U9715 ( .A(n8778), .B(n9669), .Z(n8779) );
  OR2P U9716 ( .A(n8780), .B(n8779), .Z(n9296) );
  IVP U9717 ( .A(n9285), .Z(n9293) );
  ND2 U9718 ( .A(n9293), .B(n10665), .Z(n8781) );
  AO7 U9719 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[13]), .B(n9296), 
        .C(n8781), .Z(n8785) );
  ND2 U9720 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[14]), .B(n9295), 
        .Z(n8783) );
  ND2 U9721 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[13]), .B(n9296), 
        .Z(n8782) );
  AN2P U9722 ( .A(n8783), .B(n8782), .Z(n8784) );
  AO7P U9723 ( .A(n8786), .B(n8785), .C(n8784), .Z(n8789) );
  NR2 U9724 ( .A(n9303), .B(n8787), .Z(n8788) );
  AO6P U9725 ( .A(n8790), .B(n8789), .C(n8788), .Z(n9333) );
  AO6 U9726 ( .A(n9333), .B(n10484), .C(n8791), .Z(n3853) );
  ND2 U9727 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[29]), .B(n8636), .Z(n8796) );
  NR2 U9728 ( .A(n5047), .B(n8793), .Z(n8794) );
  ND2 U9729 ( .A(n8800), .B(n8794), .Z(n8795) );
  ND2 U9730 ( .A(n8796), .B(n8795), .Z(n4606) );
  ND2 U9731 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[28]), .B(n8797), .Z(n8802) );
  NR2 U9732 ( .A(n5047), .B(n8798), .Z(n8799) );
  ND2 U9733 ( .A(n8800), .B(n8799), .Z(n8801) );
  ND2 U9734 ( .A(n8802), .B(n8801), .Z(n4607) );
  ND2 U9735 ( .A(n10051), .B(i_ahb_hrdata_s0[13]), .Z(n8803) );
  ND2 U9736 ( .A(n10053), .B(n8803), .Z(n4356) );
  ND2 U9737 ( .A(n10051), .B(i_ahb_hrdata_s0[29]), .Z(n8804) );
  ND2 U9738 ( .A(n10053), .B(n8804), .Z(n4350) );
  ND2 U9739 ( .A(n10051), .B(i_ahb_hrdata_s0[7]), .Z(n8806) );
  ND2 U9740 ( .A(i_ahb_U_arb_ebtcount[7]), .B(n4996), .Z(n8805) );
  ND2 U9741 ( .A(n8806), .B(n8805), .Z(n4360) );
  ND2 U9742 ( .A(n10051), .B(i_ahb_hrdata_s0[25]), .Z(n8807) );
  ND2 U9743 ( .A(n10053), .B(n8807), .Z(n4352) );
  ND2 U9744 ( .A(n10051), .B(i_ahb_hrdata_s0[9]), .Z(n8809) );
  ND2 U9745 ( .A(i_ahb_U_arb_ebtcount[9]), .B(n4996), .Z(n8808) );
  ND2 U9746 ( .A(n8809), .B(n8808), .Z(n4358) );
  ND2 U9747 ( .A(n10051), .B(i_ahb_hrdata_s0[20]), .Z(n8810) );
  ND2 U9748 ( .A(n10053), .B(n8810), .Z(n4354) );
  ND2 U9749 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[1]), .B(n10081), .Z(n8827) );
  IVDA U9750 ( .A(n11154), .Y(n7945), .Z(ex_i_ahb_AHB_Slave_haddr[1]) );
  ND2 U9751 ( .A(n10065), .B(ex_i_ahb_AHB_Slave_haddr[1]), .Z(n8825) );
  AO6 U9752 ( .A(n6964), .B(n8814), .C(n10483), .Z(n8815) );
  IVDA U9753 ( .A(n8816), .Y(n8820), .Z(n6299) );
  IVP U9754 ( .A(n8818), .Z(n10154) );
  AO7 U9755 ( .A(n8820), .B(n8819), .C(n10154), .Z(n8821) );
  ND2 U9756 ( .A(i_apb_U_DW_apb_ahbsif_piped_haddr_c[1]), .B(n10074), .Z(n8824) );
  ND2 U9757 ( .A(n10073), .B(i_apb_U_DW_apb_ahbsif_saved_haddr_c[16]), .Z(
        n8831) );
  ND2 U9758 ( .A(ex_i_ahb_AHB_Slave_haddr[16]), .B(n10065), .Z(n8830) );
  ND2 U9759 ( .A(ex_i_ahb_AHB_Slave_haddr[7]), .B(n10065), .Z(n8835) );
  ND2 U9760 ( .A(n10074), .B(i_apb_U_DW_apb_ahbsif_piped_haddr_c[7]), .Z(n8834) );
  ND2 U9761 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[7]), .B(n10081), .Z(n8833) );
  ND4 U9762 ( .A(n8836), .B(n8835), .C(n8834), .D(n8833), .Z(n11081) );
  ND2 U9763 ( .A(n11109), .B(n8837), .Z(n8838) );
  AO7 U9764 ( .A(n10269), .B(n10796), .C(n8838), .Z(n4251) );
  AO3 U9765 ( .A(n8840), .B(n9073), .C(i_i2c_debug_wr), .D(n8839), .Z(n10276)
         );
  NR2 U9766 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_tx_bit_count[2]), .B(n10572), .Z(
        n9461) );
  AO2 U9767 ( .A(n9461), .B(n5078), .C(n8844), .D(n4896), .Z(n8843) );
  ND2 U9768 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_tx_bit_count[2]), .B(n10572), .Z(
        n8848) );
  AO2 U9769 ( .A(n8845), .B(n5077), .C(n8841), .D(n4899), .Z(n8842) );
  ND2 U9770 ( .A(n8843), .B(n8842), .Z(n8850) );
  AO2 U9771 ( .A(n9461), .B(n5074), .C(n8844), .D(n5079), .Z(n8847) );
  ND2 U9772 ( .A(n8845), .B(n5075), .Z(n8846) );
  AO3 U9773 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_tx_shift_buf[2]), .B(n8848), .C(
        n8847), .D(n8846), .Z(n8849) );
  MUX21L U9774 ( .A(n8850), .B(n8849), .S(
        i_i2c_U_DW_apb_i2c_tx_shift_tx_bit_count[0]), .Z(n8852) );
  MUX21L U9775 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_data_sda), .B(n8852), .S(n9317), .Z(n8853) );
  ND3 U9776 ( .A(n11052), .B(n10276), .C(n8853), .Z(n3926) );
  OR2P U9777 ( .A(i_i2c_mst_rx_bit_count[2]), .B(n8854), .Z(n9067) );
  MUX21L U9778 ( .A(n10237), .B(n5081), .S(n9067), .Z(n4044) );
  ND2 U9779 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[15]), .B(n10081), .Z(
        n8856) );
  AO3 U9780 ( .A(n8857), .B(n5244), .C(n8856), .D(n8855), .Z(n11077) );
  IVDA U9781 ( .A(ex_i_ahb_AHB_Slave_haddr[23]), .Y(n8860), .Z(n8625) );
  ND2 U9782 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[23]), .B(n10081), .Z(
        n8859) );
  AO3 U9783 ( .A(n8860), .B(n5244), .C(n8859), .D(n8858), .Z(n11069) );
  IVDA U9784 ( .A(ex_i_ahb_AHB_Slave_haddr[21]), .Y(n8863), .Z(n8553) );
  ND2 U9785 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[21]), .B(n10073), .Z(
        n8862) );
  AO3 U9786 ( .A(n8863), .B(n5244), .C(n8862), .D(n8861), .Z(n11071) );
  IVDA U9787 ( .A(ex_i_ahb_AHB_Slave_haddr[18]), .Y(n8866), .Z(n8559) );
  ND2 U9788 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[18]), .B(n10081), .Z(
        n8865) );
  AO3 U9789 ( .A(n8866), .B(n5244), .C(n8865), .D(n8864), .Z(n11074) );
  IVDA U9790 ( .A(ex_i_ahb_AHB_Slave_haddr[22]), .Y(n8868), .Z(n8617) );
  IVDA U9791 ( .A(ex_i_ahb_AHB_Slave_haddr[20]), .Y(n8871), .Z(n8638) );
  ND2 U9792 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[20]), .B(n10081), .Z(
        n8870) );
  AO3 U9793 ( .A(n8871), .B(n5244), .C(n8870), .D(n8869), .Z(n11072) );
  ND2 U9794 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[14]), .B(n10081), .Z(
        n8873) );
  ND3 U9795 ( .A(n10075), .B(n10848), .C(n4767), .Z(n8872) );
  ND2 U9796 ( .A(i_ahb_U_arb_ebtcount[3]), .B(n8875), .Z(n8876) );
  ND2 U9797 ( .A(n8878), .B(i_ahb_U_arb_U_arbif_ipl1_int[3]), .Z(n8879) );
  OR2P U9798 ( .A(n8882), .B(n8881), .Z(n9106) );
  NR2 U9799 ( .A(n10590), .B(n9107), .Z(n9105) );
  AO7 U9800 ( .A(n9106), .B(n10795), .C(n8883), .Z(n4202) );
  NR2 U9801 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[14]), .B(n9295), 
        .Z(n8884) );
  AO6 U9802 ( .A(n9303), .B(n10616), .C(n8884), .Z(n8926) );
  ND2 U9803 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[9]), .B(n9278), 
        .Z(n8907) );
  AO2 U9804 ( .A(n9241), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[4]), 
        .C(n9251), .D(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[3]), .Z(
        n8885) );
  AO4 U9805 ( .A(n9241), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[4]), 
        .C(n9246), .D(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[5]), .Z(
        n8890) );
  NR2 U9806 ( .A(n8885), .B(n8890), .Z(n8889) );
  ND2 U9807 ( .A(n9265), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[6]), 
        .Z(n8887) );
  ND2 U9808 ( .A(n9246), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[5]), 
        .Z(n8886) );
  ND2 U9809 ( .A(n8887), .B(n8886), .Z(n8888) );
  NR2 U9810 ( .A(n8889), .B(n8888), .Z(n8900) );
  ND2 U9811 ( .A(n9254), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[0]), 
        .Z(n8893) );
  AO7 U9812 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[0]), .B(n9259), 
        .C(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[1]), .Z(n8892) );
  ND2 U9813 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[2]), .B(n9255), 
        .Z(n8891) );
  ND4 U9814 ( .A(n8893), .B(n8892), .C(n9258), .D(n8891), .Z(n8896) );
  OR2P U9815 ( .A(n9255), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[2]), 
        .Z(n8895) );
  OR2P U9816 ( .A(n9251), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[3]), 
        .Z(n8894) );
  ND4 U9817 ( .A(n8897), .B(n8896), .C(n8895), .D(n8894), .Z(n8899) );
  NR2 U9818 ( .A(n9265), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[6]), 
        .Z(n8898) );
  AO6 U9819 ( .A(n8900), .B(n8899), .C(n8898), .Z(n8902) );
  IVP U9820 ( .A(n9269), .Z(n8901) );
  AO7 U9821 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[7]), .B(n8902), 
        .C(n8901), .Z(n8905) );
  ND2 U9822 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[7]), .B(n8902), 
        .Z(n8904) );
  ND2 U9823 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[8]), .B(n9273), 
        .Z(n8903) );
  ND4 U9824 ( .A(n8907), .B(n8905), .C(n8904), .D(n8903), .Z(n8910) );
  AO4 U9825 ( .A(n9273), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[8]), 
        .C(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[9]), .D(n9278), .Z(
        n8906) );
  ND2 U9826 ( .A(n8907), .B(n8906), .Z(n8909) );
  AN2P U9827 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[10]), .B(n9282), 
        .Z(n8908) );
  AO6 U9828 ( .A(n8910), .B(n8909), .C(n8908), .Z(n8916) );
  NR2 U9829 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[11]), .B(n9286), 
        .Z(n8912) );
  NR2 U9830 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[10]), .B(n9282), 
        .Z(n8911) );
  ND2 U9831 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[12]), .B(n9285), 
        .Z(n8915) );
  ND2 U9832 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[11]), .B(n9286), 
        .Z(n8914) );
  NR2 U9833 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[13]), .B(n9296), 
        .Z(n8919) );
  NR2 U9834 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[12]), .B(n9285), 
        .Z(n8918) );
  ND2 U9835 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[13]), .B(n9296), 
        .Z(n8922) );
  ND2 U9836 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[14]), .B(n9295), 
        .Z(n8921) );
  AO3P U9837 ( .A(n8923), .B(n8920), .C(n8922), .D(n8921), .Z(n8925) );
  NR2 U9838 ( .A(n9303), .B(n10616), .Z(n8924) );
  AO6P U9839 ( .A(n8926), .B(n8925), .C(n8924), .Z(n8953) );
  AN2P U9840 ( .A(i_i2c_scl_p_setup_en), .B(n8927), .Z(n9019) );
  ND2 U9841 ( .A(i_i2c_scl_p_setup_cmplt), .B(i_i2c_scl_p_setup_en), .Z(n8928)
         );
  ND2 U9842 ( .A(n8954), .B(n8928), .Z(n3816) );
  MUX21L U9843 ( .A(n10237), .B(n5082), .S(n8929), .Z(n4048) );
  NR2 U9844 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_bit_count_3_), .B(n4924), 
        .Z(n8930) );
  AN2P U9845 ( .A(n11050), .B(n8930), .Z(n10221) );
  NR2 U9846 ( .A(n8975), .B(n10627), .Z(n8931) );
  AN2P U9847 ( .A(n10221), .B(n8931), .Z(n8934) );
  ND2 U9848 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_scl_hl_edg_cntr[2]), .B(n8934), 
        .Z(n8933) );
  ND2 U9849 ( .A(n7034), .B(n8933), .Z(n8932) );
  MUX21L U9850 ( .A(n8933), .B(n8932), .S(
        i_i2c_U_DW_apb_i2c_rx_shift_scl_hl_edg_cntr[3]), .Z(n3874) );
  OR2P U9851 ( .A(n8975), .B(n8934), .Z(n8959) );
  MUX21L U9852 ( .A(n8935), .B(n8959), .S(
        i_i2c_U_DW_apb_i2c_rx_shift_scl_hl_edg_cntr[2]), .Z(n3875) );
  ND2 U9853 ( .A(n9133), .B(n8937), .Z(n8939) );
  MUX21L U9854 ( .A(n5095), .B(n8939), .S(n8938), .Z(n4301) );
  ND2 U9855 ( .A(n8941), .B(n8940), .Z(n8942) );
  AN2P U9856 ( .A(n8943), .B(n8942), .Z(n8944) );
  MUX21L U9857 ( .A(n10753), .B(n8944), .S(n10174), .Z(n4373) );
  AN3 U9858 ( .A(i_i2c_mst_rx_bit_count[2]), .B(n8946), .C(n8945), .Z(n8948)
         );
  ND2 U9859 ( .A(i_i2c_U_DW_apb_i2c_mstfsm_ic_abort_chk_win), .B(n8947), .Z(
        n8950) );
  ND2 U9860 ( .A(i_i2c_ic_abort_sync), .B(n8948), .Z(n8949) );
  AO7 U9861 ( .A(n8950), .B(n9083), .C(n8949), .Z(n3878) );
  AN2P U9862 ( .A(n9064), .B(n10591), .Z(n10268) );
  NR2 U9863 ( .A(i_i2c_mst_rx_bit_count[1]), .B(n10585), .Z(n8951) );
  ND2 U9864 ( .A(n10268), .B(n8951), .Z(n8952) );
  MUX21L U9865 ( .A(n10237), .B(n5071), .S(n8952), .Z(n4045) );
  AN2P U9866 ( .A(n8953), .B(i_i2c_scl_p_setup_en), .Z(n9020) );
  MUX21L U9867 ( .A(n8955), .B(n8954), .S(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[0]), .Z(n3832) );
  NR2 U9868 ( .A(i_i2c_mst_rx_bit_count[1]), .B(n10591), .Z(n8956) );
  AN2P U9869 ( .A(n9064), .B(n8956), .Z(n8980) );
  ND2 U9870 ( .A(i_i2c_mst_rx_bit_count[2]), .B(n8980), .Z(n8957) );
  MUX21L U9871 ( .A(n10237), .B(n5073), .S(n8957), .Z(n4046) );
  ND2 U9872 ( .A(n8980), .B(n10585), .Z(n8958) );
  MUX21L U9873 ( .A(n10237), .B(n5070), .S(n8958), .Z(n4042) );
  NR2 U9874 ( .A(n10221), .B(i_i2c_U_DW_apb_i2c_rx_shift_scl_hl_edg_cntr[1]), 
        .Z(n8960) );
  NR2 U9875 ( .A(n8960), .B(n8959), .Z(n3876) );
  AO3 U9876 ( .A(i_i2c_ic_enable_sync), .B(i_i2c_mst_activity), .C(n9920), .D(
        n9236), .Z(n10278) );
  NR2 U9877 ( .A(n9620), .B(n10278), .Z(i_i2c_U_DW_apb_i2c_mstfsm_N68) );
  ND2 U9878 ( .A(i_i2c_sda_int), .B(n7034), .Z(n8979) );
  ND2 U9879 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[1]), .B(n7034), 
        .Z(n8962) );
  OR2P U9880 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_bit_count_2to0[0]), .B(
        n8966), .Z(n10234) );
  ND2 U9881 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_bit_count_2to0[2]), .B(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_bit_count_2to0[1]), .Z(n8972) );
  OR2P U9882 ( .A(n10234), .B(n8972), .Z(n8961) );
  MUX21L U9883 ( .A(n8979), .B(n8962), .S(n8961), .Z(n4288) );
  OR2P U9884 ( .A(n8975), .B(n10741), .Z(n8965) );
  OR2P U9885 ( .A(n8969), .B(n10234), .Z(n8964) );
  MUX21L U9886 ( .A(n8979), .B(n8965), .S(n8964), .Z(n4282) );
  OR2P U9887 ( .A(n8975), .B(n10739), .Z(n8968) );
  OR2P U9888 ( .A(n10518), .B(n8966), .Z(n10229) );
  OR2P U9889 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_bit_count_2to0[2]), .B(
        n10629), .Z(n8976) );
  OR2P U9890 ( .A(n10229), .B(n8976), .Z(n8967) );
  MUX21L U9891 ( .A(n8979), .B(n8968), .S(n8967), .Z(n4285) );
  OR2P U9892 ( .A(n8975), .B(n10740), .Z(n8971) );
  OR2P U9893 ( .A(n8969), .B(n10229), .Z(n8970) );
  MUX21L U9894 ( .A(n8979), .B(n8971), .S(n8970), .Z(n4283) );
  OR2P U9895 ( .A(n8975), .B(n10742), .Z(n8974) );
  OR2P U9896 ( .A(n10229), .B(n8972), .Z(n8973) );
  MUX21L U9897 ( .A(n8979), .B(n8974), .S(n8973), .Z(n4289) );
  OR2P U9898 ( .A(n8975), .B(n10496), .Z(n8978) );
  OR2P U9899 ( .A(n10234), .B(n8976), .Z(n8977) );
  MUX21L U9900 ( .A(n8979), .B(n8978), .S(n8977), .Z(n4284) );
  OR2P U9901 ( .A(n10268), .B(n8981), .Z(n9065) );
  ND2 U9902 ( .A(i_i2c_mst_rx_bit_count[1]), .B(n9065), .Z(n8982) );
  ND2 U9903 ( .A(n8983), .B(n8982), .Z(n4107) );
  IVDA U9904 ( .A(n9019), .Y(n8954), .Z(n9014) );
  ND2 U9905 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[8]), .B(n9014), 
        .Z(n8989) );
  IVDA U9906 ( .A(n9020), .Y(n8955), .Z(n9016) );
  ND2 U9907 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[4]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[5]), .Z(n9034) );
  ND2 U9908 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[6]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[7]), .Z(n8984) );
  NR2 U9909 ( .A(n9034), .B(n8984), .Z(n8986) );
  ND2 U9910 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[2]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[3]), .Z(n8985) );
  ND2 U9911 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[0]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[1]), .Z(n9021) );
  NR2 U9912 ( .A(n8985), .B(n9021), .Z(n9036) );
  ND2 U9913 ( .A(n8986), .B(n9036), .Z(n9055) );
  EO U9914 ( .A(n9055), .B(n10717), .Z(n8987) );
  ND2 U9915 ( .A(n9016), .B(n8987), .Z(n8988) );
  ND2 U9916 ( .A(n8989), .B(n8988), .Z(n3824) );
  ND2 U9917 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[12]), .B(n9014), 
        .Z(n8994) );
  ND2 U9918 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[8]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[9]), .Z(n9046) );
  ND2 U9919 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[10]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[11]), .Z(n8990) );
  NR2 U9920 ( .A(n9046), .B(n8990), .Z(n9053) );
  EN U9921 ( .A(n9053), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[12]), 
        .Z(n8991) );
  MUX21L U9922 ( .A(n8991), .B(n10714), .S(n9055), .Z(n8992) );
  ND2 U9923 ( .A(n9016), .B(n8992), .Z(n8993) );
  ND2 U9924 ( .A(n8994), .B(n8993), .Z(n3820) );
  ND2 U9925 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[6]), .B(n9014), 
        .Z(n8999) );
  EN U9926 ( .A(n8995), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[6]), 
        .Z(n8996) );
  MUX21L U9927 ( .A(n8996), .B(n10718), .S(n9060), .Z(n8997) );
  ND2 U9928 ( .A(n9016), .B(n8997), .Z(n8998) );
  ND2 U9929 ( .A(n8999), .B(n8998), .Z(n3826) );
  ND2 U9930 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[10]), .B(n9014), 
        .Z(n9004) );
  EN U9931 ( .A(n9000), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[10]), 
        .Z(n9001) );
  MUX21L U9932 ( .A(n9001), .B(n10715), .S(n9055), .Z(n9002) );
  ND2 U9933 ( .A(n9016), .B(n9002), .Z(n9003) );
  ND2 U9934 ( .A(n9004), .B(n9003), .Z(n3822) );
  ND2 U9935 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[3]), .B(n9014), 
        .Z(n9008) );
  EN U9936 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[2]), .B(n10720), 
        .Z(n9005) );
  MUX21H U9937 ( .A(n9005), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[3]), 
        .S(n9021), .Z(n9006) );
  ND2 U9938 ( .A(n9016), .B(n9006), .Z(n9007) );
  ND2 U9939 ( .A(n9008), .B(n9007), .Z(n3829) );
  ND2 U9940 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[14]), .B(n9014), 
        .Z(n9013) );
  ND2 U9941 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[12]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[13]), .Z(n9051) );
  EO U9942 ( .A(n9051), .B(n10617), .Z(n9009) );
  MUX21L U9943 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[14]), .B(n9009), .S(n9053), .Z(n9010) );
  MUX21L U9944 ( .A(n9010), .B(n10617), .S(n9055), .Z(n9011) );
  ND2 U9945 ( .A(n9016), .B(n9011), .Z(n9012) );
  ND2 U9946 ( .A(n9013), .B(n9012), .Z(n3818) );
  ND2 U9947 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[1]), .B(n9014), 
        .Z(n9018) );
  ND2 U9948 ( .A(n9016), .B(n9015), .Z(n9017) );
  ND2 U9949 ( .A(n9018), .B(n9017), .Z(n3831) );
  ND2 U9950 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[2]), .B(n9019), 
        .Z(n9025) );
  EN U9951 ( .A(n9022), .B(n10721), .Z(n9023) );
  ND2 U9952 ( .A(n9020), .B(n9023), .Z(n9024) );
  ND2 U9953 ( .A(n9025), .B(n9024), .Z(n3830) );
  ND2 U9954 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[9]), .B(n9019), 
        .Z(n9029) );
  EN U9955 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[8]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[9]), .Z(n9026) );
  MUX21L U9956 ( .A(n9026), .B(n10716), .S(n9055), .Z(n9027) );
  ND2 U9957 ( .A(n9020), .B(n9027), .Z(n9028) );
  ND2 U9958 ( .A(n9029), .B(n9028), .Z(n3823) );
  ND2 U9959 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[5]), .B(n9019), 
        .Z(n9033) );
  EN U9960 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[4]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[5]), .Z(n9030) );
  MUX21L U9961 ( .A(n9030), .B(n10722), .S(n9060), .Z(n9031) );
  ND2 U9962 ( .A(n9020), .B(n9031), .Z(n9032) );
  ND2 U9963 ( .A(n9033), .B(n9032), .Z(n3827) );
  ND2 U9964 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[7]), .B(n9019), 
        .Z(n9040) );
  EN U9965 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[6]), .B(n10571), 
        .Z(n9035) );
  MUX21L U9966 ( .A(n9035), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[7]), 
        .S(n9034), .Z(n9037) );
  MUX21L U9967 ( .A(n10571), .B(n9037), .S(n9036), .Z(n9038) );
  ND2 U9968 ( .A(n9020), .B(n9038), .Z(n9039) );
  ND2 U9969 ( .A(n9040), .B(n9039), .Z(n3825) );
  ND2 U9970 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[13]), .B(n9019), 
        .Z(n9045) );
  MUX21L U9971 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[13]), .B(n9041), .S(n9053), .Z(n9042) );
  MUX21L U9972 ( .A(n9042), .B(n10713), .S(n9055), .Z(n9043) );
  ND2 U9973 ( .A(n9020), .B(n9043), .Z(n9044) );
  ND2 U9974 ( .A(n9045), .B(n9044), .Z(n3819) );
  ND2 U9975 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[11]), .B(n9019), 
        .Z(n9050) );
  EN U9976 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[10]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[11]), .Z(n9047) );
  MUX21L U9977 ( .A(n5001), .B(n10618), .S(n9055), .Z(n9048) );
  ND2 U9978 ( .A(n9020), .B(n9048), .Z(n9049) );
  ND2 U9979 ( .A(n9050), .B(n9049), .Z(n3821) );
  ND2 U9980 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[15]), .B(n9019), 
        .Z(n9059) );
  EN U9981 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[14]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[15]), .Z(n9052) );
  MUX21L U9982 ( .A(n9052), .B(n10616), .S(n9051), .Z(n9054) );
  MUX21L U9983 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[15]), .B(n9054), .S(n9053), .Z(n9056) );
  MUX21L U9984 ( .A(n9056), .B(n10616), .S(n9055), .Z(n9057) );
  ND2 U9985 ( .A(n9020), .B(n9057), .Z(n9058) );
  ND2 U9986 ( .A(n9059), .B(n9058), .Z(n3817) );
  ND2 U9987 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_p_setup_cntr[4]), .B(n9019), 
        .Z(n9063) );
  EO U9988 ( .A(n9060), .B(n10719), .Z(n9061) );
  ND2 U9989 ( .A(n9020), .B(n9061), .Z(n9062) );
  ND2 U9990 ( .A(n9063), .B(n9062), .Z(n3828) );
  AN2P U9991 ( .A(n9064), .B(n10738), .Z(n9066) );
  AO7 U9992 ( .A(n9066), .B(n9065), .C(i_i2c_mst_rx_bit_count[2]), .Z(n9068)
         );
  ND2 U9993 ( .A(n9068), .B(n9067), .Z(n4106) );
  ND2 U9994 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_tx_bit_count[3]), .B(n9069), .Z(
        n9078) );
  ND2 U9995 ( .A(n9073), .B(n9078), .Z(n9070) );
  ND2 U9996 ( .A(n11052), .B(n9070), .Z(n9071) );
  ND2P U9997 ( .A(n10569), .B(n11052), .Z(n9323) );
  IVP U9998 ( .A(n9072), .Z(n10259) );
  ND2 U9999 ( .A(i_i2c_debug_wr), .B(n10445), .Z(n9074) );
  NR2 U10000 ( .A(n9075), .B(n9074), .Z(n9602) );
  AN2P U10001 ( .A(n9602), .B(n11052), .Z(n9460) );
  ND2 U10002 ( .A(n9460), .B(n9076), .Z(n9077) );
  AO7 U10003 ( .A(n10259), .B(n10445), .C(n9077), .Z(n3811) );
  ND2 U10004 ( .A(i_i2c_debug_wr), .B(n9078), .Z(n9079) );
  OR2P U10005 ( .A(n10263), .B(n9079), .Z(n9080) );
  ND2 U10006 ( .A(n10276), .B(n9080), .Z(n9316) );
  AO1P U10007 ( .A(n9081), .B(n9317), .C(
        i_i2c_U_DW_apb_i2c_tx_shift_data_scl_lcnt_en), .D(n9316), .Z(n9082) );
  NR2 U10008 ( .A(n10259), .B(n9082), .Z(n3809) );
  MUX21L U10009 ( .A(n9083), .B(i_i2c_U_DW_apb_i2c_mstfsm_abrt_in_idle), .S(
        n9617), .Z(n9085) );
  AO6 U10010 ( .A(n10797), .B(n9085), .C(n9084), .Z(n4061) );
  OR2P U10011 ( .A(i_i2c_tx_rd_addr[2]), .B(i_i2c_tx_rd_addr[1]), .Z(n9086) );
  NR2 U10012 ( .A(n10893), .B(n9086), .Z(n10312) );
  OR2P U10013 ( .A(i_i2c_tx_rd_addr[0]), .B(i_i2c_tx_rd_addr[2]), .Z(n9088) );
  NR2 U10014 ( .A(n10584), .B(n9088), .Z(n9087) );
  AO2 U10015 ( .A(n10312), .B(i_i2c_U_dff_tx_mem[59]), .C(n9087), .D(
        i_i2c_U_dff_tx_mem[50]), .Z(n9093) );
  NR2 U10016 ( .A(i_i2c_tx_rd_addr[1]), .B(n9088), .Z(n10313) );
  AN3 U10017 ( .A(i_i2c_tx_rd_addr[0]), .B(i_i2c_tx_rd_addr[1]), .C(n10745), 
        .Z(n9109) );
  AO2 U10018 ( .A(n10313), .B(i_i2c_U_dff_tx_mem[68]), .C(n9109), .D(
        i_i2c_U_dff_tx_mem[41]), .Z(n9092) );
  AN3 U10019 ( .A(i_i2c_tx_rd_addr[0]), .B(i_i2c_tx_rd_addr[2]), .C(n10584), 
        .Z(n9110) );
  AN3 U10020 ( .A(i_i2c_tx_rd_addr[2]), .B(n10893), .C(n10584), .Z(n9111) );
  AO2 U10021 ( .A(n9110), .B(i_i2c_U_dff_tx_mem[23]), .C(n9111), .D(
        i_i2c_U_dff_tx_mem[32]), .Z(n9091) );
  ND2 U10022 ( .A(i_i2c_tx_rd_addr[1]), .B(i_i2c_tx_rd_addr[2]), .Z(n10295) );
  NR2 U10023 ( .A(i_i2c_tx_rd_addr[0]), .B(n10295), .Z(n9089) );
  NR2 U10024 ( .A(n10893), .B(n10295), .Z(n10287) );
  AO2 U10025 ( .A(n9089), .B(i_i2c_U_dff_tx_mem[14]), .C(n10314), .D(
        i_i2c_U_dff_tx_mem[5]), .Z(n9090) );
  AN4P U10026 ( .A(n9093), .B(n9092), .C(n9091), .D(n9090), .Z(n9094) );
  MUX21L U10027 ( .A(n4925), .B(n9094), .S(n9116), .Z(n4267) );
  AO2 U10028 ( .A(n10312), .B(i_i2c_U_dff_tx_mem[56]), .C(n9087), .D(
        i_i2c_U_dff_tx_mem[47]), .Z(n9098) );
  AO2 U10029 ( .A(n10313), .B(i_i2c_U_dff_tx_mem[65]), .C(n9109), .D(
        i_i2c_U_dff_tx_mem[38]), .Z(n9097) );
  AO2 U10030 ( .A(n9110), .B(i_i2c_U_dff_tx_mem[20]), .C(n9111), .D(
        i_i2c_U_dff_tx_mem[29]), .Z(n9096) );
  AO2 U10031 ( .A(n9089), .B(i_i2c_U_dff_tx_mem[11]), .C(n10314), .D(
        i_i2c_U_dff_tx_mem[2]), .Z(n9095) );
  AN4P U10032 ( .A(n9098), .B(n9097), .C(n9096), .D(n9095), .Z(n9099) );
  MUX21L U10033 ( .A(n4929), .B(n9099), .S(n9116), .Z(n4270) );
  AO2 U10034 ( .A(n10312), .B(i_i2c_U_dff_tx_mem[58]), .C(n9087), .D(
        i_i2c_U_dff_tx_mem[49]), .Z(n9103) );
  AO2 U10035 ( .A(n10313), .B(i_i2c_U_dff_tx_mem[67]), .C(n9109), .D(
        i_i2c_U_dff_tx_mem[40]), .Z(n9102) );
  AO2 U10036 ( .A(n9110), .B(i_i2c_U_dff_tx_mem[22]), .C(n9111), .D(
        i_i2c_U_dff_tx_mem[31]), .Z(n9101) );
  AO2 U10037 ( .A(n9089), .B(i_i2c_U_dff_tx_mem[13]), .C(n10314), .D(
        i_i2c_U_dff_tx_mem[4]), .Z(n9100) );
  AN4P U10038 ( .A(n9103), .B(n9102), .C(n9101), .D(n9100), .Z(n9104) );
  MUX21L U10039 ( .A(n4928), .B(n9104), .S(n9116), .Z(n4268) );
  AO7 U10040 ( .A(n9105), .B(i_i2c_scl_int), .C(n9106), .Z(n9108) );
  AO2 U10041 ( .A(n10453), .B(n9108), .C(n9107), .D(n9106), .Z(n4220) );
  AO2 U10042 ( .A(n10312), .B(i_i2c_U_dff_tx_mem[62]), .C(n9087), .D(
        i_i2c_U_dff_tx_mem[53]), .Z(n9115) );
  AO2 U10043 ( .A(n10313), .B(i_i2c_U_dff_tx_mem[71]), .C(n9109), .D(
        i_i2c_U_dff_tx_mem[44]), .Z(n9114) );
  AO2 U10044 ( .A(n9110), .B(i_i2c_U_dff_tx_mem[26]), .C(n9111), .D(
        i_i2c_U_dff_tx_mem[35]), .Z(n9113) );
  AO2 U10045 ( .A(n9089), .B(i_i2c_U_dff_tx_mem[17]), .C(n10314), .D(
        i_i2c_U_dff_tx_mem[8]), .Z(n9112) );
  AN4P U10046 ( .A(n9115), .B(n9114), .C(n9113), .D(n9112), .Z(n9117) );
  MUX21L U10047 ( .A(n10424), .B(n9117), .S(n9116), .Z(n4264) );
  AO2 U10048 ( .A(n10312), .B(i_i2c_U_dff_tx_mem[54]), .C(n9087), .D(
        i_i2c_U_dff_tx_mem[45]), .Z(n9121) );
  AO2 U10049 ( .A(n10313), .B(i_i2c_U_dff_tx_mem[63]), .C(n9109), .D(
        i_i2c_U_dff_tx_mem[36]), .Z(n9120) );
  AO2 U10050 ( .A(n9110), .B(i_i2c_U_dff_tx_mem[18]), .C(n9111), .D(
        i_i2c_U_dff_tx_mem[27]), .Z(n9119) );
  AO2 U10051 ( .A(n9089), .B(i_i2c_U_dff_tx_mem[9]), .C(n10314), .D(
        i_i2c_U_dff_tx_mem[0]), .Z(n9118) );
  AN4P U10052 ( .A(n9121), .B(n9120), .C(n9119), .D(n9118), .Z(n9122) );
  MUX21L U10053 ( .A(n4897), .B(n9122), .S(n9116), .Z(n4272) );
  AO2 U10054 ( .A(n10312), .B(i_i2c_U_dff_tx_mem[60]), .C(n9087), .D(
        i_i2c_U_dff_tx_mem[51]), .Z(n9126) );
  AO2 U10055 ( .A(n10313), .B(i_i2c_U_dff_tx_mem[69]), .C(n9109), .D(
        i_i2c_U_dff_tx_mem[42]), .Z(n9125) );
  AO2 U10056 ( .A(n9110), .B(i_i2c_U_dff_tx_mem[24]), .C(n9111), .D(
        i_i2c_U_dff_tx_mem[33]), .Z(n9124) );
  AO2 U10057 ( .A(n9089), .B(i_i2c_U_dff_tx_mem[15]), .C(n10314), .D(
        i_i2c_U_dff_tx_mem[6]), .Z(n9123) );
  AN4P U10058 ( .A(n9126), .B(n9125), .C(n9124), .D(n9123), .Z(n9127) );
  MUX21L U10059 ( .A(n4930), .B(n9127), .S(n9116), .Z(n4266) );
  AN2P U10060 ( .A(i_i2c_mst_rx_bit_count[1]), .B(n10268), .Z(n9129) );
  ND2 U10061 ( .A(n9129), .B(n10585), .Z(n9128) );
  MUX21L U10062 ( .A(n10237), .B(n5069), .S(n9128), .Z(n4043) );
  ND2 U10063 ( .A(i_i2c_mst_rx_bit_count[2]), .B(n9129), .Z(n9130) );
  MUX21L U10064 ( .A(n10237), .B(n5072), .S(n9130), .Z(n4047) );
  OR2P U10065 ( .A(n9133), .B(n9132), .Z(n9136) );
  ND2 U10066 ( .A(n9133), .B(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[0]), 
        .Z(n9134) );
  AO7 U10067 ( .A(n9136), .B(n10454), .C(n9134), .Z(n10241) );
  ND2 U10068 ( .A(n10608), .B(n10241), .Z(n9140) );
  NR2 U10069 ( .A(n9135), .B(n9142), .Z(n9137) );
  NR2 U10070 ( .A(n9137), .B(n9136), .Z(n9149) );
  NR3 U10071 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_shift_reg[0]), .B(n9138), 
        .C(n10462), .Z(n9139) );
  AO1P U10072 ( .A(n9141), .B(n9140), .C(n9149), .D(n9139), .Z(n9143) );
  NR2 U10073 ( .A(n9143), .B(n9142), .Z(n9155) );
  AO7 U10074 ( .A(n9145), .B(n9148), .C(n9147), .Z(n9154) );
  AN3 U10075 ( .A(n9148), .B(n9147), .C(n9146), .Z(n9151) );
  ND2 U10076 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_bit_count_3_), .B(n9149), 
        .Z(n9150) );
  AO7 U10077 ( .A(n11050), .B(n9151), .C(n9150), .Z(n9152) );
  OR2P U10078 ( .A(n9153), .B(n9152), .Z(n9156) );
  AO3 U10079 ( .A(n9155), .B(n9154), .C(n7034), .D(n9156), .Z(n9159) );
  ND2 U10080 ( .A(i_i2c_slv_rx_ack_vld), .B(n9157), .Z(n9158) );
  ND2 U10081 ( .A(n9159), .B(n9158), .Z(n4297) );
  NR2 U10082 ( .A(n10264), .B(n10254), .Z(n9234) );
  NR2 U10083 ( .A(i_i2c_ic_lcnt[2]), .B(n9702), .Z(n9188) );
  AN2P U10084 ( .A(n9188), .B(n10994), .Z(n9185) );
  ND2 U10085 ( .A(n9185), .B(n5060), .Z(n9187) );
  ND2 U10086 ( .A(n5058), .B(n10743), .Z(n9160) );
  OR2P U10087 ( .A(n9187), .B(n9160), .Z(n9182) );
  NR2 U10088 ( .A(i_i2c_ic_lcnt[7]), .B(n9182), .Z(n9174) );
  ND2 U10089 ( .A(n9174), .B(n10883), .Z(n9176) );
  OR2P U10090 ( .A(i_i2c_ic_lcnt[9]), .B(n9176), .Z(n9172) );
  OR2P U10091 ( .A(i_i2c_ic_lcnt[10]), .B(n9172), .Z(n9168) );
  NR2 U10092 ( .A(i_i2c_ic_lcnt[11]), .B(n9168), .Z(n9212) );
  AN2P U10093 ( .A(n9212), .B(n10882), .Z(n9162) );
  ND2 U10094 ( .A(n9162), .B(n11025), .Z(n9164) );
  OR2P U10095 ( .A(i_i2c_ic_lcnt[14]), .B(n9164), .Z(n9161) );
  EO U10096 ( .A(n9161), .B(i_i2c_ic_lcnt[15]), .Z(n9752) );
  ND2 U10097 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[15]), .B(n9752), .Z(
        n9227) );
  EO U10098 ( .A(n9164), .B(i_i2c_ic_lcnt[14]), .Z(n9749) );
  ND2 U10099 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[14]), .B(n9749), .Z(
        n9166) );
  IVP U10100 ( .A(n9162), .Z(n9215) );
  ND2 U10101 ( .A(i_i2c_ic_lcnt[13]), .B(n9215), .Z(n9163) );
  AN2P U10102 ( .A(n9164), .B(n9163), .Z(n9744) );
  ND2 U10103 ( .A(n9744), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[13]), .Z(
        n9165) );
  AN2P U10104 ( .A(n9166), .B(n9165), .Z(n9226) );
  EN U10105 ( .A(n9168), .B(n10884), .Z(n9743) );
  NR2 U10106 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[11]), .B(n9743), .Z(
        n9170) );
  ND2 U10107 ( .A(i_i2c_ic_lcnt[10]), .B(n9172), .Z(n9167) );
  AN2P U10108 ( .A(n9168), .B(n9167), .Z(n9733) );
  NR2 U10109 ( .A(n9733), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[10]), .Z(
        n9169) );
  NR2 U10110 ( .A(n9170), .B(n9169), .Z(n9219) );
  ND2 U10111 ( .A(i_i2c_ic_lcnt[9]), .B(n9176), .Z(n9171) );
  ND2 U10112 ( .A(n9172), .B(n9171), .Z(n9730) );
  NR2 U10113 ( .A(n9730), .B(n10696), .Z(n9173) );
  AO6 U10114 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[10]), .B(n9733), .C(
        n9173), .Z(n9211) );
  IVP U10115 ( .A(n9174), .Z(n9179) );
  ND2 U10116 ( .A(i_i2c_ic_lcnt[8]), .B(n9179), .Z(n9175) );
  AN2P U10117 ( .A(n9176), .B(n9175), .Z(n9725) );
  NR2 U10118 ( .A(n9725), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[8]), .Z(
        n9177) );
  AO6 U10119 ( .A(n9730), .B(n10696), .C(n9177), .Z(n9209) );
  ND2 U10120 ( .A(i_i2c_ic_lcnt[7]), .B(n9182), .Z(n9178) );
  ND2 U10121 ( .A(n9179), .B(n9178), .Z(n9721) );
  NR2 U10122 ( .A(n9721), .B(n10611), .Z(n9180) );
  AO6 U10123 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[8]), .B(n9725), .C(
        n9180), .Z(n9207) );
  AO7 U10124 ( .A(i_i2c_ic_lcnt[5]), .B(n9187), .C(i_i2c_ic_lcnt[6]), .Z(n9181) );
  AN2P U10125 ( .A(n9182), .B(n9181), .Z(n9719) );
  IVP U10126 ( .A(n9719), .Z(n9184) );
  EO U10127 ( .A(n9187), .B(i_i2c_ic_lcnt[5]), .Z(n9698) );
  ND2 U10128 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[5]), .B(n9698), .Z(
        n9183) );
  AO7 U10129 ( .A(n10698), .B(n9184), .C(n9183), .Z(n9205) );
  IVP U10130 ( .A(n9185), .Z(n9191) );
  ND2 U10131 ( .A(i_i2c_ic_lcnt[4]), .B(n9191), .Z(n9186) );
  ND2 U10132 ( .A(n9187), .B(n9186), .Z(n9699) );
  IVP U10133 ( .A(n9699), .Z(n9697) );
  IVP U10134 ( .A(n9188), .Z(n9189) );
  ND2 U10135 ( .A(i_i2c_ic_lcnt[3]), .B(n9189), .Z(n9190) );
  AN2P U10136 ( .A(n9191), .B(n9190), .Z(n9706) );
  AO2 U10137 ( .A(n9697), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[4]), .C(
        n9706), .D(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[3]), .Z(n9201) );
  NR2 U10138 ( .A(n9706), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[3]), .Z(
        n9197) );
  EN U10139 ( .A(n9702), .B(n5061), .Z(n9707) );
  NR2 U10140 ( .A(i_i2c_ic_lcnt[0]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[0]), .Z(n9193) );
  AO7 U10141 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[0]), .B(n9702), .C(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[1]), .Z(n9192) );
  AO6 U10142 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[2]), .B(n9707), .C(
        n9194), .Z(n9196) );
  NR2 U10143 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[2]), .B(n9707), .Z(
        n9195) );
  OR3 U10144 ( .A(n9197), .B(n9196), .C(n9195), .Z(n9200) );
  ND2 U10145 ( .A(n9699), .B(n10700), .Z(n9198) );
  AO7 U10146 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[5]), .B(n9698), .C(
        n9198), .Z(n9199) );
  NR2 U10147 ( .A(n9719), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[6]), .Z(
        n9202) );
  AO6 U10148 ( .A(n9721), .B(n10611), .C(n9202), .Z(n9203) );
  AO7 U10149 ( .A(n9205), .B(n9204), .C(n9203), .Z(n9206) );
  ND2 U10150 ( .A(n9207), .B(n9206), .Z(n9208) );
  ND2 U10151 ( .A(n9209), .B(n9208), .Z(n9210) );
  ND2 U10152 ( .A(n9211), .B(n9210), .Z(n9218) );
  IVP U10153 ( .A(n9212), .Z(n9213) );
  ND2 U10154 ( .A(i_i2c_ic_lcnt[12]), .B(n9213), .Z(n9214) );
  ND2 U10155 ( .A(n9215), .B(n9214), .Z(n9220) );
  ND2 U10156 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[11]), .B(n9743), .Z(
        n9216) );
  AO7 U10157 ( .A(n10694), .B(n9220), .C(n9216), .Z(n9217) );
  AO6 U10158 ( .A(n9219), .B(n9218), .C(n9217), .Z(n9223) );
  NR2 U10159 ( .A(n9744), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[13]), .Z(
        n9222) );
  IVP U10160 ( .A(n9220), .Z(n9745) );
  NR2 U10161 ( .A(n9745), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[12]), .Z(
        n9221) );
  OR3 U10162 ( .A(n9223), .B(n9222), .C(n9221), .Z(n9225) );
  NR2 U10163 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[15]), .B(n9752), .Z(
        n9224) );
  AO6P U10164 ( .A(n9226), .B(n9225), .C(n9224), .Z(n9230) );
  NR2 U10165 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[14]), .B(n9749), .Z(
        n9228) );
  ND2 U10166 ( .A(n9228), .B(n9227), .Z(n9229) );
  AO7P U10167 ( .A(n9231), .B(n9230), .C(n9229), .Z(n9232) );
  AN2P U10168 ( .A(n9234), .B(n9232), .Z(n9385) );
  AN2P U10169 ( .A(n9234), .B(n9233), .Z(n9415) );
  MUX21L U10170 ( .A(n5089), .B(n9235), .S(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[0]), .Z(n4124) );
  ND3 U10171 ( .A(i_i2c_ic_enable_sync), .B(n9236), .C(n10567), .Z(n9237) );
  IVA U10172 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[15]), .Z(n9302) );
  NR2 U10173 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[14]), .B(n9295), .Z(
        n9238) );
  AO6 U10174 ( .A(n9303), .B(n9302), .C(n9238), .Z(n9306) );
  NR2 U10175 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[9]), .B(n9278), .Z(
        n9240) );
  NR2 U10176 ( .A(n9273), .B(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[8]), .Z(
        n9239) );
  NR2 U10177 ( .A(n9240), .B(n9239), .Z(n9277) );
  AO2 U10178 ( .A(n9241), .B(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[4]), .C(
        n9251), .D(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[3]), .Z(n9245) );
  NR2 U10179 ( .A(n9246), .B(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[5]), .Z(
        n9243) );
  NR2 U10180 ( .A(n9241), .B(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[4]), .Z(
        n9242) );
  NR2P U10181 ( .A(n9243), .B(n9242), .Z(n9264) );
  NR2 U10182 ( .A(n9245), .B(n9244), .Z(n9250) );
  ND2 U10183 ( .A(n9265), .B(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[6]), .Z(
        n9248) );
  ND2 U10184 ( .A(n9246), .B(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[5]), .Z(
        n9247) );
  ND2 U10185 ( .A(n9248), .B(n9247), .Z(n9249) );
  NR2 U10186 ( .A(n9250), .B(n9249), .Z(n9268) );
  NR2 U10187 ( .A(n9251), .B(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[3]), .Z(
        n9253) );
  NR2 U10188 ( .A(n9255), .B(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[2]), .Z(
        n9252) );
  NR2 U10189 ( .A(n9253), .B(n9252), .Z(n9263) );
  ND2 U10190 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[0]), .B(n9254), .Z(
        n9257) );
  ND2 U10191 ( .A(n9255), .B(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[2]), .Z(
        n9256) );
  AN3 U10192 ( .A(n9258), .B(n9257), .C(n9256), .Z(n9261) );
  AO7 U10193 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[0]), .B(n9259), .C(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[1]), .Z(n9260) );
  ND2 U10194 ( .A(n9261), .B(n9260), .Z(n9262) );
  ND3 U10195 ( .A(n9264), .B(n9263), .C(n9262), .Z(n9267) );
  NR2 U10196 ( .A(n9265), .B(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[6]), .Z(
        n9266) );
  AO6 U10197 ( .A(n9268), .B(n9267), .C(n9266), .Z(n9272) );
  ND2 U10198 ( .A(n9269), .B(n10606), .Z(n9271) );
  NR2 U10199 ( .A(n9269), .B(n10606), .Z(n9270) );
  AO6 U10200 ( .A(n9272), .B(n9271), .C(n9270), .Z(n9275) );
  ND2 U10201 ( .A(n9273), .B(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[8]), .Z(
        n9274) );
  ND2 U10202 ( .A(n9275), .B(n9274), .Z(n9276) );
  ND2 U10203 ( .A(n9277), .B(n9276), .Z(n9281) );
  ND2 U10204 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[10]), .B(n9282), .Z(
        n9280) );
  ND2 U10205 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[9]), .B(n9278), .Z(
        n9279) );
  AN3 U10206 ( .A(n9281), .B(n9280), .C(n9279), .Z(n9291) );
  NR2 U10207 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[11]), .B(n9286), .Z(
        n9284) );
  NR2 U10208 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[10]), .B(n9282), .Z(
        n9283) );
  OR2P U10209 ( .A(n9284), .B(n9283), .Z(n9290) );
  ND2 U10210 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[12]), .B(n9285), .Z(
        n9288) );
  ND2 U10211 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[11]), .B(n9286), .Z(
        n9287) );
  AN2P U10212 ( .A(n9288), .B(n9287), .Z(n9289) );
  ND2 U10213 ( .A(n9293), .B(n10677), .Z(n9294) );
  AO7 U10214 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[13]), .B(n9296), .C(
        n9294), .Z(n9300) );
  ND2 U10215 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[14]), .B(n9295), .Z(
        n9298) );
  ND2 U10216 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[13]), .B(n9296), .Z(
        n9297) );
  AN2P U10217 ( .A(n9298), .B(n9297), .Z(n9299) );
  AO7P U10218 ( .A(n9301), .B(n9300), .C(n9299), .Z(n9305) );
  NR2 U10219 ( .A(n9303), .B(n9302), .Z(n9304) );
  AO6P U10220 ( .A(n9306), .B(n9305), .C(n9304), .Z(n9309) );
  AN2P U10221 ( .A(n9310), .B(n9307), .Z(n9525) );
  ND2 U10222 ( .A(n9310), .B(i_i2c_U_DW_apb_i2c_mstfsm_N362), .Z(n9308) );
  ND2 U10223 ( .A(n9311), .B(n9308), .Z(n4320) );
  AN2P U10224 ( .A(n9310), .B(n9309), .Z(n9521) );
  MUX21L U10225 ( .A(n9312), .B(n9311), .S(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[0]), .Z(n4335) );
  IVP U10226 ( .A(n9313), .Z(n9315) );
  MUX21L U10227 ( .A(n9315), .B(n9314), .S(
        i_i2c_U_DW_apb_i2c_clk_gen_bus_idle_cntr[0]), .Z(n4319) );
  NR2 U10228 ( .A(n9317), .B(n9316), .Z(n9604) );
  MUX21L U10229 ( .A(i_i2c_scl_lcnt_cmplt), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_data_scl), .S(n9604), .Z(n9318) );
  ND2 U10230 ( .A(n11052), .B(n9318), .Z(n3927) );
  ND2 U10231 ( .A(n9480), .B(i_i2c_ic_tar[0]), .Z(n9320) );
  AO3 U10232 ( .A(n9473), .B(n4897), .C(n9320), .D(n9319), .Z(n9321) );
  NR2 U10233 ( .A(n9322), .B(n9321), .Z(n9324) );
  B2IP U10234 ( .A(n9323), .Z2(n10042) );
  MUX21L U10235 ( .A(n9324), .B(n5079), .S(n10042), .Z(n4229) );
  AO11 U10236 ( .A(n9326), .B(i_i2c_tx_fifo_data_buf[3]), .C(n10038), .D(
        n10843), .E(n9480), .F(i_i2c_ic_tar[3]), .Z(n9325) );
  MUX21L U10237 ( .A(n9325), .B(n4899), .S(n10042), .Z(n4226) );
  AO2 U10238 ( .A(n10038), .B(i_i2c_ic_tar[0]), .C(n9480), .D(i_i2c_ic_tar[1]), 
        .Z(n9329) );
  ND2 U10239 ( .A(n9326), .B(i_i2c_tx_fifo_data_buf[1]), .Z(n9328) );
  ND2 U10240 ( .A(n10039), .B(i_i2c_ic_tar[8]), .Z(n9327) );
  AN3 U10241 ( .A(n9329), .B(n9328), .C(n9327), .Z(n9330) );
  MUX21L U10242 ( .A(n9330), .B(n4896), .S(n10042), .Z(n4228) );
  AN2P U10243 ( .A(n9332), .B(n9331), .Z(n9464) );
  ND2 U10244 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[11]), .B(n9370), 
        .Z(n9340) );
  AN2P U10245 ( .A(n9333), .B(n9332), .Z(n9567) );
  IVDAP U10246 ( .A(n9567), .Y(n5085) );
  EN U10247 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[10]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[11]), .Z(n9334) );
  ND2 U10248 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[8]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[9]), .Z(n9595) );
  ND2 U10249 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[4]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[5]), .Z(n9364) );
  ND2 U10250 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[6]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[7]), .Z(n9335) );
  NR2 U10251 ( .A(n9364), .B(n9335), .Z(n9337) );
  ND2 U10252 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[2]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[3]), .Z(n9336) );
  ND2 U10253 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[0]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[1]), .Z(n9590) );
  NR2 U10254 ( .A(n9336), .B(n9590), .Z(n9353) );
  ND2 U10255 ( .A(n9337), .B(n9353), .Z(n9597) );
  MUX21L U10256 ( .A(n4997), .B(n10601), .S(n9597), .Z(n9338) );
  ND2 U10257 ( .A(n9567), .B(n9338), .Z(n9339) );
  ND2 U10258 ( .A(n9340), .B(n9339), .Z(n3858) );
  ND2 U10259 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[9]), .B(n9370), 
        .Z(n9344) );
  EN U10260 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[8]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[9]), .Z(n9341) );
  MUX21L U10261 ( .A(n9341), .B(n10667), .S(n9597), .Z(n9342) );
  ND2 U10262 ( .A(n9567), .B(n9342), .Z(n9343) );
  ND2 U10263 ( .A(n9344), .B(n9343), .Z(n3860) );
  ND2 U10264 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[2]), .B(n9370), 
        .Z(n9348) );
  EN U10265 ( .A(n9345), .B(n10673), .Z(n9346) );
  ND2 U10266 ( .A(n9567), .B(n9346), .Z(n9347) );
  ND2 U10267 ( .A(n9348), .B(n9347), .Z(n3867) );
  ND2 U10268 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[4]), .B(n9370), 
        .Z(n9351) );
  EO U10269 ( .A(n9571), .B(n10671), .Z(n9349) );
  ND2 U10270 ( .A(n9567), .B(n9349), .Z(n9350) );
  ND2 U10271 ( .A(n9351), .B(n9350), .Z(n3865) );
  ND2 U10272 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[7]), .B(n9370), 
        .Z(n9357) );
  EN U10273 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[6]), .B(n10602), 
        .Z(n9352) );
  MUX21L U10274 ( .A(n9352), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[7]), 
        .S(n9364), .Z(n9354) );
  MUX21L U10275 ( .A(n10602), .B(n9354), .S(n9353), .Z(n9355) );
  ND2 U10276 ( .A(n9567), .B(n9355), .Z(n9356) );
  ND2 U10277 ( .A(n9357), .B(n9356), .Z(n3862) );
  ND2 U10278 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[13]), .B(n9370), 
        .Z(n9363) );
  ND2 U10279 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[10]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[11]), .Z(n9359) );
  NR2 U10280 ( .A(n9595), .B(n9359), .Z(n9582) );
  MUX21L U10281 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[13]), .B(n9358), 
        .S(n9582), .Z(n9360) );
  MUX21L U10282 ( .A(n9360), .B(n10664), .S(n9597), .Z(n9361) );
  ND2 U10283 ( .A(n9567), .B(n9361), .Z(n9362) );
  ND2 U10284 ( .A(n9363), .B(n9362), .Z(n3856) );
  ND2 U10285 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[6]), .B(n9370), 
        .Z(n9369) );
  EN U10286 ( .A(n9365), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[6]), .Z(
        n9366) );
  MUX21L U10287 ( .A(n9366), .B(n10669), .S(n9571), .Z(n9367) );
  ND2 U10288 ( .A(n9567), .B(n9367), .Z(n9368) );
  ND2 U10289 ( .A(n9369), .B(n9368), .Z(n3863) );
  ND2 U10290 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[15]), .B(n9370), 
        .Z(n9377) );
  EN U10291 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[14]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[15]), .Z(n9371) );
  ND2 U10292 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[12]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[13]), .Z(n9576) );
  MUX21L U10293 ( .A(n9371), .B(n10599), .S(n9576), .Z(n9372) );
  MUX21L U10294 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[15]), .B(n9372), 
        .S(n9582), .Z(n9373) );
  MUX21L U10295 ( .A(n9373), .B(n10599), .S(n9597), .Z(n9374) );
  ND2 U10296 ( .A(n9567), .B(n9374), .Z(n9376) );
  ND2 U10297 ( .A(n9377), .B(n9376), .Z(n3854) );
  ND2 U10298 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[11]), .B(n9408), .Z(
        n9384) );
  EN U10299 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[10]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[11]), .Z(n9378) );
  ND2 U10300 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[8]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[9]), .Z(n9409) );
  ND2 U10301 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[4]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[5]), .Z(n9451) );
  ND2 U10302 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[6]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[7]), .Z(n9379) );
  NR2 U10303 ( .A(n9451), .B(n9379), .Z(n9381) );
  ND2 U10304 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[2]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[3]), .Z(n9380) );
  ND2 U10305 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[0]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[1]), .Z(n9427) );
  NR2 U10306 ( .A(n9380), .B(n9427), .Z(n9453) );
  ND2 U10307 ( .A(n9381), .B(n9453), .Z(n9445) );
  MUX21L U10308 ( .A(n5000), .B(n10610), .S(n9445), .Z(n9382) );
  ND2 U10309 ( .A(n9385), .B(n9382), .Z(n9383) );
  ND2 U10310 ( .A(n9384), .B(n9383), .Z(n4113) );
  ND2 U10311 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[12]), .B(n9408), .Z(
        n9390) );
  ND2 U10312 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[10]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[11]), .Z(n9386) );
  NR2 U10313 ( .A(n9409), .B(n9386), .Z(n9443) );
  EN U10314 ( .A(n9443), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[12]), .Z(
        n9387) );
  MUX21L U10315 ( .A(n9387), .B(n10694), .S(n9445), .Z(n9388) );
  ND2 U10316 ( .A(n9385), .B(n9388), .Z(n9389) );
  ND2 U10317 ( .A(n9390), .B(n9389), .Z(n4112) );
  ND2 U10318 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[9]), .B(n9408), .Z(
        n9394) );
  EN U10319 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[8]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[9]), .Z(n9391) );
  MUX21L U10320 ( .A(n9391), .B(n10696), .S(n9445), .Z(n9392) );
  ND2 U10321 ( .A(n9385), .B(n9392), .Z(n9393) );
  ND2 U10322 ( .A(n9394), .B(n9393), .Z(n4115) );
  ND2 U10323 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[8]), .B(n9408), .Z(
        n9397) );
  EO U10324 ( .A(n9445), .B(n10697), .Z(n9395) );
  ND2 U10325 ( .A(n9385), .B(n9395), .Z(n9396) );
  ND2 U10326 ( .A(n9397), .B(n9396), .Z(n4116) );
  ND2 U10327 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[14]), .B(n9408), .Z(
        n9402) );
  ND2 U10328 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[12]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[13]), .Z(n9441) );
  EO U10329 ( .A(n9441), .B(n10609), .Z(n9398) );
  MUX21L U10330 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[14]), .B(n9398), 
        .S(n9443), .Z(n9399) );
  MUX21L U10331 ( .A(n9399), .B(n10609), .S(n9445), .Z(n9400) );
  ND2 U10332 ( .A(n9385), .B(n9400), .Z(n9401) );
  ND2 U10333 ( .A(n9402), .B(n9401), .Z(n4110) );
  ND2 U10334 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[13]), .B(n9408), .Z(
        n9407) );
  MUX21L U10335 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[13]), .B(n9403), 
        .S(n9443), .Z(n9404) );
  MUX21L U10336 ( .A(n9404), .B(n10693), .S(n9445), .Z(n9405) );
  ND2 U10337 ( .A(n9385), .B(n9405), .Z(n9406) );
  ND2 U10338 ( .A(n9407), .B(n9406), .Z(n4111) );
  ND2 U10339 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[10]), .B(n9408), .Z(
        n9414) );
  EN U10340 ( .A(n9410), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[10]), .Z(
        n9411) );
  MUX21L U10341 ( .A(n9411), .B(n10695), .S(n9445), .Z(n9412) );
  ND2 U10342 ( .A(n9385), .B(n9412), .Z(n9413) );
  ND2 U10343 ( .A(n9414), .B(n9413), .Z(n4114) );
  ND2 U10344 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[5]), .B(n9415), .Z(
        n9419) );
  EN U10345 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[4]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[5]), .Z(n9416) );
  MUX21L U10346 ( .A(n9416), .B(n10699), .S(n9436), .Z(n9417) );
  ND2 U10347 ( .A(n9385), .B(n9417), .Z(n9418) );
  ND2 U10348 ( .A(n9419), .B(n9418), .Z(n4119) );
  ND2 U10349 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[2]), .B(n9415), .Z(
        n9423) );
  EN U10350 ( .A(n9420), .B(n10702), .Z(n9421) );
  ND2 U10351 ( .A(n9385), .B(n9421), .Z(n9422) );
  ND2 U10352 ( .A(n9423), .B(n9422), .Z(n4122) );
  ND2 U10353 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[1]), .B(n9415), .Z(
        n9426) );
  ND2 U10354 ( .A(n9385), .B(n9424), .Z(n9425) );
  ND2 U10355 ( .A(n9426), .B(n9425), .Z(n4123) );
  ND2 U10356 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[3]), .B(n9415), .Z(
        n9431) );
  EN U10357 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[2]), .B(n10701), .Z(
        n9428) );
  MUX21H U10358 ( .A(n9428), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[3]), 
        .S(n9427), .Z(n9429) );
  ND2 U10359 ( .A(n9385), .B(n9429), .Z(n9430) );
  ND2 U10360 ( .A(n9431), .B(n9430), .Z(n4121) );
  ND2 U10361 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[4]), .B(n9415), .Z(
        n9434) );
  EO U10362 ( .A(n9436), .B(n10700), .Z(n9432) );
  ND2 U10363 ( .A(n9385), .B(n9432), .Z(n9433) );
  ND2 U10364 ( .A(n9434), .B(n9433), .Z(n4120) );
  ND2 U10365 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[6]), .B(n9415), .Z(
        n9440) );
  EN U10366 ( .A(n9435), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[6]), .Z(
        n9437) );
  MUX21L U10367 ( .A(n9437), .B(n10698), .S(n9436), .Z(n9438) );
  ND2 U10368 ( .A(n9385), .B(n9438), .Z(n9439) );
  ND2 U10369 ( .A(n9440), .B(n9439), .Z(n4118) );
  ND2 U10370 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[15]), .B(n9415), .Z(
        n9450) );
  EN U10371 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[14]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[15]), .Z(n9442) );
  MUX21L U10372 ( .A(n9442), .B(n10612), .S(n9441), .Z(n9444) );
  MUX21L U10373 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[15]), .B(n9444), 
        .S(n9443), .Z(n9446) );
  MUX21L U10374 ( .A(n9446), .B(n10612), .S(n9445), .Z(n9447) );
  ND2 U10375 ( .A(n9385), .B(n9447), .Z(n9449) );
  ND2 U10376 ( .A(n9450), .B(n9449), .Z(n4125) );
  ND2 U10377 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[7]), .B(n9415), .Z(
        n9457) );
  EN U10378 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[6]), .B(n10611), .Z(
        n9452) );
  MUX21L U10379 ( .A(n9452), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_low_cntr[7]), 
        .S(n9451), .Z(n9454) );
  MUX21L U10380 ( .A(n10611), .B(n9454), .S(n9453), .Z(n9455) );
  ND2 U10381 ( .A(n9385), .B(n9455), .Z(n9456) );
  ND2 U10382 ( .A(n9457), .B(n9456), .Z(n4117) );
  NR2 U10383 ( .A(n9458), .B(n10278), .Z(i_i2c_U_DW_apb_i2c_mstfsm_N70) );
  ND2 U10384 ( .A(n9460), .B(n10607), .Z(n10258) );
  ND3 U10385 ( .A(n10259), .B(i_i2c_U_DW_apb_i2c_tx_shift_tx_bit_count[1]), 
        .C(n10258), .Z(n9459) );
  AO3 U10386 ( .A(n9460), .B(n9072), .C(
        i_i2c_U_DW_apb_i2c_tx_shift_tx_bit_count[2]), .D(n9459), .Z(n9463) );
  AN2P U10387 ( .A(n9460), .B(i_i2c_U_DW_apb_i2c_tx_shift_tx_bit_count[0]), 
        .Z(n10262) );
  ND2 U10388 ( .A(n9461), .B(n10262), .Z(n9462) );
  ND2 U10389 ( .A(n9463), .B(n9462), .Z(n3812) );
  MUX21L U10390 ( .A(n5085), .B(n9465), .S(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[0]), .Z(n3869) );
  OR2P U10391 ( .A(n9466), .B(n10042), .Z(n9486) );
  ND2 U10392 ( .A(n9480), .B(i_i2c_ic_tar[6]), .Z(n9468) );
  ND2 U10393 ( .A(n10038), .B(i_i2c_ic_tar[5]), .Z(n9467) );
  AO3 U10394 ( .A(n9473), .B(n4930), .C(n9468), .D(n9467), .Z(n9469) );
  MUX21L U10395 ( .A(n9469), .B(i_i2c_U_DW_apb_i2c_tx_shift_tx_shift_buf[6]), 
        .S(n10042), .Z(n9470) );
  ND2 U10396 ( .A(n9486), .B(n9470), .Z(n4223) );
  ND2 U10397 ( .A(n7346), .B(i_i2c_ic_tar[5]), .Z(n9472) );
  ND2 U10398 ( .A(n9481), .B(n10844), .Z(n9471) );
  AO3 U10399 ( .A(n9473), .B(n4925), .C(n9472), .D(n9471), .Z(n9474) );
  MUX21L U10400 ( .A(n9474), .B(i_i2c_U_DW_apb_i2c_tx_shift_tx_shift_buf[5]), 
        .S(n10042), .Z(n9475) );
  ND2 U10401 ( .A(n9486), .B(n9475), .Z(n4224) );
  ND2 U10402 ( .A(n7346), .B(n10844), .Z(n9477) );
  ND2 U10403 ( .A(n10038), .B(i_i2c_ic_tar[3]), .Z(n9476) );
  AO3 U10404 ( .A(n9473), .B(n4928), .C(n9477), .D(n9476), .Z(n9478) );
  MUX21L U10405 ( .A(n9478), .B(i_i2c_U_DW_apb_i2c_tx_shift_tx_shift_buf[4]), 
        .S(n10042), .Z(n9479) );
  ND2 U10406 ( .A(n9486), .B(n9479), .Z(n4225) );
  ND2 U10407 ( .A(n9480), .B(i_i2c_ic_tar[7]), .Z(n9483) );
  ND2 U10408 ( .A(n9481), .B(i_i2c_ic_tar[6]), .Z(n9482) );
  AO3 U10409 ( .A(n7327), .B(n4898), .C(n9483), .D(n9482), .Z(n9484) );
  MUX21L U10410 ( .A(n9484), .B(i_i2c_U_DW_apb_i2c_tx_shift_tx_shift_buf[7]), 
        .S(n10042), .Z(n9485) );
  ND2 U10411 ( .A(n9486), .B(n9485), .Z(n4222) );
  IVDA U10412 ( .A(n9521), .Y(n9312), .Z(n9517) );
  ND2 U10413 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[4]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[5]), .Z(n9555) );
  ND2 U10414 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[6]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[7]), .Z(n9487) );
  NR2 U10415 ( .A(n9555), .B(n9487), .Z(n9489) );
  ND2 U10416 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[2]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[3]), .Z(n9488) );
  ND2 U10417 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[0]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[1]), .Z(n9550) );
  NR2 U10418 ( .A(n9488), .B(n9550), .Z(n9557) );
  ND2 U10419 ( .A(n9489), .B(n9557), .Z(n9562) );
  EO U10420 ( .A(n9562), .B(n10680), .Z(n9490) );
  ND2 U10421 ( .A(n9517), .B(n9490), .Z(n9492) );
  ND2 U10422 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[8]), .B(n9518), .Z(
        n9491) );
  ND2 U10423 ( .A(n9492), .B(n9491), .Z(n4327) );
  ND2 U10424 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[8]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[9]), .Z(n9528) );
  ND2 U10425 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[10]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[11]), .Z(n9493) );
  NR2 U10426 ( .A(n9528), .B(n9493), .Z(n9545) );
  EN U10427 ( .A(n9545), .B(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[12]), .Z(
        n9494) );
  MUX21L U10428 ( .A(n9494), .B(n10677), .S(n9562), .Z(n9495) );
  ND2 U10429 ( .A(n9517), .B(n9495), .Z(n9497) );
  ND2 U10430 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[12]), .B(n9518), .Z(
        n9496) );
  ND2 U10431 ( .A(n9497), .B(n9496), .Z(n4323) );
  EN U10432 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[4]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[5]), .Z(n9498) );
  MUX21L U10433 ( .A(n9498), .B(n10682), .S(n9533), .Z(n9499) );
  ND2 U10434 ( .A(n9517), .B(n9499), .Z(n9501) );
  ND2 U10435 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[5]), .B(n9518), .Z(
        n9500) );
  ND2 U10436 ( .A(n9501), .B(n9500), .Z(n4330) );
  EN U10437 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[2]), .B(n10684), .Z(
        n9502) );
  MUX21H U10438 ( .A(n9502), .B(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[3]), 
        .S(n9550), .Z(n9503) );
  ND2 U10439 ( .A(n9517), .B(n9503), .Z(n9505) );
  ND2 U10440 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[3]), .B(n9518), .Z(
        n9504) );
  ND2 U10441 ( .A(n9505), .B(n9504), .Z(n4332) );
  ND2 U10442 ( .A(n9517), .B(n9506), .Z(n9508) );
  ND2 U10443 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[1]), .B(n9518), .Z(
        n9507) );
  ND2 U10444 ( .A(n9508), .B(n9507), .Z(n4334) );
  ND2 U10445 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[12]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[13]), .Z(n9537) );
  EO U10446 ( .A(n9537), .B(n10604), .Z(n9509) );
  MUX21L U10447 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[14]), .B(n9509), 
        .S(n9545), .Z(n9510) );
  MUX21L U10448 ( .A(n9510), .B(n10604), .S(n9562), .Z(n9511) );
  ND2 U10449 ( .A(n9517), .B(n9511), .Z(n9513) );
  ND2 U10450 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[14]), .B(n9518), .Z(
        n9512) );
  ND2 U10451 ( .A(n9513), .B(n9512), .Z(n4321) );
  EN U10452 ( .A(n9514), .B(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[10]), .Z(
        n9515) );
  MUX21L U10453 ( .A(n9515), .B(n10678), .S(n9562), .Z(n9516) );
  ND2 U10454 ( .A(n9517), .B(n9516), .Z(n9520) );
  ND2 U10455 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[10]), .B(n9518), .Z(
        n9519) );
  ND2 U10456 ( .A(n9520), .B(n9519), .Z(n4325) );
  EN U10457 ( .A(n9522), .B(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[6]), .Z(
        n9523) );
  MUX21L U10458 ( .A(n9523), .B(n10681), .S(n9533), .Z(n9524) );
  ND2 U10459 ( .A(n9521), .B(n9524), .Z(n9527) );
  ND2 U10460 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[6]), .B(n9518), .Z(
        n9526) );
  ND2 U10461 ( .A(n9527), .B(n9526), .Z(n4329) );
  EN U10462 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[10]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[11]), .Z(n9529) );
  MUX21L U10463 ( .A(n4993), .B(n10605), .S(n9562), .Z(n9530) );
  ND2 U10464 ( .A(n9521), .B(n9530), .Z(n9532) );
  ND2 U10465 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[11]), .B(n9525), .Z(
        n9531) );
  ND2 U10466 ( .A(n9532), .B(n9531), .Z(n4324) );
  EO U10467 ( .A(n9533), .B(n10683), .Z(n9534) );
  ND2 U10468 ( .A(n9521), .B(n9534), .Z(n9536) );
  ND2 U10469 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[4]), .B(n9525), .Z(
        n9535) );
  ND2 U10470 ( .A(n9536), .B(n9535), .Z(n4331) );
  EN U10471 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[14]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[15]), .Z(n9538) );
  MUX21L U10472 ( .A(n9538), .B(n10603), .S(n9537), .Z(n9539) );
  MUX21L U10473 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[15]), .B(n9539), 
        .S(n9545), .Z(n9540) );
  MUX21L U10474 ( .A(n9540), .B(n10603), .S(n9562), .Z(n9541) );
  ND2 U10475 ( .A(n9521), .B(n9541), .Z(n9543) );
  ND2 U10476 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[15]), .B(n9525), .Z(
        n9542) );
  ND2 U10477 ( .A(n9543), .B(n9542), .Z(n4336) );
  MUX21L U10478 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[13]), .B(n9544), 
        .S(n9545), .Z(n9546) );
  MUX21L U10479 ( .A(n9546), .B(n10676), .S(n9562), .Z(n9547) );
  ND2 U10480 ( .A(n9521), .B(n9547), .Z(n9549) );
  ND2 U10481 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[13]), .B(n9525), .Z(
        n9548) );
  ND2 U10482 ( .A(n9549), .B(n9548), .Z(n4322) );
  EN U10483 ( .A(n9551), .B(n10685), .Z(n9552) );
  ND2 U10484 ( .A(n9521), .B(n9552), .Z(n9554) );
  ND2 U10485 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[2]), .B(n9525), .Z(
        n9553) );
  ND2 U10486 ( .A(n9554), .B(n9553), .Z(n4333) );
  EN U10487 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[6]), .B(n10606), .Z(
        n9556) );
  MUX21L U10488 ( .A(n9556), .B(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[7]), 
        .S(n9555), .Z(n9558) );
  MUX21L U10489 ( .A(n10606), .B(n9558), .S(n9557), .Z(n9559) );
  ND2 U10490 ( .A(n9521), .B(n9559), .Z(n9561) );
  ND2 U10491 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[7]), .B(n9525), .Z(
        n9560) );
  ND2 U10492 ( .A(n9561), .B(n9560), .Z(n4328) );
  EN U10493 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[8]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[9]), .Z(n9563) );
  MUX21L U10494 ( .A(n9563), .B(n10679), .S(n9562), .Z(n9564) );
  ND2 U10495 ( .A(n9521), .B(n9564), .Z(n9566) );
  ND2 U10496 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_min_hld_cntr[9]), .B(n9525), .Z(
        n9565) );
  ND2 U10497 ( .A(n9566), .B(n9565), .Z(n4326) );
  ND2 U10498 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[8]), .B(n9370), 
        .Z(n9570) );
  EO U10499 ( .A(n9597), .B(n10668), .Z(n9568) );
  ND2 U10500 ( .A(n9567), .B(n9568), .Z(n9569) );
  ND2 U10501 ( .A(n9570), .B(n9569), .Z(n3861) );
  ND2 U10502 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[5]), .B(n9464), 
        .Z(n9575) );
  EN U10503 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[4]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[5]), .Z(n9572) );
  MUX21L U10504 ( .A(n9572), .B(n10670), .S(n9571), .Z(n9573) );
  ND2 U10505 ( .A(n9567), .B(n9573), .Z(n9574) );
  ND2 U10506 ( .A(n9575), .B(n9574), .Z(n3864) );
  ND2 U10507 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[14]), .B(n9464), 
        .Z(n9581) );
  EO U10508 ( .A(n9576), .B(n10600), .Z(n9577) );
  MUX21L U10509 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[14]), .B(n9577), 
        .S(n9582), .Z(n9578) );
  MUX21L U10510 ( .A(n9578), .B(n10600), .S(n9597), .Z(n9579) );
  ND2 U10511 ( .A(n9567), .B(n9579), .Z(n9580) );
  ND2 U10512 ( .A(n9581), .B(n9580), .Z(n3855) );
  ND2 U10513 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[12]), .B(n9464), 
        .Z(n9586) );
  EN U10514 ( .A(n9582), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[12]), 
        .Z(n9583) );
  MUX21L U10515 ( .A(n9583), .B(n10665), .S(n9597), .Z(n9584) );
  ND2 U10516 ( .A(n9567), .B(n9584), .Z(n9585) );
  ND2 U10517 ( .A(n9586), .B(n9585), .Z(n3857) );
  ND2 U10518 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[1]), .B(n9464), 
        .Z(n9589) );
  ND2 U10519 ( .A(n9567), .B(n9587), .Z(n9588) );
  ND2 U10520 ( .A(n9589), .B(n9588), .Z(n3868) );
  ND2 U10521 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[3]), .B(n9464), 
        .Z(n9594) );
  EN U10522 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[2]), .B(n10672), 
        .Z(n9591) );
  MUX21H U10523 ( .A(n9591), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[3]), 
        .S(n9590), .Z(n9592) );
  ND2 U10524 ( .A(n9567), .B(n9592), .Z(n9593) );
  ND2 U10525 ( .A(n9594), .B(n9593), .Z(n3866) );
  ND2 U10526 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[10]), .B(n9464), 
        .Z(n9601) );
  EN U10527 ( .A(n9596), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_hld_cntr[10]), 
        .Z(n9598) );
  MUX21L U10528 ( .A(n9598), .B(n10666), .S(n9597), .Z(n9599) );
  ND2 U10529 ( .A(n9567), .B(n9599), .Z(n9600) );
  ND2 U10530 ( .A(n9601), .B(n9600), .Z(n3859) );
  ND3 U10531 ( .A(n9604), .B(n11052), .C(n9603), .Z(n9606) );
  AO6 U10532 ( .A(i_i2c_scl_int), .B(n9606), .C(i_i2c_scl_hcnt_en), .Z(n9610)
         );
  ND2 U10533 ( .A(n9605), .B(n11052), .Z(n9609) );
  ND2 U10534 ( .A(i_i2c_scl_hcnt_en), .B(n9607), .Z(n9608) );
  AO7 U10535 ( .A(n9610), .B(n9609), .C(n9608), .Z(n3810) );
  NR2 U10536 ( .A(n9612), .B(n9611), .Z(n9619) );
  ND3 U10537 ( .A(n9615), .B(n10280), .C(n9614), .Z(n9616) );
  AO7 U10538 ( .A(n9621), .B(n9616), .C(
        i_i2c_U_DW_apb_i2c_mstfsm_byte_waiting_q), .Z(n9618) );
  AO6 U10539 ( .A(n9619), .B(n9618), .C(n9617), .Z(n4233) );
  ND2 U10540 ( .A(n9622), .B(i_i2c_re_start_en), .Z(n9626) );
  NR2 U10541 ( .A(n9620), .B(n10280), .Z(n9623) );
  AO3P U10542 ( .A(n9624), .B(n9623), .C(n9622), .D(n9621), .Z(n9625) );
  MUX21L U10543 ( .A(i_i2c_byte_wait_scl), .B(n9626), .S(n9625), .Z(n4221) );
  OR2P U10544 ( .A(n9683), .B(n10615), .Z(n9691) );
  ND2 U10545 ( .A(n9657), .B(n10706), .Z(n9663) );
  NR2 U10546 ( .A(n9651), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[7]), .Z(
        n9628) );
  NR2 U10547 ( .A(n9646), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[6]), .Z(
        n9627) );
  NR2 U10548 ( .A(n9628), .B(n9627), .Z(n9654) );
  NR2 U10549 ( .A(i_i2c_ic_hcnt[0]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[0]), .Z(n9632) );
  ND2 U10550 ( .A(i_i2c_ic_hcnt[1]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[1]), .Z(n9631) );
  NR2 U10551 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[1]), .B(n9629), .Z(
        n9630) );
  AO6 U10552 ( .A(n9632), .B(n9631), .C(n9630), .Z(n9634) );
  OR2P U10553 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[2]), .B(n9635), 
        .Z(n9633) );
  AN2P U10554 ( .A(n9634), .B(n9633), .Z(n9645) );
  ND2 U10555 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[3]), .B(n9638), .Z(
        n9637) );
  ND2 U10556 ( .A(n9639), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[4]), .Z(
        n9641) );
  ND2 U10557 ( .A(n9635), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[2]), .Z(
        n9636) );
  AO4 U10558 ( .A(n9639), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[4]), .C(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[3]), .D(n9638), .Z(n9640) );
  ND2 U10559 ( .A(n9641), .B(n9640), .Z(n9643) );
  ND2 U10560 ( .A(n9646), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[6]), .Z(
        n9649) );
  ND2 U10561 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[5]), .B(n9647), .Z(
        n9648) );
  ND3 U10562 ( .A(n9650), .B(n9649), .C(n9648), .Z(n9653) );
  AN2P U10563 ( .A(n9651), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[7]), 
        .Z(n9652) );
  AO6 U10564 ( .A(n9654), .B(n9653), .C(n9652), .Z(n9655) );
  AO5 U10565 ( .A(n9656), .B(n10707), .C(n9655), .Z(n9662) );
  IVP U10566 ( .A(n9657), .Z(n9658) );
  ND2 U10567 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[9]), .B(n9658), .Z(
        n9660) );
  ND2 U10568 ( .A(n9664), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[10]), 
        .Z(n9659) );
  ND2 U10569 ( .A(n9660), .B(n9659), .Z(n9661) );
  AO6 U10570 ( .A(n9663), .B(n9662), .C(n9661), .Z(n9682) );
  AN2P U10571 ( .A(n9669), .B(n10703), .Z(n9677) );
  NR2 U10572 ( .A(n9664), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[10]), 
        .Z(n9665) );
  AO6 U10573 ( .A(n9666), .B(n10613), .C(n9665), .Z(n9667) );
  OR2P U10574 ( .A(n9673), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[12]), 
        .Z(n9672) );
  ND2 U10575 ( .A(n9667), .B(n9672), .Z(n9668) );
  OR2P U10576 ( .A(n9677), .B(n9668), .Z(n9681) );
  IVP U10577 ( .A(n9684), .Z(n9671) );
  NR2 U10578 ( .A(n9669), .B(n10703), .Z(n9670) );
  AO6 U10579 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[14]), .B(n9671), 
        .C(n9670), .Z(n9679) );
  AO2 U10580 ( .A(n9674), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[11]), 
        .C(n9673), .D(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[12]), .Z(n9675)
         );
  OR3 U10581 ( .A(n9677), .B(n9676), .C(n9675), .Z(n9678) );
  IVP U10582 ( .A(n9683), .Z(n9686) );
  ND2 U10583 ( .A(n9684), .B(n10570), .Z(n9685) );
  AO7 U10584 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[15]), .B(n9686), 
        .C(n9685), .Z(n9687) );
  AN2P U10585 ( .A(n9693), .B(n10275), .Z(n9871) );
  AN2P U10586 ( .A(n10275), .B(n10273), .Z(n9870) );
  MUX21L U10587 ( .A(n4982), .B(n5005), .S(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[0]), .Z(n3851) );
  NR2 U10588 ( .A(n9721), .B(n10597), .Z(n9694) );
  AO6 U10589 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[8]), .B(n9725), 
        .C(n9694), .Z(n9728) );
  ND2 U10590 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[5]), .B(n9698), 
        .Z(n9696) );
  ND2 U10591 ( .A(n9719), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[6]), 
        .Z(n9695) );
  ND2 U10592 ( .A(n9696), .B(n9695), .Z(n9724) );
  AO2 U10593 ( .A(n9697), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[4]), 
        .C(n9706), .D(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[3]), .Z(
        n9718) );
  NR2 U10594 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[5]), .B(n9698), 
        .Z(n9715) );
  AN2P U10595 ( .A(n9699), .B(n10661), .Z(n9714) );
  ND2 U10596 ( .A(n9701), .B(n9700), .Z(n9717) );
  AN2P U10597 ( .A(n9707), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[2]), 
        .Z(n9712) );
  NR2 U10598 ( .A(i_i2c_ic_lcnt[0]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[0]), .Z(n9705) );
  AO7 U10599 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[0]), .B(n9702), 
        .C(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[1]), .Z(n9703) );
  AO7 U10600 ( .A(n9705), .B(n9704), .C(n9703), .Z(n9711) );
  NR2 U10601 ( .A(n9706), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[3]), 
        .Z(n9709) );
  NR2 U10602 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[2]), .B(n9707), 
        .Z(n9708) );
  OR3 U10603 ( .A(n9715), .B(n9714), .C(n9713), .Z(n9716) );
  NR2 U10604 ( .A(n9719), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[6]), 
        .Z(n9720) );
  AO6 U10605 ( .A(n9721), .B(n10597), .C(n9720), .Z(n9722) );
  NR2 U10606 ( .A(n9725), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[8]), 
        .Z(n9726) );
  AO6P U10607 ( .A(n9728), .B(n9727), .C(n9726), .Z(n9732) );
  AN2P U10608 ( .A(n9733), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[10]), 
        .Z(n9729) );
  AO6 U10609 ( .A(n9732), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[9]), 
        .C(n9729), .Z(n9736) );
  IVP U10610 ( .A(n9730), .Z(n9731) );
  AO7 U10611 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[9]), .B(n9732), 
        .C(n9731), .Z(n9735) );
  NR2 U10612 ( .A(n9733), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[10]), 
        .Z(n9734) );
  AO6P U10613 ( .A(n9736), .B(n9735), .C(n9734), .Z(n9738) );
  OR2P U10614 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[11]), .B(n9738), 
        .Z(n9742) );
  ND2 U10615 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[14]), .B(n9749), 
        .Z(n9748) );
  ND2 U10616 ( .A(n9745), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[12]), 
        .Z(n9737) );
  ND2 U10617 ( .A(n9744), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[13]), 
        .Z(n9747) );
  AN3 U10618 ( .A(n9748), .B(n9737), .C(n9747), .Z(n9740) );
  ND2 U10619 ( .A(n9738), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[11]), 
        .Z(n9739) );
  AO6P U10620 ( .A(n9743), .B(n9742), .C(n9741), .Z(n9755) );
  AO4 U10621 ( .A(n9745), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[12]), 
        .C(n9744), .D(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[13]), .Z(
        n9746) );
  ND3 U10622 ( .A(n9748), .B(n9747), .C(n9746), .Z(n9751) );
  OR2P U10623 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[14]), .B(n9749), 
        .Z(n9750) );
  AO3 U10624 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[15]), .B(n9752), 
        .C(n9751), .D(n9750), .Z(n9754) );
  AO6 U10625 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[15]), .B(n9752), 
        .C(n10579), .Z(n9753) );
  AO7P U10626 ( .A(n9755), .B(n9754), .C(n9753), .Z(n9758) );
  NR2P U10627 ( .A(n10453), .B(n9758), .Z(n10218) );
  B2I U10628 ( .A(n10218), .Z2(n9832) );
  ND2 U10629 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[2]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[3]), .Z(n9756) );
  ND2 U10630 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[0]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[1]), .Z(n9818) );
  NR2 U10631 ( .A(n9756), .B(n9818), .Z(n9803) );
  EO U10632 ( .A(n9786), .B(n10661), .Z(n9757) );
  ND2 U10633 ( .A(n9832), .B(n9757), .Z(n9760) );
  AN2P U10634 ( .A(i_i2c_scl_s_setup_en), .B(n9758), .Z(n9777) );
  B3IP U10635 ( .A(n9777), .Z2(n10220) );
  ND2 U10636 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[4]), .B(n10220), 
        .Z(n9759) );
  ND2 U10637 ( .A(n9760), .B(n9759), .Z(n4214) );
  ND2 U10638 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[4]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[5]), .Z(n9801) );
  EN U10639 ( .A(n9761), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[6]), 
        .Z(n9762) );
  MUX21L U10640 ( .A(n9762), .B(n10659), .S(n9786), .Z(n9763) );
  ND2 U10641 ( .A(n9832), .B(n9763), .Z(n9765) );
  ND2 U10642 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[6]), .B(n10220), 
        .Z(n9764) );
  ND2 U10643 ( .A(n9765), .B(n9764), .Z(n4212) );
  EN U10644 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[14]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[15]), .Z(n9766) );
  ND2 U10645 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[12]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[13]), .Z(n9780) );
  MUX21L U10646 ( .A(n9766), .B(n10598), .S(n9780), .Z(n9768) );
  ND2 U10647 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[8]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[9]), .Z(n9828) );
  ND2 U10648 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[10]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[11]), .Z(n9767) );
  NR2 U10649 ( .A(n9828), .B(n9767), .Z(n9796) );
  MUX21L U10650 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[15]), .B(
        n9768), .S(n9796), .Z(n9771) );
  ND2 U10651 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[6]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[7]), .Z(n9769) );
  NR2 U10652 ( .A(n9801), .B(n9769), .Z(n9770) );
  ND2 U10653 ( .A(n9770), .B(n9803), .Z(n9830) );
  MUX21L U10654 ( .A(n9771), .B(n10598), .S(n9830), .Z(n9772) );
  ND2 U10655 ( .A(n9832), .B(n9772), .Z(n9774) );
  ND2 U10656 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[15]), .B(n10220), 
        .Z(n9773) );
  ND2 U10657 ( .A(n9774), .B(n9773), .Z(n4219) );
  EN U10658 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[8]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[9]), .Z(n9775) );
  MUX21L U10659 ( .A(n9775), .B(n10657), .S(n9830), .Z(n9776) );
  ND2 U10660 ( .A(n10218), .B(n9776), .Z(n9779) );
  ND2 U10661 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[9]), .B(n10220), 
        .Z(n9778) );
  ND2 U10662 ( .A(n9779), .B(n9778), .Z(n4209) );
  EO U10663 ( .A(n9780), .B(n10595), .Z(n9781) );
  MUX21L U10664 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[14]), .B(
        n9781), .S(n9796), .Z(n9782) );
  MUX21L U10665 ( .A(n9782), .B(n10595), .S(n9830), .Z(n9783) );
  ND2 U10666 ( .A(n9832), .B(n9783), .Z(n9785) );
  ND2 U10667 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[14]), .B(n10220), 
        .Z(n9784) );
  ND2 U10668 ( .A(n9785), .B(n9784), .Z(n4204) );
  EN U10669 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[4]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[5]), .Z(n9787) );
  MUX21L U10670 ( .A(n9787), .B(n10660), .S(n9786), .Z(n9788) );
  ND2 U10671 ( .A(n10218), .B(n9788), .Z(n9790) );
  ND2 U10672 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[5]), .B(n10220), 
        .Z(n9789) );
  ND2 U10673 ( .A(n9790), .B(n9789), .Z(n4213) );
  EN U10674 ( .A(n9796), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[12]), 
        .Z(n9791) );
  MUX21L U10675 ( .A(n9791), .B(n10655), .S(n9830), .Z(n9792) );
  ND2 U10676 ( .A(n9832), .B(n9792), .Z(n9794) );
  ND2 U10677 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[12]), .B(n9777), 
        .Z(n9793) );
  ND2 U10678 ( .A(n9794), .B(n9793), .Z(n4206) );
  MUX21L U10679 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[13]), .B(
        n9795), .S(n9796), .Z(n9797) );
  MUX21L U10680 ( .A(n9797), .B(n10654), .S(n9830), .Z(n9798) );
  ND2 U10681 ( .A(n9832), .B(n9798), .Z(n9800) );
  ND2 U10682 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[13]), .B(n9777), 
        .Z(n9799) );
  ND2 U10683 ( .A(n9800), .B(n9799), .Z(n4205) );
  EN U10684 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[6]), .B(n10597), 
        .Z(n9802) );
  MUX21L U10685 ( .A(n9802), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[7]), .S(n9801), .Z(n9804) );
  MUX21L U10686 ( .A(n10597), .B(n9804), .S(n9803), .Z(n9805) );
  ND2 U10687 ( .A(n10218), .B(n9805), .Z(n9807) );
  ND2 U10688 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[7]), .B(n9777), 
        .Z(n9806) );
  ND2 U10689 ( .A(n9807), .B(n9806), .Z(n4211) );
  EO U10690 ( .A(n9830), .B(n10658), .Z(n9808) );
  ND2 U10691 ( .A(n9832), .B(n9808), .Z(n9810) );
  ND2 U10692 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[8]), .B(n9777), 
        .Z(n9809) );
  ND2 U10693 ( .A(n9810), .B(n9809), .Z(n4210) );
  EN U10694 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[2]), .B(n10662), 
        .Z(n9811) );
  MUX21H U10695 ( .A(n9811), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[3]), .S(n9818), .Z(n9812) );
  ND2 U10696 ( .A(n10218), .B(n9812), .Z(n9814) );
  ND2 U10697 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[3]), .B(n10220), 
        .Z(n9813) );
  ND2 U10698 ( .A(n9814), .B(n9813), .Z(n4215) );
  ND2 U10699 ( .A(n10218), .B(n9815), .Z(n9817) );
  ND2 U10700 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[1]), .B(n10220), 
        .Z(n9816) );
  ND2 U10701 ( .A(n9817), .B(n9816), .Z(n4217) );
  EN U10702 ( .A(n9819), .B(n10663), .Z(n9820) );
  ND2 U10703 ( .A(n9832), .B(n9820), .Z(n9822) );
  ND2 U10704 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[2]), .B(n10220), 
        .Z(n9821) );
  ND2 U10705 ( .A(n9822), .B(n9821), .Z(n4216) );
  EN U10706 ( .A(n9823), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[10]), 
        .Z(n9824) );
  MUX21L U10707 ( .A(n9824), .B(n10656), .S(n9830), .Z(n9825) );
  ND2 U10708 ( .A(n9832), .B(n9825), .Z(n9827) );
  ND2 U10709 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[10]), .B(n9777), 
        .Z(n9826) );
  ND2 U10710 ( .A(n9827), .B(n9826), .Z(n4208) );
  EN U10711 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[10]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[11]), .Z(n9829) );
  MUX21L U10712 ( .A(n5084), .B(n10596), .S(n9830), .Z(n9831) );
  ND2 U10713 ( .A(n9832), .B(n9831), .Z(n9834) );
  ND2 U10714 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[11]), .B(n9777), 
        .Z(n9833) );
  ND2 U10715 ( .A(n9834), .B(n9833), .Z(n4207) );
  ND2 U10716 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[3]), .B(n9905), .Z(
        n9838) );
  EN U10717 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[2]), .B(n10711), .Z(
        n9835) );
  ND2 U10718 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[1]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[0]), .Z(n9900) );
  MUX21H U10719 ( .A(n9835), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[3]), 
        .S(n9900), .Z(n9836) );
  ND2 U10720 ( .A(n9871), .B(n9836), .Z(n9837) );
  ND2 U10721 ( .A(n9838), .B(n9837), .Z(n3848) );
  ND2 U10722 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[13]), .B(n9870), 
        .Z(n9847) );
  ND2 U10723 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[9]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[8]), .Z(n9875) );
  ND2 U10724 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[10]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[11]), .Z(n9840) );
  NR2 U10725 ( .A(n9875), .B(n9840), .Z(n9908) );
  MUX21L U10726 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[13]), .B(n9839), 
        .S(n9908), .Z(n9844) );
  ND2 U10727 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[4]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[5]), .Z(n9881) );
  ND2 U10728 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[6]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[7]), .Z(n9841) );
  NR2 U10729 ( .A(n9881), .B(n9841), .Z(n9843) );
  ND2 U10730 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[2]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[3]), .Z(n9842) );
  NR2 U10731 ( .A(n9842), .B(n9900), .Z(n9865) );
  ND2 U10732 ( .A(n9843), .B(n9865), .Z(n9910) );
  MUX21L U10733 ( .A(n9844), .B(n10703), .S(n9910), .Z(n9845) );
  ND2 U10734 ( .A(n9871), .B(n9845), .Z(n9846) );
  ND2 U10735 ( .A(n9847), .B(n9846), .Z(n3838) );
  ND2 U10736 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[11]), .B(n9870), 
        .Z(n9852) );
  EN U10737 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[10]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[11]), .Z(n9848) );
  MUX21H U10738 ( .A(n9848), .B(n10613), .S(n9875), .Z(n9849) );
  MUX21L U10739 ( .A(n9849), .B(n10613), .S(n9910), .Z(n9850) );
  ND2 U10740 ( .A(n9871), .B(n9850), .Z(n9851) );
  ND2 U10741 ( .A(n9852), .B(n9851), .Z(n3840) );
  ND2 U10742 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[5]), .B(n9870), .Z(
        n9856) );
  EN U10743 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[4]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[5]), .Z(n9853) );
  MUX21L U10744 ( .A(n9853), .B(n10709), .S(n9896), .Z(n9854) );
  ND2 U10745 ( .A(n9871), .B(n9854), .Z(n9855) );
  ND2 U10746 ( .A(n9856), .B(n9855), .Z(n3846) );
  ND2 U10747 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[9]), .B(n9870), .Z(
        n9860) );
  EN U10748 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[9]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[8]), .Z(n9857) );
  MUX21L U10749 ( .A(n9857), .B(n10706), .S(n9910), .Z(n9858) );
  ND2 U10750 ( .A(n9871), .B(n9858), .Z(n9859) );
  ND2 U10751 ( .A(n9860), .B(n9859), .Z(n3842) );
  ND2 U10752 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[1]), .B(n9870), .Z(
        n9863) );
  ND2 U10753 ( .A(n9871), .B(n9861), .Z(n9862) );
  ND2 U10754 ( .A(n9863), .B(n9862), .Z(n3850) );
  ND2 U10755 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[7]), .B(n9870), .Z(
        n9869) );
  EN U10756 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[6]), .B(n10614), .Z(
        n9864) );
  MUX21L U10757 ( .A(n9864), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[7]), 
        .S(n9881), .Z(n9866) );
  MUX21L U10758 ( .A(n10614), .B(n9866), .S(n9865), .Z(n9867) );
  ND2 U10759 ( .A(n9871), .B(n9867), .Z(n9868) );
  ND2 U10760 ( .A(n9869), .B(n9868), .Z(n3844) );
  ND2 U10761 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[8]), .B(n9905), .Z(
        n9874) );
  EO U10762 ( .A(n9910), .B(n10707), .Z(n9872) );
  ND2 U10763 ( .A(n9871), .B(n9872), .Z(n9873) );
  ND2 U10764 ( .A(n9874), .B(n9873), .Z(n3843) );
  ND2 U10765 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[10]), .B(n9905), 
        .Z(n9880) );
  EN U10766 ( .A(n9876), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[10]), .Z(
        n9877) );
  MUX21L U10767 ( .A(n9877), .B(n10705), .S(n9910), .Z(n9878) );
  ND2 U10768 ( .A(n9871), .B(n9878), .Z(n9879) );
  ND2 U10769 ( .A(n9880), .B(n9879), .Z(n3841) );
  ND2 U10770 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[6]), .B(n9905), .Z(
        n9886) );
  EN U10771 ( .A(n9882), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[6]), .Z(
        n9883) );
  MUX21L U10772 ( .A(n9883), .B(n10708), .S(n9896), .Z(n9884) );
  ND2 U10773 ( .A(n9871), .B(n9884), .Z(n9885) );
  ND2 U10774 ( .A(n9886), .B(n9885), .Z(n3845) );
  ND2 U10775 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[12]), .B(n9905), 
        .Z(n9890) );
  EN U10776 ( .A(n9908), .B(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[12]), .Z(
        n9887) );
  MUX21L U10777 ( .A(n9887), .B(n10704), .S(n9910), .Z(n9888) );
  ND2 U10778 ( .A(n9871), .B(n9888), .Z(n9889) );
  ND2 U10779 ( .A(n9890), .B(n9889), .Z(n3839) );
  ND2 U10780 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[14]), .B(n9905), 
        .Z(n9895) );
  ND2 U10781 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[12]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[13]), .Z(n9906) );
  EO U10782 ( .A(n9906), .B(n10570), .Z(n9891) );
  MUX21L U10783 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[14]), .B(n9891), 
        .S(n9908), .Z(n9892) );
  MUX21L U10784 ( .A(n9892), .B(n10570), .S(n9910), .Z(n9893) );
  ND2 U10785 ( .A(n9871), .B(n9893), .Z(n9894) );
  ND2 U10786 ( .A(n9895), .B(n9894), .Z(n3837) );
  ND2 U10787 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[4]), .B(n9905), .Z(
        n9899) );
  EO U10788 ( .A(n9896), .B(n10710), .Z(n9897) );
  ND2 U10789 ( .A(n9871), .B(n9897), .Z(n9898) );
  ND2 U10790 ( .A(n9899), .B(n9898), .Z(n3847) );
  ND2 U10791 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[2]), .B(n9905), .Z(
        n9904) );
  EN U10792 ( .A(n9901), .B(n10712), .Z(n9902) );
  ND2 U10793 ( .A(n9871), .B(n9902), .Z(n9903) );
  ND2 U10794 ( .A(n9904), .B(n9903), .Z(n3849) );
  ND2 U10795 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[15]), .B(n9905), 
        .Z(n9915) );
  EN U10796 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[14]), .B(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[15]), .Z(n9907) );
  MUX21L U10797 ( .A(n9907), .B(n10615), .S(n9906), .Z(n9909) );
  MUX21L U10798 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_high_cntr[15]), .B(n9909), 
        .S(n9908), .Z(n9911) );
  MUX21L U10799 ( .A(n9911), .B(n10615), .S(n9910), .Z(n9912) );
  ND2 U10800 ( .A(n9871), .B(n9912), .Z(n9914) );
  ND2 U10801 ( .A(n9915), .B(n9914), .Z(n3836) );
  NR2 U10802 ( .A(n9920), .B(n9916), .Z(n9918) );
  ND2 U10803 ( .A(n9918), .B(n9917), .Z(n9919) );
  ND2 U10804 ( .A(i_i2c_ic_clk_oe), .B(n9919), .Z(n9924) );
  ND4 U10805 ( .A(i_i2c_mst_rx_data_scl), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_re_start_scl), .C(
        i_i2c_U_DW_apb_i2c_tx_shift_data_scl), .D(
        i_i2c_U_DW_apb_i2c_tx_shift_stop_scl), .Z(n9921) );
  AO7 U10806 ( .A(i_i2c_scl_hld_low_en), .B(n9921), .C(n9920), .Z(n9923) );
  ND2 U10807 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[12]), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[13]), .Z(n9935) );
  EO U10808 ( .A(n9935), .B(n10620), .Z(n9926) );
  ND2 U10809 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[11]), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[10]), .Z(n9925) );
  ND2 U10810 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[9]), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[8]), .Z(n9977) );
  NR2 U10811 ( .A(n9925), .B(n9977), .Z(n10045) );
  MUX21L U10812 ( .A(n9927), .B(n9926), .S(n10045), .Z(n9931) );
  ND2 U10813 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[5]), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[4]), .Z(n9983) );
  ND2 U10814 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[6]), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[7]), .Z(n9928) );
  NR2 U10815 ( .A(n9983), .B(n9928), .Z(n9930) );
  ND2 U10816 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[3]), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[2]), .Z(n9929) );
  ND2 U10817 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[1]), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[0]), .Z(n10088) );
  NR2 U10818 ( .A(n9929), .B(n10088), .Z(n9959) );
  ND2 U10819 ( .A(n9930), .B(n9959), .Z(n10046) );
  MUX21L U10820 ( .A(n9931), .B(n10620), .S(n10046), .Z(n9932) );
  ND2 U10821 ( .A(n10091), .B(n9932), .Z(n9934) );
  ND2 U10822 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[14]), .B(n10044), .Z(n9933) );
  ND2 U10823 ( .A(n9934), .B(n9933), .Z(n4085) );
  ND2 U10824 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[15]), .B(n10044), .Z(n9941) );
  EN U10825 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[14]), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[15]), .Z(n9936) );
  MUX21L U10826 ( .A(n9936), .B(n10619), .S(n9935), .Z(n9937) );
  MUX21L U10827 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[15]), .B(
        n9937), .S(n10045), .Z(n9938) );
  MUX21L U10828 ( .A(n9938), .B(n10619), .S(n10046), .Z(n9939) );
  ND2 U10829 ( .A(n10091), .B(n9939), .Z(n9940) );
  ND2 U10830 ( .A(n9941), .B(n9940), .Z(n4084) );
  EN U10831 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[5]), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[4]), .Z(n9942) );
  MUX21L U10832 ( .A(n9942), .B(n10725), .S(n10060), .Z(n9943) );
  ND2 U10833 ( .A(n10091), .B(n9943), .Z(n9945) );
  ND2 U10834 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[5]), .B(n10044), 
        .Z(n9944) );
  ND2 U10835 ( .A(n9945), .B(n9944), .Z(n4094) );
  EO U10836 ( .A(n10046), .B(n10724), .Z(n9946) );
  ND2 U10837 ( .A(n10091), .B(n9946), .Z(n9948) );
  ND2 U10838 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[8]), .B(n10044), 
        .Z(n9947) );
  ND2 U10839 ( .A(n9948), .B(n9947), .Z(n4091) );
  EN U10840 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[9]), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[8]), .Z(n9949) );
  MUX21L U10841 ( .A(n9949), .B(n10723), .S(n10046), .Z(n9950) );
  ND2 U10842 ( .A(n10091), .B(n9950), .Z(n9952) );
  ND2 U10843 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[9]), .B(n10044), 
        .Z(n9951) );
  ND2 U10844 ( .A(n9952), .B(n9951), .Z(n4090) );
  ND2 U10845 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[13]), .B(n10044), .Z(n9957) );
  MUX21L U10846 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[13]), .B(
        n9953), .S(n10045), .Z(n9954) );
  MUX21L U10847 ( .A(n9954), .B(n10769), .S(n10046), .Z(n9955) );
  ND2 U10848 ( .A(n10091), .B(n9955), .Z(n9956) );
  ND2 U10849 ( .A(n9957), .B(n9956), .Z(n4086) );
  EN U10850 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[6]), .B(n10621), 
        .Z(n9958) );
  MUX21L U10851 ( .A(n9958), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[7]), .S(n9983), .Z(n9960)
         );
  MUX21L U10852 ( .A(n10621), .B(n9960), .S(n9959), .Z(n9961) );
  ND2 U10853 ( .A(n10091), .B(n9961), .Z(n9964) );
  IVAP U10854 ( .A(n9962), .Z(n10087) );
  ND2 U10855 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[7]), .B(n10087), 
        .Z(n9963) );
  ND2 U10856 ( .A(n9964), .B(n9963), .Z(n4092) );
  ND2 U10857 ( .A(n10091), .B(n9965), .Z(n9967) );
  ND2 U10858 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[1]), .B(n10087), 
        .Z(n9966) );
  ND2 U10859 ( .A(n9967), .B(n9966), .Z(n4098) );
  EN U10860 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[2]), .B(n10580), 
        .Z(n9968) );
  MUX21H U10861 ( .A(n9968), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[3]), .S(n10088), .Z(n9969) );
  ND2 U10862 ( .A(n10091), .B(n9969), .Z(n9971) );
  ND2 U10863 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[3]), .B(n10087), 
        .Z(n9970) );
  ND2 U10864 ( .A(n9971), .B(n9970), .Z(n4096) );
  EN U10865 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[10]), .B(
        i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[11]), .Z(n9972) );
  MUX21L U10866 ( .A(n9973), .B(n10460), .S(n10046), .Z(n9974) );
  ND2 U10867 ( .A(n10091), .B(n9974), .Z(n9976) );
  ND2 U10868 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[11]), .B(n10087), .Z(n9975) );
  ND2 U10869 ( .A(n9976), .B(n9975), .Z(n4088) );
  ND2 U10870 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[10]), .B(n10087), .Z(n9982) );
  EN U10871 ( .A(n9978), .B(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[10]), 
        .Z(n9979) );
  MUX21L U10872 ( .A(n9979), .B(n10770), .S(n10046), .Z(n9980) );
  ND2 U10873 ( .A(n10091), .B(n9980), .Z(n9981) );
  ND2 U10874 ( .A(n9982), .B(n9981), .Z(n4089) );
  EN U10875 ( .A(n9984), .B(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[6]), 
        .Z(n9985) );
  MUX21L U10876 ( .A(n9985), .B(n10771), .S(n10060), .Z(n9986) );
  ND2 U10877 ( .A(n10091), .B(n9986), .Z(n9988) );
  ND2 U10878 ( .A(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[6]), .B(n10087), 
        .Z(n9987) );
  ND2 U10879 ( .A(n9988), .B(n9987), .Z(n4093) );
  MUX21H U10880 ( .A(n10986), .B(n6395), .S(n9990), .Z(n10508) );
  MUX21H U10881 ( .A(n10898), .B(n9989), .S(n9990), .Z(n10509) );
  MUX21H U10882 ( .A(n10897), .B(n10146), .S(n9990), .Z(n10510) );
  EN U10883 ( .A(i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[14]), .B(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[14]), .Z(n9992) );
  ND2 U10884 ( .A(n11030), .B(n9992), .Z(n9993) );
  AN2P U10885 ( .A(n10000), .B(n9993), .Z(n10525) );
  EN U10886 ( .A(i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[13]), .B(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[13]), .Z(n9994) );
  ND2 U10887 ( .A(n11027), .B(n9994), .Z(n9995) );
  AN2P U10888 ( .A(n10000), .B(n9995), .Z(n10526) );
  EN U10889 ( .A(i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[15]), .B(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[15]), .Z(n9996) );
  ND2 U10890 ( .A(n11032), .B(n9996), .Z(n9997) );
  AN2P U10891 ( .A(n10000), .B(n9997), .Z(n10527) );
  EN U10892 ( .A(i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync[16]), .B(
        i_i2c_U_DW_apb_i2c_intctl_tx_abrt_source_sync_q[16]), .Z(n9998) );
  ND2 U10893 ( .A(n10967), .B(n9998), .Z(n9999) );
  AN2P U10894 ( .A(n10000), .B(n9999), .Z(n10528) );
  ND2 U10895 ( .A(i_i2c_ic_lcnt[1]), .B(n10001), .Z(n10003) );
  ND2 U10896 ( .A(n10009), .B(n7712), .Z(n10002) );
  AN2P U10897 ( .A(n10003), .B(n10002), .Z(n10529) );
  AN2P U10898 ( .A(ex_i_ahb_AHB_Master_hprot[2]), .B(n10004), .Z(
        ex_i_ahb_AHB_Slave_hprot[2]) );
  AN2P U10899 ( .A(ex_i_ahb_AHB_Master_hprot[3]), .B(n10004), .Z(
        ex_i_ahb_AHB_Slave_hprot[3]) );
  AN2P U10900 ( .A(ex_i_ahb_AHB_Master_hburst[0]), .B(n5512), .Z(
        ex_i_ahb_AHB_Slave_hburst[0]) );
  AN2P U10901 ( .A(ex_i_ahb_AHB_Master_haddr[10]), .B(n6948), .Z(
        ex_i_ahb_AHB_Slave_haddr[10]) );
  AN2P U10902 ( .A(ex_i_ahb_AHB_Master_haddr[11]), .B(n10004), .Z(
        ex_i_ahb_AHB_Slave_haddr[11]) );
  ND2 U10903 ( .A(n10009), .B(n5012), .Z(n10007) );
  ND2 U10904 ( .A(n10005), .B(i_i2c_ic_lcnt[4]), .Z(n10006) );
  ND2 U10905 ( .A(n10007), .B(n10006), .Z(n4453) );
  ND2 U10906 ( .A(i_i2c_ic_lcnt[7]), .B(n10005), .Z(n10011) );
  ND2 U10907 ( .A(n10009), .B(n10008), .Z(n10010) );
  ND2 U10908 ( .A(n10011), .B(n10010), .Z(n4450) );
  ND2 U10909 ( .A(n10073), .B(i_apb_U_DW_apb_ahbsif_saved_haddr_c[24]), .Z(
        n10015) );
  ND2 U10910 ( .A(n10065), .B(ex_i_ahb_AHB_Slave_haddr[24]), .Z(n10014) );
  ND2 U10911 ( .A(n10073), .B(i_apb_U_DW_apb_ahbsif_saved_haddr_c[19]), .Z(
        n10017) );
  ND2 U10912 ( .A(n10065), .B(ex_i_ahb_AHB_Slave_haddr[19]), .Z(n10016) );
  ND2 U10913 ( .A(i_apb_U_DW_apb_ahbsif_saved_haddr_c[17]), .B(n10073), .Z(
        n10019) );
  ND3 U10914 ( .A(n10075), .B(i_apb_paddr[17]), .C(n4767), .Z(n10018) );
  AN2P U10915 ( .A(n10110), .B(n10021), .Z(n10024) );
  ND2 U10916 ( .A(n10074), .B(i_apb_U_DW_apb_ahbsif_piped_haddr_c[2]), .Z(
        n10025) );
  MUX21L U10917 ( .A(n10843), .B(n8340), .S(n5137), .Z(n10846) );
  MUX21L U10918 ( .A(n10844), .B(n5012), .S(n5137), .Z(n10847) );
  MUX21L U10919 ( .A(n4938), .B(n10029), .S(n5137), .Z(n4404) );
  MUX21L U10920 ( .A(n10881), .B(n10030), .S(n5137), .Z(n4405) );
  MUX21L U10921 ( .A(n4953), .B(n10149), .S(n5137), .Z(n4412) );
  MUX21L U10922 ( .A(n4934), .B(n5166), .S(n5137), .Z(n4408) );
  MUX21L U10923 ( .A(n4933), .B(n10148), .S(n5137), .Z(n4410) );
  MUX21L U10924 ( .A(n4935), .B(n10150), .S(n5137), .Z(n4407) );
  MUX21L U10925 ( .A(n10778), .B(n10055), .S(n5137), .Z(n4414) );
  MUX21L U10926 ( .A(n4936), .B(n10031), .S(n5137), .Z(n4406) );
  MUX21L U10927 ( .A(n10779), .B(n10032), .S(n10403), .Z(n4563) );
  ND2 U10928 ( .A(n10081), .B(i_apb_U_DW_apb_ahbsif_saved_haddr_c[12]), .Z(
        n10037) );
  IVDA U10929 ( .A(ex_i_ahb_AHB_Slave_haddr[12]), .Y(n5006) );
  OR2P U10930 ( .A(n5006), .B(n5489), .Z(n10035) );
  ND2 U10931 ( .A(i_apb_U_DW_apb_ahbsif_piped_haddr_c[12]), .B(n10074), .Z(
        n10034) );
  ND4 U10932 ( .A(n10037), .B(n10036), .C(n10035), .D(n10034), .Z(n11080) );
  AO2 U10933 ( .A(n10038), .B(i_i2c_ic_tar[1]), .C(n7346), .D(n10843), .Z(
        n10041) );
  ND2 U10934 ( .A(n10039), .B(i_i2c_ic_tar[9]), .Z(n10040) );
  AO3 U10935 ( .A(n7327), .B(n4929), .C(n10041), .D(n10040), .Z(n10043) );
  MUX21H U10936 ( .A(n10043), .B(i_i2c_U_DW_apb_i2c_tx_shift_tx_shift_buf[2]), 
        .S(n10042), .Z(n4227) );
  ND2 U10937 ( .A(n10044), .B(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[12]), .Z(n10050) );
  EN U10938 ( .A(n10045), .B(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[12]), 
        .Z(n10047) );
  MUX21L U10939 ( .A(n10047), .B(n10463), .S(n10046), .Z(n10048) );
  ND2 U10940 ( .A(n10091), .B(n10048), .Z(n10049) );
  ND2 U10941 ( .A(n10050), .B(n10049), .Z(n4087) );
  ND2 U10942 ( .A(n10051), .B(i_ahb_hrdata_s0[5]), .Z(n10052) );
  AO3 U10943 ( .A(n10054), .B(n10960), .C(n10053), .D(n10052), .Z(n4362) );
  EO1 U10944 ( .A(n10059), .B(n10057), .C(n10058), .D(i_i2c_ic_hcnt[1]), .Z(
        n4440) );
  ND2 U10945 ( .A(n10087), .B(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[4]), 
        .Z(n10063) );
  EO U10946 ( .A(n10060), .B(n10726), .Z(n10061) );
  ND2 U10947 ( .A(n10091), .B(n10061), .Z(n10062) );
  ND2 U10948 ( .A(n10063), .B(n10062), .Z(n4095) );
  ND2 U10949 ( .A(n10073), .B(i_apb_U_DW_apb_ahbsif_saved_haddr_c[6]), .Z(
        n10069) );
  ND3 U10950 ( .A(n10075), .B(n4767), .C(i_i2c_reg_addr[4]), .Z(n10067) );
  ND2 U10951 ( .A(ex_i_ahb_AHB_Slave_haddr[6]), .B(n10065), .Z(n10066) );
  ND4 U10952 ( .A(n10069), .B(n10068), .C(n10067), .D(n10066), .Z(n11082) );
  ND2 U10953 ( .A(n10081), .B(i_apb_U_DW_apb_ahbsif_saved_haddr_c[4]), .Z(
        n10072) );
  ND2 U10954 ( .A(n10073), .B(i_apb_U_DW_apb_ahbsif_saved_haddr_c[5]), .Z(
        n10080) );
  ND2 U10955 ( .A(n10074), .B(i_apb_U_DW_apb_ahbsif_piped_haddr_c[5]), .Z(
        n10079) );
  ND3 U10956 ( .A(n10075), .B(n4767), .C(i_i2c_reg_addr[3]), .Z(n10078) );
  OR2P U10957 ( .A(n5489), .B(n10076), .Z(n10077) );
  ND4 U10958 ( .A(n10080), .B(n10079), .C(n10078), .D(n10077), .Z(n11083) );
  ND2 U10959 ( .A(n10081), .B(i_apb_U_DW_apb_ahbsif_saved_haddr_c[3]), .Z(
        n10086) );
  OR2P U10960 ( .A(n10082), .B(n5489), .Z(n10083) );
  ND2 U10961 ( .A(n10087), .B(i_i2c_U_DW_apb_i2c_tx_shift_sda_hold_count_r[2]), 
        .Z(n10093) );
  EN U10962 ( .A(n10089), .B(n10727), .Z(n10090) );
  ND2 U10963 ( .A(n10091), .B(n10090), .Z(n10092) );
  ND2 U10964 ( .A(n10093), .B(n10092), .Z(n4097) );
  ND2 U10965 ( .A(n5100), .B(n10094), .Z(n10103) );
  IVDA U10966 ( .A(n10095), .Y(n6241), .Z(n10099) );
  ND2P U10967 ( .A(n10102), .B(n10101), .Z(n10116) );
  MUX21L U10968 ( .A(n10103), .B(n10116), .S(
        i_i2c_U_DW_apb_i2c_tx_shift_start_sda_gate_r), .Z(
        i_i2c_U_DW_apb_i2c_tx_shift_N271) );
  MUX21L U10969 ( .A(n10850), .B(n10104), .S(n10116), .Z(n4081) );
  OR2P U10970 ( .A(n10105), .B(n10952), .Z(n10109) );
  NR2 U10971 ( .A(n7649), .B(n10106), .Z(n10107) );
  ND2 U10972 ( .A(n10283), .B(n10107), .Z(n10108) );
  AO3 U10973 ( .A(n10283), .B(n10952), .C(n10109), .D(n10108), .Z(n4195) );
  MUX21L U10974 ( .A(i_apb_U_DW_apb_ahbsif_piped_haddr_c[1]), .B(
        i_apb_U_DW_apb_ahbsif_saved_haddr_c[1]), .S(
        i_apb_U_DW_apb_ahbsif_use_saved_c), .Z(n10111) );
  MUX21L U10975 ( .A(n10111), .B(n10513), .S(n4767), .Z(n3919) );
  ND2 U10976 ( .A(n10114), .B(n10113), .Z(n10115) );
  NR2 U10977 ( .A(n10116), .B(n10115), .Z(
        i_i2c_U_DW_apb_i2c_tx_shift_mst_slv_ack_ext) );
  MUX21L U10978 ( .A(n10118), .B(n10851), .S(n10165), .Z(n4572) );
  MUX21L U10979 ( .A(n10119), .B(n4946), .S(n10165), .Z(n4588) );
  MUX21L U10980 ( .A(n10120), .B(n4908), .S(n10165), .Z(n4578) );
  MUX21L U10981 ( .A(n10121), .B(n4931), .S(n10165), .Z(n4594) );
  MUX21L U10982 ( .A(n10122), .B(n4921), .S(n10165), .Z(n4586) );
  MUX21L U10983 ( .A(n10123), .B(n4856), .S(n10165), .Z(n4602) );
  MUX21L U10984 ( .A(n10124), .B(n4927), .S(n10165), .Z(n4584) );
  MUX21L U10985 ( .A(n10125), .B(n4955), .S(n10165), .Z(n4600) );
  MUX21L U10986 ( .A(n10126), .B(n4922), .S(n10165), .Z(n4585) );
  MUX21L U10987 ( .A(n10127), .B(n4857), .S(n10165), .Z(n4601) );
  MUX21L U10988 ( .A(n10128), .B(n4985), .S(n10165), .Z(n4580) );
  MUX21L U10989 ( .A(n10130), .B(n4974), .S(n10165), .Z(n4596) );
  AN2P U10990 ( .A(n10132), .B(n10131), .Z(n10133) );
  MUX21L U10991 ( .A(n10782), .B(n10133), .S(n10154), .Z(n3923) );
  MUX21L U10992 ( .A(n10134), .B(n4916), .S(n10165), .Z(n4587) );
  MUX21L U10993 ( .A(n10135), .B(n4884), .S(n10165), .Z(n4574) );
  MUX21L U10994 ( .A(n10136), .B(n4943), .S(n10165), .Z(n4590) );
  MUX21L U10995 ( .A(n10137), .B(n4909), .S(n10165), .Z(n4577) );
  MUX21L U10996 ( .A(n10138), .B(n4932), .S(n10165), .Z(n4593) );
  MUX21L U10997 ( .A(n10139), .B(n4880), .S(n10165), .Z(n4575) );
  MUX21L U10998 ( .A(n10140), .B(n4940), .S(n10165), .Z(n4591) );
  MUX21L U10999 ( .A(n10141), .B(n4913), .S(n10165), .Z(n4576) );
  MUX21L U11000 ( .A(n10142), .B(n4937), .S(n10165), .Z(n4592) );
  MUX21L U11001 ( .A(n10143), .B(n4887), .S(n10165), .Z(n4573) );
  ND3 U11002 ( .A(ex_i_ahb_AHB_Slave_htrans[1]), .B(ex_i_ahb_AHB_Slave_hwrite), 
        .C(n10170), .Z(n10144) );
  NR2 U11003 ( .A(n10154), .B(n10777), .Z(i_apb_U_DW_apb_ahbsif_N739) );
  MUX21L U11004 ( .A(n7649), .B(n10852), .S(n10153), .Z(n4199) );
  MUX21L U11005 ( .A(n5167), .B(n10853), .S(n10153), .Z(n4167) );
  MUX21L U11006 ( .A(n10146), .B(n10854), .S(n10153), .Z(n4151) );
  MUX21L U11007 ( .A(n6395), .B(n10855), .S(n10153), .Z(n4183) );
  MUX21L U11008 ( .A(n10147), .B(n10856), .S(n10153), .Z(n4191) );
  MUX21L U11009 ( .A(n10148), .B(n10857), .S(n10153), .Z(n4159) );
  MUX21L U11010 ( .A(n5166), .B(n10858), .S(n10153), .Z(n4143) );
  MUX21L U11011 ( .A(n10149), .B(n10859), .S(n10153), .Z(n4175) );
  MUX21L U11012 ( .A(n10150), .B(n10860), .S(n10153), .Z(n4135) );
  ND2 U11013 ( .A(n10451), .B(n10151), .Z(n10152) );
  AN3 U11014 ( .A(n10285), .B(n10153), .C(n10152), .Z(
        i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N43) );
  MUX21L U11015 ( .A(i_apb_psel_en), .B(i_apb_U_DW_apb_ahbsif_nextstate_1_), 
        .S(n10154), .Z(n10155) );
  ND2 U11016 ( .A(n10156), .B(n10155), .Z(n3925) );
  AO7 U11017 ( .A(n10160), .B(n10828), .C(n10159), .Z(n3924) );
  AO6 U11018 ( .A(i_ahb_U_arb_U_gctrl_wasinn), .B(n10403), .C(n10161), .Z(
        n10162) );
  MUX21L U11019 ( .A(n10169), .B(n10476), .S(n10162), .Z(n4393) );
  OR2P U11020 ( .A(n4964), .B(n10163), .Z(n10164) );
  MUX21L U11021 ( .A(n5200), .B(n10164), .S(n10403), .Z(n4661) );
  MUX21L U11022 ( .A(n10166), .B(n4904), .S(n10165), .Z(n4579) );
  MUX21L U11023 ( .A(n10169), .B(n10168), .S(n10403), .Z(n4663) );
  NR2 U11024 ( .A(n10747), .B(n10171), .Z(n10172) );
  OR2P U11025 ( .A(n10170), .B(n10172), .Z(n4660) );
  NR2 U11026 ( .A(n10431), .B(n10173), .Z(i_ahb_U_dfltslv_next_state) );
  NR2 U11027 ( .A(n10749), .B(n10403), .Z(n10175) );
  OR2P U11028 ( .A(n10175), .B(n10174), .Z(n4566) );
  ND2 U11029 ( .A(i_ahb_U_arb_ebten), .B(n10593), .Z(n10176) );
  NR2 U11030 ( .A(n10177), .B(n10176), .Z(n10181) );
  NR4 U11031 ( .A(i_ahb_U_arb_U_ebt_int_count[9]), .B(
        i_ahb_U_arb_U_ebt_int_count[8]), .C(i_ahb_U_arb_U_ebt_int_count[7]), 
        .D(i_ahb_U_arb_U_ebt_int_count[6]), .Z(n10180) );
  NR4 U11032 ( .A(i_ahb_U_arb_U_ebt_int_count[5]), .B(
        i_ahb_U_arb_U_ebt_int_count[4]), .C(i_ahb_U_arb_U_ebt_int_count[3]), 
        .D(i_ahb_U_arb_U_ebt_int_count[2]), .Z(n10179) );
  AN3 U11033 ( .A(ex_i_ahb_AHB_Slave_htrans[0]), .B(
        i_ahb_U_arb_U_ebt_int_count[0]), .C(n10737), .Z(n10178) );
  AN4P U11034 ( .A(n10181), .B(n10180), .C(n10179), .D(n10178), .Z(
        i_ahb_U_arb_U_ebt_next_state[1]) );
  EN U11035 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_scl_clk_int), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_U_scl_sync_data_d_int_0_), .Z(n10182) );
  AN2P U11036 ( .A(n10183), .B(n10182), .Z(n10197) );
  AN2P U11037 ( .A(n10197), .B(n10184), .Z(i_i2c_U_DW_apb_i2c_rx_filter_N63)
         );
  HA1 U11038 ( .A(n10185), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[5]), .CO(n10194), .S(
        n10186) );
  AN2P U11039 ( .A(n10197), .B(n10186), .Z(i_i2c_U_DW_apb_i2c_rx_filter_N62)
         );
  HA1 U11040 ( .A(n10187), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[4]), .CO(n10185), .S(
        n10188) );
  AN2P U11041 ( .A(n10197), .B(n10188), .Z(i_i2c_U_DW_apb_i2c_rx_filter_N61)
         );
  HA1 U11042 ( .A(n10189), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[3]), .CO(n10187), .S(
        n10190) );
  AN2P U11043 ( .A(n10197), .B(n10190), .Z(i_i2c_U_DW_apb_i2c_rx_filter_N60)
         );
  HA1 U11044 ( .A(n10191), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[2]), .CO(n10189), .S(
        n10192) );
  AN2P U11045 ( .A(n10197), .B(n10192), .Z(i_i2c_U_DW_apb_i2c_rx_filter_N59)
         );
  HA1 U11046 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[0]), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[1]), .CO(n10191), .S(
        n10193) );
  AN2P U11047 ( .A(n10197), .B(n10193), .Z(i_i2c_U_DW_apb_i2c_rx_filter_N58)
         );
  AN2P U11048 ( .A(n10197), .B(n10466), .Z(i_i2c_U_DW_apb_i2c_rx_filter_N57)
         );
  HA1 U11049 ( .A(n10194), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[6]), .CO(n10195), .S(
        n10184) );
  EO U11050 ( .A(n10195), .B(i_i2c_U_DW_apb_i2c_rx_filter_ic_scl_spklen_cnt[7]), .Z(n10196) );
  AN2P U11051 ( .A(n10197), .B(n10196), .Z(i_i2c_U_DW_apb_i2c_rx_filter_N64)
         );
  EO U11052 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_sda_data_int), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_U_sda_sync_data_d_int_0_), .Z(n10198) );
  NR2 U11053 ( .A(n10199), .B(n10198), .Z(n10201) );
  AN2P U11054 ( .A(n10201), .B(n10200), .Z(n10215) );
  EO U11055 ( .A(n10202), .B(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[7]), .Z(n10203) );
  AN2P U11056 ( .A(n10215), .B(n10203), .Z(i_i2c_U_DW_apb_i2c_rx_filter_N101)
         );
  HA1 U11057 ( .A(n10204), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[5]), .CO(n10213), .S(
        n10205) );
  AN2P U11058 ( .A(n10215), .B(n10205), .Z(i_i2c_U_DW_apb_i2c_rx_filter_N99)
         );
  HA1 U11059 ( .A(n10206), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[4]), .CO(n10204), .S(
        n10207) );
  AN2P U11060 ( .A(n10215), .B(n10207), .Z(i_i2c_U_DW_apb_i2c_rx_filter_N98)
         );
  HA1 U11061 ( .A(n10208), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[3]), .CO(n10206), .S(
        n10209) );
  AN2P U11062 ( .A(n10215), .B(n10209), .Z(i_i2c_U_DW_apb_i2c_rx_filter_N97)
         );
  HA1 U11063 ( .A(n10210), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[2]), .CO(n10208), .S(
        n10211) );
  AN2P U11064 ( .A(n10215), .B(n10211), .Z(i_i2c_U_DW_apb_i2c_rx_filter_N96)
         );
  HA1 U11065 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[0]), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[1]), .CO(n10210), .S(
        n10212) );
  AN2P U11066 ( .A(n10215), .B(n10212), .Z(i_i2c_U_DW_apb_i2c_rx_filter_N95)
         );
  AN2P U11067 ( .A(n10215), .B(n10425), .Z(i_i2c_U_DW_apb_i2c_rx_filter_N94)
         );
  HA1 U11068 ( .A(n10213), .B(
        i_i2c_U_DW_apb_i2c_rx_filter_ic_sda_spklen_cnt[6]), .CO(n10202), .S(
        n10214) );
  AN2P U11069 ( .A(n10215), .B(n10214), .Z(i_i2c_U_DW_apb_i2c_rx_filter_N100)
         );
  NR2 U11070 ( .A(n10216), .B(i_i2c_U_DW_apb_i2c_rx_filter_sda_int_q), .Z(
        n10217) );
  AN2P U11071 ( .A(i_i2c_sda_int), .B(n10217), .Z(n11129) );
  MUX21H U11072 ( .A(n10218), .B(n10220), .S(
        i_i2c_U_DW_apb_i2c_clk_gen_scl_s_setup_cntr[0]), .Z(n4218) );
  NR2 U11073 ( .A(n10453), .B(n10590), .Z(n10219) );
  OR2P U11074 ( .A(n10220), .B(n10219), .Z(n4203) );
  ND2 U11075 ( .A(n11050), .B(n10499), .Z(n10222) );
  AO1P U11076 ( .A(n4924), .B(n10222), .C(n8975), .D(n10221), .Z(n3877) );
  NR2 U11077 ( .A(n8975), .B(n10757), .Z(n10224) );
  AN2P U11078 ( .A(n10224), .B(n10223), .Z(n4290) );
  NR2 U11079 ( .A(i_i2c_slv_rxbyte_rdy), .B(
        i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_bit_count_3_), .Z(n10225) );
  NR2 U11080 ( .A(n8975), .B(n10225), .Z(n10226) );
  AN2P U11081 ( .A(n11050), .B(n10226), .Z(n4295) );
  ND2 U11082 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_sda_cnt_0_), .B(n5054), .Z(
        n10227) );
  AN2P U11083 ( .A(i_i2c_scl_int), .B(n10227), .Z(n4347) );
  ND2 U11084 ( .A(n5055), .B(n5054), .Z(n10228) );
  AN2P U11085 ( .A(i_i2c_scl_int), .B(n10228), .Z(n4348) );
  ND2 U11086 ( .A(i_i2c_U_DW_apb_i2c_rx_shift_slv_rx_bit_count_2to0[2]), .B(
        n10629), .Z(n10235) );
  OR2P U11087 ( .A(n10235), .B(n10229), .Z(n10230) );
  AO6 U11088 ( .A(n10674), .B(n10230), .C(n8975), .Z(n10233) );
  ND2 U11089 ( .A(n10231), .B(n10237), .Z(n10232) );
  AN2P U11090 ( .A(n10233), .B(n10232), .Z(n4287) );
  OR2P U11091 ( .A(n10235), .B(n10234), .Z(n10236) );
  AO6 U11092 ( .A(n10441), .B(n10236), .C(n8975), .Z(n10240) );
  ND2 U11093 ( .A(n10238), .B(n10237), .Z(n10239) );
  AN2P U11094 ( .A(n10240), .B(n10239), .Z(n4286) );
  AN2P U11095 ( .A(n7034), .B(n10241), .Z(
        i_i2c_U_DW_apb_i2c_rx_shift_rx_slv_read_s) );
  AN2P U11096 ( .A(n11051), .B(i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_ready_dly1), 
        .Z(i_i2c_U_DW_apb_i2c_tx_shift_N395) );
  AN2P U11097 ( .A(n11051), .B(i_i2c_U_DW_apb_i2c_tx_shift_slv_tx_ready_dly2), 
        .Z(i_i2c_U_DW_apb_i2c_tx_shift_N394) );
  ND2 U11098 ( .A(n10894), .B(n10242), .Z(n10243) );
  AN2P U11099 ( .A(n11051), .B(n10243), .Z(n4262) );
  ND2 U11100 ( .A(i_i2c_U_DW_apb_i2c_slvfsm_slv_tx_flush), .B(
        i_i2c_U_DW_apb_i2c_slvfsm_N284), .Z(n10244) );
  NR2 U11101 ( .A(n10245), .B(n10244), .Z(n10250) );
  NR2 U11102 ( .A(n10248), .B(n10247), .Z(n10249) );
  MUX21H U11103 ( .A(n10251), .B(n10250), .S(n10249), .Z(n4273) );
  AO4 U11104 ( .A(n10256), .B(n10255), .C(n10254), .D(n10253), .Z(n10257) );
  OR2P U11105 ( .A(n4056), .B(n10257), .Z(n4250) );
  ND2 U11106 ( .A(n10259), .B(n10258), .Z(n10261) );
  ND2 U11107 ( .A(n10607), .B(n9072), .Z(n10260) );
  AN2P U11108 ( .A(n10261), .B(n10260), .Z(n3814) );
  MUX21H U11109 ( .A(n10262), .B(n10261), .S(
        i_i2c_U_DW_apb_i2c_tx_shift_tx_bit_count[1]), .Z(n3813) );
  NR2 U11110 ( .A(n10264), .B(n10263), .Z(n10265) );
  OR2P U11111 ( .A(n9408), .B(n10265), .Z(n4109) );
  NR2 U11112 ( .A(n10266), .B(n10591), .Z(n10267) );
  OR2P U11113 ( .A(n10268), .B(n10267), .Z(n4108) );
  ND2 U11114 ( .A(i_i2c_scl_int), .B(n10269), .Z(n10272) );
  AO1P U11115 ( .A(n10766), .B(n10272), .C(n10271), .D(n10270), .Z(n4252) );
  OR2P U11116 ( .A(i_i2c_U_DW_apb_i2c_clk_gen_scl_hcnt_cmplt_int), .B(n10273), 
        .Z(n10274) );
  AN2P U11117 ( .A(n10275), .B(n10274), .Z(n3852) );
  ND2 U11118 ( .A(n10495), .B(n10276), .Z(n10277) );
  AN2P U11119 ( .A(n11052), .B(n10277), .Z(n3833) );
  AN2P U11120 ( .A(n10281), .B(n10279), .Z(i_i2c_U_DW_apb_i2c_mstfsm_N69) );
  AN2P U11121 ( .A(n10281), .B(n10280), .Z(i_i2c_U_DW_apb_i2c_mstfsm_N67) );
  AN2P U11122 ( .A(n10281), .B(n4667), .Z(i_i2c_U_DW_apb_i2c_mstfsm_N71) );
  AO7 U11123 ( .A(n10283), .B(n10845), .C(n10282), .Z(n10284) );
  AN2P U11124 ( .A(n10285), .B(n10284), .Z(n11108) );
  AN2P U11125 ( .A(n10286), .B(n11108), .Z(
        i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N40) );
  IVDA U11126 ( .A(n10287), .Y(n10288), .Z(n10314) );
  AO1P U11127 ( .A(n10745), .B(n10290), .C(n10289), .D(n10294), .Z(
        i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N46) );
  ND2 U11128 ( .A(n5369), .B(n10893), .Z(n10292) );
  ND2 U11129 ( .A(n10292), .B(n10291), .Z(n10293) );
  NR2 U11130 ( .A(n10294), .B(n10293), .Z(n11107) );
  AN2P U11131 ( .A(n10296), .B(n11107), .Z(
        i_i2c_U_DW_apb_i2c_fifo_U_tx_fifo_N39) );
  ND2 U11132 ( .A(n11051), .B(n10894), .Z(n10300) );
  ND2 U11133 ( .A(i_i2c_U_DW_apb_i2c_rx_filter_slv_arb_lost), .B(n10297), .Z(
        n10298) );
  AO7 U11134 ( .A(n10300), .B(n10299), .C(n10298), .Z(n10301) );
  AN2P U11135 ( .A(i_i2c_slv_activity), .B(n10301), .Z(n3871) );
  OR2P U11136 ( .A(i_i2c_re_start_en), .B(i_i2c_split_start_en), .Z(
        i_i2c_U_DW_apb_i2c_rx_filter_N165) );
  AO2 U11137 ( .A(n10312), .B(i_i2c_U_dff_tx_mem[57]), .C(n9087), .D(
        i_i2c_U_dff_tx_mem[48]), .Z(n10305) );
  AO2 U11138 ( .A(n10313), .B(i_i2c_U_dff_tx_mem[66]), .C(n9109), .D(
        i_i2c_U_dff_tx_mem[39]), .Z(n10304) );
  AO2 U11139 ( .A(n9110), .B(i_i2c_U_dff_tx_mem[21]), .C(n9111), .D(
        i_i2c_U_dff_tx_mem[30]), .Z(n10303) );
  AO2 U11140 ( .A(n9089), .B(i_i2c_U_dff_tx_mem[12]), .C(n10314), .D(
        i_i2c_U_dff_tx_mem[3]), .Z(n10302) );
  ND4 U11141 ( .A(n10305), .B(n10304), .C(n10303), .D(n10302), .Z(n10306) );
  MUX21H U11142 ( .A(i_i2c_tx_fifo_data_buf[3]), .B(n10306), .S(n9116), .Z(
        n4269) );
  AO2 U11143 ( .A(n10312), .B(i_i2c_U_dff_tx_mem[61]), .C(n9087), .D(
        i_i2c_U_dff_tx_mem[52]), .Z(n10310) );
  AO2 U11144 ( .A(n10313), .B(i_i2c_U_dff_tx_mem[70]), .C(n9109), .D(
        i_i2c_U_dff_tx_mem[43]), .Z(n10309) );
  AO2 U11145 ( .A(n9110), .B(i_i2c_U_dff_tx_mem[25]), .C(n9111), .D(
        i_i2c_U_dff_tx_mem[34]), .Z(n10308) );
  AO2 U11146 ( .A(n9089), .B(i_i2c_U_dff_tx_mem[16]), .C(n10314), .D(
        i_i2c_U_dff_tx_mem[7]), .Z(n10307) );
  ND4 U11147 ( .A(n10310), .B(n10309), .C(n10308), .D(n10307), .Z(n10311) );
  MUX21H U11148 ( .A(i_i2c_tx_fifo_data_buf[7]), .B(n10311), .S(n9116), .Z(
        n4265) );
  AO2 U11149 ( .A(n10312), .B(i_i2c_U_dff_tx_mem[55]), .C(n9087), .D(
        i_i2c_U_dff_tx_mem[46]), .Z(n10318) );
  AO2 U11150 ( .A(n10313), .B(i_i2c_U_dff_tx_mem[64]), .C(n9109), .D(
        i_i2c_U_dff_tx_mem[37]), .Z(n10317) );
  AO2 U11151 ( .A(n9110), .B(i_i2c_U_dff_tx_mem[19]), .C(n9111), .D(
        i_i2c_U_dff_tx_mem[28]), .Z(n10316) );
  AO2 U11152 ( .A(n9089), .B(i_i2c_U_dff_tx_mem[10]), .C(n10314), .D(
        i_i2c_U_dff_tx_mem[1]), .Z(n10315) );
  ND4 U11153 ( .A(n10318), .B(n10317), .C(n10316), .D(n10315), .Z(n10319) );
  MUX21H U11154 ( .A(i_i2c_tx_fifo_data_buf[1]), .B(n10319), .S(n9116), .Z(
        n4271) );
  AO6 U11155 ( .A(n10322), .B(n10321), .C(i_i2c_s_det), .Z(n10328) );
  ND2 U11156 ( .A(n10324), .B(n10323), .Z(n10326) );
  AO3 U11157 ( .A(n10328), .B(n10327), .C(n10326), .D(n10325), .Z(n10329) );
  OR2P U11158 ( .A(n10330), .B(n10329), .Z(n10331) );
  AN2P U11159 ( .A(n10332), .B(n10331), .Z(i_i2c_U_DW_apb_i2c_slvfsm_N38) );
  ND3 U11160 ( .A(n10333), .B(i_i2c_p_det_ifaddr_sync), .C(n10957), .Z(n10334)
         );
  AN2P U11161 ( .A(n11129), .B(n10334), .Z(i_i2c_U_DW_apb_i2c_rx_filter_N199)
         );
  IVP U11162 ( .A(n10335), .Z(n10347) );
  EN U11163 ( .A(i_i2c_U_DW_apb_i2c_intctl_p_det_flg_sync), .B(
        i_i2c_U_DW_apb_i2c_intctl_p_det_flg_sync_q), .Z(n10340) );
  NR2 U11164 ( .A(n10336), .B(n10622), .Z(n10338) );
  ND2 U11165 ( .A(n10338), .B(n10343), .Z(n10339) );
  AO3 U11166 ( .A(n10347), .B(n10622), .C(n10340), .D(n10339), .Z(n10341) );
  AN2P U11167 ( .A(i_i2c_ic_en), .B(n10341), .Z(n4248) );
  EN U11168 ( .A(i_i2c_U_DW_apb_i2c_intctl_s_det_flg_sync), .B(
        i_i2c_U_DW_apb_i2c_intctl_s_det_flg_sync_q), .Z(n10346) );
  NR2 U11169 ( .A(n10342), .B(n10623), .Z(n10344) );
  ND2 U11170 ( .A(n10344), .B(n10343), .Z(n10345) );
  AO3 U11171 ( .A(n10347), .B(n10623), .C(n10346), .D(n10345), .Z(n10348) );
  AN2P U11172 ( .A(i_i2c_ic_en), .B(n10348), .Z(n4247) );
  ND2 U11173 ( .A(n11092), .B(n10449), .Z(n10349) );
  AO7 U11174 ( .A(n5018), .B(n10350), .C(n10349), .Z(n10351) );
  AN2P U11175 ( .A(n10352), .B(n10351), .Z(
        i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N38) );
  ND2 U11176 ( .A(i_ahb_ahbarbint), .B(n10353), .Z(n10354) );
  AN2P U11177 ( .A(i_ahb_U_arb_ebten), .B(n10356), .Z(n4369) );
  NR2 U11178 ( .A(n10358), .B(n10357), .Z(n10360) );
  AO1P U11179 ( .A(n10519), .B(n10361), .C(n10360), .D(n10359), .Z(
        i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N46) );
  AN2P U11180 ( .A(n10363), .B(n11094), .Z(
        i_i2c_U_DW_apb_i2c_fifo_U_rx_fifo_N39) );
  AO7 U11181 ( .A(n10364), .B(n10478), .C(n10974), .Z(n10365) );
  AN2P U11182 ( .A(n10447), .B(n10365), .Z(n4294) );
  ND2 U11183 ( .A(ex_i_ahb_AHB_Slave_hrdata[10]), .B(n10396), .Z(n10368) );
  ND2 U11184 ( .A(i_apb_prdata_apb_dslcr[10]), .B(n10373), .Z(n10367) );
  ND2 U11185 ( .A(ex_i_ahb_AHB_Slave_hrdata[11]), .B(n10396), .Z(n10370) );
  ND2 U11186 ( .A(i_apb_prdata_apb_dslcr[11]), .B(n10373), .Z(n10369) );
  ND2 U11187 ( .A(ex_i_ahb_AHB_Slave_hrdata[14]), .B(n6797), .Z(n10372) );
  ND2 U11188 ( .A(i_apb_prdata_apb_dslcr[14]), .B(n10373), .Z(n10371) );
  ND2 U11189 ( .A(ex_i_ahb_AHB_Slave_hrdata[15]), .B(n10396), .Z(n10375) );
  ND2 U11190 ( .A(i_apb_prdata_apb_dslcr[15]), .B(n10373), .Z(n10374) );
  ND2 U11191 ( .A(ex_i_ahb_AHB_Slave_hrdata[17]), .B(n5023), .Z(n10379) );
  ND2 U11192 ( .A(n7742), .B(i_i2c_U_DW_apb_i2c_regfile_N402), .Z(n10376) );
  ND2 U11193 ( .A(i_apb_prdata_apb_dslcr[1]), .B(n10397), .Z(n10378) );
  ND2P U11194 ( .A(n10379), .B(n10378), .Z(ex_i_ahb_AHB_Master_hrdata[17]) );
  ND2 U11195 ( .A(ex_i_ahb_AHB_Slave_hrdata[18]), .B(n5023), .Z(n10381) );
  ND2 U11196 ( .A(i_apb_prdata_apb_dslcr[2]), .B(n10397), .Z(n10380) );
  ND2P U11197 ( .A(n10381), .B(n10380), .Z(ex_i_ahb_AHB_Master_hrdata[18]) );
  ND2 U11198 ( .A(ex_i_ahb_AHB_Slave_hrdata[19]), .B(n10396), .Z(n10383) );
  ND2 U11199 ( .A(i_apb_prdata_apb_dslcr[3]), .B(n10397), .Z(n10382) );
  ND2P U11200 ( .A(n10383), .B(n10382), .Z(ex_i_ahb_AHB_Master_hrdata[19]) );
  ND2 U11201 ( .A(ex_i_ahb_AHB_Slave_hrdata[22]), .B(n6797), .Z(n10385) );
  ND2 U11202 ( .A(i_apb_prdata_apb_dslcr[6]), .B(n10397), .Z(n10384) );
  ND2P U11203 ( .A(n10385), .B(n10384), .Z(ex_i_ahb_AHB_Master_hrdata[22]) );
  ND2 U11204 ( .A(ex_i_ahb_AHB_Slave_hrdata[23]), .B(n6797), .Z(n10387) );
  ND2 U11205 ( .A(i_apb_prdata_apb_dslcr[7]), .B(n10397), .Z(n10386) );
  ND2P U11206 ( .A(n10387), .B(n10386), .Z(ex_i_ahb_AHB_Master_hrdata[23]) );
  ND2 U11207 ( .A(ex_i_ahb_AHB_Slave_hrdata[24]), .B(n10396), .Z(n10389) );
  ND2 U11208 ( .A(i_apb_prdata_apb_dslcr[8]), .B(n10397), .Z(n10388) );
  ND2P U11209 ( .A(n10389), .B(n10388), .Z(ex_i_ahb_AHB_Master_hrdata[24]) );
  ND2 U11210 ( .A(ex_i_ahb_AHB_Slave_hrdata[26]), .B(n6797), .Z(n10391) );
  ND2 U11211 ( .A(i_apb_prdata_apb_dslcr[10]), .B(n10397), .Z(n10390) );
  ND2P U11212 ( .A(n10391), .B(n10390), .Z(ex_i_ahb_AHB_Master_hrdata[26]) );
  ND2 U11213 ( .A(ex_i_ahb_AHB_Slave_hrdata[27]), .B(n10396), .Z(n10393) );
  ND2 U11214 ( .A(i_apb_prdata_apb_dslcr[11]), .B(n10397), .Z(n10392) );
  ND2P U11215 ( .A(n10393), .B(n10392), .Z(ex_i_ahb_AHB_Master_hrdata[27]) );
  ND2 U11216 ( .A(ex_i_ahb_AHB_Slave_hrdata[30]), .B(n6797), .Z(n10395) );
  ND2 U11217 ( .A(i_apb_prdata_apb_dslcr[14]), .B(n10397), .Z(n10394) );
  ND2P U11218 ( .A(n10395), .B(n10394), .Z(ex_i_ahb_AHB_Master_hrdata[30]) );
  ND2 U11219 ( .A(ex_i_ahb_AHB_Slave_hrdata[31]), .B(n10396), .Z(n10399) );
  ND2 U11220 ( .A(i_apb_prdata_apb_dslcr[15]), .B(n10397), .Z(n10398) );
  ND2P U11221 ( .A(n10399), .B(n10398), .Z(ex_i_ahb_AHB_Master_hrdata[31]) );
endmodule

