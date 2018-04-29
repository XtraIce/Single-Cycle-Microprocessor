`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:10:32 10/31/2016 
// Design Name: 
// Module Name:    ALmux_unit 
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
module ALmux_unit #(WL = 32)(input selectBit, [WL-1:0]Lin, input signed [WL-1:0]Ain, output reg signed [WL-1:0]Mout); //inputs selectBit Lin, Ain, outputs Mux output


always @(*) begin//sensitive to all changes
	case (selectBit)//decides which unit to output to y based on select's most significant bit
	1'b0: Mout = Ain; //mux gets arith output
	1'b1: Mout = Lin; //mux gets logic output
	endcase
end

endmodule
