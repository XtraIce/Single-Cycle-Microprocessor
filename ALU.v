`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:25:25 10/31/2016 
// Design Name: 
// Module Name:    ALU 
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
module ALU#(WL = 32, SL=5)(input signed [WL-1:0]SrcA,[WL-1:0]SrcB, input [SL-1:0]sel, output signed [WL-1:0]Out, output Zero);
wire signed [WL-1:0] Q1,Q2;
//instantiation of all three 3 modules, connected together
Arithmetic_unit AU00(.a(SrcA),.b(SrcB),.select(sel[SL-3:0]),.Aout(Q1),.Zero(Zero)); //Q1 gets the Arithmetic ouput
Logic_unit 		 LU00(.a(SrcA),.b(SrcB),.select(sel[SL-2:0]),.Lout(Q2)); //Q2 gets the logic output
ALmux_unit		 MX00(.Lin(Q2),.Ain(Q1),.selectBit(sel[SL-1]),.Mout(Out));// both outputs are passed to MUX and chosen based on select[3] bit

endmodule
