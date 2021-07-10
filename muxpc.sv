`timescale 1ns / 1ps

module muxpc(input reg[7:0] d0, d1,
input logic s,
output reg [7:0] y);
assign y = s ? d1 : d0;
endmodule