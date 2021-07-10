`timescale 1ns / 1ps

module PCPlus(
input reg [7:0] old_pc,
output reg[7:0] new_pc
    );
    
    assign new_pc = old_pc + 1;
endmodule
