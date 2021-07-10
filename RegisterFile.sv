`timescale 1ns / 1ps

module RegisterFile(
    input logic [2:0] a1, a2, a3,
    input logic we, clk,
    input logic [7:0] wd,
    input logic [7:0] r7,
    output logic [7:0] rd1, rd2
    );
    
    reg [7:0] rf [7:0];
    
    initial begin   
    rf[0] = 8'h00;
    rf[1] = 8'h00;
    rf[2] = 8'h00;
    rf[3] = 8'h00;
    rf[4] = 8'h00;
    rf[5] = 8'h00;
    rf[6] = 8'h00;
    end

    assign rf[7] = r7;
    
    always @ (posedge clk) begin
        rd1 <= rf[a1];
        rd2 <= rf[a2];
        if(we)
            rf[a3] <= wd;
    end
    
endmodule
