`timescale 1ns / 1ps

module mux19_16(input logic[2:0] d0, d1,
input logic s,
output logic [2:0] y);
assign y = s ? d1 : d0;
endmodule
