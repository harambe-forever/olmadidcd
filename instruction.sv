`timescale 1ns / 1ps


module instruction(input logic clk, input logic[15:0] INS);
wire [7:0] rd1, rd2, result;
logic v,c,n,z;
logic WE3 = 1;
logic wd3 = 4'b0000;

registerFile regfile1(INS[8:6],INS[5:3],INS[11:9],WE3,clk,wd3,rd1,rd2);
ALU alu1(rd1,rd2,INS[13:12],result,v,c,n,z);
endmodule
