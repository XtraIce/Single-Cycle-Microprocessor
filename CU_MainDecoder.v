`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:41:08 02/11/2018 
// Design Name: 
// Module Name:    CU_MainDecoder 
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
module CU_MainDecoder(input RST,[5:0] Opcode,output reg RegWrite,RegDst,ALUSrc,Branch,MemWrite,MemtoReg,Jump, output reg[1:0] ALUOp);
//reg RegWrite,RegDst,ALUSrc,Branch,MemWrite,MemtoReg,MemRead,Jump;

always@(*)
begin 
/*
opFlags[6]=RegWrite; //RFWE
opFlags[5]=RegDst; //RFDSel
opFlags[4]=ALUSrc; //ALUinSel
opFlags[3]=Branch; //Branch
opFlags[2]=MemWrite; //DMWE
opFlags[1]=MemtoReg; //MtoRFSel
opFlags[0]=Jump;

ALUOP
00 Add
01 Subtract
10 Look at Funct
11 Not Used
*/
if(RST)
begin
	RegWrite = 0;
	RegDst = 0;
	ALUSrc = 0;
	Branch = 0;
	MemWrite = 0;
	MemtoReg = 0;
	Jump = 0;
end

case(Opcode)
6'b000000://Rtype
begin
	RegWrite = 1;
	RegDst = 1;
	ALUSrc = 0;
	Branch = 0;
	MemWrite = 0;
	MemtoReg = 0;
	Jump = 0;
	
	ALUOp = 2'b10;
end
6'b100011://lw
begin
	RegWrite = 1;
	RegDst = 0;
	ALUSrc = 1;
	Branch = 0;
	MemWrite = 0;
	MemtoReg = 1;
	Jump = 0;
	
	ALUOp = 2'b00;
end
6'b101011://sw
begin
	RegWrite = 0;
	ALUSrc = 1;
	Branch = 0;
	MemWrite = 1;
	Jump = 0;
	
	ALUOp = 2'b00;
end

6'b001000://addi
begin 
	RegWrite = 1;
	RegDst = 0;
	ALUSrc = 1;
	Branch = 0;
	MemWrite = 0;
	MemtoReg = 0;
	Jump = 0;
	
	ALUOp = 2'b00;
end
6'b000010://j
begin 
	Jump = 1'b1;
end
6'b000100://beq
begin
	RegWrite = 0;
	ALUSrc = 0;
	Branch = 1;
	MemWrite = 0;
	Jump = 0;

	ALUOp = 2'b01;
end
default:
	begin
	RegWrite = 0;
	RegDst = 0;
	ALUSrc = 0;
	Branch = 0;
	MemWrite = 0;
	MemtoReg = 0;
	Jump = 0;
	end
endcase

end

endmodule
