`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:41:50 02/21/2018 
// Design Name: 
// Module Name:    Single-Cycle_Processor 
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
module Single_Cycle_Processor #(WL=32)(input CLK,RST);

wire [6:0] CTRLSIG;//RegWrite,RegDst,ALUSrc,Branch,MemWrite,MemtoReg,Jump
wire [4:0] ALUCTRL;
reg [4:0] WriteA;
wire RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, Jump;
wire ALUZERO,PCSrc; 

wire[WL-1:0]PC,Instr,RD1,RD2,ALUResult,SIGNIMM,ReadData,SrcBWire;
reg [WL-1:0]PCnew,SrcB,Result,PCMUX1,PCPlus1,PCBranch,PCJump;
reg [WL/8:0]WriteReg;

assign RegWrite = CTRLSIG[6];
assign RegDst = CTRLSIG[5];
assign ALUSrc = CTRLSIG[4];
assign Branch = CTRLSIG[3];
assign MemWrite = CTRLSIG[2];
assign MemtoReg = CTRLSIG[1];
assign Jump = CTRLSIG[0];
Control_Unit CU00(.RST(RST),.OPCODES(Instr[WL-1:WL-6]), .Funct(Instr[WL/8+1:0]), .CTRLFLAGS(CTRLSIG), .ALUSelect(ALUCTRL));

instruction_memory IM00 (.addr_A(PC),.inst_RD(Instr) );

WFRegisterFile RF00 (.RST(RST),.CLK(CLK),.write_en(RegWrite),.RA1(Instr[/*(WL-(WL/4)+1)*/25:21/*((WL/2)+(WL/8)+1)*/]),.RA2(Instr[/*WL/2+WL/8*/20:16/*WL/2*/]),.WA3(WriteA),.WD3(Result),.RD1(RD1),.RD2(RD2));

ALU A00(.SrcA(RD1),.SrcB(SrcBWire),.sel(ALUCTRL), .Zero(ALUZERO), .Out(ALUResult));

SignExtend SE00(.immediate(Instr[(WL/2)-1:0]),.SignImm(SIGNIMM));

data_memory DM00(.CLK(CLK),.write_en(MemWrite),.A(ALUResult),.RD(ReadData),.WD(RD2));

PC_ProgramCounter PC00(.CLK(CLK),.RST(RST),.nextPC(PCnew),.PC(PC));

and(PCSrc,Branch,ALUZERO); //Decides if Branching occurs
/*assign PCBranch = PCPlus1 + SIGNIMM;
assign PCPlus1 = PC + 1;//adder
assign PC = PCnew;
assign PCJump = {PCPlus1,Instr[(WL-(WL/8)-1):0]};
assign WriteA = WriteReg;
*/
assign SrcBWire = SrcB;
always @(*)begin
PCPlus1 = PC+1;
PCBranch = PCPlus1+SIGNIMM;
if(RegDst)
	WriteReg = Instr[(WL/2)-1:(WL/4)+(WL/8)-1];
else
	WriteReg = Instr[(WL/2)+(WL/8):(WL/2)];
	
if(ALUSrc)//MUX
	SrcB = SIGNIMM;
else
	SrcB = RD2;
	
if(MemtoReg)//MUX
	Result = ReadData;
else
	Result = ALUResult;

if(PCSrc) // MUX
	PCMUX1 = PCBranch;
else
	PCMUX1 = PCPlus1;

if(Jump) //MUX
	PCnew = PCJump;
else
	PCnew = PCMUX1;
	
PCJump = {PC[31:26],Instr[25:0]};	
WriteA = WriteReg;
	
end

endmodule
