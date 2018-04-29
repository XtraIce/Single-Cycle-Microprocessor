`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:45:03 02/21/2018 
// Design Name: 
// Module Name:    Processor_tb 
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
module Processor_tb();
reg clk,rst;
Single_Cycle_Processor SCP(.CLK(clk),.RST(rst));

parameter PERIOD = 20;

initial begin: CLOCK_CYCLE
rst=1;
clk=1;
#PERIOD clk = 0;
rst = 0;
repeat(40)
#PERIOD clk = ~clk;

end

endmodule
