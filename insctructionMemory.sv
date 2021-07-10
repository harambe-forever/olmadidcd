`timescale 1ns / 1ps


module instructionMemory(input logic clk,input logic [7:0] PC,
output reg [15:0] RD);
reg [15:0] rf1 [7:0];

initial rf1[0] = 16'b000_000_001_010_00_00;
initial rf1[1] = 16'b000_001_011_001_00_01;

always@(posedge clk )
RD <= rf1[PC];
endmodule
