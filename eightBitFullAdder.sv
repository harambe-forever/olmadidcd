`timescale 1ns / 1ps

module eightBitFullAdder(
    input logic [7:0] a, b,
    input logic cin,
    output logic [7:0] s,
    output logic cout
    );
    
    wire [6:0] c;
    fullbitAdder bit1(a[0], b[0], cin, s[0], c[0]);
    fullbitAdder bit2(a[1], b[1], c[0], s[1], c[1]);
    fullbitAdder bit3(a[2], b[2], c[1], s[2], c[2]);
    fullbitAdder bit4(a[3], b[3], c[2], s[3], c[3]);
    fullbitAdder bit5(a[4], b[4], c[3], s[4], c[4]);
    fullbitAdder bit6(a[5], b[5], c[4], s[5], c[5]);
    fullbitAdder bit7(a[6], b[6], c[5], s[6], c[6]);
    fullbitAdder bit8(a[7], b[7], c[6], s[7], cout);
    
endmodule
