`timescale 1ns / 1ps

module ALU(
    input logic [7:0] a, b,
    input logic [1:0] ALUControl,
    output logic [7:0] y, 
    output logic [3:0] flags
    );
    
    wire [7:0] adderOutput, logicAnd, logicOr;
    wire adderOverflow;
    
    wire [7:0]bWire;
    assign bWire = ALUControl[0] ? (~b): b; // negates if ALUControl[0] is 0
    
    eightBitFullAdder arithmetic(a, bWire, ALUControl[0], adderOutput, adderOverflow); // say�sal i�lemleri yapan mod�l
    
    // 000 add rd, ra, rb
    // 001 sub rd, ra, rb
    // 010 and rd, ra, rb
    // 011 or rd, ra, rb
    
    assign logicAnd = a & b;
    assign logicOr = a | b;
    
    mux4 muxResult(adderOutput, adderOutput, logicAnd, logicOr, ALUControl, y);
    
    // flaglar a�a��da ayarlanacak S�ralamas� -> N Z C V
    assign flags[3] = y[7]; // en de�erli bit 1 ise negatif oldu�undan
    assign flags[2] = &(~y);  // s�f�r
    assign flags[1] = ~ALUControl[1] & adderOverflow; //  carry
    assign flags[0] = ~(ALUControl[0] ^ a[7] ^ b[7]) & (adderOutput[7] ^ a[7]) & ~ALUControl[1];
    
endmodule
