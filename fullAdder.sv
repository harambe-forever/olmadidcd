`timescale 1ns / 1ps


module pp4fullAdder(input logic [7:0] PC,
output logic [7:0] s,
output logic cout );

logic [7:0] b;
assign b = 8'h01;
wire [8:0] c;
assign c=PC+b;
assign cout=c[8];
assign s=c[7:0];
endmodule