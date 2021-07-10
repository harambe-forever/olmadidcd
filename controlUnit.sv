`timescale 1ns / 1ps

module controlUnit(input logic[15:0] immRD,
output logic[1:0] RegSrc, output logic[1:0]ALUctrl, 
output logic RegWrite, ALUsrc, MemWrite, MemToReg, Branch, CheckCond);
logic [2:0]cuRD;
assign cuRD = immRD[5:3];
logic [1:0]cuFunct;
assign cuFunct = immRD[1:0];
logic [2:0]cuOP;
assign cuOP = immRD[15:13];

logic [2:0]rd, ra;
assign rd = immRD[12:10];
assign ra = immRD[9:7];

assign MemToReg = ~cuOP[0] & cuOP[1] & ~cuOP[2];
assign MemWrite = cuOP[1] & cuOP[0];
assign RegSrc[1] = cuOP[0] & cuOP[1];
assign RegSrc[0] = (cuOP[0] | cuOP[1]) & cuOP[2];
assign RegWrite = ~cuOP[2] & (~cuOP[0] | ~cuOP[1]);
//assign Branch = cuOP[2];
always @(*)
    begin
        if(rd == ra)
            Branch <= cuOP[2];
        else
            Branch <= 2'b00;
    end
assign ALUsrc = cuOP[0] | cuOP[1] | cuOP[2];
always @(*)
    begin
        if(ALUsrc == 1'b0)
            ALUctrl <= cuFunct;
        else
            ALUctrl <= 2'b00;
    end
assign CheckCond = cuOP[2] & ~cuOP[0];
endmodule
