`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:48:25 02/18/2018 
// Design Name: 
// Module Name:    Control_Unit 
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
module Control_Unit(input RST,[5:0]OPCODES,[5:0]Funct, output [6:0] CTRLFLAGS, [4:0]ALUSelect);


wire [1:0] ALU;

CU_MainDecoder MD00 (.Opcode(OPCODES),.RST(RST),.RegWrite(CTRLFLAGS[6]),.RegDst(CTRLFLAGS[5]),.ALUSrc(CTRLFLAGS[4]),.Branch(CTRLFLAGS[3]),.MemWrite(CTRLFLAGS[2]),.MemtoReg(CTRLFLAGS[1]),.Jump(CTRLFLAGS[0]),.ALUOp(ALU));
CU_ALUDecoder  AD00 (.Funct(Funct),.ALUOp(ALU),.ALUsel(ALUSelect));

endmodule
