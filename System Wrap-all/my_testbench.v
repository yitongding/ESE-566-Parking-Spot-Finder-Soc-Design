
module top_wraper (
	input wire HCLK,
	input wire HRESETn,
	input wire i_i2c_ic_clk_in_a,
	input wire i_i2c_ic_data_in_a,
	output wire i_i2c_ic_clk_oe,
	output wire i_i2c_ic_data_oe,
	output wire i_i2c_ic_en,
	input wire in_ACCEL_X,
	input wire in_ACCEL_Y,
	input wire in_YAW,
	input wire [31:0] ram_rdata,
	output wire [17:0] ram_addr,
	output wire [31:0] ram_wdata,
	output wire ram_write,
	output wire [31:0] NEXT_DIRC
);

//------------------------------------------------------------------------------
// Define parameters for clock period and power-on reset delay
//------------------------------------------------------------------------------

//localparam clk_period = 100;            // Simulation cycles per clock period
//localparam por_delay  = 1001;           // Simulation cycles of power-on-reset
localparam ram_log2   = 18;             // Power of two of RAM words
//localparam addr_tty   = 32'h40000000;   // Address of output console

//------------------------------------------------------------------------------
// Define registers for clock, reset and memory
//------------------------------------------------------------------------------

//reg sim_clock;                          // System clock
//reg power_on_reset_n;                   // Power-on reset signal
//reg [31:0] ram [0:(2**ram_log2)-1];     // Storage for AHB memory model

//------------------------------------------------------------------------------
// Cortex-M0 DesignStart signal list
//------------------------------------------------------------------------------

// See the AMBA(r)3 AHB-Lite Protocol Specification v1.0 (ARM IHI 0033),
// and the Cortex(tm)-M0 Technical Reference Manual (ARM DDI 0432), for
// further details on the following signals:
//wire        HCLK;               // AHB-Lite interface and CPU master clock
//wire        HRESETn;            // AHB-Lite active-low reset signal

wire [31:0] HADDR;              // AHB-Lite byte address
wire [ 2:0] HBURST;             // AHB-Lite burst type (not used by testbench)
wire        HMASTLOCK;          // AHB-Lite locked transaction (always zero)
wire [ 3:0] HPROT;              // AHB-Lite protection (not used by testbench)
wire [ 2:0] HSIZE;              // AHB-Lite size (# of bits: 0=8, 1=16, 2=32)
wire [ 1:0] HTRANS;             // AHB-Lite perform transaction
wire [31:0] HWDATA;             // AHB-Lite write-data
wire        HWRITE;             // AHB-Lite transaction is write not read
wire [31:0] HRDATA;             // AHB-Lite read-data
wire        HREADY;             // AHB-Lite bus ready signal
wire [1:0]  HRESP;              // AHB-Lite bus error (not used by testbench)
wire 		HBUSREQ;			// AHB-Lite HBUSREQ output will be left unconnected
wire 		HGRANT;				// AHB-Lite HGRANT input tied to logic '1' (1'b1).


wire 		HSEL_S ;
wire [31:0] HADDR_S ;
wire [ 2:0] HBURST_S ;
wire [ 1:0] HTRANS_S ;
wire [31:0] HWDATA_S ;
wire 		HWRITE_S ;
wire [ 1:0] HRESP_S ;
wire [31:0] HRDATA_S ;
wire 		HREADY_S ;
//need to be assign
wire 		HMASTLOCK_S;
wire 		HPORT_S;
wire [ 2:0] HSIZE_S;
wire 		HREADY_RESP_S;
// See the ARMv6-M Architecture Reference Manual (ARM DDI 0419), and the
// Cortex(tm)-M0 Technical Reference Manual (ARM DDI 0432), for further
// details on the following signals:

wire        NMI;                // Non-maskable interrupt input (not used by tb)
wire [15:0] IRQ;                // Interrupt inputs (not used by testbench)

wire        TXEV;               // Event output (CPU executed SEV instruction)
wire        RXEV;               // Event input (not used by testbench)

wire        LOCKUP;             // CPU stopped due to multiple software errors
wire        SYSRESETREQ;        // CPU request for system to be reset

wire        SLEEPING;           // CPU is sleeping (not used by testbench)

//------------------------------------------------------------------------------
// Generate system clock, power-on reset and synchronized AHB reset signals
//------------------------------------------------------------------------------
/*
// Generate a clock of the appropriate period
initial
  #0 sim_clock = 1'b0;

always @(sim_clock)
  #(clk_period/2) sim_clock <= ~sim_clock;

// Release the active-low power-on reset signal after the given delay
initial begin
  #0 power_on_reset_n = 1'b0;
  #(por_delay) power_on_reset_n = 1'b1;
end

// Synchronize AHB reset, and factor in reset request from the CPU
reg [1:0] rst_sync;
always @(posedge sim_clock or negedge power_on_reset_n)
  if(!power_on_reset_n)
    rst_sync <= 2'b00;
  else
    rst_sync <= {rst_sync[0],~SYSRESETREQ};
*/
//------------------------------------------------------------------------------
// Connect clock and reset to M0 signals and assign static signals
//------------------------------------------------------------------------------

//assign HCLK    		= sim_clock;    // Assign AHB clock from simulation clock
//assign HRESETn 		= rst_sync[1];  // Assign AHB clock from synchronizer
assign HREADY  		= 1'b1;         // All devices are zero-wait-state
assign NMI     		= 1'b0;         // Do not generate any non-maskable interrupts
assign IRQ     		= {16{1'b0}};   // Do not generate any interrupts
assign RXEV    		= 1'b0;         // Do not generate any external events	
assign HRESP[1:0] 	= 2'b00;         // No device in this system generates errors
assign HGRANT  		= 1'b1;

//signal for slave stage
assign HMASTLOCK_S 	= 1'b0;
assign HPORT_S		= 1'b0;
assign HSIZE_S[2:0] = 3'b000;
assign HREADY_RESP_S= 1'b1;


CORTEXM0DS u_cortexm0ds (
  .HCLK        (HCLK),
  .HRESETn     (HRESETn),
  .HADDR       (HADDR[31:0]),
  .HBURST      (HBURST[2:0]),
  .HMASTLOCK   (HMASTLOCK),
  .HPROT       (HPROT[3:0]),
  .HSIZE       (HSIZE[2:0]),
  .HTRANS      (HTRANS[1:0]),
  .HWDATA      (HWDATA[31:0]),
  .HWRITE      (HWRITE),
  .HRDATA      (HRDATA[31:0]),
  .HREADY      (HREADY),
  .HRESP       (HRESP[0]),
  .NMI         (NMI),
  .IRQ         (IRQ[15:0]),
  .TXEV        (TXEV),
  .RXEV        (RXEV),
  .LOCKUP      (LOCKUP),
  .SYSRESETREQ (SYSRESETREQ),
  .SLEEPING    (SLEEPING)
);

//------------------------------------------------------------------------------
// Connect clock and reset to AHB
//------------------------------------------------------------------------------


wire i_ahb_pause;
wire i_apb_pclk_en;

//Arbiter Slave Interface Signals (left open)
wire [31:0] i_ahb_hrdata_s0;
wire 		i_ahb_hready_resp_s0;
wire [1:0]	i_ahb_hresp_s0;
wire 		i_ahb_hsel_s0;
wire 		i_ahb_ahbarbint;

//Observability Signals (left open)
wire [3:0] 	i_ahb_hmaster_data;	

wire i_i2c_debug_addr;
wire i_i2c_debug_addr_10bit;
wire i_i2c_debug_data;
wire i_i2c_debug_hs;
wire i_i2c_debug_master_act;
wire [4:0] i_i2c_debug_mst_cstate;
wire i_i2c_debug_p_gen;
wire i_i2c_debug_rd;
wire i_i2c_debug_s_gen;
wire i_i2c_debug_slave_act;
wire [3:0] i_i2c_debug_slv_cstate;
wire i_i2c_debug_wr;

wire i_i2c_ic_activity_intr;
wire i_i2c_ic_gen_call_intr;
wire i_i2c_ic_rd_req_intr;
wire i_i2c_ic_rx_done_intr;
wire i_i2c_ic_rx_full_intr;
wire i_i2c_ic_rx_over_intr;
wire i_i2c_ic_rx_under_intr;
wire i_i2c_ic_start_det_intr;
wire i_i2c_ic_stop_det_intr;
wire i_i2c_ic_tx_abrt_intr;
wire i_i2c_ic_tx_empty_intr;
wire i_i2c_ic_tx_over_intr;

assign i_ahb_pause					= 1'b0;
assign i_apb_pclk_en				= 1'b1;

assign i_i2c_debug_addr				= 1'b0;
assign i_i2c_debug_addr_10bit		= 1'b0;
assign i_i2c_debug_data				= 1'b0;
assign i_i2c_debug_hs				= 1'b0;
assign i_i2c_debug_master_act		= 1'b0;
assign i_i2c_debug_mst_cstate[4:0]  = 5'b0;
assign i_i2c_debug_p_gen			= 1'b0;
assign i_i2c_debug_rd				= 1'b0;
assign i_i2c_debug_s_gen			= 1'b0;
assign i_i2c_debug_slave_act		= 1'b0;
assign i_i2c_debug_slv_cstate[3:0] 	= 4'b0;
assign i_i2c_debug_wr				= 1'b0;

assign i_i2c_ic_activity_intr 	= 1'b0;
assign i_i2c_ic_gen_call_intr 	= 1'b0;
assign i_i2c_ic_rd_req_intr 	= 1'b0;
assign i_i2c_ic_rx_done_intr 	= 1'b0;
assign i_i2c_ic_rx_full_intr 	= 1'b0;
assign i_i2c_ic_rx_over_intr 	= 1'b0;
assign i_i2c_ic_rx_under_intr 	= 1'b0;
assign i_i2c_ic_start_det_intr 	= 1'b0;
assign i_i2c_ic_stop_det_intr 	= 1'b0;
assign i_i2c_ic_tx_abrt_intr 	= 1'b0;
assign i_i2c_ic_tx_empty_intr 	= 1'b0;
assign i_i2c_ic_tx_over_intr 	= 1'b0;

parking AHB (
	// Ports for Interface HCLK
	.HCLK_hclk					(HCLK),
	// Ports for Interface HRESETn
	.HRESETn_hresetn			(HRESETn),
	// Ports for Interface PCLK
	.PCLK_pclk					(HCLK),
	// Ports for Interface PRESETn
	.PRESETn_presetn			(HRESETn),
	// Ports for Interface ex_i_ahb_AHB_Master
	.ex_i_ahb_AHB_Master_haddr	(HADDR[31:0]),
	.ex_i_ahb_AHB_Master_hburst	(HBURST[2:0]),
	.ex_i_ahb_AHB_Master_hbusreq(HBUSREQ),
	.ex_i_ahb_AHB_Master_hlock	(HMASTLOCK),
	.ex_i_ahb_AHB_Master_hprot	(HPROT[3:0]),
	.ex_i_ahb_AHB_Master_hsize	(HSIZE[2:0]),
	.ex_i_ahb_AHB_Master_htrans	(HTRANS[1:0]),
	.ex_i_ahb_AHB_Master_hwdata	(HWDATA[31:0]),
	.ex_i_ahb_AHB_Master_hwrite	(HWRITE),
	.ex_i_ahb_AHB_Master_hgrant	(HGRANT),
	.ex_i_ahb_AHB_Master_hrdata	(HRDATA[31:0]),
	.ex_i_ahb_AHB_Master_hready	(HREADY),
	.ex_i_ahb_AHB_Master_hresp	(HRESP[1:0]),
	// Ports for Interface ex_i_ahb_AHB_Slave
	.ex_i_ahb_AHB_Slave_hrdata	(HRDATA_S[31:0]),		//input
	.ex_i_ahb_AHB_Slave_hready_resp(HREADY_RESP_S),	//input
	.ex_i_ahb_AHB_Slave_hresp	(HRESP_S[ 1:0]),		//input
	.ex_i_ahb_AHB_Slave_haddr	(HADDR_S[31:0]),
	.ex_i_ahb_AHB_Slave_hburst	(HBURST_S[ 2:0]),
	.ex_i_ahb_AHB_Slave_hmastlock(HMASTLOCK_S),
	.ex_i_ahb_AHB_Slave_hprot	(HPORT_S),
	.ex_i_ahb_AHB_Slave_hready	(HREADY_S),
	.ex_i_ahb_AHB_Slave_hsel	(HSEL_S),
	.ex_i_ahb_AHB_Slave_hsize	(HSIZE_S),
	.ex_i_ahb_AHB_Slave_htrans	(HTRANS_S[ 1:0]),
	.ex_i_ahb_AHB_Slave_hwdata	(HWDATA_S[31:0]),
	.ex_i_ahb_AHB_Slave_hwrite	(HWRITE_S),
	// Ports for Manually exported pins
	.i_ahb_pause				(i_ahb_pause),			//input//
	.i_apb_pclk_en				(i_apb_pclk_en),		//input//
	.i_i2c_ic_clk				(HCLK),					//input
	.i_i2c_ic_clk_in_a			(i_i2c_ic_clk_in_a),	//input from the top
	.i_i2c_ic_data_in_a			(i_i2c_ic_clk_in_a),	//input from the top
	.i_i2c_ic_rst_n				(HRESETn),				//input
	.i_i2c_ic_clk_oe			(i_i2c_ic_clk_oe),		//output to the top
	.i_i2c_ic_data_oe			(i_i2c_ic_data_oe),		//output to the top
	.i_i2c_ic_en				(i_i2c_ic_en),			//output to the top
	.i_ahb_ahbarbint			(i_ahb_ahbarbint),
	.i_ahb_hmaster_data			(i_ahb_hmaster_data),
	.i_ahb_hrdata_s0			(i_ahb_hrdata_s0),
	.i_ahb_hready_resp_s0		(i_ahb_hready_resp_s0),
	.i_ahb_hresp_s0				(i_ahb_hresp_s0),
	.i_ahb_hsel_s0				(i_ahb_hsel_s0),
	.i_i2c_debug_addr			(i_i2c_debug_addr),
	.i_i2c_debug_addr_10bit		(i_i2c_debug_addr_10bit),
	.i_i2c_debug_data			(i_i2c_debug_data),
	.i_i2c_debug_hs				(i_i2c_debug_hs),
	.i_i2c_debug_master_act		(i_i2c_debug_master_act),
	.i_i2c_debug_mst_cstate		(i_i2c_debug_mst_cstate),
	.i_i2c_debug_p_gen			(i_i2c_debug_p_gen),
	.i_i2c_debug_rd				(i_i2c_debug_rd),
	.i_i2c_debug_s_gen			(i_i2c_debug_s_gen),
	.i_i2c_debug_slave_act		(i_i2c_debug_slave_act),
	.i_i2c_debug_slv_cstate		(i_i2c_debug_slv_cstate),
	.i_i2c_debug_wr				(i_i2c_debug_wr),
	.i_i2c_ic_activity_intr		(i_i2c_ic_activity_intr),
	.i_i2c_ic_gen_call_intr		(i_i2c_ic_gen_call_intr),
	.i_i2c_ic_rd_req_intr		(i_i2c_ic_rd_req_intr),
	.i_i2c_ic_rx_done_intr		(i_i2c_ic_rx_done_intr),
	.i_i2c_ic_rx_full_intr		(i_i2c_ic_rx_full_intr),
	.i_i2c_ic_rx_over_intr		(i_i2c_ic_rx_over_intr),
	.i_i2c_ic_rx_under_intr		(i_i2c_ic_rx_under_intr),
	.i_i2c_ic_start_det_intr	(i_i2c_ic_start_det_intr),
	.i_i2c_ic_stop_det_intr		(i_i2c_ic_stop_det_intr),
	.i_i2c_ic_tx_abrt_intr		(i_i2c_ic_tx_abrt_intr),
	.i_i2c_ic_tx_empty_intr		(i_i2c_ic_tx_empty_intr),
	.i_i2c_ic_tx_over_intr		(i_i2c_ic_tx_over_intr)
	);

	
//-------------------------------------//
//AHB to RAM wrapper
//-------------------------------------//
/*
wire [31:0] ram_rdata ;
wire [31:0] ram_addr  ;
wire [31:0] ram_wdata ;
wire 		ram_write ;
*/
ram_ahbif U_ram_ahbif (
	.hclk 		(HCLK ),
	.hresetn 	(HRESETn ),
	.hsel_s 	(HSEL_S ),
	.haddr_s 	(HADDR_S[31:0] ),
	.hburst_s	(HBURST_S[ 2:0] ),
	.htrans_s 	(HTRANS_S[ 1:0] ),
	.hrdata_s 	(HRDATA_S[31:0] ),
	.hwdata_s 	(HWDATA_S[31:0] ),
	.hwrite_s 	(HWRITE_S ),
	.hready_s 	(HREADY_S ),
	.hresp_s 	(HRESP_S[ 1:0] ),
	.ram_rdata 	(ram_rdata ),
	.ram_addr 	(ram_addr ),
	.ram_wdata 	(ram_wdata ),
	.ram_write 	(ram_write )
);



//-----------------------------------------//
//hardware accelerater
//-----------------------------------------//
wire   			AP_START;			//in
wire   			AP_DONE;			//out
wire   			AP_IDLE;			//out
wire   			AP_READY;			//out
wire	[31:0] 	ACCEL_X;			//in
wire	[31:0] 	ACCEL_Y;			//in
wire	[31:0] 	YAW;				//in
wire	[31:0] 	START_POINT;		//in
wire	[31:0] 	END_POINT;			//in
//wire	[31:0] 	NEXT_DIRC;			//out to the top
wire 			NEXT_DIRC_AP_VLD;	//out 

//assign ram address for simulation data input
localparam	ADD_in_ACCEL_X		= 32'h00010030;
localparam	ADD_in_ACCEL_Y		= 32'h00010034;
localparam	ADD_in_YAW			= 32'h00010038;
//assign ram address for the input and output ports of hardware accelerater 
localparam	ADD_AP_START		= 32'h00010000;			//in
localparam	ADD_AP_DONE			= 32'h00010004;			//out
localparam	ADD_AP_IDLE			= 32'h00010008;			//out
localparam	ADD_AP_READY		= 32'h0001000c;			//out
localparam	ADD_ACCEL_X			= 32'h00010010;			//in
localparam	ADD_ACCEL_Y			= 32'h00010014;			//in
localparam	ADD_YAW				= 32'h00010018;			//in
localparam	ADD_START_POINT		= 32'h0001001c;			//in
localparam	ADD_END_POINT		= 32'h00010020;			//in
localparam	ADD_NEXT_DIRC		= 32'h00010024;			//out
localparam	ADD_NEXT_DIRC_AP_VLD= 32'h00010028;			//out

top park_guild (
	.ap_clk				(HCLK),
	.ap_rst				(HRESETn),
	.ap_start			(AP_START),
	.ap_done			(AP_DONE),
	.ap_idle			(AP_IDLE),
	.ap_ready			(AP_READY),
	.accel_x			(ACCEL_X),
	//.accel_y			(ACCEL_Y),
	.yaw				(YAW),
	.start_point		(START_POINT),
	.end_point			(END_POINT),
	.next_dirc			(NEXT_DIRC),
	.next_dirc_ap_vld	(NEXT_DIRC_AP_VLD)
);

ap_start_timer ap_start_timer(
	.HCLK(HCLK),
	.HRESETn(HRESETn),
	.ap_start(AP_START)
);
/*
always @(posedge HCLK) begin
	if (ram_write) begin
		ram[ram_addr] = ram_wdata;
	end
	ram[ADD_AP_DONE][0]				= AP_DONE;
	ram[ADD_AP_IDLE][0]				= AP_IDLE;
	ram[ADD_AP_READY][0]			= AP_READY;
	ram[ADD_NEXT_DIRC]				= NEXT_DIRC;
	ram[ADD_NEXT_DIRC_AP_VLD][0] 	= NEXT_DIRC_AP_VLD;
	ram[ADD_in_ACCEL_X]				= in_ACCEL_X;
	ram[ADD_in_ACCEL_Y]				= in_ACCEL_Y;
	ram[ADD_in_YAW]					= in_YAW;
end
assign ram_rdata = ram[ram_addr];
assign ACCEL_X		= ram[ADD_ACCEL_X];
assign ACCEL_Y		= ram[ADD_ACCEL_Y];
assign YAW			= ram[ADD_YAW];
assign START_POINT 	= ram[ADD_START_POINT];
assign END_POINT 	= ram[ADD_END_POINT];
*/
endmodule