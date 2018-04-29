`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:46:37 02/05/2018 
// Design Name: 
// Module Name:    WFRegisterFile 
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
module WFRegisterFile #(WL=4)(input CLK, input write_en,RST,input [WL:0] RA1,[WL:0] RA2,[WL:0] WA3,input [WL*8-1:0]WD3,output reg[WL*8-1:0] RD1,reg [WL*8-1:0] RD2);

//register file data storage
reg [WL*8-1:0] registers [0:WL*8-1];

always @(posedge CLK)
begin
	if(write_en)
		registers[WA3] <= WD3;
end
always @(*)begin
		if(registers[RA1] === 32'bx)
			RD1 = 0;
		else
			RD1 = registers[RA1];
			
		if(registers[RA2] === 32'bx)
			RD2 = 0;
		else
			RD2 = registers[RA2];
end


endmodule
