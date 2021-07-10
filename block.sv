`timescale 1ns / 1ps

module block();
logic clk;

initial begin
clk = 0;
forever #10 clk = ~clk;
end


wire[15:0] RD;
reg [7:0] pcout, pcin;
wire[7:0] rd1, rd2, ALUout, RDDM, muxDataMemOut; //RDDM: read data data memory

wire[5:0] imm;
wire [2:0] obd, bu, sa, value4;
assign imm = RD[5:0];
assign obd = RD[12:10]; //obd = onbir dokuz destin
assign bu = RD[6:4]; //bu = bes uc son reg
assign sa = RD[9:7]; //sa = sekiz alti ilk reg

assign value4 = 3'b111;

wire coutpp4, coutpp8;
wire[7:0] sppd, spps;
wire RegWrite, ALUsrc, MemWrite, MemToReg, Branch, CheckCond;
wire[1:0] RegSrc, ALUctrl;
wire [2:0] muxra1out, muxra2out;
wire [3:0] ALUflags;
logic [2:0] b, c;

muxpc pcmux(sppd, muxDataMemOut, Branch, pcin);
CLOCK clock(pcin, clk, pcout);
instructionMemory im(clk,pcout,RD);
instruction inst(clk, RD, ALUctrl, ALUout, ALUflags);
pp4fullAdder pp4fa(pcout, sppd, coutpp4);
mux19_16 muxra1(sa, value4, RegSrc[0], muxra1out);
mux19_16 muxra2(bu, obd, RegSrc[1], muxra2out);
pp4fullAdder pp8fa(sppd, spps, coutpp8);
controlUnit control(RD, RegSrc, ALUctrl, RegWrite, ALUsrc, MemWrite, MemToReg, Branch, CheckCond);
RegisterFile rf(muxra1out, muxra2out, obd, RegWrite, clk, muxDataMemOut, rd1, rd2);
ALU alu(rd1, rd2, ALUctrl, ALUout, ALUflags); 
DataMemory dataMemory(ALUout, MemWrite, clk, rd2, RDDM);
muxDataMem muxdataMem(ALUout, RDDM, MemToReg, muxDataMemOut);

initial begin
assign pcin = 8'h00; #100;
/*pcin = 8'h01; #100;
pcin = 8'h02; #100;
pcin = 8'h03; #100;
pcin = 8'h04; #100;
pcin = 8'h05; #100;
pcin = 8'h06; #100;
pcin = 8'h07; #100;
pcin = 8'h08; #100;*/
end
endmodule