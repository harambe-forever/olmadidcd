`timescale 1ns / 1ps


module instructionMemory(input logic clk,input logic [7:0] PC,
output reg [15:0] RD);
reg [15:0] rf1 [7:0];
               //151413 121110 987 654 32 10
/*initial rf1[0] = 16'b000_000_001_010_00_00;  // op reg1:0 reg2:1 reg3:2 add
initial rf1[1] = 16'b000_001_011_001_00_11;  // op reg1:1 reg2:3 reg3:1 or 
initial rf1[2] = 16'b000_111_101_110_00_10;  // and
initial rf1[3] = 16'b010_001_010_011_00_00;  // load
initial rf1[4] = 16'b100_111_111_000_00_00;  // beq
initial rf1[5] = 16'b011_101_010_001_00_00;  // store
initial rf1[6] = 16'b001_111_001_010_01_00;  // add imm;*/

initial rf1[0] = 16'b010_010_001_001_10_10;
initial rf1[1] = 16'b001_011_010_000_01_01;
initial rf1[2] = 16'b000_100_011_010_00_00;
initial rf1[3] = 16'b001_000_001_111_11_11;
always@(posedge clk )
RD <= rf1[PC];
endmodule
