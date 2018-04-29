`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:41:52 02/05/2018 
// Design Name: 
// Module Name:    instruction_memory 
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
module instruction_memory#(WL = 32)(input [WL-1:0]addr_A,output [WL-1:0] inst_RD );

reg [WL-1:0] inst_regs [0:WL*8-1];

assign inst_RD = inst_regs[addr_A];
initial begin
	$readmemh("prog.dat",inst_regs);
end

endmodule
