`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:58 02/21/2018 
// Design Name: 
// Module Name:    SignExtend 
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
module SignExtend#(WL=32)(input [(WL/2)-1:0] immediate, output reg[WL-1:0] SignImm);

//assign SignImm [(WL/2)-1:0] = immediate[(WL/2)-1:0];//[15:0]
always@(*)begin

    SignImm[WL-1:0] <= { {WL/2{immediate[WL/2-1]}}, immediate[WL/2-1:0] };
end

endmodule
