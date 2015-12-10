/* --------------------------------------------------------------------
**
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
// File Version     :        $Revision: #7 $ 
// Revision: $Id: //dwh/DW_ocb/DW_apb/amba_dev/sim/testbench/apb_resp_sb.v#7 $ 
**
** --------------------------------------------------------------------
**
** File     : apb_resp_sb.v
** Created  : Fri Nov 26 16:07:37 MET 2010
** Abstract :
**
** --------------------------------------------------------------------
*/

/*
 * Example instantiation of this scoreboard in the top-level testbench
 *
    wire rvalid_s0  = (`NUM_APB_SLAVES > 0)  ? (`APB_IS_APB3_0==1)  ? (U_apb.psel_s0  & U_apb.penable & U_apb.pready_s0)  : (U_apb.psel_s0  & U_apb.penable) : 1'b0;
    wire rvalid_s1  = (`NUM_APB_SLAVES > 1)  ? (`APB_IS_APB3_1==1)  ? (U_apb.psel_s1  & U_apb.penable & U_apb.pready_s1)  : (U_apb.psel_s1  & U_apb.penable) : 1'b0;
    wire rvalid_s2  = (`NUM_APB_SLAVES > 2)  ? (`APB_IS_APB3_2==1)  ? (U_apb.psel_s2  & U_apb.penable & U_apb.pready_s2)  : (U_apb.psel_s2  & U_apb.penable) : 1'b0;
    wire rvalid_s3  = (`NUM_APB_SLAVES > 3)  ? (`APB_IS_APB3_3==1)  ? (U_apb.psel_s3  & U_apb.penable & U_apb.pready_s3)  : (U_apb.psel_s3  & U_apb.penable) : 1'b0;
    wire rvalid_s4  = (`NUM_APB_SLAVES > 4)  ? (`APB_IS_APB3_4==1)  ? (U_apb.psel_s4  & U_apb.penable & U_apb.pready_s4)  : (U_apb.psel_s4  & U_apb.penable) : 1'b0;
    wire rvalid_s5  = (`NUM_APB_SLAVES > 5)  ? (`APB_IS_APB3_5==1)  ? (U_apb.psel_s5  & U_apb.penable & U_apb.pready_s5)  : (U_apb.psel_s5  & U_apb.penable) : 1'b0;
    wire rvalid_s6  = (`NUM_APB_SLAVES > 6)  ? (`APB_IS_APB3_6==1)  ? (U_apb.psel_s6  & U_apb.penable & U_apb.pready_s6)  : (U_apb.psel_s6  & U_apb.penable) : 1'b0;
    wire rvalid_s7  = (`NUM_APB_SLAVES > 7)  ? (`APB_IS_APB3_7==1)  ? (U_apb.psel_s7  & U_apb.penable & U_apb.pready_s7)  : (U_apb.psel_s7  & U_apb.penable) : 1'b0;
    wire rvalid_s8  = (`NUM_APB_SLAVES > 8)  ? (`APB_IS_APB3_8==1)  ? (U_apb.psel_s8  & U_apb.penable & U_apb.pready_s8)  : (U_apb.psel_s8  & U_apb.penable) : 1'b0;
    wire rvalid_s9  = (`NUM_APB_SLAVES > 9)  ? (`APB_IS_APB3_9==1)  ? (U_apb.psel_s9  & U_apb.penable & U_apb.pready_s9)  : (U_apb.psel_s9  & U_apb.penable) : 1'b0;
    wire rvalid_s10 = (`NUM_APB_SLAVES > 10) ? (`APB_IS_APB3_10==1) ? (U_apb.psel_s10 & U_apb.penable & U_apb.pready_s10) : (U_apb.psel_s10 & U_apb.penable) : 1'b0;
    wire rvalid_s11 = (`NUM_APB_SLAVES > 11) ? (`APB_IS_APB3_11==1) ? (U_apb.psel_s11 & U_apb.penable & U_apb.pready_s11) : (U_apb.psel_s11 & U_apb.penable) : 1'b0;
    wire rvalid_s12 = (`NUM_APB_SLAVES > 12) ? (`APB_IS_APB3_12==1) ? (U_apb.psel_s12 & U_apb.penable & U_apb.pready_s12) : (U_apb.psel_s12 & U_apb.penable) : 1'b0;
    wire rvalid_s13 = (`NUM_APB_SLAVES > 13) ? (`APB_IS_APB3_13==1) ? (U_apb.psel_s13 & U_apb.penable & U_apb.pready_s13) : (U_apb.psel_s13 & U_apb.penable) : 1'b0;
    wire rvalid_s14 = (`NUM_APB_SLAVES > 14) ? (`APB_IS_APB3_14==1) ? (U_apb.psel_s14 & U_apb.penable & U_apb.pready_s14) : (U_apb.psel_s14 & U_apb.penable) : 1'b0;
    wire rvalid_s15 = (`NUM_APB_SLAVES > 15) ? (`APB_IS_APB3_15==1) ? (U_apb.psel_s15 & U_apb.penable & U_apb.pready_s15) : (U_apb.psel_s15 & U_apb.penable) : 1'b0;

    wire sb_psel_s0  = (`NUM_APB_SLAVES > 0)  ? U_apb.psel_s0  : 1'b0;
    wire sb_psel_s1  = (`NUM_APB_SLAVES > 1)  ? U_apb.psel_s1  : 1'b0;
    wire sb_psel_s2  = (`NUM_APB_SLAVES > 2)  ? U_apb.psel_s2  : 1'b0;
    wire sb_psel_s3  = (`NUM_APB_SLAVES > 3)  ? U_apb.psel_s3  : 1'b0;
    wire sb_psel_s4  = (`NUM_APB_SLAVES > 4)  ? U_apb.psel_s4  : 1'b0;
    wire sb_psel_s5  = (`NUM_APB_SLAVES > 5)  ? U_apb.psel_s5  : 1'b0;
    wire sb_psel_s6  = (`NUM_APB_SLAVES > 6)  ? U_apb.psel_s6  : 1'b0;
    wire sb_psel_s7  = (`NUM_APB_SLAVES > 7)  ? U_apb.psel_s7  : 1'b0;
    wire sb_psel_s8  = (`NUM_APB_SLAVES > 8)  ? U_apb.psel_s8  : 1'b0;
    wire sb_psel_s9  = (`NUM_APB_SLAVES > 9)  ? U_apb.psel_s9  : 1'b0;
    wire sb_psel_s10 = (`NUM_APB_SLAVES > 10) ? U_apb.psel_s10 : 1'b0;
    wire sb_psel_s11 = (`NUM_APB_SLAVES > 11) ? U_apb.psel_s11 : 1'b0;
    wire sb_psel_s12 = (`NUM_APB_SLAVES > 12) ? U_apb.psel_s12 : 1'b0;
    wire sb_psel_s13 = (`NUM_APB_SLAVES > 13) ? U_apb.psel_s13 : 1'b0;
    wire sb_psel_s14 = (`NUM_APB_SLAVES > 14) ? U_apb.psel_s14 : 1'b0;
    wire sb_psel_s15 = (`NUM_APB_SLAVES > 15) ? U_apb.psel_s15 : 1'b0;

    // Assert the rvalid_dec signal if an AHB address does NOT target the
    // address space for ANY of the APB slaves
    wire rvalid_dec = ~(sb_psel_s0|sb_psel_s1|sb_psel_s2|sb_psel_s3|sb_psel_s4|sb_psel_s5|sb_psel_s6|sb_psel_s7|
                        sb_psel_s8|sb_psel_s9|sb_psel_s10|sb_psel_s11|sb_psel_s12|sb_psel_s13|sb_psel_s14|sb_psel_s15) & U_apb.psel_en & U_apb.penable;

    wire [1:0] presp_s0  = (`NUM_APB_SLAVES > 0)  ? (`APB_IS_APB3_0==1)  ? {1'b0, U_apb.pslverr_s0}  : 2'b0 : 2'b0;
    wire [1:0] presp_s1  = (`NUM_APB_SLAVES > 1)  ? (`APB_IS_APB3_1==1)  ? {1'b0, U_apb.pslverr_s1}  : 2'b0 : 2'b0;
    wire [1:0] presp_s2  = (`NUM_APB_SLAVES > 2)  ? (`APB_IS_APB3_2==1)  ? {1'b0, U_apb.pslverr_s2}  : 2'b0 : 2'b0;
    wire [1:0] presp_s3  = (`NUM_APB_SLAVES > 3)  ? (`APB_IS_APB3_3==1)  ? {1'b0, U_apb.pslverr_s3}  : 2'b0 : 2'b0;
    wire [1:0] presp_s4  = (`NUM_APB_SLAVES > 4)  ? (`APB_IS_APB3_4==1)  ? {1'b0, U_apb.pslverr_s4}  : 2'b0 : 2'b0;
    wire [1:0] presp_s5  = (`NUM_APB_SLAVES > 5)  ? (`APB_IS_APB3_5==1)  ? {1'b0, U_apb.pslverr_s5}  : 2'b0 : 2'b0;
    wire [1:0] presp_s6  = (`NUM_APB_SLAVES > 6)  ? (`APB_IS_APB3_6==1)  ? {1'b0, U_apb.pslverr_s6}  : 2'b0 : 2'b0;
    wire [1:0] presp_s7  = (`NUM_APB_SLAVES > 7)  ? (`APB_IS_APB3_7==1)  ? {1'b0, U_apb.pslverr_s7}  : 2'b0 : 2'b0;
    wire [1:0] presp_s8  = (`NUM_APB_SLAVES > 8)  ? (`APB_IS_APB3_8==1)  ? {1'b0, U_apb.pslverr_s8}  : 2'b0 : 2'b0;
    wire [1:0] presp_s9  = (`NUM_APB_SLAVES > 9)  ? (`APB_IS_APB3_9==1)  ? {1'b0, U_apb.pslverr_s9}  : 2'b0 : 2'b0;
    wire [1:0] presp_s10 = (`NUM_APB_SLAVES > 10) ? (`APB_IS_APB3_10==1) ? {1'b0, U_apb.pslverr_s10} : 2'b0 : 2'b0;
    wire [1:0] presp_s11 = (`NUM_APB_SLAVES > 11) ? (`APB_IS_APB3_11==1) ? {1'b0, U_apb.pslverr_s11} : 2'b0 : 2'b0;
    wire [1:0] presp_s12 = (`NUM_APB_SLAVES > 12) ? (`APB_IS_APB3_12==1) ? {1'b0, U_apb.pslverr_s12} : 2'b0 : 2'b0;
    wire [1:0] presp_s13 = (`NUM_APB_SLAVES > 13) ? (`APB_IS_APB3_13==1) ? {1'b0, U_apb.pslverr_s13} : 2'b0 : 2'b0;
    wire [1:0] presp_s14 = (`NUM_APB_SLAVES > 14) ? (`APB_IS_APB3_14==1) ? {1'b0, U_apb.pslverr_s14} : 2'b0 : 2'b0;
    wire [1:0] presp_s15 = (`NUM_APB_SLAVES > 15) ? (`APB_IS_APB3_15==1) ? {1'b0, U_apb.pslverr_s15} : 2'b0 : 2'b0;

    apb_resp_sb U_resp_sb(
       .hclk        (hclk)
      ,.hresetn     (d_hresetn)
      ,.hsel        (hsel_s1)
      ,.hready      (hready)
      ,.hresp       (hresp)
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
*/

module apb_resp_sb(
  // Inputs
  hclk, hresetn, hsel, hready, hresp, htrans,
  rvalid_s0,  rvalid_s1,  rvalid_s2,  rvalid_s3,
  rvalid_s4,  rvalid_s5,  rvalid_s6,  rvalid_s7,
  rvalid_s8,  rvalid_s9,  rvalid_s10, rvalid_s11,
  rvalid_s12, rvalid_s13, rvalid_s14, rvalid_s15, rvalid_dec,
  resp_s0,    resp_s1,    resp_s2,    resp_s3,
  resp_s4,    resp_s5,    resp_s6,    resp_s7,
  resp_s8,    resp_s9,    resp_s10,   resp_s11,
  resp_s12,   resp_s13,   resp_s14,   resp_s15
  );

  input       hclk, hresetn, hsel, hready;
  input [1:0] hresp, htrans;
  input       rvalid_s0,  rvalid_s1,  rvalid_s2,  rvalid_s3;
  input       rvalid_s4,  rvalid_s5,  rvalid_s6,  rvalid_s7;
  input       rvalid_s8,  rvalid_s9,  rvalid_s10, rvalid_s11;
  input       rvalid_s12, rvalid_s13, rvalid_s14, rvalid_s15;
  input       rvalid_dec; // APB transfer to a non-existent APB slave address space.
  input [1:0] resp_s0,    resp_s1,    resp_s2,    resp_s3;
  input [1:0] resp_s4,    resp_s5,    resp_s6,    resp_s7;
  input [1:0] resp_s8,    resp_s9,    resp_s10,   resp_s11;
  input [1:0] resp_s12,   resp_s13,   resp_s14,   resp_s15;

  reg [1:0] response;
  reg       any_valid_dly;
  reg       dp_hsel;
  reg [1:0] presp_r, hresp_r, dp_htrans;
  reg       presp_valid, hresp_valid;
  wire      any_valid, any_valid_re;
  integer   presp_time, hresp_time;

  //
  // One-hot mux to select the response from the apb slave
  //
  always @(rvalid_s0 or rvalid_s1 or rvalid_s2 or rvalid_s3 or rvalid_s4 or
           rvalid_s5 or rvalid_s6 or rvalid_s7 or rvalid_s8 or rvalid_s9 or
           rvalid_s10 or rvalid_s11 or rvalid_s12 or rvalid_s13 or rvalid_s14 or
           rvalid_s15 or rvalid_dec or resp_s0 or resp_s1 or resp_s2 or
           resp_s3 or  resp_s4 or resp_s5 or resp_s6 or  resp_s7 or resp_s8 or
           resp_s9 or resp_s10 or resp_s11 or resp_s12 or resp_s13 or resp_s14 or
           resp_s15)
  begin : respMux_PROC
    case(1'b1)
      rvalid_s0    : response = resp_s0;
      rvalid_s1    : response = resp_s1;
      rvalid_s2    : response = resp_s2;
      rvalid_s3    : response = resp_s3;
      rvalid_s4    : response = resp_s4;
      rvalid_s5    : response = resp_s5;
      rvalid_s6    : response = resp_s6;
      rvalid_s7    : response = resp_s7;
      rvalid_s8    : response = resp_s8;
      rvalid_s9    : response = resp_s9;
      rvalid_s10   : response = resp_s10;
      rvalid_s11   : response = resp_s11;
      rvalid_s12   : response = resp_s12;
      rvalid_s13   : response = resp_s13;
      rvalid_s14   : response = resp_s14;
      rvalid_s15   : response = resp_s15;
      rvalid_dec   : response = 2'b00; // The bridge always returns an OKAY response if the AHB does not map to any APB slave address space.
    endcase
  end

  assign any_valid = rvalid_s0  | rvalid_s1  | rvalid_s2  | rvalid_s3  | rvalid_s4  | rvalid_s5  | rvalid_s6  | rvalid_s7  |
                     rvalid_s8  | rvalid_s9  | rvalid_s10 | rvalid_s11 | rvalid_s12 | rvalid_s13 | rvalid_s14 | rvalid_s15 | rvalid_dec;

  // Rising edge detect on any valid response in the pclk logic
  always @(posedge hclk or negedge hresetn)
  begin : rvalidEdge_PROC
    if(~hresetn)
    begin
      any_valid_dly <= 1'b0;
    end else begin
      any_valid_dly <= any_valid;
    end
  end
  assign any_valid_re = (~any_valid_dly & any_valid);

  // Register to latch the APB slave response for compare against AHB hresp
  always @(posedge hclk or negedge hresetn)
  begin : prespLatch_PROC
    if(~hresetn)
    begin
      presp_r <= 2'b0;
      presp_time <= 0;
      presp_valid <= 1'b0;
    end else begin
      if(any_valid_re)
      begin
        presp_valid <= 1'b1;
        presp_time <= $time;
        presp_r <= response;
      end else begin
        if(presp_valid & hresp_valid)
          presp_valid <= 1'b0;
      end
    end
  end

  // Create data phase version of hsel and htrans
  always @(posedge hclk or negedge hresetn)
  begin : dpHsel_PROC
    if(~hresetn)
    begin
      dp_hsel <= 1'b0;
      dp_htrans <= 2'b0;
    end else begin
      if(hready)
      begin
        dp_hsel <= hsel;
        dp_htrans <= htrans;
      end
    end
  end

  // Register to latch the DW_apb AHB response for compare against the APB
  // slave resp
  always @(posedge hclk or negedge hresetn)
  begin : hrespLatch_PROC
    if(~hresetn)
    begin
      hresp_r <= 2'b0;
      hresp_time <= 0;
      hresp_valid <= 1'b0;
    end else begin
      if(dp_hsel && (dp_htrans==2'b10 || dp_htrans==2'b11) && hready)
      begin
        hresp_valid <= 1'b1;
        hresp_time <= $time;
        hresp_r <= hresp;
      end else begin
        if(hresp_valid & presp_valid)
          hresp_valid <= 1'b0;
      end
    end
  end

  // Compare and report any miss-matches
  always @(hresp_valid or presp_valid or hresp_r or presp_r)
  begin : respCompare_PROC
    if(hresp_valid && presp_valid)
    begin
      if(hresp_r != presp_r)
      begin
        $display("[%0d] ERROR : APB response %2b (@time %0d) does not match AHB response %2b (@time %0d)\n", $time, presp_r, presp_time, hresp_r, hresp_time);
        repeat (40) @(posedge hclk);
        $finish;
      end
    end
  end

  // check if two AHB responses are returned without any APB response
  always @(posedge hclk or negedge hresetn)
  begin : twoHrespCheck_PROC
    if(hresp_valid && dp_hsel && (dp_htrans==2'b10 || dp_htrans==2'b11) && hready && !presp_valid)
    begin
      $display("[%0d] ERROR : Observed two AHB responses phases, without seeing a single APB transfer complete\n", $time);
      repeat (40) @(posedge hclk);
      $finish;
    end
  end

endmodule







