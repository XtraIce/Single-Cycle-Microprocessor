`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:55:54 02/11/2018 
// Design Name: 
// Module Name:    PC_ProgramCounter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PC_ProgramCounter#(WL = 32)(input CLK,RST,[WL-1:0] nextPC, output reg[WL-1:0] PC);

always @(posedge CLK)
begin
	if(RST)
	PC <= 0;
	else
	PC <= nextPC;
end
endmodule
