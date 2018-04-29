`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:54:40 10/31/2016 
// Design Name: 
// Module Name:    Logic_unit 
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
module Logic_unit#(WL=32,SL=5)(input signed [WL-1:0]a,[WL-1:0]b, input [SL-2:0]select, output reg [WL-1:0]Lout);//inputs a,b, select, and output Lout

always @(*) begin //decides which logic operation based on select's 4 least significant bits

	case (select)
		4'b0000: Lout = ~a; //NOTa
		4'b0001: Lout = ~b; //NOTb
		4'b0010: Lout = a&b;//aANDb
		4'b0011: Lout = a|b;//aORb
		4'b0100: Lout = ~(a&b);//aNANDb
		4'b0101: Lout = ~(a|b);//aNORb
		4'b0110: Lout = a^b;//aXORb
		4'b0111: Lout = a~^b;//aXNORb
		4'b1000: Lout = a<<b;//logical Lshift a by b
		4'b1001: Lout = a>>b;//logical Rshift a by b
		4'b1010: Lout = a<<<b;//arithmetic Lshift a by b
		4'b1011: Lout = a>>>b;//arithmetic Rshift a by b
		4'b1100: Lout = a<b? 1:0;//slt
	endcase

end

endmodule
