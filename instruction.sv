`timescale 1ns / 1ps


module instruction(input logic clk, input logic[13:0] INS);
wire [31:0] rd1, rd2, result;
logic v,c,n,z;
logic WE3 = 1;
logic wd3 = 4'b0000;

registerFile regfile1(INS[7:4],INS[3:0],INS[11:8],WE3,clk,wd3,rd1,rd2);
ALU alu1(rd1,rd2,INS[13:12],result,v,c,n,z);
endmodule
