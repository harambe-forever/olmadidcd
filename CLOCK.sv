`timescale 1ns / 1ps

module CLOCK(input logic[7:0] PCin, input logic clk, 
output logic[7:0] PCout);

always @(posedge clk)  
        PCout <= PCin;

endmodule
