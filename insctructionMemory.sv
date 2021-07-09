`timescale 1ns / 1ps


module instructionMemory(input logic clk,input logic [15:0] PC,
output reg [15:0] RD);
reg [15:0] rf1 [2:0];

initial rf1[0] = 16'b0001000000011111;
initial rf1[1] = 16'b0111111100001110;
initial rf1[2] = 16'b1101101111101101;
initial rf1[3] = 16'b1111101111111011;

always@(posedge clk )
RD <= rf1[PC];
endmodule
