`timescale 1ns / 1ps

module CLOCK(input logic[15:0] PCin, input logic clk, 
output logic[15:0] PCout);
logic CLK = 0;
initial begin
forever #100 CLK = ~CLK;
end

always @(posedge CLK)  
        PCout = PCin;

endmodule
