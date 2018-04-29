`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:55:26 10/31/2016 
// Design Name: 
// Module Name:    Arithematic_unit 
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
module Arithmetic_unit#(WL=32,SL=5)(input signed [WL-1:0]a,[WL-1:0]b, input [SL-3:0]select, output reg signed [WL-1:0]Aout, output reg [0:0]Zero);//input a, b, select, output Arith output

always @(*) begin //decides which arithmetic operation based on select's 3 least significant bits
	case (select)
		3'b000: Aout = a+b;
		3'b001:
		begin 
			Aout = a-b;
			if(Aout == 0)
				Zero = 1'b1;
			else
				Zero = 1'b0;
		end
		3'b010: 		
		begin 
			Aout = b-a;
			if(Aout == 0)
				Zero = 1'b1;
			else
				Zero = 1'b0;
		end
		3'b011: Aout = a+1;
		3'b100: Aout = b+1;
		3'b101: Aout = a-1;
		3'b110: Aout = b-1;
		3'b111: Aout = a*b;
	endcase

end

endmodule
