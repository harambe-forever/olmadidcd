`timescale 1ns / 1ps

module mux8(
input logic [7:0] d0, d1, d2, d3, d4, d5, d6, d7,
input logic [2:0] s,
output logic [7:0] y
    );
    
    wire [7:0]lowResult, highResult;
    mux4 low(d0, d1, d2, d3, s[1:0], lowResult);
    mux4 high(d4, d5, d6, d7, s[1:0], highResult);
    
    assign y = s[2] ? highResult: lowResult;
    
endmodule
