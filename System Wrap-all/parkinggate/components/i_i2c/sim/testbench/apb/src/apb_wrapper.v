module V9l5h(Jal5h, Oal5h, Wal5h, Ebl5h, Tbl5h, Zbl5h, Gcl5h, Lcl5h, Scl5h,  
Zcl5h, Kdl5h, Wdl5h, Cel5h, Lel5h, Rel5h, Cfl5h, Jfl5h, Rfl5h); 
parameter Rml5h = 3'b0; 
parameter Uml5h = 3'b1; 
parameter Xml5h = 3'b010; 
parameter Anl5h = 3'b011; 
parameter Dnl5h = 3'b100; 
parameter Gnl5h = 3'b101; 
parameter Jnl5h = 3'b110; 
input Ebl5h; 
input [(32 - 1):0] Tbl5h; 
input Jal5h; 
input Oal5h; 
input Zbl5h; 
input Gcl5h; 
input [(2 - 1):0] Lcl5h; 
input [(256 - 1):0] Zcl5h; 
input Scl5h; 
input Wal5h; 
output Kdl5h; 
output [(2 - 1):0] Wdl5h; 
output [1:0] Cel5h; 
output [(32 - 1):0] Lel5h; 
output Jfl5h; 
output Rfl5h; 
output [(32 - 1):0] Rel5h; 
output Cfl5h; 
reg Kdl5h; 
reg [1:0] Cel5h; 
reg [(32 - 1):0] Lel5h; 
reg Jfl5h; 
reg Rfl5h; 
reg [(32 - 1):0] Rel5h; 
reg Cfl5h; 
wire Zfl5h; 
wire Mgl5h; 
wire Wgl5h; 
wire [(32 - 1):0] Ghl5h; 
wire Qhl5h; 
wire Ail5h; 
reg [(32 - 1):0] Kil5h; 
reg [(32 - 1):0] Til5h; 
reg Fjl5h; 
reg Sjl5h; 
reg [(32 - 1):0] Bkl5h; 
reg [(32 - 1):0] Nkl5h; 
reg Cll5h; 
reg Mll5h; 
reg [2:0] Bml5h; 
reg [2:0] Lml5h; 
assign Mgl5h = (Gcl5h & Zbl5h); 
assign Zfl5h = ((Lcl5h != 2'b0) && (Lcl5h != 2'b1)); 
assign Wgl5h = ((Mgl5h == 1'b1) && (Zfl5h == 1'b1)); 
assign Wdl5h = 2'b0; 
assign Ghl5h = (Sjl5h ? Til5h : Bkl5h); 
assign Qhl5h = ((Lml5h == Anl5h) && (Sjl5h == 1'b1)); 
assign Ail5h = ((Lml5h == Xml5h) && (Sjl5h == 1'b1)); 
always @(Ghl5h or Zcl5h or Ebl5h) begin : Mnl5h 
if (32 == 64) begin 
if (Ebl5h == 1'b1) begin 
case (Ghl5h[2]) 
1'b1: 
Kil5h = Zcl5h[31:0]; 
1'b0: 
Kil5h = Zcl5h[63:32]; 
endcase 
end 
else 
begin 
case (Ghl5h[2]) 
1'b0: 
Kil5h = Zcl5h[31:0]; 
1'b1: 
Kil5h = Zcl5h[63:32]; 
endcase 
end 
end 
else if (32 == 128) begin 
if (Ebl5h == 1'b1) begin 
case (Ghl5h[3:2]) 
2'b11: 
Kil5h = Zcl5h[31:0]; 
2'b10: 
Kil5h = Zcl5h[63:32]; 
2'b1: 
Kil5h = Zcl5h[95:64]; 
2'b0: 
Kil5h = Zcl5h[127:96]; 
endcase 
end 
else 
begin 
case (Ghl5h[3:2]) 
2'b0: 
Kil5h = Zcl5h[31:0]; 
2'b1: 
Kil5h = Zcl5h[63:32]; 
2'b10: 
Kil5h = Zcl5h[95:64]; 
2'b11: 
Kil5h = Zcl5h[127:96]; 
endcase 
end 
end 
else if (32 == 256) begin 
if (Ebl5h == 1'b1) begin 
case (Ghl5h[4:2]) 
3'b111: 
Kil5h = Zcl5h[31:0]; 
3'b110: 
Kil5h = Zcl5h[63:32]; 
3'b101: 
Kil5h = Zcl5h[95:64]; 
3'b100: 
Kil5h = Zcl5h[127:96]; 
3'b011: 
Kil5h = Zcl5h[159:128]; 
3'b010: 
Kil5h = Zcl5h[191:160]; 
3'b1: 
Kil5h = Zcl5h[223:192]; 
3'b0: 
Kil5h = Zcl5h[255:224]; 
endcase 
end 
else 
begin 
case (Ghl5h[4:2]) 
3'b0: 
Kil5h = Zcl5h[31:0]; 
3'b1: 
Kil5h = Zcl5h[63:32]; 
3'b010: 
Kil5h = Zcl5h[95:64]; 
3'b011: 
Kil5h = Zcl5h[127:96]; 
3'b100: 
Kil5h = Zcl5h[159:128]; 
3'b101: 
Kil5h = Zcl5h[191:160]; 
3'b110: 
Kil5h = Zcl5h[223:192]; 
3'b111: 
Kil5h = Zcl5h[255:224]; 
endcase 
end 
end 
else 
begin 
Kil5h = Zcl5h[31:0]; 
end 
end 
always @(posedge Jal5h or negedge Oal5h) begin : Hol5h 
if (Oal5h == 1'b0) begin 
Lel5h <= {32 {1'b0}}; 
Cel5h <= 2'b0; 
end 
else 
begin 
if (Wal5h == 1'b1) begin 
case (Bml5h) 
Xml5h: 
if (Cll5h == 1'b1) begin 
Lel5h <= Bkl5h; 
Cel5h <= Bkl5h[1:0]; 
end 
else 
begin 
Lel5h <= Til5h; 
Cel5h <= Til5h[1:0]; 
end 
Gnl5h: begin 
Cel5h <= Cel5h; 
case (Lml5h) 
Dnl5h: 
if (Sjl5h == 1'b1) begin 
Lel5h <= Til5h; 
end 
else begin 
Lel5h <= Bkl5h; 
end 
Anl5h: 
if (Wgl5h == 1'b1) begin 
Lel5h <= Tbl5h; 
end 
else begin 
Lel5h <= Til5h; 
end 
default: 
Lel5h <= Tbl5h; 
endcase 
end 
default: begin 
Lel5h <= Lel5h; 
Cel5h <= Cel5h; 
end 
endcase 
end 
end 
end 
always @(posedge Jal5h or negedge Oal5h) begin : Sol5h 
if (Oal5h == 1'b0) begin 
Jfl5h <= 1'b0; 
end 
else 
begin 
if (Wal5h == 1'b1) begin 
case (Lml5h) 
Xml5h, Gnl5h: 
Jfl5h <= 1'b1; 
default: 
Jfl5h <= 1'b0; 
endcase 
end 
end 
end 
always @(posedge Jal5h or negedge Oal5h) begin : Fpl5h 
if (Oal5h == 1'b0) begin 
Cfl5h <= 1'b0; 
end 
else 
begin 
if (Wal5h == 1'b1) begin 
case (Bml5h) 
Xml5h: 
Cfl5h <= 1'b1; 
Gnl5h: 
Cfl5h <= 1'b0; 
default: 
Cfl5h <= Cfl5h; 
endcase 
end 
end 
end 
always @(posedge Jal5h or negedge Oal5h) begin : Rpl5h 
if (Oal5h == 1'b0) begin 
Rel5h <= {32 {1'b0}}; 
end 
else 
begin 
if (Wal5h == 1'b1) begin 
case (Bml5h) 
Xml5h: 
if (Lml5h == Uml5h) begin 
if (Mll5h == 1'b1) begin 
Rel5h <= Nkl5h; 
end 
else begin 
Rel5h <= Kil5h; 
end 
end 
else begin 
Rel5h <= Kil5h; 
end 
default: 
Rel5h <= Rel5h; 
endcase 
end 
end 
end 
always @(posedge Jal5h or negedge Oal5h) begin : Dql5h 
if (Oal5h == 1'b0) begin 
Rfl5h <= 1'b0; 
end 
else 
begin 
if (Wal5h == 1'b1) begin 
case (Bml5h) 
Xml5h, Anl5h, Gnl5h, Jnl5h: 
Rfl5h <= 1'b1; 
default: 
Rfl5h <= 1'b0; 
endcase 
end 
end 
end 
always @(posedge Jal5h or negedge Oal5h) begin : Qql5h 
if (Oal5h == 1'b0) begin 
Kdl5h <= 1'b1; 
end 
else 
begin 
case (Lml5h) 
Rml5h: 
if ((Bml5h == Gnl5h) || (Bml5h == Dnl5h)) begin 
Kdl5h <= 1'b0; 
end 
else begin 
Kdl5h <= 1'b1; 
end 
Uml5h: 
if (Wgl5h == 1'b1) begin 
Kdl5h <= 1'b0; 
end 
else if ((Bml5h == Xml5h) && (Sjl5h == 1'b0)) begin 
Kdl5h <= 1'b1; 
end 
Xml5h: 
if (Wgl5h == 1'b1) begin 
Kdl5h <= 1'b0; 
end 
else if ((Bml5h == Anl5h) && (Sjl5h == 1'b1)) begin 
Kdl5h <= 1'b0; 
end 
Anl5h: 
case (Bml5h) 
Uml5h: 
if (Sjl5h == 1'b1) begin 
Kdl5h <= 1'b0; 
end 
Dnl5h, Gnl5h: 
Kdl5h <= 1'b0; 
default: 
Kdl5h <= 1'b1; 
endcase 
Jnl5h: 
case (Bml5h) 
Dnl5h, Gnl5h: 
Kdl5h <= 1'b0; 
default: 
Kdl5h <= 1'b1; 
endcase 
Dnl5h: 
Kdl5h <= 1'b0; 
Gnl5h: 
if (Wal5h == 1'b1) begin 
Kdl5h <= 1'b1; 
end 
default: 
Kdl5h <= 1'b1; 
endcase 
end 
end 
always @(posedge Jal5h or negedge Oal5h) begin : Hrl5h 
if (Oal5h == 1'b0) begin 
Sjl5h <= 1'b0; 
end 
else 
begin 
if (Wal5h == 1'b0) begin 
case (Lml5h) 
Uml5h, Xml5h: 
if (Wgl5h == 1'b1) begin 
Sjl5h <= 1'b1; 
end 
Anl5h: 
if ((Wgl5h == 1'b0) && (Bml5h != Dnl5h)) begin 
Sjl5h <= 1'b0; 
end 
else if ((Wgl5h == 1'b1) && (Bml5h == Dnl5h)) begin 
Sjl5h <= 1'b1; 
end 
Rml5h: 
Sjl5h <= 1'b0; 
default: 
Sjl5h <= Sjl5h; 
endcase 
end 
else 
begin 
case (Lml5h) 
Uml5h, Xml5h: 
if (Wgl5h == 1'b1) begin 
Sjl5h <= 1'b1; 
end 
Anl5h: 
if (Wgl5h == 1'b0) begin 
Sjl5h <= 1'b0; 
end 
else if (Fjl5h == 1'b0) begin 
Sjl5h <= 1'b0; 
end 
Dnl5h, Rml5h: 
Sjl5h <= 1'b0; 
default: 
Sjl5h <= Sjl5h; 
endcase 
end 
end 
end 
always @(posedge Jal5h or negedge Oal5h) begin : Vrl5h 
if (Oal5h == 1'b0) begin 
Til5h <= {32 {1'b0}}; 
end 
else 
begin 
case (Lml5h) 
Uml5h, Xml5h, Anl5h: 
if (Wgl5h == 1'b1) begin 
Til5h <= Tbl5h; 
end 
default: 
Til5h <= Til5h; 
endcase 
end 
end 
always @(posedge Jal5h or negedge Oal5h) begin : Msl5h 
if (Oal5h == 1'b0) begin 
Bkl5h <= {32 {1'b0}}; 
end 
else 
begin 
case (Bml5h) 
Uml5h: 
if ((Lml5h == Rml5h) || (Lml5h == Jnl5h)) begin 
Bkl5h <= Tbl5h; 
end 
else if (Lml5h == Anl5h) begin 
if (Sjl5h == 1'b1) begin 
Bkl5h <= Til5h; 
end 
else begin 
Bkl5h <= Tbl5h; 
end 
end 
Dnl5h: 
if ((Lml5h == Rml5h) || (Lml5h == Jnl5h)) begin 
Bkl5h <= Tbl5h; 
end 
default: 
Bkl5h <= Bkl5h; 
endcase 
end 
end 
always @(posedge Jal5h or negedge Oal5h) begin : Dtl5h 
if (Oal5h == 1'b0) begin 
Fjl5h <= 1'b0; 
end 
else 
begin 
case (Lml5h) 
Uml5h, Xml5h, Anl5h: 
if (Wgl5h == 1'b1) begin 
Fjl5h <= Scl5h; 
end 
default: 
Fjl5h <= Fjl5h; 
endcase 
end 
end 
always @(posedge Jal5h or negedge Oal5h) begin : Vtl5h 
if (Oal5h == 1'b0) begin 
Nkl5h <= {32 {1'b0}}; 
end 
else 
begin 
if (Mll5h == 1'b1) begin 
Nkl5h <= Nkl5h; 
end 
else 
begin 
case (Bml5h) 
Uml5h: 
if ((Lml5h == Uml5h) || (Qhl5h == 1'b1)) begin 
Nkl5h <= Kil5h; 
end 
Anl5h: 
if (Ail5h == 1'b1) begin 
Nkl5h <= Kil5h; 
end 
default: 
Nkl5h <= Nkl5h; 
endcase 
end 
end 
end 
always @(posedge Jal5h or negedge Oal5h) begin : Pul5h 
if (Oal5h == 1'b0) begin 
Cll5h <= 1'b0; 
end 
else 
begin 
case (Bml5h) 
Uml5h: 
if (((Lml5h == Rml5h) || (Lml5h == Anl5h)) || (Lml5h == Jnl5h)) begin 
Cll5h <= 1'b1; 
end 
Xml5h: 
if (Lml5h == Uml5h) begin 
Cll5h <= 1'b0; 
end 
default: 
Cll5h <= Cll5h; 
endcase 
end 
end 
always @(posedge Jal5h or negedge Oal5h) begin : Evl5h 
if (Oal5h == 1'b0) begin 
Mll5h <= 1'b0; 
end 
else 
begin 
if ((Cll5h == 1'b1) && (Wal5h == 0)) begin 
Mll5h <= 1'b1; 
end 
else begin 
Mll5h <= 1'b0; 
end 
end 
end 
always @(posedge Jal5h or negedge Oal5h) begin : Yvl5h 
if (Oal5h == 1'b0) begin 
Lml5h <= Rml5h; 
end 
else 
begin 
Lml5h <= Bml5h; 
end 
end 
always @(Lml5h or Wgl5h or Scl5h or Wal5h or Sjl5h or Fjl5h) begin : Jwl5h 
Bml5h = Rml5h; 
case (Lml5h) 
Rml5h: begin 
if (Wgl5h == 1'b1) begin 
if (Scl5h == 1'b0) begin 
if (Wal5h == 1'b1) begin 
Bml5h = Gnl5h; 
end 
else 
begin 
Bml5h = Dnl5h; 
end 
end 
else 
begin 
Bml5h = Uml5h; 
end 
end 
end 
Uml5h: begin 
if (Wal5h == 1'b1) begin 
Bml5h = Xml5h; 
end 
else 
begin 
Bml5h = Uml5h; 
end 
end 
Xml5h: begin 
if (Wal5h == 1'b1) begin 
Bml5h = Anl5h; 
end 
else 
begin 
Bml5h = Xml5h; 
end 
end 
Jnl5h, Anl5h: begin 
if (Sjl5h == 1'b1) begin 
if (Fjl5h == 1'b1) begin 
if (Wal5h == 1'b1) begin 
Bml5h = Xml5h; 
end 
else 
begin 
Bml5h = Uml5h; 
end 
end 
else 
begin 
if (Wal5h == 1'b1) begin 
Bml5h = Gnl5h; 
end 
else 
begin 
Bml5h = Dnl5h; 
end 
end 
end 
else 
begin 
if (Wgl5h == 1'b1) begin 
if (Scl5h == 1'b0) begin 
if (Wal5h == 1'b1) begin 
Bml5h = Gnl5h; 
end 
else 
begin 
Bml5h = Dnl5h; 
end 
end 
else 
begin 
Bml5h = Uml5h; 
end 
end 
else 
begin 
Bml5h = Rml5h; 
end 
end 
end 
Dnl5h: begin 
if (Wal5h == 1'b1) begin 
Bml5h = Gnl5h; 
end 
else 
begin 
Bml5h = Dnl5h; 
end 
end 
Gnl5h: begin 
if (Wal5h == 1'b1) begin 
Bml5h = Jnl5h; 
end 
else 
begin 
Bml5h = Gnl5h; 
end 
end 
default: begin 
Bml5h = Rml5h; 
end 
endcase 
end 
endmodule 
module Ywl5h(Lel5h, Kxl5h); 
input [(32 - 1):0] Lel5h; 
output [(3 - 1):0] Kxl5h; 
wire [(16 - 1):0] Txl5h; 
assign Txl5h[0] = ((Lel5h >= 32'h01000400) && (Lel5h <= 32'h010007ff)); 
assign Txl5h[1] = ((Lel5h >= 32'h01000800) && (Lel5h <= 32'h01000bff)); 
assign Txl5h[2] = ((Lel5h >= 32'h01000c00) && (Lel5h <= 32'h01000fff)); 
assign Txl5h[3] = ((Lel5h >= 32'h00001000) && (Lel5h <= 32'h000013ff)); 
assign Txl5h[4] = ((Lel5h >= 32'h00001400) && (Lel5h <= 32'h000017ff)); 
assign Txl5h[5] = ((Lel5h >= 32'h00001800) && (Lel5h <= 32'h00001bff)); 
assign Txl5h[6] = ((Lel5h >= 32'h00001c00) && (Lel5h <= 32'h00001fff)); 
assign Txl5h[7] = ((Lel5h >= 32'h00002000) && (Lel5h <= 32'h000023ff)); 
assign Txl5h[8] = ((Lel5h >= 32'h00002400) && (Lel5h <= 32'h000027ff)); 
assign Txl5h[9] = ((Lel5h >= 32'h00002800) && (Lel5h <= 32'h00002bff)); 
assign Txl5h[10] = ((Lel5h >= 32'h00002c00) && (Lel5h <= 32'h00002fff)); 
assign Txl5h[11] = ((Lel5h >= 32'h00003000) && (Lel5h <= 32'h000033ff)); 
assign Txl5h[12] = ((Lel5h >= 32'h00003400) && (Lel5h <= 32'h000037ff)); 
assign Txl5h[13] = ((Lel5h >= 32'h00003800) && (Lel5h <= 32'h00003bff)); 
assign Txl5h[14] = ((Lel5h >= 32'h00003c00) && (Lel5h <= 32'h00003fff)); 
assign Txl5h[15] = ((Lel5h >= 32'h00004000) && (Lel5h <= 32'h000043ff)); 
assign Kxl5h[(3 - 1):0] = Txl5h[(3 - 1):0]; 
endmodule 
module Cyl5h(Ebl5h, Lel5h, Qyl5h, Bzl5h); 
input Ebl5h; 
input [(32 - 1):0] Lel5h; 
input [(32 - 1):0] Qyl5h; 
output [(256 - 1):0] Bzl5h; 
reg [(256 - 1):0] Bzl5h; 
reg [31:0] Mzl5h; 
always @(Lel5h or Qyl5h or Ebl5h) begin : Vzl5h 
`define BC265PG `APB_DATA_WIDTH
if (`BC265PG == 8) begin 
if (Ebl5h == 1'b1) begin 
case (Lel5h[1:0]) 
2'b11: 
Mzl5h = {24'b0, Qyl5h[7:0]}; 
2'b10: 
Mzl5h = {16'b0, Qyl5h[7:0], 8'b0}; 
2'b1: 
Mzl5h = {8'b0, Qyl5h[7:0], 16'b0}; 
2'b0: 
Mzl5h = {Qyl5h[7:0], 24'b0}; 
endcase 
end 
else 
begin 
case (Lel5h[1:0]) 
2'b0: 
Mzl5h = {24'b0, Qyl5h[7:0]}; 
2'b1: 
Mzl5h = {16'b0, Qyl5h[7:0], 8'b0}; 
2'b10: 
Mzl5h = {8'b0, Qyl5h[7:0], 16'b0}; 
2'b11: 
Mzl5h = {Qyl5h[7:0], 24'b0}; 
endcase 
end 
end 
else if (`BC265PG == 16) begin 
if (Ebl5h == 1'b1) begin 
case (Lel5h[1]) 
1'b1: 
Mzl5h = {16'b0, Qyl5h[7:0], Qyl5h[15:8]}; 
1'b0: 
Mzl5h = {Qyl5h[7:0], Qyl5h[15:8], 16'b0}; 
endcase 
end 
else 
begin 
case (Lel5h[1]) 
1'b0: 
Mzl5h = {16'b0, Qyl5h[15:0]}; 
1'b1: 
Mzl5h = {Qyl5h[15:0], 16'b0}; 
endcase 
end 
end 
else 
begin 
if (Ebl5h == 1'b1) begin 
Mzl5h = {Qyl5h[7:0], Qyl5h[15:8], Qyl5h[23:16], Qyl5h[31:24]}; 
end 
else 
begin 
Mzl5h = Qyl5h; 
end 
end 
end 
always @(Lel5h or Mzl5h or Ebl5h) begin : S0m5h 
if (32 == 64) begin 
if (Ebl5h == 1'b1) begin 
case (Lel5h[2]) 
1'b1: 
Bzl5h[63:0] = {32'b0, Mzl5h}; 
1'b0: 
Bzl5h[63:0] = {Mzl5h, 32'b0}; 
endcase 
end 
else 
begin 
case (Lel5h[2]) 
1'b0: 
Bzl5h[63:0] = {32'b0, Mzl5h}; 
1'b1: 
Bzl5h[63:0] = {Mzl5h, 32'b0}; 
endcase 
end 
end 
else if (32 == 128) begin 
if (Ebl5h == 1'b1) begin 
case (Lel5h[3:2]) 
2'b11: 
Bzl5h[127:0] = {96'b0, Mzl5h}; 
2'b10: 
Bzl5h[127:0] = {64'b0, Mzl5h, 32'b0}; 
2'b1: 
Bzl5h[127:0] = {32'b0, Mzl5h, 64'b0}; 
2'b0: 
Bzl5h[127:0] = {Mzl5h, 96'b0}; 
endcase 
end 
else 
begin 
case (Lel5h[3:2]) 
2'b0: 
Bzl5h[127:0] = {96'b0, Mzl5h}; 
2'b1: 
Bzl5h[127:0] = {64'b0, Mzl5h, 32'b0}; 
2'b10: 
Bzl5h[127:0] = {32'b0, Mzl5h, 64'b0}; 
2'b11: 
Bzl5h[127:0] = {Mzl5h, 96'b0}; 
endcase 
end 
end 
else if (32 == 256) begin 
if (Ebl5h == 1'b1) begin 
case (Lel5h[4:2]) 
3'b111: 
Bzl5h = {224'b0, Mzl5h}; 
3'b110: 
Bzl5h = {192'b0, Mzl5h, 32'b0}; 
3'b101: 
Bzl5h = {160'b0, Mzl5h, 64'b0}; 
3'b100: 
Bzl5h = {128'b0, Mzl5h, 96'b0}; 
3'b011: 
Bzl5h = {96'b0, Mzl5h, 128'b0}; 
3'b010: 
Bzl5h = {64'b0, Mzl5h, 160'b0}; 
3'b1: 
Bzl5h = {32'b0, Mzl5h, 192'b0}; 
3'b0: 
Bzl5h = {Mzl5h, 224'b0}; 
endcase 
end 
else 
begin 
case (Lel5h[4:2]) 
3'b0: 
Bzl5h = {224'b0, Mzl5h}; 
3'b1: 
Bzl5h = {192'b0, Mzl5h, 32'b0}; 
3'b010: 
Bzl5h = {160'b0, Mzl5h, 64'b0}; 
3'b011: 
Bzl5h = {128'b0, Mzl5h, 96'b0}; 
3'b100: 
Bzl5h = {96'b0, Mzl5h, 128'b0}; 
3'b101: 
Bzl5h = {64'b0, Mzl5h, 160'b0}; 
3'b110: 
Bzl5h = {32'b0, Mzl5h, 192'b0}; 
3'b111: 
Bzl5h = {Mzl5h, 224'b0}; 
endcase 
end 
end 
else 
begin 
Bzl5h[31:0] = Mzl5h; 
end 
end 
endmodule 
module P1m5h(Kxl5h, D2m5h, N2m5h); 
input [(3 - 1):0] Kxl5h; 
input [((`BC265PG * 3) - 1):0] D2m5h; 
output [(`BC265PG - 1):0] N2m5h; 
reg [(`BC265PG - 1):0] N2m5h; 
integer Y2m5h; 
always @(Kxl5h or D2m5h) begin : A3m5h 
N2m5h = D2m5h[(`BC265PG - 1):0]; 
for (Y2m5h = 1; (Y2m5h < 3); Y2m5h = (Y2m5h + 1)) begin 
if (Kxl5h[Y2m5h] == 1'b1) begin 
N2m5h = (D2m5h >> (Y2m5h * `BC265PG)); 
end 
end 
end 
endmodule 
module R3m5h(Rfl5h, Kxl5h, D4m5h); 
input Rfl5h; 
input [(3 - 1):0] Kxl5h; 
output [(3 - 1):0] D4m5h; 
reg [(3 - 1):0] D4m5h; 
always @(Kxl5h or Rfl5h) begin : M4m5h 
if (Rfl5h == 1'b1) begin 
D4m5h = Kxl5h; 
end 
else 
begin 
D4m5h = {3 {1'b0}}; 
end 
end 
endmodule 
module W4m5h(Ebl5h, Lel5h, Rel5h, I5m5h); 
input Ebl5h; 
input [1:0] Lel5h; 
input [(32 - 1):0] Rel5h; 
output [(32 - 1):0] I5m5h; 
reg [(32 - 1):0] I5m5h; 
always @(Lel5h or Rel5h or Ebl5h) begin : T5m5h 
if (`BC265PG == 16) begin 
if (Ebl5h == 1'b1) begin 
case (Lel5h[1]) 
1'b1: 
I5m5h[15:0] = {Rel5h[7:0], Rel5h[15:8]}; 
1'b0: 
I5m5h[15:0] = {Rel5h[23:16], Rel5h[31:24]}; 
endcase 
end 
else 
begin 
case (Lel5h[1]) 
1'b0: 
I5m5h[15:0] = Rel5h[15:0]; 
1'b1: 
I5m5h[15:0] = Rel5h[31:16]; 
endcase 
end 
end 
else if (`BC265PG == 8) begin 
if (Ebl5h == 1'b1) begin 
case (Lel5h[1:0]) 
2'b11: 
I5m5h[7:0] = Rel5h[7:0]; 
2'b10: 
I5m5h[7:0] = Rel5h[15:8]; 
2'b1: 
I5m5h[7:0] = Rel5h[23:16]; 
2'b0: 
I5m5h[7:0] = Rel5h[31:24]; 
endcase 
end 
else 
begin 
case (Lel5h[1:0]) 
2'b0: 
I5m5h[7:0] = Rel5h[7:0]; 
2'b1: 
I5m5h[7:0] = Rel5h[15:8]; 
2'b10: 
I5m5h[7:0] = Rel5h[23:16]; 
2'b11: 
I5m5h[7:0] = Rel5h[31:24]; 
endcase 
end 
end 
else 
begin 
if (Ebl5h == 1'b1) begin 
I5m5h = {Rel5h[7:0], Rel5h[15:8], Rel5h[23:16], Rel5h[31:24]}; 
end 
else 
begin 
I5m5h = Rel5h; 
end 
end 
end 
endmodule 
module apb_wrapper (hclk, hresetn, haddr, hready, hsel, htrans, hwrite, hsize, hburst, 
hresp, hready_resp, hwdata, hrdata, pclk_en, paddr, penable, pwrite, pwdata,  
psel_s2, psel_s1, psel_s0, prdata_s2, prdata_s1, prdata_s0, pslverr_s0,pready_s0,pslverr_s1,pready_s1,pslverr_s2,pready_s2);

input pready_s0;
input pslverr_s0;
input pready_s1;
input pslverr_s1;
input pready_s2;
input pslverr_s2;
input hclk; 
input hresetn; 
input [(32 - 1):0] haddr; 
input hready; 
input hsel; 
input [(2 - 1):0] htrans; 
input hwrite; 
input [(3 - 1):0] hsize; 
input [(3 - 1):0] hburst; 
input [(32 - 1):0] hwdata; 
output [(32 - 1):0] hrdata; 
output hready_resp; 
output [(2 - 1):0] hresp; 
input pclk_en; 
output [(32 - 1):0] paddr; 
output penable; 
output psel_s0; 
output psel_s1; 
output psel_s2; 
output [(`BC265PG - 1):0] pwdata; 
output pwrite; 
input [(`BC265PG - 1):0] prdata_s0; 
input [(`BC265PG - 1):0] prdata_s1; 
input [(`BC265PG - 1):0] prdata_s2; 
wire [(`BC265PG - 1):0] Y9m5h; 
wire [(`BC265PG - 1):0] Iam5h; 
wire [(`BC265PG - 1):0] Sam5h; 
wire [(`BC265PG - 1):0] Cbm5h; 
wire [(`BC265PG - 1):0] Mbm5h; 
wire [(`BC265PG - 1):0] Wbm5h; 
wire [(`BC265PG - 1):0] Gcm5h; 
wire [(`BC265PG - 1):0] Qcm5h; 
wire [(`BC265PG - 1):0] Bdm5h; 
wire [(`BC265PG - 1):0] Mdm5h; 
wire [(`BC265PG - 1):0] Xdm5h; 
wire [(`BC265PG - 1):0] Iem5h; 
wire [(`BC265PG - 1):0] Tem5h; 
wire Efm5h; 
wire Mfm5h; 
wire Ufm5h; 
wire Cgm5h; 
wire Kgm5h; 
wire Sgm5h; 
wire Ahm5h; 
wire Ihm5h; 
wire Rhm5h; 
wire Aim5h; 
wire Jim5h; 
wire Sim5h; 
wire Bjm5h; 
wire [((`BC265PG * 3) - 1):0] D2m5h; 
wire [(512 - 1):0] Kjm5h; 
wire Ebl5h; 
wire [(`BC265PG - 1):0] N2m5h; 
wire [(32 - 1):0] Rel5h; 
reg [(32 - 1):0] Qyl5h; 
wire [(256 - 1):0] Bzl5h; 
reg [(256 - 1):0] Zcl5h; 
wire [(32 - 1):0] I5m5h; 
wire Rfl5h; 
wire [(16 - 1):0] D4m5h; 
wire [(3 - 1):0] Kxl5h; 
wire [1:0] Cel5h; 
assign Ebl5h = 0; 
assign pwdata = I5m5h[(`BC265PG - 1):0]; 
assign hrdata[(32 - 1):0] = Bzl5h[(32 - 1):0]; 
assign Kjm5h[(`BC265PG - 1):0] = prdata_s0; 
assign Kjm5h[((`BC265PG * 2) - 1):`BC265PG] = prdata_s1; 
assign Kjm5h[((`BC265PG * 3) - 1):(`BC265PG * 2)] = prdata_s2; 
assign Kjm5h[((`BC265PG * 4) - 1):(`BC265PG * 3)] = Y9m5h; 
assign Kjm5h[((`BC265PG * 5) - 1):(`BC265PG * 4)] = Iam5h; 
assign Kjm5h[((`BC265PG * 6) - 1):(`BC265PG * 5)] = Sam5h; 
assign Kjm5h[((`BC265PG * 7) - 1):(`BC265PG * 6)] = Cbm5h; 
assign Kjm5h[((`BC265PG * 8) - 1):(`BC265PG * 7)] = Mbm5h; 
assign Kjm5h[((`BC265PG * 9) - 1):(`BC265PG * 8)] = Wbm5h; 
assign Kjm5h[((`BC265PG * 10) - 1):(`BC265PG * 9)] = Gcm5h; 
assign Kjm5h[((`BC265PG * 11) - 1):(`BC265PG * 10)] = Qcm5h; 
assign Kjm5h[((`BC265PG * 12) - 1):(`BC265PG * 11)] = Bdm5h; 
assign Kjm5h[((`BC265PG * 13) - 1):(`BC265PG * 12)] = Mdm5h; 
assign Kjm5h[((`BC265PG * 14) - 1):(`BC265PG * 13)] = Xdm5h; 
assign Kjm5h[((`BC265PG * 15) - 1):(`BC265PG * 14)] = Iem5h; 
assign Kjm5h[((`BC265PG * 16) - 1):(`BC265PG * 15)] = Tem5h; 
assign D2m5h = Kjm5h[((`BC265PG * 3) - 1):0]; 
assign psel_s0 = D4m5h[0]; 
assign psel_s1 = D4m5h[1]; 
assign psel_s2 = D4m5h[2]; 
assign Efm5h = D4m5h[3]; 
assign Mfm5h = D4m5h[4]; 
assign Ufm5h = D4m5h[5]; 
assign Cgm5h = D4m5h[6]; 
assign Kgm5h = D4m5h[7]; 
assign Sgm5h = D4m5h[8]; 
assign Ahm5h = D4m5h[9]; 
assign Ihm5h = D4m5h[10]; 
assign Rhm5h = D4m5h[11]; 
assign Aim5h = D4m5h[12]; 
assign Jim5h = D4m5h[13]; 
assign Sim5h = D4m5h[14]; 
assign Bjm5h = D4m5h[15]; 
V9l5h Yjm5h( .Ebl5h (Ebl5h),  .Jal5h (hclk),  .Oal5h (hresetn),  .Tbl5h (haddr), 
.Zbl5h (hready),  .Gcl5h (hsel),  .Lcl5h (htrans),  .Scl5h (hwrite),  .Zcl5h 
(Zcl5h),  .Kdl5h (hready_resp),  .Wdl5h (hresp),  .Wal5h (pclk_en),  .Lel5h 
(paddr),  .Cel5h (Cel5h),  .Rel5h (Rel5h),  .Cfl5h (pwrite),  .Jfl5h (penable),  
.Rfl5h (Rfl5h)); 
Ywl5h Okm5h( .Lel5h (paddr),  .Kxl5h (Kxl5h)); 
W4m5h Clm5h( .Ebl5h (Ebl5h),  .Lel5h (Cel5h),  .Rel5h (Rel5h),  .I5m5h (I5m5h)); 
Cyl5h Qlm5h( .Ebl5h (Ebl5h),  .Lel5h (paddr),  .Qyl5h (Qyl5h),  .Bzl5h (Bzl5h)); 
P1m5h Gmm5h( .Kxl5h (Kxl5h),  .D2m5h (D2m5h),  .N2m5h (N2m5h)); 
R3m5h Wmm5h( .Rfl5h (Rfl5h),  .Kxl5h (Kxl5h),  .D4m5h (D4m5h[(3 - 1):0])); 
always @(hwdata) begin 
Zcl5h = {256 {1'b0}}; 
Zcl5h[(32 - 1):0] = hwdata[(32 - 1):0]; 
end 
always @(N2m5h) begin 
Qyl5h = {32 {1'b0}}; 
Qyl5h[(`BC265PG - 1):0] = N2m5h; 
end 
endmodule 
