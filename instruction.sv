`timescale 1ns / 1ps


module instruction(input logic clk, input logic[15:0] INS,
input logic[1:0] ALUctrl, output logic[7:0] y, output logic[3:0] ALUflags);
wire [7:0] rd1, rd2, result;
logic v,c,n,z;
logic WE3 = 1;
logic wd3 = 4'b0000;

RegisterFile regfile1(INS[9:7],INS[6:4],INS[12:10],WE3,clk,wd3,rd1,rd2);
ALU alu1(rd1,rd2,ALUctrl,y,ALUflags);
RegisterFile regfile2(INS[9:7],INS[6:4],INS[12:10],WE,clk,result,rd1,rd2);
endmodule
