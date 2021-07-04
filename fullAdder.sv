`timescale 1ns / 1ps


module pp4fullAdder(input logic [1:0] PC, input logic[2:0] b,
input logic cin,
output logic [7:0] s,
output logic cout );


assign b = 3'b100;
wire [8:0] c;
assign c=PC+4+cin;
assign cout=c[8];
assign s=c[7:0];
endmodule