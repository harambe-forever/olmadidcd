`timescale 1ns / 1ps

module CLOCK(input reg[7:0] PCin, input reg clk, 
output reg[7:0] PCout);

always @(posedge clk)  
        PCout <= PCin;

endmodule
