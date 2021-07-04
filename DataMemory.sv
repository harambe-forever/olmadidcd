`timescale 1ns / 1ps

module DataMemory(
    input logic [7:0] a,
    input logic we, clk,
    input logic [7:0] wd,
    output logic [7:0] read
    );
    
    reg [7:0] rf [255:0];
    
    always @(posedge clk)begin
        read <= rf[a];
        
        if(we)
            rf[a] <= wd;
    end
    
endmodule
