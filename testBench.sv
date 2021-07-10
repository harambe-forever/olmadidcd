`timescale 1ns / 1ps

module testBench();
logic clk;
initial begin
clk = 0;
forever #100 clk = ~clk;
end

wire[15:0] RD;
reg [7:0] pcout;
reg [7:0] pcin;
wire[7:0] rd1, rd2;
wire[7:0]RDDM, muxDataMemOut; //RDDM: read data data memory

wire[7:0] ALUout;

wire[5:0] imm;
wire [2:0] obd, bu, sa, value4;
assign imm = RD[5:0];
assign obd = RD[12:10]; //obd = onbir dokuz destin
assign bu = RD[6:4]; //bu = bes uc son reg
assign sa = RD[9:7]; //sa = sekiz alti ilk reg

assign value4 = 3'b111;

reg[7:0] sppd;
wire RegWrite, ALUsrc, MemWrite, MemToReg, Branch, CheckCond;
wire[1:0] RegSrc, ALUctrl;
wire [2:0] muxra1out, muxra2out;
wire [3:0] ALUflags;
logic [2:0] b, c;

PCPlus pplus(pcout, sppd);
//eightBitFullAdder pcAdder(pcout, plus1, 1'b0, sppd);

muxpc pcmux(sppd, muxDataMemOut, Branch, pcin);
CLOCK clock(pcin, clk, pcout);
instructionMemory im(pcout,RD);
//instruction inst(clk, RD, ALUctrl, ALUout, ALUflags);
mux19_16 muxra1(sa, value4, RegSrc[0], muxra1out);
mux19_16 muxra2(bu, obd, RegSrc[1], muxra2out);
controlUnit control(RD, RegSrc, ALUctrl, RegWrite, ALUsrc, MemWrite, MemToReg, Branch, CheckCond);
RegisterFile rf(muxra1out, muxra2out, obd, RegWrite, clk, muxDataMemOut, sppd, rd1, rd2);
ALU alu(rd1, rd2, ALUctrl, ALUout, ALUflags); 
DataMemory dataMemory(ALUout, MemWrite, clk, rd2, RDDM);
muxDataMem muxdataMem(ALUout, RDDM, MemToReg, muxDataMemOut);

initial begin
pcin <= 8'h00;
end

endmodule
