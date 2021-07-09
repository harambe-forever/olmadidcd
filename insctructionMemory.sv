`timescale 1ns / 1ps


module instructionMemory(input logic clk,input logic [15:0] PC,
output reg [15:0] RD);
reg [15:0] rf1 [3:0];

initial rf1[0] = 15'b000000000011111;
initial rf1[1] = 15'b011111100001110;
initial rf1[2] = 15'b101101111101101;
initial rf1[3] = 15'b111101111111011;

always@(posedge clk )
RD <= rf1[PC];
endmodule
