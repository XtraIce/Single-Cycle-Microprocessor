`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:47:51 02/11/2018 
// Design Name: 
// Module Name:    CU_ALUDecoder 
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
module CU_ALUDecoder(input [5:0] Funct, [1:0] ALUOp, output reg [4:0] ALUsel);

always @(*)begin

case(ALUOp)
	2'b00: ALUsel = 5'b00000;//add
	2'b01: ALUsel = 5'b00001;//subtract
	2'b10: // check Funct
		begin
			case(Funct)
				6'b100000: ALUsel = 5'b00000;//add
				6'b100010: ALUsel = 5'b00001;//subtract
				6'b100100: ALUsel = 5'b10010;//and
				6'b100101: ALUsel = 5'b10011;//or
				6'b100010: ALUsel = 5'b00111;//mult
				6'b000000: ALUsel = 5'b11000;//sll
				6'b000010: ALUsel = 5'b11001;//srl
				6'b101010: ALUsel = 5'b11100;//slt
				default: ALUsel =5'b11111;
			endcase
		end
endcase

end
endmodule
