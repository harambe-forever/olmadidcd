`timescale 1ns / 1ps

module muxpc(input logic[15:0] d0, d1,
input logic s,
output logic [15:0] y);
assign y = s ? d1 : d0;
endmodule