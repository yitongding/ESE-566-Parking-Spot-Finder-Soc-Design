// ------------------------------------------------------------------------
// --
//  ------------------------------------------------------------------------
//
//                    (C) COPYRIGHT 2003 - 2014 SYNOPSYS, INC.
//                            ALL RIGHTS RESERVED
//
//  This software and the associated documentation are confidential and
//  proprietary to Synopsys, Inc.  Your use or disclosure of this
//  software is subject to the terms and conditions of a written
//  license agreement between you, or your company, and Synopsys, Inc.
//
// The entire notice above must be reproduced on all authorized copies.
//
//  ------------------------------------------------------------------------

// 
// Release version :  1.22a
// File Version     :        $Revision: #21 $ 
// Revision: $Id: //dwh/DW_ocb/DW_apb_i2c/amba_dev/sim/testbench/test_DW_apb_i2c.v#21 $ 
//
//
//
// File    : test_DW_apb_i2c.v
// Author  : Ray Beechinor
// Created : Mon Jul 29 10:56:05 GMT 2002
// Abstract: Top-level verilog testbench for the APB I2C
//           peripheral
//
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------

`timescale 1ns / 10ps
`include "DW_amba_constants.v"
`include "DW_apb_cc_constants.v"
 `include "DW_apb_i2c_cc_constants.v"

`define IC_CON_OS             8'h00
`define IC_SDA_HOLD_OS        8'h7c

`define IC_FS_SPKLEN_OS       8'ha0
`define IC_HS_SPKLEN_OS       8'ha4


module test_DW_apb_i2c;

   wire                        hclk;
   wire                        pclk;
   reg                        _hclk;
   reg                        _pclk;
   reg                        same_clk_freq;

   wire                       reset;
   wire                       presetn;
   wire                       d_presetn;

   assign #1 d_presetn = presetn;

   reg                        pclk_en;
   reg                        my_ic_clk;
   reg                        bfm_scl_clk;
   wire                       ic_clk;

   wire                       ic_clk_in_a;
   wire                       ic_clk_in_alt;
   wire                       ic_clk_oe;
   wire                       ic_clk_oe_alt;

   wire                       ic_data_in_a;
   wire                       ic_data_oe;
   wire                       ic_data_oe_alt;

   wire                       ic_sda;
   wand                       ic_scl;
   reg                        ic_scl_dly;
   reg                        ic_scl_dly_alt;
   reg                        ic_rst_n;
   wire                       d_ic_rst_n;
   
   reg                        spklen_test;

   assign #1 d_ic_rst_n = ic_rst_n;


   wire                       ic_current_src_en;

   wire                       ic_en;
   wire                       debug_s_gen_alt;
   wire                       debug_p_gen_alt;
   wire                       debug_data_alt;
   wire                       debug_addr_alt;
   wire                       debug_addr_10bit_alt;
   wire                       debug_rd_alt;
   wire                       debug_wr_alt;
   wire                       debug_hs_alt;
   wire                       debug_master_act_alt;
   wire                       debug_slave_act_alt;
   wire [4:0]                 debug_mst_cstate_alt;
   wire [3:0]                 debug_slv_cstate_alt;

   wire                       ic_en_alt;
   wire                       debug_s_gen;
   wire                       debug_p_gen;
   wire                       debug_data;
   wire                       debug_addr;
   wire                       debug_addr_10bit;
   wire                       debug_rd;
   wire                       debug_wr;
   wire                       debug_hs;
   wire                       debug_master_act;
   wire                       debug_slave_act;
   wire [4:0]                 debug_mst_cstate;
   wire [3:0]                 debug_slv_cstate;

   wire                       dma_tx_ack;
   wire                       dma_tx_req;
   wire                       dma_tx_single;
   wire                       dma_rx_ack;
   wire                       dma_rx_req;
   wire                       dma_rx_single;
//# Alternative DMA Engine
   wire                       dma_tx_ack_alt;
   wire                       dma_tx_req_alt;
   wire                       dma_tx_single_alt;
   wire                       dma_rx_ack_alt;
   wire                       dma_rx_req_alt;
   wire                       dma_rx_single_alt;

   reg dut0_arb_loss;
   reg dut1_arb_loss;
   reg dut0_arb_loss_r;
   reg dut1_arb_loss_r;

   wire bfm_speed;
   wire bfm_oe;
   wire bfm_slow_en;

   reg                        ic_sclk;  // i2c standard speed clock
   reg                        ic_fclk;  // i2c fast clock
   reg                        ic_hclk;  // i2c high speed clock

   parameter sspeed = 10000;         // clock time period for standard speed clock in ns
   parameter fspeed = 2500;          // clock time period for fast speed clock in ns
   parameter hspeed = 294;           // clock time period for fast speed clock in ns

   // JS, 18/7/2008
   // scaling up these values for IC_CLK_MODE = 0, as these values are
   // too quick for the 100ns ic_clk that is used in this case.
   // high time in HS mode,   60ns (100pF loading)
   parameter hspeed_high = (`IC_CLK_TYPE == `IDENT) ? 600 :((`IC_CAP_LOADING == 400)?120:60);
   // low  time in HS mode,  160ns (100pF loading)
   parameter hspeed_low  = (`IC_CLK_TYPE == `IDENT) ? 1600 :( (`IC_CAP_LOADING == 400)?320:160);

   parameter fspeed_high =  600;  // high time in FS mode,  600ns
   parameter fspeed_low  = 1300;  //  low time in FS mode, 1300ns
   parameter sspeed_high = 4000;  // high time in SS mode, 4000ns
   parameter sspeed_low  = 4700;  //  low time in SS mode, 4700ns


   // ----------------------------------------
   // AHB bus signals
   // ----------------------------------------
   wire 		      hsel_s1;
   wire 		      hready;
   wire 		      hwrite;
   wire 		      hready_resp;
   wire [`HRESP_WIDTH-1:0]    hresp;
   wire [`HADDR_WIDTH-1:0]    haddr;
   wire [`HTRANS_WIDTH-1:0]   htrans;
   wire [`AHB_DATA_WIDTH-1:0] hrdata;
   wire [`AHB_DATA_WIDTH-1:0] hwdata;
   wire [63:0] 		      addr64;

   assign addr64[63:32] = 0;
   assign addr64[31:0] = U_ahb.haddr;

   // added for new monitor
   wire [15:0]		      hsel;
   wire [15:0]		      bus_hbusreq;
   wire [15:0]		      bus_hgrant;
   wire [15:0]		      bus_hlock;

   assign hsel[15:3]        = {13{1'b0}};
   assign hsel[2]           = U_ahb.hsel_s2;
   assign hsel[1]           = U_ahb.hsel_s1;
   assign hsel[0]           = 1'b0;
   assign bus_hbusreq[15:0] = {{12{1'b0}}, U_ahb.hbusreq_m3, U_ahb.hbusreq_m2, U_ahb.hbusreq_m1, 1'b0};
   assign bus_hgrant [15:0] = {{12{1'b0}}, U_ahb.hgrant_m3,  U_ahb.hgrant_m2,  U_ahb.hgrant_m1, 1'b0};
   assign bus_hlock  [15:0] = {{12{1'b0}}, U_ahb.hlock_m3,   U_ahb.hlock_m2,   U_ahb.hlock_m1, 1'b0};

   // ----------------------------------------
   // APB bus signals
   // ----------------------------------------
   wire                       psel;
   wire                       psel_alt;
   wire                       penable;
   wire                       pwrite;
   wire [`PADDR_WIDTH-1:0]    paddr;
   wire [`APB_DATA_WIDTH-1:0] pwdata;
   wire [`APB_DATA_WIDTH-1:0] prdata;
   wire [`APB_DATA_WIDTH-1:0] prdata_alt;

   // added for new monitor
   wire [15:0] 		      psel_apb;

   // To connect apb monitor using mon_user_apb4_if.
   // This must be done correctly when supporing APB4
   //   For now using a temporary interface to connect.
   wire  pstrb_apb_mon;
   wire  pprot_apb_mon;

   assign psel_apb = {{13{1'b0}}, U_apb.psel_s2, U_apb.psel_s1, U_apb.psel_s0};


   // AARAUJO: START
   // --------------------------------------------
   // Emulates register bank write access to detect
   // when either I2C SDA HOLD time or I2C operating
   // mode changes.
   // Those values are then used to check I2C HOLD
   // time feature.
   // --------------------------------------------
   reg  [3:0] byte_en;
   wire [7:0] reg_addr;

   wire wr_en, wr_en_alt;
   wire ic_sda_hold_en;
   wire ic_mode_en;

   wire ic_sda_hold_we;
   wire ic_sda_hold_we_alt;
   wire ic_mode_we;
   wire ic_mode_we_alt;

   reg  [15:0] ic_sda_hold;
   reg  [15:0] ic_sda_hold_alt;
   reg         ic_mode;
   reg         ic_mode_alt;

   reg   [7:0] ic_fs_spklen;
   reg   [7:0] ic_fs_spklen_alt;
   wire        ic_fs_spklen_en;
   wire        ic_fs_spklen_we;
   wire        ic_fs_spklen_we_alt;

`ifdef IC_HIGHSPEED_MODE_EN
   reg   [7:0] ic_hs_spklen;
   reg   [7:0] ic_hs_spklen_alt;
   wire        ic_hs_spklen_en;
   wire        ic_hs_spklen_we;
   wire        ic_hs_spklen_we_alt;
`endif

   task make_clk_freq_equal ;
     input equal;
   begin
     $display("Setting same_clk_freq : %0b",equal);
     same_clk_freq = equal;
   end
   endtask

   initial begin
     same_clk_freq = 1'b0;
     _pclk = 1;
     forever begin
       #((`PERIOD*`APB_CLK_RATIO)/2.0)  _pclk = ~_pclk;
     end
   end

   assign pclk = ((same_clk_freq == 1'b1) && (`IC_CLK_TYPE != `IDENT)) ? my_ic_clk : _pclk;

   initial begin
     _hclk = 1;
     forever begin
       #(`PERIOD/2.0) _hclk = ~_hclk;
     end
   end

   assign hclk = ((same_clk_freq == 1'b1) && (`IC_CLK_TYPE != `IDENT)) ? my_ic_clk : _hclk;

   assign reg_addr           = paddr[`IC_ADDR_SLICE_LHS:2];

   assign wr_en              = psel     &  penable &  pwrite;
   assign wr_en_alt          = psel_alt &  penable &  pwrite;

   assign ic_sda_hold_en     = (reg_addr == (`IC_SDA_HOLD_OS >> 2));
   assign ic_mode_en         = (reg_addr == (`IC_CON_OS      >> 2));
   assign ic_fs_spklen_en    = (reg_addr == (`IC_FS_SPKLEN_OS >> 2));
`ifdef IC_HIGHSPEED_MODE_EN
   assign ic_hs_spklen_en    = (reg_addr == (`IC_HS_SPKLEN_OS >> 2));
`endif

   assign ic_sda_hold_we      = ic_sda_hold_en & wr_en;
   assign ic_sda_hold_we_alt  = ic_sda_hold_en & wr_en_alt;
   assign ic_fs_spklen_we     = ic_fs_spklen_en & wr_en;
   assign ic_fs_spklen_we_alt = ic_fs_spklen_en & wr_en_alt;
`ifdef IC_HIGHSPEED_MODE_EN
   assign ic_hs_spklen_we     = ic_hs_spklen_en & wr_en;
   assign ic_hs_spklen_we_alt = ic_hs_spklen_en & wr_en_alt;
`endif

   assign ic_mode_we         = ic_mode_en & wr_en;
   assign ic_mode_we_alt     = ic_mode_en & wr_en_alt;

   // --------------------------------------------
   // Active byte lane: used to set the active
   // byte lanes for write/read accesses to the
   // registers
   // --------------------------------------------
   always @(paddr) begin : BYTE_EN_PROC
      if(`APB_DATA_WIDTH == 6'h08) begin //APB_DATA is 8 bit wide
         case(paddr[1:0])
           2'b00   : byte_en = 4'b0001;
           2'b01   : byte_en = 4'b0010;
           2'b10   : byte_en = 4'b0100;
           default : byte_en = 4'b1000;
         endcase
      end else begin
         if(`APB_DATA_WIDTH == 6'h10) begin //APB_DATA is 16 bit wide
            case(paddr[1])
              1'b0    : byte_en = 4'b0011;
              default : byte_en = 4'b1100;
            endcase
         end else begin
            byte_en = 4'b1111;
         end
      end
   end

   always @(posedge pclk or negedge presetn)
     if(presetn == 1'b0) begin
       ic_sda_hold     <= `IC_DEFAULT_SDA_HOLD;
       ic_sda_hold_alt <= `IC_DEFAULT_SDA_HOLD;
     end
     else begin
       if(ic_sda_hold_we == 1'b1) begin
           case(byte_en)
             4'b0001 : ic_sda_hold[7:0] <= pwdata[7:0];
             4'b0010 : ic_sda_hold[`IC_SDA_HOLD_RS-1:8] <= pwdata[7:0];
             4'b0011 : ic_sda_hold[`IC_SDA_HOLD_RS-1:0] <= pwdata;
             4'b1111 : ic_sda_hold[`IC_SDA_HOLD_RS-1:0] <= pwdata;
             default : ic_sda_hold[`IC_SDA_HOLD_RS-1:0] <= ic_sda_hold[`IC_SDA_HOLD_RS-1:0];
           endcase
       end

       if(ic_sda_hold_we_alt == 1'b1) begin
           case(byte_en)
             4'b0001 : ic_sda_hold_alt[7:0] <= pwdata[7:0];
             4'b0010 : ic_sda_hold_alt[`IC_SDA_HOLD_RS-1:8] <= pwdata[7:0];
             4'b0011 : ic_sda_hold_alt[`IC_SDA_HOLD_RS-1:0] <= pwdata;
             4'b1111 : ic_sda_hold_alt[`IC_SDA_HOLD_RS-1:0] <= pwdata;
             default : ic_sda_hold_alt[`IC_SDA_HOLD_RS-1:0] <= ic_sda_hold_alt[`IC_SDA_HOLD_RS-1:0];
           endcase
       end
     end

   always @(posedge pclk or negedge presetn)
     if(presetn == 1'b0) begin
       ic_fs_spklen     <= `IC_DEFAULT_FS_SPKLEN;
       ic_fs_spklen_alt <= `IC_DEFAULT_FS_SPKLEN;
     end
     else begin
       if(ic_fs_spklen_we == 1'b1) begin
           case(byte_en)
             4'b0001 : ic_fs_spklen[`IC_FS_SPKLEN_RS-1:0] <= pwdata[7:0];
             4'b0011 : ic_fs_spklen[`IC_FS_SPKLEN_RS-1:0] <= pwdata;
             4'b1111 : ic_fs_spklen[`IC_FS_SPKLEN_RS-1:0] <= pwdata;
             default : ic_fs_spklen[`IC_FS_SPKLEN_RS-1:0] <= ic_fs_spklen[`IC_FS_SPKLEN_RS-1:0];
           endcase
       end

       if(ic_fs_spklen_we_alt == 1'b1) begin
           case(byte_en)
             4'b0001 : ic_fs_spklen_alt[`IC_FS_SPKLEN_RS-1:0] <= pwdata[7:0];
             4'b0011 : ic_fs_spklen_alt[`IC_FS_SPKLEN_RS-1:0] <= pwdata;
             4'b1111 : ic_fs_spklen_alt[`IC_FS_SPKLEN_RS-1:0] <= pwdata;
             default : ic_fs_spklen_alt[`IC_FS_SPKLEN_RS-1:0] <= ic_fs_spklen_alt[`IC_FS_SPKLEN_RS-1:0];
           endcase
       end
     end

`ifdef IC_HIGHSPEED_MODE_EN
   always @(posedge pclk or negedge presetn)
     if(presetn == 1'b0) begin
       ic_hs_spklen     <= `IC_DEFAULT_HS_SPKLEN;
       ic_hs_spklen_alt <= `IC_DEFAULT_HS_SPKLEN;
     end
     else begin
       if(ic_hs_spklen_we == 1'b1) begin
           case(byte_en)
             4'b0001 : ic_hs_spklen[`IC_HS_SPKLEN_RS-1:0] <= pwdata[7:0];
             4'b0011 : ic_hs_spklen[`IC_HS_SPKLEN_RS-1:0] <= pwdata;
             4'b1111 : ic_hs_spklen[`IC_HS_SPKLEN_RS-1:0] <= pwdata;
             default : ic_hs_spklen[`IC_HS_SPKLEN_RS-1:0] <= ic_hs_spklen[`IC_HS_SPKLEN_RS-1:0];
           endcase
       end

       if(ic_hs_spklen_we_alt == 1'b1) begin
           case(byte_en)
             4'b0001 : ic_hs_spklen_alt[`IC_HS_SPKLEN_RS-1:0] <= pwdata[7:0];
             4'b0011 : ic_hs_spklen_alt[`IC_HS_SPKLEN_RS-1:0] <= pwdata;
             4'b1111 : ic_hs_spklen_alt[`IC_HS_SPKLEN_RS-1:0] <= pwdata;
             default : ic_hs_spklen_alt[`IC_HS_SPKLEN_RS-1:0] <= ic_hs_spklen_alt[`IC_HS_SPKLEN_RS-1:0];
           endcase
       end
     end
`endif

   `define IC_CON_0_MASTER_MODE 1
   always @(posedge pclk or negedge presetn) begin: IC_MODE_PROC
      if(presetn == 1'b0) begin
         ic_mode     <= `IC_CON_0_MASTER_MODE;
         ic_mode_alt <= `IC_CON_0_MASTER_MODE;
      end else begin
         if ((ic_mode_we == 1'b1) && (byte_en[0] == 1'b1) && (ic_en == 1'b0)) begin
              ic_mode <= pwdata[0];
           end
         if ((ic_mode_we_alt == 1'b1) && (byte_en[0] == 1'b1) && (ic_en_alt == 1'b0)) begin
              ic_mode_alt <= pwdata[0];
           end
      end
   end

   // ---------------------------------------------------------------------------------------
   // (1) was replaced by (2) in ic_mode generation
   //
   // (1) - if ((ic_mode_we == 1'b1) && (byte_en[0] == 1'b1) && (ic_enable[0] == 1'b0)) begin
   // (2) - if ((ic_mode_we == 1'b1) && (byte_en[0] == 1'b1) && (ic_en == 1'b0)) begin
   // ---------------------------------------------------------------------------------------
   //
   // ic_en - output of I2C unit; generated as follows:
   //
   // always @(posedge pclk or negedge presetn) begin : IC_EN_PROC
   //    if(presetn == 1'b0)
   //       ic_en <= 1'b0;
   //    else
   //       ic_en <= ic_enable[0] | activity;
   //    end
   // end
   // ---------------------------------------------------------------------------------------

   // AARAUJO: END


   // ----------------------------------------
   // Instantiate the VERA Shell
   // The connections to the VERA Shell are
   // done with dynamic binds.
   // ----------------------------------------
   test_DW_apb_i2c_shell vshell(hclk, hclk, pclk);

   // ----------------------------------------
   // Instantiate the top-level AHB Bus IP
   // ----------------------------------------
   ahb_wrapper U_ahb(
           .hresetn            (presetn)
           ,.hclk              (hclk)
           ,.haddr             (haddr)
           ,.hready            (hready)
           ,.htrans            (htrans)
           ,.hwrite            (hwrite)
           ,.hwdata            (hwdata)
           ,.hsel_s1           (hsel_s1)
           ,.hready_resp_s1    (hready_resp)
           ,.hresp_s1          (hresp)
           ,.hrdata_s1         (hrdata)
   );

   // ----------------------------------------
   // Instantiate the top-level APB Bus IP
   // ----------------------------------------
   apb_wrapper U_apb(
           // AHB bus interface signals
           .hresetn            (presetn)
           ,.hclk              (pclk)
           ,.pclk_en           (pclk_en)
           ,.haddr             (haddr)
           ,.hready            (hready)
           ,.htrans            (htrans)
           ,.hwrite            (hwrite)
           ,.hwdata            (hwdata)
           ,.hsel              (hsel_s1)
           ,.hrdata            (hrdata)
           ,.hready_resp       (hready_resp)
           ,.hresp             (hresp)
           // APB bus interface signals
           ,.paddr             (paddr)
           ,.penable           (penable)
           ,.pwrite            (pwrite)
           ,.pwdata            (pwdata)
           ,.psel_s0           (psel)
           ,.prdata_s0         (prdata)
           ,.psel_s1           (psel_alt)
           ,.prdata_s1         (prdata_alt)
   );


   // ----------------------------------------
   // Instantiate the APB slave peripherial
   // ----------------------------------------
  i_i2c_DW_apb_i2c U_i2c(
          .pclk                   (pclk)
          ,.presetn               (d_presetn)
          ,.psel                  (psel)
          ,.paddr                 (paddr[`IC_ADDR_SLICE_LHS:0])
          ,.pwdata                (pwdata)
          ,.pwrite                (pwrite)
          ,.penable               (penable)
          ,.prdata                (prdata)
          ,.ic_clk_oe             (ic_clk_oe)
          ,.ic_clk_in_a           (ic_clk_in_a)
          ,.ic_data_oe            (ic_data_oe)
          ,.ic_data_in_a          (ic_data_in_a)
          ,.ic_rst_n              (d_ic_rst_n)
          ,.ic_clk                (ic_clk)
          ,.ic_en                 (ic_en)

          `ifdef IC_HAS_DMA_EQ_1
          ,.dma_tx_req            (dma_tx_req)
          ,.dma_tx_single         (dma_tx_single)
          ,.dma_rx_req            (dma_rx_req)
          ,.dma_rx_single         (dma_rx_single)
          ,.dma_tx_ack            (dma_tx_ack)
          ,.dma_rx_ack            (dma_rx_ack)
          `endif

          ,.debug_s_gen           (debug_s_gen)
          ,.debug_p_gen           (debug_p_gen)
          ,.debug_data            (debug_data)
          ,.debug_addr            (debug_addr)
          ,.debug_addr_10bit      (debug_addr_10bit)
          ,.debug_rd              (debug_rd)
          ,.debug_wr              (debug_wr)
          ,.debug_hs              (debug_hs)
          ,.debug_master_act      (debug_master_act)
          ,.debug_slave_act       (debug_slave_act)
          ,.debug_mst_cstate      (debug_mst_cstate)
          ,.debug_slv_cstate      (debug_slv_cstate)
   );

  i_i2c_DW_apb_i2c U_i2c_alt(
          .pclk                   (pclk)
          ,.presetn               (d_presetn)
          ,.psel                  (psel_alt)
          ,.paddr                 (paddr[`IC_ADDR_SLICE_LHS:0])
          ,.pwdata                (pwdata)
          ,.pwrite                (pwrite)
          ,.penable               (penable)
          ,.ic_rst_n              (d_ic_rst_n)
          ,.ic_clk                (ic_clk)
          ,.ic_clk_in_a           (ic_clk_in_alt)
          ,.ic_data_in_a          (ic_data_in_a)
          ,.prdata                (prdata_alt)
          ,.ic_clk_oe             (ic_clk_oe_alt)
          ,.ic_data_oe            (ic_data_oe_alt)

          `ifdef IC_HAS_DMA_EQ_1
          ,.dma_tx_req            (dma_tx_req_alt)
          ,.dma_tx_single         (dma_tx_single_alt)
          ,.dma_rx_req            (dma_rx_req_alt)
          ,.dma_rx_single         (dma_rx_single_alt)
          ,.dma_tx_ack            (dma_tx_ack_alt)
          ,.dma_rx_ack            (dma_rx_ack_alt)
          `endif

          ,.ic_en                 (ic_en_alt)
          ,.debug_s_gen           (debug_s_gen_alt)
          ,.debug_p_gen           (debug_p_gen_alt)
          ,.debug_data            (debug_data_alt)
          ,.debug_addr            (debug_addr_alt)
          ,.debug_addr_10bit      (debug_addr_10bit_alt)
          ,.debug_rd              (debug_rd_alt)
          ,.debug_wr              (debug_wr_alt)
          ,.debug_hs              (debug_hs_alt)
          ,.debug_master_act      (debug_master_act_alt)
          ,.debug_slave_act       (debug_slave_act_alt)
          ,.debug_mst_cstate      (debug_mst_cstate_alt)
          ,.debug_slv_cstate      (debug_slv_cstate_alt)
   );


   // ----------------------------------------
   // wire DW_apb_i2c bus interface
   // ----------------------------------------
  initial
  begin
          ic_rst_n = 1'b1;
    #100  ic_rst_n = 1'b0;
    #3000 ic_rst_n = 1'b1;
  end

  initial
    spklen_test = 0;

  // 22.02.2010, jstokes
  // Delay ic_scl by 2 cycles - coarse model of bus capacitance on SCL.
  // This will cause the TB to fail if the SDA hold time does not extend
  // SDA past this delayed SCL.
  `define DELAY_SCL 0
  wand ic_scl_r0;
  reg ic_scl_r1;
  reg ic_scl_r2;
  always @(posedge ic_clk) begin
    ic_scl_r1 <= ic_scl_r0;
    ic_scl_r2 <= ic_scl_r1;
  end

  // Insert the Skew on the SCL to model undefined region of SCL edge
  reg tx_scl_skew_en;
  reg rx_scl_skew_en;
  reg ic_clk_in_a_delayed;
  reg ic_clk_in_a_alt_delayed;
  reg shift_reg[0:256];
  integer i0;
  integer tx_skew_delay;
  integer rx_skew_delay;

  assign ic_scl_r0       = ic_clk_oe  ? 1'b0 : 1'bz;
  assign ic_scl_r0       = ic_clk_oe_alt  ? 1'b0 : 1'bz;

  assign ic_scl          = `DELAY_SCL ? ic_scl_r2 : ic_scl_r0;

  initial begin
    tx_scl_skew_en = 0;
    rx_scl_skew_en = 0;
    tx_skew_delay = 0;
    rx_skew_delay = 0;
    ic_clk_in_a_delayed = 1'b1;
    ic_clk_in_a_alt_delayed = 1'b1;
  end

  always @(posedge ic_clk or presetn) 
  begin
    if(presetn===1'b0)begin
      for (i0 = 0; i0 < 256;i0=i0+1)
        shift_reg[i0] <= 1'b1;
    end
    else  begin
      shift_reg[0] <= ic_scl;
      for (i0 =1; i0 <256; i0=i0+1)
        shift_reg[i0] <= shift_reg[i0-1];
    end
  end

  always @(shift_reg[rx_skew_delay-1] or rx_skew_delay or ic_scl)
    if(rx_skew_delay != 0)
      ic_clk_in_a_delayed = shift_reg[rx_skew_delay-1];
    else
      ic_clk_in_a_delayed = ic_scl;

  always @(shift_reg[tx_skew_delay] or tx_skew_delay or ic_scl)
    if(tx_skew_delay != 0)
      ic_clk_in_a_alt_delayed = shift_reg[tx_skew_delay];
    else
      ic_clk_in_a_alt_delayed = ic_scl;

  task setup_scl_skew;
  input direction;
  input enable;
  input integer delay;
  begin
     $display("Setting SCL clock skew - Direction %0b Enable:%0b Delay:%0d",direction,enable,delay);
     if(direction) begin
       $display ("Setting SCL clock skew for Rx direction");
       rx_skew_delay = delay;
       rx_scl_skew_en = enable;
     end

     if(~direction) begin
       $display ("Setting SCL clock skew for Tx direction");
       tx_skew_delay = delay;
       tx_scl_skew_en = enable;
     end     
  end
  endtask

  //assign ic_scl        = ic_clk_oe_alt  ? 1'b0 : 1'bz;
  //assign ic_scl        = ic_clk_oe  ? 1'b0 : 1'bz;
  assign ic_sda          = ic_data_oe ? 1'b0 : 1'bz;
  assign ic_sda          = ic_data_oe_alt ? 1'b0 : 1'bz;
  assign #1 ic_clk_in_a  = rx_scl_skew_en ? ic_clk_in_a_delayed: ic_scl;
  assign #1 ic_clk_in_alt  = tx_scl_skew_en ? ic_clk_in_a_alt_delayed: ic_scl;
  assign #1 ic_data_in_a = ic_sda;

  assign ic_clk          = (`IC_CLK_TYPE == `IDENT) ? _pclk : my_ic_clk;
  pullup(ic_scl);
  pullup(ic_sda);
  assign ic_scl          = ic_scl_dly;
  assign ic_scl          = ic_scl_dly_alt;

  // JOE: Replaced the following two lines of code with the assign and
  //      always proc below. This was done to workaround an MTI 6.0 sim
  //      failure during regressions.
  //
  //assign bfm_scl_clk  = bfm_speed ? ic_hclk : (bfm_slow_en ? ic_sclk : ic_fclk);
  //assign ic_scl       = bfm_oe ? (bfm_speed ? ic_hclk : (bfm_slow_en ? ic_sclk : ic_fclk) ) : 1'bz;




  assign ic_scl_r0       = bfm_oe ? bfm_scl_clk : 1'bz;

  always @(bfm_speed or bfm_slow_en or ic_hclk or ic_sclk or ic_fclk) begin
    if(bfm_speed) begin
      #1 bfm_scl_clk = ic_hclk;
    end else begin
      if(bfm_slow_en) begin
        #1 bfm_scl_clk = ic_sclk;
      end else begin
        #1 bfm_scl_clk = ic_fclk;
      end
    end
  end
  // JOE: End

  initial
  begin
     ic_scl_dly = 1'bz;
     forever begin
       @(negedge ic_clk_oe);
       if ((bfm_oe) && (!bfm_scl_clk))
       begin
         ic_scl_dly = 1'b0;
         @(posedge bfm_scl_clk);
         @(negedge bfm_scl_clk);
         #1 ic_scl_dly = 1'bz;
       end
       else
         if ((bfm_oe) && (bfm_scl_clk))
         begin
           ic_scl_dly = 1'b0;
           @(negedge bfm_scl_clk);
           #1 ic_scl_dly = 1'bz;
         end
     end
    end

  initial
  begin
     ic_scl_dly_alt = 1'bz;
     forever begin
       @(negedge ic_clk_oe_alt);
       if ((bfm_oe) && (!bfm_scl_clk))
       begin
         ic_scl_dly_alt = 1'b0;
         @(posedge bfm_scl_clk);
         @(negedge bfm_scl_clk);
         #1 ic_scl_dly_alt = 1'bz;
       end
       else
         if ((bfm_oe) && (bfm_scl_clk))
         begin
           ic_scl_dly_alt = 1'b0;
           @(negedge bfm_scl_clk);
           #1 ic_scl_dly_alt = 1'bz;
         end
     end
    end

// ----------------------------------------
// pclk_en control
// ----------------------------------------
  initial
  begin
    if (`APB_CLK_RATIO == 1) begin
      pclk_en = 1;
    end else begin
      pclk_en = 0;
      repeat (`APB_CLK_RATIO) @(posedge hclk);
      pclk_en = 1;
      @(posedge hclk);
      pclk_en = 0;
      forever begin
        repeat (`APB_CLK_RATIO-1) @(posedge hclk);
         #1 pclk_en = 1;
         @(posedge hclk);
         #1 pclk_en = 0;
      end
    end
  end

   // ----------------------------------------
   // dump control
   // ----------------------------------------

`ifdef DUMP_DEPTH
   initial begin
 `ifdef VCS
      $vcdpluson(`DUMP_DEPTH);
 `else
  `ifdef DUMP_FILE
  `else
   `define DUMP_FILE "test.vcd"
  `endif
      $dumpfile(`DUMP_FILE);
      $dumpvars(`DUMP_DEPTH);
 `endif
   end
`endif

   // ----------------------------------------
   // sdf simulations
   // ----------------------------------------
`ifdef SDF_FILE
   initial
     begin
        $display("About to sdf-annotate the design from %s",`SDF_FILE);
        $sdf_annotate(`SDF_FILE, U_i2c, , , `SDF_LEVEL);
        $sdf_annotate(`SDF_FILE, U_i2c_alt, , , `SDF_LEVEL);
     end
`endif

`ifdef CODE_COVERAGE
   initial
     begin
   //$set_toggle_mode(1);
   //$start_toggle("U_i2c");
     end
`endif

// ----------------------------------------
// I2C Clock Generator
// ----------------------------------------
initial
   begin
      my_ic_clk = 1;
      forever
         begin
            my_ic_clk = #(`IC_CLOCK_PERIOD/2.0) ~my_ic_clk;
         end // forever begin
   end


// standard speed clock generation
   initial begin
    ic_sclk  = 0 ;
    forever begin
      #(sspeed_low)
        ic_sclk = 1'b1;
      #(sspeed_high)
        ic_sclk = 1'b0;
    end
   end

// fast speed clock generation
   initial begin
    ic_fclk  = 0 ;
    forever begin
      #(fspeed_low)
        ic_fclk = 1'b1;
      #(fspeed_high)
        ic_fclk = 1'b0;
    end
   end

// high speed clock generation
   initial begin
    ic_hclk  = 0 ;
    forever begin
      #(hspeed_low)
        ic_hclk = 1'b1;
      #(hspeed_high)
        ic_hclk = 1'b0;
    end
   end

  // =====================================================
  // Checker for "ic_clk_oe"
  // On falling edges, check count and report/terminate.
  // =====================================================
  integer ic_clk_oe_count;
  integer ic_data_oe_count;
  reg     ic_clk_oe_r;
  reg     ic_data_oe_r;
  reg     ic_data_oe_alt_r;
  initial ic_clk_oe_count = 0;

  always @(posedge ic_clk)
    ic_clk_oe_r <= ic_clk_oe;

  always @(posedge ic_clk) begin
    if(ic_clk_oe) begin
      ic_clk_oe_count = ic_clk_oe_count + 1;
    end else begin
      if(ic_clk_oe_count <=5 && ic_clk_oe_r && ic_rst_n) begin
        $display("[%d] ERROR!!! ic_clk_oe pulse is less than 6 clocks wide.", $time);
        $display("Simulation terminated.\n\n");
        #100000;
        $finish;
      end

      ic_clk_oe_count = 0;
    end
  end

  always @(posedge ic_clk) begin
    if(~ic_data_oe) begin
      ic_data_oe_count = ic_data_oe_count + 1;
    end else begin
      // Only flag an ic_data_oe pulse of less than 6 cycles as an error if
      // SCL is high.
      if(ic_data_oe_count <=5 && ~ic_data_oe_r && ic_rst_n & ic_scl & ~dut0_arb_loss_r) begin
        $display("[%d] ERROR!!! ic_data_oe pulse is less than 6 clocks wide.", $time);
        $display("Simulation terminated.\n\n");
        #100000;
        $finish;
      end

      ic_data_oe_count = 0;
    end
  end

  // =====================================================
  // Checker for SDA changing versus SCL changing
  // =====================================================
  always @(posedge ic_clk) begin
    ic_data_oe_r <= ic_data_oe;
    ic_data_oe_alt_r <= ic_data_oe_alt;
  end

  always @(posedge ic_clk) begin
    if(ic_rst_n && (ic_data_oe_r ^ ic_data_oe) && (ic_clk_oe_r ^ ic_clk_oe)) begin
      $display("[%d] ERROR!!! ic_data_oe changes simultaneously with ic_clk_oe...!!", $time);
      $display("Simulation terminated.\n\n");
      #100000;
      $finish;
    end // if ic_rst_n
  end // always

  reg bfm_drove_last_bit;
  always @(posedge ic_clk) begin
    if(~ic_rst_n) begin
      bfm_drove_last_bit <= 1'b0;
    end else begin
      if(ic_scl)
      bfm_drove_last_bit <=    ic_sda & (ic_data_oe | ic_data_oe_alt)
                            | ~ic_sda & (~ic_data_oe & ~ic_data_oe_alt);
    end
  end


  // Detect arbitration loss in DUT 0
  reg dut0_arb_loss_sclh;
  always @(posedge ic_clk or negedge ic_rst_n) begin : dut0_arb_loss_sclh_PROC
    if(~ic_rst_n) begin
      dut0_arb_loss_sclh <= 1'b0;
    end else begin
      if(ic_scl)
        dut0_arb_loss_sclh <= ic_data_oe & ic_sda;
      else
        dut0_arb_loss_sclh <= 1'b0;
    end
  end // dut0_arb_loss_sclh_PROC

  reg ic_scl_r;
  wire ic_scl_fed;
  always @(posedge ic_clk or negedge ic_rst_n) begin : ic_scl_r_PROC
    if(~ic_rst_n) begin
      ic_scl_r <= 1'b0;
    end else begin
      ic_scl_r <= ic_scl;
    end
  end
  assign ic_scl_fed = ic_scl_r & !ic_scl;

  // Detect arbitration loss in DUT 0
  always @(*) begin : dut0_arb_loss_PROC
    dut1_arb_loss = 1'b0;
    // JS_DEBUG
    /*
    dut0_arb_loss = dut0_arb_loss_r;
    if(~dut0_arb_loss_r) begin
      if(~ic_scl)
        dut0_arb_loss = (~ic_data_oe & ~ic_sda);
    end
    if(ic_scl_fed) dut0_arb_loss = 1'b0;
    */
  end // dut0_arb_loss_PROC

  always @(posedge ic_clk or negedge ic_rst_n) begin : dut0_arb_loss_r_PROC
    if(~ic_rst_n) begin
      dut0_arb_loss_r <= 1'b0;
    end else begin
      dut0_arb_loss_r <= dut0_arb_loss;
    end
  end // dut0_arb_loss_r_PROC

  // Detect arbitration loss in DUT 1
  always @(*) begin : dut1_arb_loss_PROC
    dut1_arb_loss = 1'b0;
    // JS_DEBUG
    /*
    dut1_arb_loss = dut0_arb_loss_r;
    if(~dut1_arb_loss_r) begin
      if(~ic_scl)
        dut1_arb_loss = (~ic_data_oe_alt & ~ic_sda);
    end
    if(ic_scl_fed) dut1_arb_loss = 1'b0;
    */
  end // dut1_arb_loss_PROC

  always @(posedge ic_clk or negedge ic_rst_n) begin : dut1_arb_loss_r_PROC
    if(~ic_rst_n) begin
      dut1_arb_loss_r <= 1'b0;
    end else begin
      dut1_arb_loss_r <= dut1_arb_loss;
    end
  end // dut1_arb_loss_PROC


  // SDA HOLD TIME CHECKER
  // `define DUT_SDA_HOLD_MIN 1
  // dut_sda_hold_assertion: assert property (
  //   @(posedge ic_clk)
  //   disable iff (  ~ic_rst_n | dut0_arb_loss )
  //   $fell(ic_scl) |-> $stable(ic_data_oe) [*`DUT_SDA_HOLD_MIN]
  // )
  // else
  //   $error("%m violated.");
  //
  // alt_dut_sda_hold_assertion: assert property (
  //   @(posedge ic_clk)
  //   disable iff (  ~ic_rst_n | dut1_arb_loss )
  //   $fell(ic_scl) |-> $stable(ic_data_oe_alt) [*`DUT_SDA_HOLD_MIN]
  // )
  // else
  //   $error("%m violated.");

  // AARAUJO: SDA HOLD time check
  integer sda_hold_count;
  integer sda_hold_alt_count;

  integer ic_clk_oe_hold_count;
  integer ic_clk_oe_alt_hold_count;


  // Falling edge detect on SDA.
  reg sda_r;
  wire sda_fed;
  always @(posedge ic_clk or negedge ic_rst_n) begin
    if(~ic_rst_n) begin
      sda_r <= 1'b0;
    end else begin
      sda_r <= ic_sda;
    end
  end
  assign sda_fed = ~ic_sda & sda_r;

  // Rising edge detect on SCL.
  wire scl_red;
  reg scl_r;
  always @(posedge ic_clk or negedge ic_rst_n) begin
    if(~ic_rst_n) begin
      scl_r <= ic_scl;
    end else begin
      scl_r <= ic_scl;
    end
  end
  assign scl_red = ~scl_r & ic_scl;

  // Detect a START and hold until next posedge of SCL.
  reg s_det;
  always @(posedge ic_clk or negedge ic_rst_n) begin
    if(~ic_rst_n) begin
      s_det <= 1'b0;
    end else begin
      if(ic_scl & sda_fed) s_det <= 1'b1;
      if(scl_red) s_det <= 1'b0;
    end
  end

  // Measure HOLD time for DUT0
  // Count ic_clk cycles when DUT0 is active and ic_scl is low
  always @(posedge ic_clk or negedge ic_rst_n) begin
    if(~ic_rst_n)
       sda_hold_count <= 0;
    else begin
       if (dut0_arb_loss)
          sda_hold_count <= 0;
       else begin
         if(!ic_scl)
            sda_hold_count <= sda_hold_count + 1;
         else
            sda_hold_count <= 0;
       end
    end
  end

  // Measure HOLD time for DUT0 - from ic_data_oe
  // Count ic_clk cycles when DUT0 is active and ic_scl is low
  // Due to glitch injection, and because the DW_apb_i2c in master
  // mode times SDA hold time from its internal SCL, we must 
  // check it against its internal SCL. If we were to use the
  // external SCL, glitches on this line would cause the check to
  // fail.
  always @(posedge ic_clk or negedge ic_rst_n) begin
    if(~ic_rst_n)
       ic_clk_oe_hold_count <= 0;
    else begin
       if (dut0_arb_loss)
          ic_clk_oe_hold_count <= 0;
       else begin
         if(ic_clk_oe)
            ic_clk_oe_hold_count <= ic_clk_oe_hold_count + 1;
         else
            ic_clk_oe_hold_count <= 0;
       end
    end
  end

  // Extend deassertion of debug_data until ic_clk_oe goes low (to pull SCL high)
  reg debug_data_extd_r;
  always @(posedge ic_clk or negedge ic_rst_n) begin : debug_data_extd_PROC
    if(~ic_rst_n) begin
      debug_data_extd_r <= 1'b0;
    end else begin
      if(debug_data_extd_r) begin
        debug_data_extd_r <= debug_data;
      end else begin
        debug_data_extd_r <= ~ic_clk_oe;
      end
    end
  end

  // Select the spike length of the selected speed mode
  wire [`IC_SPKLEN_RS-1:0] spklen_dut0;
  `ifdef IC_HIGHSPEED_MODE_EN
  assign spklen_dut0 = debug_hs ? ic_hs_spklen : ic_fs_spklen;
  `else
  assign spklen_dut0 = ic_fs_spklen;
  `endif


  // jstokes
  // 0 cycle paths in cadence simulators are causing this check to fail
  // i.e. when ic_data_oe transitions after a posedge, the previous edge
  // count value is used instead of the value on the next posedge.
  `ifdef NC_VERILOG
  `else
  // Evaluate measured sda hold time against the programmed value in the registers bank
  always @(posedge ic_clk) begin
     if((ic_data_oe != ic_data_oe_r) && (!dut0_arb_loss) && (!(tx_scl_skew_en||rx_scl_skew_en))) begin
       // In master mode only sda hold times >=1 can be implemented.
       // If SCL is being extended, the slave can change
       // sda again during this time. If this is happening we check only
       // the min hold time, not that the hold time has been exceeded.
       // This is required for the master check too since some tests
       // use the DUT in dual master/slave mode.
       if (  (  ((ic_clk_oe_hold_count != ic_sda_hold) & ~debug_slave_act)
              | ((ic_clk_oe_hold_count < ic_sda_hold) & debug_slave_act)
             )
             // Only run check when SDA hold time programmed over 1.
             // Which will only happen during directed SDA hold time test.
           & (ic_sda_hold>1)
           & (ic_mode==`IC_CON_0_MASTER_MODE)
             // Min hold time of 2 after a start condition.
           & ~(s_det & (ic_sda_hold<=1))
           & ic_clk_oe
             // Don't check if DUT has been reset.
           & presetn
           // Stop check during SCL low period before SCL high for ACK phase
           // for reads. Master can decide late to ACK and bring SDA low.
           & (debug_data_extd_r | ~debug_rd)
          )
       begin
          $display("[%d] ERROR!!! Programmed hold time on (master) DUT0=[%d]; Measured hold time on DUT0=[%d]);"
                   , $time, ic_sda_hold, sda_hold_count);
          $display("Simulation terminated.\n\n");
          #100000;
          $finish;
       end


       // In slave mode only sda hold times >=8 can be implemented.
       // If SCL is being extended, the slave can change
       // sda again during this time. If this is happening we check only
       // the min hold time, not that the hold time has been exceeded.
       if ((  ((sda_hold_count != ic_sda_hold) & ~ic_clk_oe)
            | ((sda_hold_count < ic_sda_hold) & ic_clk_oe)
           )
           & (ic_mode!=`IC_CON_0_MASTER_MODE)
             // Only check if the programmed hold time is greater than the slaves other
             // latencies that affect sda hold time
           & (ic_sda_hold>=(spklen_dut0+7))
           & !ic_scl
             // Don't check if DUT has been reset.
           & presetn
          )
       begin
          $display("[%d] ERROR!!! Programmed hold time on (Slave) DUT0=[%d]; Measured hold time on DUT0=[%d]);"
                   , $time, ic_sda_hold, sda_hold_count);
          $display("Simulation terminated.\n\n");
          #100000;
          $finish;
       end
     end // if(ic_data_oe != ic_data_oe_r)
  end

  // Measure HOLD time for DUT1
  // Count ic_clk cycles when DUT1 is active and ic_scl is low
  always @(posedge ic_clk or negedge ic_rst_n) begin
    if(~ic_rst_n)
       sda_hold_alt_count <= 0;
    else begin
       if (dut1_arb_loss)
          sda_hold_alt_count <= 0;
       else begin
         if(!ic_scl)
            sda_hold_alt_count <= sda_hold_alt_count + 1;
         else
            sda_hold_alt_count <= 0;
       end
    end
  end

  // Measure HOLD time for DUT1 - from ic_data_oe_alt
  // Count ic_clk cycles when DUT1 is active and ic_scl is low
  // Due to glitch injection, and because the DW_apb_i2c in master
  // mode times SDA hold time from its internal SCL, we must 
  // check it against its internal SCL. If we were to use the
  // external SCL, glitches on this line would cause the check to
  // fail.
  always @(posedge ic_clk or negedge ic_rst_n) begin
    if(~ic_rst_n)
       ic_clk_oe_alt_hold_count <= 0;
    else begin
       if (dut1_arb_loss)
          ic_clk_oe_alt_hold_count <= 0;
       else begin
         if(ic_clk_oe_alt)
            ic_clk_oe_alt_hold_count <= ic_clk_oe_alt_hold_count + 1;
         else
            ic_clk_oe_alt_hold_count <= 0;
       end
    end
  end

  // Extend deassertion of debug_data until ic_clk_oe goes low (to pull SCL high)
  reg debug_data_alt_extd_r;
  always @(posedge ic_clk or negedge ic_rst_n) begin : debug_data_alt_extd_PROC
    if(~ic_rst_n) begin
      debug_data_alt_extd_r <= 1'b0;
    end else begin
      if(debug_data_alt_extd_r) begin
        debug_data_alt_extd_r <= debug_data_alt;
      end else begin
        debug_data_alt_extd_r <= ~ic_clk_oe_alt;
      end
    end
  end

  // Select the spike length of the selected speed mode
  wire [`IC_SPKLEN_RS-1:0] spklen_dut1;
  `ifdef IC_HIGHSPEED_MODE_EN
  assign spklen_dut1 = debug_hs_alt ? ic_hs_spklen_alt : ic_fs_spklen_alt;
  `else
  assign spklen_dut1 = ic_fs_spklen_alt;
  `endif

  // Evaluate measured sda hold time against the programmed value in the registers bank
  always @(posedge ic_clk) begin
     if((ic_data_oe_alt != ic_data_oe_alt_r) && (!(tx_scl_skew_en||rx_scl_skew_en))) begin
       // In master mode only sda hold times >=1 can be implemented.
       // If SCL is being extended, the slave can change
       // sda again during this time. If this is happening we check only
       // the min hold time, not that the hold time has been exceeded.
       // This is required for the master check too since some tests
       // use the DUT in dual master/slave mode.
       if ((  ((ic_clk_oe_alt_hold_count != ic_sda_hold_alt) & ~debug_slave_act_alt)
            | ((ic_clk_oe_alt_hold_count < ic_sda_hold_alt) & debug_slave_act_alt)
           )
             // Only run check when SDA hold time programmed over 1.
             // Which will only happen during directed SDA hold time test.
           & (ic_sda_hold_alt>1)
           & (ic_mode_alt==`IC_CON_0_MASTER_MODE)
             // Min hold time of 2 after a start condition.
           & ~(s_det & (ic_sda_hold_alt<=1))
           & ic_clk_oe_alt
             // Don't check if DUT has been reset.
           & presetn
           // Stop check during SCL low period before SCL high for ACK phase
           // for reads. Master can decide late to ACK and bring SDA low.
           & (debug_data_alt_extd_r | ~debug_rd_alt)
          )
       begin
          $display("[%d] ERROR!!! Programmed hold time on (master) DUT1=[%d]; Measured hold time on DUT1=[%d]);", $time, ic_sda_hold_alt, sda_hold_alt_count);
          $display("Simulation terminated.\n\n");
          #100000;
          $finish;
       end


       // In slave mode only sda hold times >=8 can be implemented.
       // If SCL is being extended, the slave can change
       // sda again during this time. If this is happening we check only
       // the min hold time, not that the hold time has been exceeded.
       if ((  (((sda_hold_alt_count != ic_sda_hold_alt) & ~ic_clk_oe_alt) && ~spklen_test)
            | (((sda_hold_alt_count <= ic_sda_hold_alt-(spklen_dut1+7)) & ~ic_clk_oe_alt) && spklen_test)
            | (((sda_hold_alt_count < ic_sda_hold_alt) & ic_clk_oe_alt) && ~spklen_test)
            | (((sda_hold_alt_count < ic_sda_hold_alt-(spklen_dut1+7)) & ic_clk_oe_alt) && spklen_test)
           )
           & (ic_mode_alt!=`IC_CON_0_MASTER_MODE)
             // Only check if the programmed hold time is greater than the slaves other
             // latencies that affect sda hold time
           & (ic_sda_hold_alt>=(spklen_dut1+7))
           & !ic_scl
             // Don't check if DUT has been reset.
           & presetn
          )
       begin
          $display("[%d] ERROR!!! Programmed hold time on (slave) DUT1=[%d]; Measured hold time on DUT1=[%d]);", $time, ic_sda_hold_alt, sda_hold_alt_count);
          $display("Simulation terminated.\n\n");
          #100000;
          $finish;
       end
     end // if(ic_data_oe_alt != ic_data_oe_alt_r)
  end
  `endif
  //`ifdef NC_VERILOG



endmodule
