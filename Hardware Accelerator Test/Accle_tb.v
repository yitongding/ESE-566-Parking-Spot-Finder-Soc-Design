
`timescale 100ns/10ns

module ParkingSpot_tb;

	reg sim_clock;                          // System clock
reg power_on_reset_n;                   // Power-on reset signal

localparam clk_period = 50;            // Simulation cycles per clock period
localparam por_delay  = 1010;           // Simulation cycles of power-on-reset
localparam one_sec    = 10**6;	
//------------------------------------------------------------------------------
// Generate system clock, power-on reset and synchronized AHB reset signals
//------------------------------------------------------------------------------

// Generate a clock of the appropriate period
initial
  #0 sim_clock = 1'b0;

always 
  #(clk_period/2) sim_clock <= ~sim_clock;

 // Release the active-low power-on reset signal after the given delay
 initial begin
  #0 power_on_reset_n = 1'b0;
  #(por_delay) power_on_reset_n = 1'b1;
end

wire HCLK;
wire HRESETn;

assign HCLK    = sim_clock;
assign HRESETn = power_on_reset_n;

reg	[31:0]	ACCEL_X;
reg	[31:0]	YAW;
reg [31:0]	start_point;
reg [31:0] 	end_point;

wire   ap_start;
wire   ap_done;
wire   ap_idle;
wire   ap_ready;
wire   [31:0] next_dirc;
wire   next_dirc_ap_vld;		

top DUT1(
    .ap_clk(HCLK),
    .ap_rst(!HRESETn),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .accel_x(accel_x),
    .yaw(yaw),
    .start_point(start_point),
    .end_point(end_point),
    .next_dirc(next_dirc),
    .next_dirc_ap_vld(next_dirc_ap_vld)
);

ap_start_timer DUT2(
	.HCLK(HCLK),
	.HRESETn(HRESETn),
	.ap_start(ap_start)
);

	initial begin
	$dumpfile("ParkingSpot.vcd"); 
	$dumpvars(0,ParkingSpot_tb); 

	#(por_delay);
	start_point = 20;
	end_point = 7;

	// first go straight
	
	ACCEL_X = 1;
	YAW = 0;

	#10000000
	
	ACCEL_X = 0;
	YAW = 0;

	#50000000
	
	ACCEL_X = -100;
	YAW = 0;
//right turn 
	#10000000
	
	ACCEL_X = 0;
	YAW = 90;

// second go
	#10000000
	
	ACCEL_X = 1;
	YAW = 0;

	#10000000
	
	ACCEL_X = 0;
	YAW = 0;
	
	#50000000
	
	ACCEL_X = -100;
	YAW = 0;

//right turn
	#10000000
	
	ACCEL_X = 0;
	YAW = 90;
	

//third go

	#10000000
	
	ACCEL_X = 1;
	YAW = 0;
	
	#10000000
	
	ACCEL_X = 0;
	YAW = 0;
	
	#10000000
	
	ACCEL_X =-100;
	YAW = 0;
	
//turn 
	#10000000
	
	ACCEL_X = 0;
	YAW = 90;
// forth

	#10000000
	
	ACCEL_X = 1;
	YAW = 0;
	
	#20000000
	
	ACCEL_X = 0;
	YAW = 0;
	
	#10000000
	
	ACCEL_X = -100;
	YAW = 0;
	
//turn 
	#10000000
	
	ACCEL_X = 0;
	YAW = 90;
	
//five 
	#10000000
	
	ACCEL_X = 1;
	YAW = 0;
	
	#20000000
	
	ACCEL_X = 0;
	YAW = 0;
	
	#10000000
	
	ACCEL_X = -100;
	YAW = 0;
	$finish;
	end

endmodule


