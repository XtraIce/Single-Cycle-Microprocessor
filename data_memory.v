`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:30:49 02/05/2018 
// Design Name: 
// Module Name:    data_memory 
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
module data_memory #(WL = 32)(input CLK, write_en,RST,[WL-1:0] A, [WL-1:0] WD, output reg [WL-1:0] RD);
reg [WL-1:0] data_reg[0:WL*8-1];

always @(posedge CLK)
begin
	if(write_en)
		data_reg[A] = WD;
end
always @(*)begin
	if(data_reg[A] === 32'bx)
		RD = 0;
	else
		RD = data_reg[A];
end
endmodule
