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
// Release version :  2.11a
// File Version     :        $Revision: #6 $ 
// Revision: $Id: //dwh/DW_ocb/DW_ahb/amba_dev/sim/testbench/test_DW_ahb.v#6 $ 
*/

`timescale 1ns / 10ps
 `include "../../src/DW_ahb_cc_constants.v"

module test_DW_ahb;

  reg hclk;
  supply1 logic_1;
  supply0 logic_0;
  wire                      dummy_wire;
  wire [63:0]               addr64;
  wire [64:0]               addr65;
  wire [15:0]               zero16 = 0;
  wire [(6*8)-1:0]          testcase_id;
  wire [`NUM_AHB_MASTERS:0] bus_hbusreq;
  wire [`NUM_IAHB_SLAVES:0] bus_hsel;
  wire [`NUM_AHB_MASTERS:0] bus_hlock;
  wire [`NUM_AHB_MASTERS:0] bus_hgrant;
  wire [15:0]               abus_hbusreq;
  wire [15:0]               abus_hsel;
  wire [15:0]               abus_hlock;
  wire [15:0]               abus_hgrant;

  test_DW_ahb_shell vshell(hclk, hclk);

  i_ahb_DW_ahb U_ahb (.hclk(hclk));

  assign addr65[64:`HADDR_WIDTH]  = 0;
  assign addr65[`HADDR_WIDTH-1:0] = U_ahb.haddr;
  assign addr64                   = addr65[63:0];

//# The following are used in the connection of the AHB monitor or ACT monitor
  assign bus_hsel    = abus_hsel[`NUM_IAHB_SLAVES:0];
  assign bus_hbusreq = abus_hbusreq[`NUM_AHB_MASTERS:0];
  assign bus_hlock   = abus_hlock[`NUM_AHB_MASTERS:0];
  assign bus_hgrant  = abus_hgrant[`NUM_AHB_MASTERS:0];


  assign abus_hbusreq[0] = 1'b0;
  assign abus_hbusreq[1] = U_ahb.hbusreq_m1;

  assign abus_hlock[0] = 1'b0;
  assign abus_hlock[1] = U_ahb.hlock_m1;

  assign abus_hgrant[0] = ~(|abus_hgrant[1:1]);
  assign abus_hgrant[1] = U_ahb.hgrant_m1;

  assign abus_hsel[0] = (U_ahb.hsel_s0 === 1'b1) ? 1'b1 : 1'b0;
  assign abus_hsel[1] = (U_ahb.hsel_s1 === 1'b1) ? 1'b1 : 1'b0;
  assign abus_hsel[2] = (U_ahb.hsel_s2 === 1'b1) ? 1'b1 : 1'b0;




// Only run this check for unencrypted VCS RTL sims.
`ifdef VCS
`ifdef RTL
`ifdef AHB_ENCRYPT
`else
// Insert module to check condition relating to STAR 9000231009
// "DW_ahb : need to select slave output even if HTRANS=IDLE."
// NOTE : bus* signal from DW_ahb contain default slave busses
// as well, which we are not interested in for this check.
  tb_check_idle_resp
  #(`NUM_IAHB_SLAVES,
    `AHB_DATA_WIDTH
   )
  U_tb_check_idle_resp (
    // Inputs - System.
    .hclk_i       (U_ahb.hclk),
    .hresetn_i    (U_ahb.hresetn),

    // Inputs - AHB bus.
    .htrans_i     (U_ahb.htrans),
    .hsel_i       (U_ahb.hsel[`NUM_IAHB_SLAVES:1]),
    .hready_i     (U_ahb.hready),
    .hrdata_bus_i (U_ahb.bus_hrdata[((`NUM_IAHB_SLAVES+1)*`AHB_DATA_WIDTH)-1:`AHB_DATA_WIDTH]),
    .hrdata_i     (U_ahb.hrdata)
  );
`endif
`endif
`endif

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
   initial begin
      $display("About to sdf-annotate the design from %s",`SDF_FILE);
      $sdf_annotate(`SDF_FILE, U_ahb, , , `SDF_LEVEL);
   end
`endif

// ----------------------------------------
// required for toggle coverage
// ----------------------------------------
`ifdef CODE_COVERAGE
   initial
     begin
   //$set_toggle_mode(1);
   //$start_toggle("U_ahb");
     end
`endif

// ----------------------------------------
// clock generators
// ----------------------------------------
initial begin
  hclk = 1;
  forever begin
    #(`PERIOD/2.0)
      hclk = ~hclk;
  end
end
endmodule
