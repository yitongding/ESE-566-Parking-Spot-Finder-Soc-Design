/*
 ------------------------------------------------------------------------
--
//  ------------------------------------------------------------------------
//
//                    (C) COPYRIGHT 2002 - 2014 SYNOPSYS, INC.
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
// Release version :  2.03a
// File Version     :        $Revision: #12 $ 
// Revision: $Id: //dwh/DW_ocb/DW_apb/amba_dev/sim/testbench/test_DW_apb.v#12 $ 
*/

`timescale 1ns / 10ps

`include "DW_amba_constants.v"
 `include "DW_apb_cc_constants.v"

module test_DW_apb;

   reg hclk;
   reg pclk;

   initial begin
     pclk = 1;
     forever begin
       #((`PERIOD*`APB_CLK_RATIO)/2.0)
       pclk = ~pclk;
     end
   end

   initial begin
     hclk = 1;
     forever begin
       #(`PERIOD/2.0)
       hclk = ~hclk;
     end
   end

   wire hresetn;
   wire d_hresetn;
   wire presetn;
   reg 	pclk_en;

   assign #1 d_hresetn = hresetn;

   // ----------------------------------------
   // AHB bus signals
   // ----------------------------------------
   wire 		      hsel_s1;
   wire 		      hready;
   wire 		      hwrite;
   wire                       hready_resp;
   wire [`HRESP_WIDTH-1:0]    hresp;
   wire [`HADDR_WIDTH-1:0]    haddr;
   wire [`HTRANS_WIDTH-1:0]   htrans;
   wire [`AHB_DATA_WIDTH-1:0] hrdata;
   wire [`AHB_DATA_WIDTH-1:0] hwdata;
   wire [63:0]                addr64;


   // added for new monitor
   wire [15:0]                hsel;
   wire [15:0]                bus_hbusreq;
   wire [15:0]                bus_hgrant;
   wire [15:0]                bus_hlock;


// added for new monitor
   wire [15:0]                psel_apb;
   wire [16:0]                xpsel_apb;

// To connect apb monitor using mon_user_apb4_if.
// This must be done correctly when supporing APB4
//   For now using a temporary interface to connect.
   wire  pstrb_apb_mon;
   wire  pprot_apb_mon;

   // prdata wires driven by the VIP Slaves
   wire [`APB_DATA_WIDTH-1:0] prdata_s0;
   wire [`APB_DATA_WIDTH-1:0] prdata_s1;
   wire [`APB_DATA_WIDTH-1:0] prdata_s2;
   wire [`APB_DATA_WIDTH-1:0] prdata_s3;
   wire [`APB_DATA_WIDTH-1:0] prdata_s4;
   wire [`APB_DATA_WIDTH-1:0] prdata_s5;
   wire [`APB_DATA_WIDTH-1:0] prdata_s6;
   wire [`APB_DATA_WIDTH-1:0] prdata_s7;
   wire [`APB_DATA_WIDTH-1:0] prdata_s8;
   wire [`APB_DATA_WIDTH-1:0] prdata_s9;
   wire [`APB_DATA_WIDTH-1:0] prdata_s10;
   wire [`APB_DATA_WIDTH-1:0] prdata_s11;
   wire [`APB_DATA_WIDTH-1:0] prdata_s12;
   wire [`APB_DATA_WIDTH-1:0] prdata_s13;
   wire [`APB_DATA_WIDTH-1:0] prdata_s14;
   wire [`APB_DATA_WIDTH-1:0] prdata_s15;

   // prdata connections to the DUT (DW_apb)
   wire [`APB_DATA_WIDTH-1:0] xprdata_s0;
   wire [`APB_DATA_WIDTH-1:0] xprdata_s1;
   wire [`APB_DATA_WIDTH-1:0] xprdata_s2;
   wire [`APB_DATA_WIDTH-1:0] xprdata_s3;
   wire [`APB_DATA_WIDTH-1:0] xprdata_s4;
   wire [`APB_DATA_WIDTH-1:0] xprdata_s5;
   wire [`APB_DATA_WIDTH-1:0] xprdata_s6;
   wire [`APB_DATA_WIDTH-1:0] xprdata_s7;
   wire [`APB_DATA_WIDTH-1:0] xprdata_s8;
   wire [`APB_DATA_WIDTH-1:0] xprdata_s9;
   wire [`APB_DATA_WIDTH-1:0] xprdata_s10;
   wire [`APB_DATA_WIDTH-1:0] xprdata_s11;
   wire [`APB_DATA_WIDTH-1:0] xprdata_s12;
   wire [`APB_DATA_WIDTH-1:0] xprdata_s13;
   wire [`APB_DATA_WIDTH-1:0] xprdata_s14;
   wire [`APB_DATA_WIDTH-1:0] xprdata_s15;

   wire pslverr_s0;
   wire pslverr_s1;
   wire pslverr_s2;
   wire pslverr_s3;
   wire pslverr_s4;
   wire pslverr_s5;
   wire pslverr_s6;
   wire pslverr_s7;
   wire pslverr_s8;
   wire pslverr_s9;
   wire pslverr_s10;
   wire pslverr_s11;
   wire pslverr_s12;
   wire pslverr_s13;
   wire pslverr_s14;
   wire pslverr_s15;

   wire xpslverr_s0;
   wire xpslverr_s1;
   wire xpslverr_s2;
   wire xpslverr_s3;
   wire xpslverr_s4;
   wire xpslverr_s5;
   wire xpslverr_s6;
   wire xpslverr_s7;
   wire xpslverr_s8;
   wire xpslverr_s9;
   wire xpslverr_s10;
   wire xpslverr_s11;
   wire xpslverr_s12;
   wire xpslverr_s13;
   wire xpslverr_s14;
   wire xpslverr_s15;

   wire pready_s0;
   wire pready_s1;
   wire pready_s2;
   wire pready_s3;
   wire pready_s4;
   wire pready_s5;
   wire pready_s6;
   wire pready_s7;
   wire pready_s8;
   wire pready_s9;
   wire pready_s10;
   wire pready_s11;
   wire pready_s12;
   wire pready_s13;
   wire pready_s14;
   wire pready_s15;


   //AHB Signals with skew
   wire 		                  hwrite_skew;
   wire [`HADDR_WIDTH-1:0]    haddr_skew;
   wire [`HTRANS_WIDTH-1:0]   htrans_skew;
   wire [`AHB_DATA_WIDTH-1:0] hwdata_skew;
   wire                       hready_skew;
   wire 		                  hsel_s1_skew;

   assign #1 hwrite_skew = hwrite;
   assign #1 haddr_skew  = haddr;
   assign #1 htrans_skew = htrans;
   assign #1 hwdata_skew = hwdata;
   assign #1 hready_skew = hready;
   assign #1 hsel_s1_skew = hsel_s1;

   assign hsel[15:3]        = {13{1'b0}};
   assign hsel[2]           = U_ahb.hsel_s2;
   assign hsel[1]           = U_ahb.hsel_s1;
   assign hsel[0]           = 1'b0;
   assign bus_hbusreq[15:0] = {{14{1'b0}}, U_ahb.hbusreq_m1, 1'b0};
   assign bus_hgrant [15:0] = {{14{1'b0}}, U_ahb.hgrant_m1, 1'b0};
   assign bus_hlock  [15:0] = {{14{1'b0}}, U_ahb.hlock_m1, 1'b0};

//
// Need psel_apb for the monitor.
// Not working for multisim so need a new approach
//


   assign xpsel_apb[16:`NUM_APB_SLAVES] = 17'b0;


 assign xpsel_apb[0]  = U_apb.psel_s0;
 generate if(`NUM_APB_SLAVES >1)
   assign xpsel_apb[1]  = (`NUM_APB_SLAVES > 1) ? U_apb.psel_s1 : 1'b0;
 endgenerate
 generate if(`NUM_APB_SLAVES >2)
   assign xpsel_apb[2]  = (`NUM_APB_SLAVES > 2) ? U_apb.psel_s2 : 1'b0;
 endgenerate
 generate if(`NUM_APB_SLAVES >3)
   assign xpsel_apb[3]  = (`NUM_APB_SLAVES > 3) ? U_apb.psel_s3 : 1'b0;
 endgenerate
 generate if(`NUM_APB_SLAVES >4)
   assign xpsel_apb[4]  = (`NUM_APB_SLAVES > 4) ? U_apb.psel_s4 : 1'b0;
 endgenerate
 generate if(`NUM_APB_SLAVES >5)
   assign xpsel_apb[5]  = (`NUM_APB_SLAVES > 5) ? U_apb.psel_s5 : 1'b0;
 endgenerate
 generate if(`NUM_APB_SLAVES >6)
   assign xpsel_apb[6]  = (`NUM_APB_SLAVES > 6) ? U_apb.psel_s6 : 1'b0;
 endgenerate
 generate if(`NUM_APB_SLAVES >7)
   assign xpsel_apb[7]  = (`NUM_APB_SLAVES > 7) ? U_apb.psel_s7 : 1'b0;
 endgenerate
 generate if(`NUM_APB_SLAVES >8)
   assign xpsel_apb[8]  = (`NUM_APB_SLAVES > 8) ? U_apb.psel_s8 : 1'b0;
 endgenerate
 generate if(`NUM_APB_SLAVES >9)
   assign xpsel_apb[9]  = (`NUM_APB_SLAVES > 9) ? U_apb.psel_s9 : 1'b0;
 endgenerate
 generate if(`NUM_APB_SLAVES >10)
   assign xpsel_apb[10] = (`NUM_APB_SLAVES > 10) ? U_apb.psel_s10 : 1'b0;
 endgenerate
 generate if(`NUM_APB_SLAVES >11)
   assign xpsel_apb[11] = (`NUM_APB_SLAVES > 11) ? U_apb.psel_s11 : 1'b0;
 endgenerate
 generate if(`NUM_APB_SLAVES >12)
   assign xpsel_apb[12] = (`NUM_APB_SLAVES > 12) ? U_apb.psel_s12 : 1'b0;
 endgenerate
 generate if(`NUM_APB_SLAVES >13)
   assign xpsel_apb[13] = (`NUM_APB_SLAVES > 13) ? U_apb.psel_s13 : 1'b0;
 endgenerate
 generate if(`NUM_APB_SLAVES >14)
   assign xpsel_apb[14] = (`NUM_APB_SLAVES > 14) ? U_apb.psel_s14 : 1'b0;
 endgenerate
 generate if(`NUM_APB_SLAVES >15)
   assign xpsel_apb[15] = (`NUM_APB_SLAVES > 15) ? U_apb.psel_s15 : 1'b0;
 endgenerate

   assign psel_apb[15:0] = xpsel_apb[15:0];

//
// Due to the monitor being 64-bits wide need to have an
// address line the same width
//
   assign addr64[63:32] = 0;
   assign addr64[31:0]  = haddr;

   // ----------------------------------------
   // Instantiate the VERA Shell
   // The connections to the VERA Shell are
   // done with dynamic binds.
   // ----------------------------------------
   test_DW_apb_shell vshell(hclk, hclk, pclk);


   // ----------------------------------------
   // Instantiate the top-level AHB Bus IP
   // ----------------------------------------
   ahb_wrapper U_ahb(
           .hresetn            (hresetn)
           ,.hclk              (hclk)
           ,.haddr             (haddr[`HADDR_WIDTH-1:0])
           ,.hready            (hready)
           ,.htrans            (htrans[`HTRANS_WIDTH-1:0])
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
  i_apb_DW_apb U_apb(
      // AHB bus interface signals
      .hresetn            (d_hresetn) // JOE: Using delayed version for gatelevel sims
      ,.hclk              (hclk)
      ,.pclk_en           (pclk_en)
      ,.haddr             (haddr_skew[`HADDR_WIDTH-1:0])
      ,.hready            (hready_skew)
      ,.htrans            (htrans_skew[`HTRANS_WIDTH-1:0])
      ,.hwrite            (hwrite_skew)
      ,.hwdata            (hwdata_skew)
      ,.hsel              (hsel_s1_skew)
      ,.hrdata            (hrdata)
      ,.hready_resp       (hready_resp)
      ,.hresp             (hresp)

      ,.prdata_s0         (xprdata_s0)
      `ifdef APB_HAS_S1  ,.prdata_s1  (xprdata_s1)  `endif
      `ifdef APB_HAS_S2  ,.prdata_s2  (xprdata_s2)  `endif
      `ifdef APB_HAS_S3  ,.prdata_s3  (xprdata_s3)  `endif
      `ifdef APB_HAS_S4  ,.prdata_s4  (xprdata_s4)  `endif
      `ifdef APB_HAS_S5  ,.prdata_s5  (xprdata_s5)  `endif
      `ifdef APB_HAS_S6  ,.prdata_s6  (xprdata_s6)  `endif
      `ifdef APB_HAS_S7  ,.prdata_s7  (xprdata_s7)  `endif
      `ifdef APB_HAS_S8  ,.prdata_s8  (xprdata_s8)  `endif
      `ifdef APB_HAS_S9  ,.prdata_s9  (xprdata_s9)  `endif
      `ifdef APB_HAS_S10 ,.prdata_s10 (xprdata_s10) `endif
      `ifdef APB_HAS_S11 ,.prdata_s11 (xprdata_s11) `endif
      `ifdef APB_HAS_S12 ,.prdata_s12 (xprdata_s12) `endif
      `ifdef APB_HAS_S13 ,.prdata_s13 (xprdata_s13) `endif
      `ifdef APB_HAS_S14 ,.prdata_s14 (xprdata_s14) `endif
      `ifdef APB_HAS_S15 ,.prdata_s15 (xprdata_s15) `endif

      `ifdef APB_APB3_0
       ,.pready_s0           (pready_s0)
       ,.pslverr_s0          (xpslverr_s0)
      `endif

      `ifdef APB_APB3_1
       ,.pready_s1           (pready_s1)
       ,.pslverr_s1          (xpslverr_s1)
      `endif

      `ifdef APB_APB3_2
       ,.pready_s2           (pready_s2)
       ,.pslverr_s2          (xpslverr_s2)
      `endif

      `ifdef APB_APB3_3
       ,.pready_s3           (pready_s3)
       ,.pslverr_s3          (xpslverr_s3)
      `endif

      `ifdef APB_APB3_4
       ,.pready_s4           (pready_s4)
       ,.pslverr_s4          (xpslverr_s4)
      `endif

      `ifdef APB_APB3_5
       ,.pready_s5           (pready_s5)
       ,.pslverr_s5          (xpslverr_s5)
      `endif

      `ifdef APB_APB3_6
       ,.pready_s6           (pready_s6)
       ,.pslverr_s6          (xpslverr_s6)
      `endif

      `ifdef APB_APB3_7
       ,.pready_s7           (pready_s7)
       ,.pslverr_s7          (xpslverr_s7)
      `endif

      `ifdef APB_APB3_8
       ,.pready_s8           (pready_s8)
       ,.pslverr_s8          (xpslverr_s8)
      `endif

      `ifdef APB_APB3_9
       ,.pready_s9           (pready_s9)
       ,.pslverr_s9          (xpslverr_s9)
      `endif

      `ifdef APB_APB3_10
       ,.pready_s10          (pready_s10)
       ,.pslverr_s10         (xpslverr_s10)
      `endif

      `ifdef APB_APB3_11
       ,.pready_s11          (pready_s11)
       ,.pslverr_s11         (xpslverr_s11)
      `endif

      `ifdef APB_APB3_12
       ,.pready_s12          (pready_s12)
       ,.pslverr_s12         (xpslverr_s12)
      `endif

      `ifdef APB_APB3_13
       ,.pready_s13          (pready_s13)
       ,.pslverr_s13         (xpslverr_s13)
      `endif

      `ifdef APB_APB3_14
       ,.pready_s14          (pready_s14)
       ,.pslverr_s14         (xpslverr_s14)
      `endif

      `ifdef APB_APB3_15
       ,.pready_s15          (pready_s15)
       ,.pslverr_s15         (xpslverr_s15)
      `endif

      );


   wire sb_psel_s0  = U_apb.psel_s0;
   
   `ifdef APB_APB3_0
      wire [1:0] presp_s0  = {1'b0, pslverr_s0};
      wire       rvalid_s0 = U_apb.psel_s0 & U_apb.penable & U_apb.pready_s0;
   `else
      wire [1:0] presp_s0  = 2'b0;
      wire       rvalid_s0 = U_apb.psel_s0 & U_apb.penable;
   `endif

   `ifdef APB_HAS_S1
      wire sb_psel_s1  = U_apb.psel_s1;
      `ifdef APB_APB3_1
         wire [1:0] presp_s1  = {1'b0, pslverr_s1};
         wire       rvalid_s1 = U_apb.psel_s1 & U_apb.penable & U_apb.pready_s1;
      `else
         wire [1:0] presp_s1  = 2'b0;
         wire       rvalid_s1 = U_apb.psel_s1 & U_apb.penable;
      `endif
   `else
      wire [1:0] presp_s1   = 2'b0;
      wire       rvalid_s1  = 1'b0;
      wire       sb_psel_s1 = 1'b0;
   `endif
   `ifdef APB_HAS_S2
      wire sb_psel_s2  = U_apb.psel_s2;
      `ifdef APB_APB3_2
         wire [1:0] presp_s2  = {1'b0, pslverr_s2};
         wire       rvalid_s2 = U_apb.psel_s2 & U_apb.penable & U_apb.pready_s2;
      `else
         wire [1:0] presp_s2  = 2'b0;
         wire       rvalid_s2 = U_apb.psel_s2 & U_apb.penable;
      `endif
   `else
      wire [1:0] presp_s2   = 2'b0;
      wire       rvalid_s2  = 1'b0;
      wire       sb_psel_s2 = 1'b0;
   `endif
   `ifdef APB_HAS_S3
      wire sb_psel_s3  = U_apb.psel_s3;
      `ifdef APB_APB3_3
         wire [1:0] presp_s3  = {1'b0, pslverr_s3};
         wire       rvalid_s3 = U_apb.psel_s3 & U_apb.penable & U_apb.pready_s3;
      `else
         wire [1:0] presp_s3  = 2'b0;
         wire       rvalid_s3 = U_apb.psel_s3 & U_apb.penable;
      `endif
   `else
      wire [1:0] presp_s3   = 2'b0;
      wire       rvalid_s3  = 1'b0;
      wire       sb_psel_s3 = 1'b0;
   `endif
   `ifdef APB_HAS_S4
      wire sb_psel_s4  = U_apb.psel_s4;
      `ifdef APB_APB3_4
         wire [1:0] presp_s4  = {1'b0, pslverr_s4};
         wire       rvalid_s4 = U_apb.psel_s4 & U_apb.penable & U_apb.pready_s4;
      `else
         wire [1:0] presp_s4  = 2'b0;
         wire       rvalid_s4 = U_apb.psel_s4 & U_apb.penable;
      `endif
   `else
      wire [1:0] presp_s4   = 2'b0;
      wire       rvalid_s4  = 1'b0;
      wire       sb_psel_s4 = 1'b0;
   `endif
   `ifdef APB_HAS_S5
      wire sb_psel_s5  = U_apb.psel_s5;
      `ifdef APB_APB3_5
         wire [1:0] presp_s5  = {1'b0, pslverr_s5};
         wire       rvalid_s5 = U_apb.psel_s5 & U_apb.penable & U_apb.pready_s5;
      `else
         wire [1:0] presp_s5  = 2'b0;
         wire       rvalid_s5 = U_apb.psel_s5 & U_apb.penable;
      `endif
   `else
      wire [1:0] presp_s5   = 2'b0;
      wire       rvalid_s5  = 1'b0;
      wire       sb_psel_s5 = 1'b0;
   `endif
   `ifdef APB_HAS_S6
      wire sb_psel_s6  = U_apb.psel_s6;
      `ifdef APB_APB3_6
         wire [1:0] presp_s6  = {1'b0, pslverr_s6};
         wire       rvalid_s6 = U_apb.psel_s6 & U_apb.penable & U_apb.pready_s6;
      `else
         wire [1:0] presp_s6  = 2'b0;
         wire       rvalid_s6 = U_apb.psel_s6 & U_apb.penable;
      `endif
   `else
      wire [1:0] presp_s6   = 2'b0;
      wire       rvalid_s6  = 1'b0;
      wire       sb_psel_s6 = 1'b0;
   `endif
   `ifdef APB_HAS_S7
      wire sb_psel_s7  = U_apb.psel_s7;
      `ifdef APB_APB3_7
         wire [1:0] presp_s7  = {1'b0, pslverr_s7};
         wire       rvalid_s7 = U_apb.psel_s7 & U_apb.penable & U_apb.pready_s7;
      `else
         wire [1:0] presp_s7  = 2'b0;
         wire       rvalid_s7 = U_apb.psel_s7 & U_apb.penable;
      `endif
   `else
      wire [1:0] presp_s7   = 2'b0;
      wire       rvalid_s7  = 1'b0;
      wire       sb_psel_s7 = 1'b0;
   `endif
   `ifdef APB_HAS_S8
      wire sb_psel_s8  = U_apb.psel_s8;
      `ifdef APB_APB3_8
         wire [1:0] presp_s8  = {1'b0, pslverr_s8};
         wire       rvalid_s8 = U_apb.psel_s8 & U_apb.penable & U_apb.pready_s8;
      `else
         wire [1:0] presp_s8  = 2'b0;
         wire       rvalid_s8 = U_apb.psel_s8 & U_apb.penable;
      `endif
   `else
      wire [1:0] presp_s8   = 2'b0;
      wire       rvalid_s8  = 1'b0;
      wire       sb_psel_s8 = 1'b0;
   `endif
   `ifdef APB_HAS_S9
      wire sb_psel_s9  = U_apb.psel_s9;
      `ifdef APB_APB3_9
         wire [1:0] presp_s9  = {1'b0, pslverr_s9};
         wire       rvalid_s9 = U_apb.psel_s9 & U_apb.penable & U_apb.pready_s9;
      `else
         wire [1:0] presp_s9  = 2'b0;
         wire       rvalid_s9 = U_apb.psel_s9 & U_apb.penable;
      `endif
   `else
      wire [1:0] presp_s9   = 2'b0;
      wire       rvalid_s9  = 1'b0;
      wire       sb_psel_s9 = 1'b0;
   `endif
   `ifdef APB_HAS_S10
      wire sb_psel_s10  = U_apb.psel_s10;
      `ifdef APB_APB3_10
         wire [1:0] presp_s10  = {1'b0, pslverr_s10};
         wire       rvalid_s10 = U_apb.psel_s10 & U_apb.penable & U_apb.pready_s10;
      `else
         wire [1:0] presp_s10  = 2'b0;
         wire       rvalid_s10 = U_apb.psel_s10 & U_apb.penable;
      `endif
   `else
      wire [1:0] presp_s10   = 2'b0;
      wire       rvalid_s10  = 1'b0;
      wire       sb_psel_s10 = 1'b0;
   `endif
   `ifdef APB_HAS_S11
      wire sb_psel_s11  = U_apb.psel_s11;
      `ifdef APB_APB3_11
         wire [1:0] presp_s11  = {1'b0, pslverr_s11};
         wire       rvalid_s11 = U_apb.psel_s11 & U_apb.penable & U_apb.pready_s11;
      `else
         wire [1:0] presp_s11  = 2'b0;
         wire       rvalid_s11 = U_apb.psel_s11 & U_apb.penable;
      `endif
   `else
      wire [1:0] presp_s11   = 2'b0;
      wire       rvalid_s11  = 1'b0;
      wire       sb_psel_s11 = 1'b0;
   `endif
   `ifdef APB_HAS_S12
      wire sb_psel_s12  = U_apb.psel_s12;
      `ifdef APB_APB3_12
         wire [1:0] presp_s12  = {1'b0, pslverr_s12};
         wire       rvalid_s12 = U_apb.psel_s12 & U_apb.penable & U_apb.pready_s12;
      `else
         wire [1:0] presp_s12  = 2'b0;
         wire       rvalid_s12 = U_apb.psel_s12 & U_apb.penable;
      `endif
   `else
      wire [1:0] presp_s12   = 2'b0;
      wire       rvalid_s12  = 1'b0;
      wire       sb_psel_s12 = 1'b0;
   `endif
   `ifdef APB_HAS_S13
      wire sb_psel_s13  = U_apb.psel_s13;
      `ifdef APB_APB3_13
         wire [1:0] presp_s13  = {1'b0, pslverr_s13};
         wire       rvalid_s13 = U_apb.psel_s13 & U_apb.penable & U_apb.pready_s13;
      `else
         wire [1:0] presp_s13  = 2'b0;
         wire       rvalid_s13 = U_apb.psel_s13 & U_apb.penable;
      `endif
   `else
      wire [1:0] presp_s13   = 2'b0;
      wire       rvalid_s13  = 1'b0;
      wire       sb_psel_s13 = 1'b0;
   `endif
   `ifdef APB_HAS_S14
      wire sb_psel_s14  = U_apb.psel_s14;
      `ifdef APB_APB3_14
         wire [1:0] presp_s14  = {1'b0, pslverr_s14};
         wire       rvalid_s14 = U_apb.psel_s14 & U_apb.penable & U_apb.pready_s14;
      `else
         wire [1:0] presp_s14  = 2'b0;
         wire       rvalid_s14 = U_apb.psel_s14 & U_apb.penable;
      `endif
   `else
      wire [1:0] presp_s14   = 2'b0;
      wire       rvalid_s14  = 1'b0;
      wire       sb_psel_s14 = 1'b0;
   `endif
   `ifdef APB_HAS_S15
      wire sb_psel_s15  = U_apb.psel_s15;
      `ifdef APB_APB3_15
         wire [1:0] presp_s15  = {1'b0, pslverr_s15};
         wire       rvalid_s15 = U_apb.psel_s15 & U_apb.penable & U_apb.pready_s15;
      `else
         wire [1:0] presp_s15  = 2'b0;
         wire       rvalid_s15 = U_apb.psel_s15 & U_apb.penable;
      `endif
   `else
      wire [1:0] presp_s15   = 2'b0;
      wire       rvalid_s15  = 1'b0;
      wire       sb_psel_s15 = 1'b0;
   `endif


`ifndef DISABLE_X_DRIVE
   assign xprdata_s0  = (rvalid_s0)  ? prdata_s0  : `APB_DATA_WIDTH'bx;
   assign xprdata_s1  = (rvalid_s1)  ? prdata_s1  : `APB_DATA_WIDTH'bx;
   assign xprdata_s2  = (rvalid_s2)  ? prdata_s2  : `APB_DATA_WIDTH'bx;
   assign xprdata_s3  = (rvalid_s3)  ? prdata_s3  : `APB_DATA_WIDTH'bx;
   assign xprdata_s4  = (rvalid_s4)  ? prdata_s4  : `APB_DATA_WIDTH'bx;
   assign xprdata_s5  = (rvalid_s5)  ? prdata_s5  : `APB_DATA_WIDTH'bx;
   assign xprdata_s6  = (rvalid_s6)  ? prdata_s6  : `APB_DATA_WIDTH'bx;
   assign xprdata_s7  = (rvalid_s7)  ? prdata_s7  : `APB_DATA_WIDTH'bx;
   assign xprdata_s8  = (rvalid_s8)  ? prdata_s8  : `APB_DATA_WIDTH'bx;
   assign xprdata_s9  = (rvalid_s9)  ? prdata_s9  : `APB_DATA_WIDTH'bx;
   assign xprdata_s10 = (rvalid_s10) ? prdata_s10 : `APB_DATA_WIDTH'bx;
   assign xprdata_s11 = (rvalid_s11) ? prdata_s11 : `APB_DATA_WIDTH'bx;
   assign xprdata_s12 = (rvalid_s12) ? prdata_s12 : `APB_DATA_WIDTH'bx;
   assign xprdata_s13 = (rvalid_s13) ? prdata_s13 : `APB_DATA_WIDTH'bx;
   assign xprdata_s14 = (rvalid_s14) ? prdata_s14 : `APB_DATA_WIDTH'bx;
   assign xprdata_s15 = (rvalid_s15) ? prdata_s15 : `APB_DATA_WIDTH'bx;

   assign xpslverr_s0  = (rvalid_s0)  ? pslverr_s0  : 1'bx;
   assign xpslverr_s1  = (rvalid_s1)  ? pslverr_s1  : 1'bx;
   assign xpslverr_s2  = (rvalid_s2)  ? pslverr_s2  : 1'bx;
   assign xpslverr_s3  = (rvalid_s3)  ? pslverr_s3  : 1'bx;
   assign xpslverr_s4  = (rvalid_s4)  ? pslverr_s4  : 1'bx;
   assign xpslverr_s5  = (rvalid_s5)  ? pslverr_s5  : 1'bx;
   assign xpslverr_s6  = (rvalid_s6)  ? pslverr_s6  : 1'bx;
   assign xpslverr_s7  = (rvalid_s7)  ? pslverr_s7  : 1'bx;
   assign xpslverr_s8  = (rvalid_s8)  ? pslverr_s8  : 1'bx;
   assign xpslverr_s9  = (rvalid_s9)  ? pslverr_s9  : 1'bx;
   assign xpslverr_s10 = (rvalid_s10) ? pslverr_s10 : 1'bx;
   assign xpslverr_s11 = (rvalid_s11) ? pslverr_s11 : 1'bx;
   assign xpslverr_s12 = (rvalid_s12) ? pslverr_s12 : 1'bx;
   assign xpslverr_s13 = (rvalid_s13) ? pslverr_s13 : 1'bx;
   assign xpslverr_s14 = (rvalid_s14) ? pslverr_s14 : 1'bx;
   assign xpslverr_s15 = (rvalid_s15) ? pslverr_s15 : 1'bx;
`else // DISABLE_X_DRIVE
   assign xprdata_s0  =  prdata_s0;
   assign xprdata_s1  =  prdata_s1;
   assign xprdata_s2  =  prdata_s2;
   assign xprdata_s3  =  prdata_s3;
   assign xprdata_s4  =  prdata_s4;
   assign xprdata_s5  =  prdata_s5;
   assign xprdata_s6  =  prdata_s6;
   assign xprdata_s7  =  prdata_s7;
   assign xprdata_s8  =  prdata_s8;
   assign xprdata_s9  =  prdata_s9;
   assign xprdata_s10 =  prdata_s10;
   assign xprdata_s11 =  prdata_s11;
   assign xprdata_s12 =  prdata_s12;
   assign xprdata_s13 =  prdata_s13;
   assign xprdata_s14 =  prdata_s14;
   assign xprdata_s15 =  prdata_s15;

   assign xpslverr_s0  =  pslverr_s0;
   assign xpslverr_s1  =  pslverr_s1;
   assign xpslverr_s2  =  pslverr_s2;
   assign xpslverr_s3  =  pslverr_s3;
   assign xpslverr_s4  =  pslverr_s4;
   assign xpslverr_s5  =  pslverr_s5;
   assign xpslverr_s6  =  pslverr_s6;
   assign xpslverr_s7  =  pslverr_s7;
   assign xpslverr_s8  =  pslverr_s8;
   assign xpslverr_s9  =  pslverr_s9;
   assign xpslverr_s10 =  pslverr_s10;
   assign xpslverr_s11 =  pslverr_s11;
   assign xpslverr_s12 =  pslverr_s12;
   assign xpslverr_s13 =  pslverr_s13;
   assign xpslverr_s14 =  pslverr_s14;
   assign xpslverr_s15 =  pslverr_s15;
 `endif // else DISABLE_X_DRIVE
  

   // Assert the rvalid_dec signal if an AHB address does NOT target the
   // address space for ANY of the APB slaves
   wire rvalid_dec = ~(sb_psel_s0|sb_psel_s1|sb_psel_s2|sb_psel_s3|sb_psel_s4|sb_psel_s5|sb_psel_s6|sb_psel_s7|
                       sb_psel_s8|sb_psel_s9|sb_psel_s10|sb_psel_s11|sb_psel_s12|sb_psel_s13|sb_psel_s14|sb_psel_s15) & U_apb.psel_en & U_apb.penable;


   wire hresp_int;
   assign #1 hresp_int = hresp;

   // APB Scoreboard
   apb_resp_sb U_resp_sb(
      .hclk        (hclk)
     ,.hresetn     (d_hresetn)
     ,.hsel        (hsel_s1)
     ,.hready      (hready)
     ,.hresp       (hresp_int)
     ,.htrans      (htrans)
     ,.rvalid_s0   (rvalid_s0)
     ,.rvalid_s1   (rvalid_s1)
     ,.rvalid_s2   (rvalid_s2)
     ,.rvalid_s3   (rvalid_s3)
     ,.rvalid_s4   (rvalid_s4)
     ,.rvalid_s5   (rvalid_s5)
     ,.rvalid_s6   (rvalid_s6)
     ,.rvalid_s7   (rvalid_s7)
     ,.rvalid_s8   (rvalid_s8)
     ,.rvalid_s9   (rvalid_s9)
     ,.rvalid_s10  (rvalid_s10)
     ,.rvalid_s11  (rvalid_s11)
     ,.rvalid_s12  (rvalid_s12)
     ,.rvalid_s13  (rvalid_s13)
     ,.rvalid_s14  (rvalid_s14)
     ,.rvalid_s15  (rvalid_s15)
     ,.rvalid_dec  (rvalid_dec)
     ,.resp_s0     (presp_s0)
     ,.resp_s1     (presp_s1)
     ,.resp_s2     (presp_s2)
     ,.resp_s3     (presp_s3)
     ,.resp_s4     (presp_s4)
     ,.resp_s5     (presp_s5)
     ,.resp_s6     (presp_s6)
     ,.resp_s7     (presp_s7)
     ,.resp_s8     (presp_s8)
     ,.resp_s9     (presp_s9)
     ,.resp_s10    (presp_s10)
     ,.resp_s11    (presp_s11)
     ,.resp_s12    (presp_s12)
     ,.resp_s13    (presp_s13)
     ,.resp_s14    (presp_s14)
     ,.resp_s15    (presp_s15)
   );

   // gets rid of the APB monitor complaints about the "z's"
   // during the inactiveperiod befor first access
   // plus the gate level doesn't like z's
   pulldown (pready_s15);
   pulldown (pready_s14);
   pulldown (pready_s13);
   pulldown (pready_s12);
   pulldown (pready_s11);
   pulldown (pready_s10);
   pulldown (pready_s9);
   pulldown (pready_s8);
   pulldown (pready_s7);
   pulldown (pready_s6);
   pulldown (pready_s5);
   pulldown (pready_s4);
   pulldown (pready_s3);
   pulldown (pready_s2);
   pulldown (pready_s1);
   pulldown (pready_s0);
   pulldown (pslverr_s15);
   pulldown (pslverr_s14);
   pulldown (pslverr_s13);
   pulldown (pslverr_s12);
   pulldown (pslverr_s11);
   pulldown (pslverr_s10);
   pulldown (pslverr_s9);
   pulldown (pslverr_s8);
   pulldown (pslverr_s7);
   pulldown (pslverr_s6);
   pulldown (pslverr_s5);
   pulldown (pslverr_s4);
   pulldown (pslverr_s3);
   pulldown (pslverr_s2);
   pulldown (pslverr_s1);
   pulldown (pslverr_s0);


   // ----------------------------------------
   // pclk_en control
   // ----------------------------------------
   initial begin
      if (`APB_CLK_RATIO == 1)
   pclk_en = 1;
      else begin
    pclk_en = 0;
    forever begin
       repeat (`APB_CLK_RATIO-1) @(posedge hclk);
       #1 pclk_en = 1;
       @(posedge hclk);
       #1 pclk_en = 0;
    end
      end // else: !if(`APB_CLK_RATIO == 1)
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
   $sdf_annotate(`SDF_FILE, U_apb, , , `SDF_LEVEL);
     end
`endif

`ifdef CODE_COVERAGE
   initial
     begin
   //$set_toggle_mode(1);
   //$start_toggle("U_apb");
     end
`endif

endmodule


