array set traceInfo {statusMessage {Finished successfully.} Connect {{<tt>i_ahb/hmaster</tt> {<I>open (unconnected)</I>}} {{<tt>i_apb/paddr[31:8]</tt>} {<I>open (unconnected)</I>}} {<tt>HCLK_hclk</tt> <tt>i_ahb/hclk</tt>} {<tt>HCLK_hclk</tt> <tt>i_apb/hclk</tt>} {<tt>HRESETn_hresetn</tt> <tt>i_ahb/hresetn</tt>} {<tt>HRESETn_hresetn</tt> <tt>i_apb/hresetn</tt>} {<tt>PCLK_pclk</tt> <tt>i_i2c/pclk</tt>} {<tt>PRESETn_presetn</tt> <tt>i_i2c/presetn</tt>} {<tt>ex_i_ahb_AHB_Master_haddr</tt> <tt>i_ahb/haddr_m1</tt>} {<tt>ex_i_ahb_AHB_Master_hburst</tt> <tt>i_ahb/hburst_m1</tt>} {<tt>ex_i_ahb_AHB_Master_hbusreq</tt> <tt>i_ahb/hbusreq_m1</tt>} {<tt>i_ahb/hgrant_m1</tt> <tt>ex_i_ahb_AHB_Master_hgrant</tt>} {<tt>ex_i_ahb_AHB_Master_hlock</tt> <tt>i_ahb/hlock_m1</tt>} {<tt>ex_i_ahb_AHB_Master_hprot</tt> <tt>i_ahb/hprot_m1</tt>} {<tt>i_ahb/hrdata</tt> <tt>ex_i_ahb_AHB_Master_hrdata</tt>} {<tt>i_ahb/hready</tt> <tt>ex_i_ahb_AHB_Master_hready</tt>} {<tt>i_ahb/hresp</tt> <tt>ex_i_ahb_AHB_Master_hresp</tt>} {<tt>ex_i_ahb_AHB_Master_hsize</tt> <tt>i_ahb/hsize_m1</tt>} {<tt>ex_i_ahb_AHB_Master_htrans</tt> <tt>i_ahb/htrans_m1</tt>} {<tt>ex_i_ahb_AHB_Master_hwdata</tt> <tt>i_ahb/hwdata_m1</tt>} {<tt>ex_i_ahb_AHB_Master_hwrite</tt> <tt>i_ahb/hwrite_m1</tt>} {<tt>i_ahb/haddr</tt> <tt>ex_i_ahb_AHB_Slave_haddr</tt>} {<tt>i_ahb/haddr</tt> <tt>i_apb/haddr</tt>} {<tt>i_ahb/hburst</tt> <tt>ex_i_ahb_AHB_Slave_hburst</tt>} {<tt>i_ahb/hburst</tt> <tt>i_apb/hburst</tt>} {<tt>i_ahb/hmastlock</tt> <tt>ex_i_ahb_AHB_Slave_hmastlock</tt>} {<tt>i_ahb/hprot</tt> <tt>ex_i_ahb_AHB_Slave_hprot</tt>} {<tt>ex_i_ahb_AHB_Slave_hrdata</tt> <tt>i_ahb/hrdata_s2</tt>} {<tt>i_apb/hrdata</tt> <tt>i_ahb/hrdata_s1</tt>} {<tt>i_ahb/hready</tt> <tt>ex_i_ahb_AHB_Slave_hready</tt>} {<tt>i_ahb/hready</tt> <tt>i_apb/hready</tt>} {<tt>ex_i_ahb_AHB_Slave_hready_resp</tt> <tt>i_ahb/hready_resp_s2</tt>} {<tt>i_apb/hready_resp</tt> <tt>i_ahb/hready_resp_s1</tt>} {<tt>ex_i_ahb_AHB_Slave_hresp</tt> <tt>i_ahb/hresp_s2</tt>} {<tt>i_apb/hresp</tt> <tt>i_ahb/hresp_s1</tt>} {<tt>i_ahb/hsel_s2</tt> <tt>ex_i_ahb_AHB_Slave_hsel</tt>} {<tt>i_ahb/hsel_s1</tt> <tt>i_apb/hsel</tt>} {<tt>i_ahb/hsize</tt> <tt>ex_i_ahb_AHB_Slave_hsize</tt>} {<tt>i_ahb/hsize</tt> <tt>i_apb/hsize</tt>} {<tt>i_ahb/htrans</tt> <tt>ex_i_ahb_AHB_Slave_htrans</tt>} {<tt>i_ahb/htrans</tt> <tt>i_apb/htrans</tt>} {<tt>i_ahb/hwdata</tt> <tt>ex_i_ahb_AHB_Slave_hwdata</tt>} {<tt>i_ahb/hwdata</tt> <tt>i_apb/hwdata</tt>} {<tt>i_ahb/hwrite</tt> <tt>ex_i_ahb_AHB_Slave_hwrite</tt>} {<tt>i_ahb/hwrite</tt> <tt>i_apb/hwrite</tt>} {{<tt>i_apb/paddr[7:0]</tt>} <tt>i_i2c/paddr</tt>} {<tt>i_apb/penable</tt> <tt>i_i2c/penable</tt>} {<tt>i_i2c/prdata</tt> <tt>i_apb/prdata_s0</tt>} {<tt>i_apb/psel_s0</tt> <tt>i_i2c/psel</tt>} {<tt>i_apb/pwdata</tt> <tt>i_i2c/pwdata</tt>} {<tt>i_apb/pwrite</tt> <tt>i_i2c/pwrite</tt>}} CreateExPort {{input <tt>ex_i_ahb_AHB_Master_haddr</tt> {31 : 0} ex_i_ahb_AHB_Master/haddr} {input <tt>ex_i_ahb_AHB_Master_hburst</tt> {2 : 0} ex_i_ahb_AHB_Master/hburst} {input <tt>ex_i_ahb_AHB_Master_hbusreq</tt> {<I>single bit</I>} ex_i_ahb_AHB_Master/hbusreq} {output <tt>ex_i_ahb_AHB_Master_hgrant</tt> {<I>single bit</I>} ex_i_ahb_AHB_Master/hgrant} {input <tt>ex_i_ahb_AHB_Master_hlock</tt> {<I>single bit</I>} ex_i_ahb_AHB_Master/hlock} {input <tt>ex_i_ahb_AHB_Master_hprot</tt> {3 : 0} ex_i_ahb_AHB_Master/hprot} {output <tt>ex_i_ahb_AHB_Master_hrdata</tt> {31 : 0} ex_i_ahb_AHB_Master/hrdata} {output <tt>ex_i_ahb_AHB_Master_hready</tt> {<I>single bit</I>} ex_i_ahb_AHB_Master/hready} {output <tt>ex_i_ahb_AHB_Master_hresp</tt> {1 : 0} ex_i_ahb_AHB_Master/hresp} {input <tt>ex_i_ahb_AHB_Master_hsize</tt> {2 : 0} ex_i_ahb_AHB_Master/hsize} {input <tt>ex_i_ahb_AHB_Master_htrans</tt> {1 : 0} ex_i_ahb_AHB_Master/htrans} {input <tt>ex_i_ahb_AHB_Master_hwdata</tt> {31 : 0} ex_i_ahb_AHB_Master/hwdata} {input <tt>ex_i_ahb_AHB_Master_hwrite</tt> {<I>single bit</I>} ex_i_ahb_AHB_Master/hwrite} {output <tt>ex_i_ahb_AHB_Slave_haddr</tt> {31 : 0} ex_i_ahb_AHB_Slave/haddr} {output <tt>ex_i_ahb_AHB_Slave_hburst</tt> {2 : 0} ex_i_ahb_AHB_Slave/hburst} {output <tt>ex_i_ahb_AHB_Slave_hmastlock</tt> {<I>single bit</I>} ex_i_ahb_AHB_Slave/hmastlock} {output <tt>ex_i_ahb_AHB_Slave_hprot</tt> {3 : 0} ex_i_ahb_AHB_Slave/hprot} {input <tt>ex_i_ahb_AHB_Slave_hrdata</tt> {31 : 0} ex_i_ahb_AHB_Slave/hrdata} {output <tt>ex_i_ahb_AHB_Slave_hready</tt> {<I>single bit</I>} ex_i_ahb_AHB_Slave/hready} {input <tt>ex_i_ahb_AHB_Slave_hready_resp</tt> {<I>single bit</I>} ex_i_ahb_AHB_Slave/hready_resp} {input <tt>ex_i_ahb_AHB_Slave_hresp</tt> {1 : 0} ex_i_ahb_AHB_Slave/hresp} {output <tt>ex_i_ahb_AHB_Slave_hsel</tt> {<I>single bit</I>} ex_i_ahb_AHB_Slave/hsel} {output <tt>ex_i_ahb_AHB_Slave_hsize</tt> {2 : 0} ex_i_ahb_AHB_Slave/hsize} {output <tt>ex_i_ahb_AHB_Slave_htrans</tt> {1 : 0} ex_i_ahb_AHB_Slave/htrans} {output <tt>ex_i_ahb_AHB_Slave_hwdata</tt> {31 : 0} ex_i_ahb_AHB_Slave/hwdata} {output <tt>ex_i_ahb_AHB_Slave_hwrite</tt> {<I>single bit</I>} ex_i_ahb_AHB_Slave/hwrite} {input <tt>HCLK_hclk</tt> {<I>single bit</I>} HCLK/hclk} {input <tt>HRESETn_hresetn</tt> {<I>single bit</I>} HRESETn/hresetn} {input <tt>PCLK_pclk</tt> {<I>single bit</I>} PCLK/pclk} {input <tt>PRESETn_presetn</tt> {<I>single bit</I>} PRESETn/presetn}} statusColor green}
