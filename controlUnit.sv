`timescale 1ns / 1ps

module controlUnit(input logic[15:0] immRD,
output logic[1:0] RegSrc, output logic RegWrite, ALUsrc, 
ALUctrl, MemWrite, MemToReg, PCSrc);
/*logic[2:0] rd, 
input logic[2:0] funct, input logic[3:0] opcode,
output logic RegSrc, RegWrite, ALUsrc, 
ALUctrl, MemWrite, MemToReg, PCSrc*/
assign cuRD = immRD[5:3];
assign cuFunct = immRD[2:0];
assign cuOP = immRD[15:12];

endmodule
