`timescale 1ns / 1ps

module extend(
    input logic [7:0] imm,
    input logic immSrc, // 0: 8 bit. extend etmeye gerek yok. 1: 6 bit. extend etmek gerekiyor
    output logic [7:0] extImm
    );

    always @* begin
        if(immSrc == 1)begin
            extImm[7:6] <= 0;
            extImm[5:0] <= imm[5:0];
        end
        else
            extImm <= imm;
    end
    
endmodule
