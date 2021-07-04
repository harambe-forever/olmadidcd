`timescale 1ns / 1ps

module eightBitFullAdder(
    input logic [7:0] a, b,
    input logic cin,
    output logic [7:0] s,
    output logic cout
    );
    
    wire [8:0] c;
    assign c = a + b + cin;
    assign cout = c[8];
    assign s = c[7:0];
    
endmodule
