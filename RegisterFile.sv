`timescale 1ns / 1ps

module RegisterFile(
    input logic [2:0] a1, a2, a3,
    input logic we, clk,
    input logic [7:0] wd,
    output logic [7:0] rd1, rd2
    );
    
    reg [7:0] rf [7:0];
    
    initial begin
    
    rf[0] = 8'h01;
    rf[1] = 8'h02;
    rf[2] = 8'h03;
    rf[3] = 8'h04;
    rf[4] = 8'h05;
    rf[5] = 8'h06;
    rf[6] = 8'h07;
    
    end
    
    always @ (posedge clk) begin
    
        rd1 <= rf[a1];
        rd2 <= rf[a2];
        
        if(we)
            rf[a3] = wd;
    
    end
    
endmodule
