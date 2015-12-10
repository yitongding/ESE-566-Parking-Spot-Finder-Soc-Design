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
// File Version     :        $Revision: #5 $ 
// Revision: $Id: //dwh/DW_ocb/DW_ahb/amba_dev/sim/testbench/tb_check_idle_resp.v#5 $ 
//
** Abstract : Checks that when a slave is accessed with htrans==IDLE
**            the rdata bus of the addressed slave is multiplexed onto 
**            bus hrdata signal.
*/

module tb_check_idle_resp (
  // Inputs - System.
  hclk_i,
  hresetn_i,

  // Inputs - AHB bus.
  htrans_i,
  hsel_i,
  hready_i,

  hrdata_bus_i,
  hrdata_i
);

//----------------------------------------------------------------------
// MODULE PARAMETERS.
  parameter NUM_SLVS = 0;
  parameter RDATA_W = 0;

  parameter RDATA_BUS_W = NUM_SLVS * RDATA_W;

//----------------------------------------------------------------------
// LOCAL MACROS
  `define HTRANS_W       2
  `define HTRANS_IDLE 2'b0

//----------------------------------------------------------------------
// PORT DECLARATIONS

// Inputs - System.
  input hclk_i;    
  input hresetn_i; 

// Inputs - slaves
  input [`HTRANS_W-1:0] htrans_i;
  input [NUM_SLVS-1:0] hsel_i;
  input [RDATA_BUS_W-1:0] hrdata_bus_i;

// Inputs - ahb bus.
  input hready_i;
  input [RDATA_W-1:0] hrdata_i;


//----------------------------------------------------------------------
// INTERNAL SIGNALS
  // hsel controlled to decode which slave owns the data bus.
  reg [NUM_SLVS-1:0] hsel_data_r;

  // rdata of the slave that owns the data bus.
  wire [RDATA_W-1:0] hrdata_selected;

  // Which slave owns the data bus.
  integer data_own_slave;

  // Asserted when check condition occurs.
  reg check_done;

  //--------------------------------------------------------------------
  // Generate a version of hsel that decodes which slave owns the data 
  // bus. Due to pipelined nature of AHB bus, a master can own the 
  // command signals, while another master owns the data signals. This
  // means that we cannot use hsel directly to decode which slave owns 
  // the data busses, since hsel is a command signal.
  // Here we capture a new version of hsel when ever a new value of hsel
  // is detected (compared with previous captured version) and hready is
  // asserted. By waiting for hready we know that the previous slave has
  // finished and control of data busses is now handed over to the new
  // slave.
  always @(posedge hclk_i or negedge hresetn_i)
  begin : hsel_data_r_PROC
    if(~hresetn_i) begin
      hsel_data_r <= 0;
    end else begin
      if((hsel_data_r != hsel_i) & hready_i) hsel_data_r <= hsel_i; 
    end 
  end // hsel_data_r_PROC


  // Select the read data bus of the slave that should own the
  // data bus.
  tb_busmux_ohsel
  #(NUM_SLVS,  // Number of buses to mux between.
    RDATA_W    // Width of each bus input to the mux.
  ) 
  U_tb_busmux_ohsel (
    .sel   (hsel_data_r),
    .din   (hrdata_bus_i),
    .dout  (hrdata_selected)
  );

  // Decode integer value of slave index that owns data bus.
  always @(*)
  begin : data_own_slave_PROC
    integer i;
    data_own_slave = 0;
    for(i=0 ; i<=NUM_SLVS ; i=i+1) begin
      if(hsel_data_r[i]) data_own_slave = i;
    end
  end // data_own_slave_PROC

  // Perform the check.
  always @(posedge hclk_i)
  begin : check_PROC
    check_done = 1'b0;
   
    // This is the case we need to do the check, a slave is
    // selected, and the master is sending IDLE transactions.
    if(|hsel_i & (htrans_i == `HTRANS_IDLE)) begin

      check_done = 1'b1;

      if(hrdata_i != hrdata_selected) begin
        $display("ERROR: %0d - IDLE RESP CHECKER FAILED.", $time); 
        $display("ERROR: %0d - Bus hrdata (0x%0h) != selcted slave (%0d) hrdata (0x%0h)"
	         , $time, hrdata_i, data_own_slave, hrdata_selected); 
      end

    end

  end // check_PROC


//----------------------------------------------------------------------
// LOCAL MACROS UNDEF
  `undef HTRANS_W    
  `undef HTRANS_IDLE 

endmodule
