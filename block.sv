`timescale 1ns / 1ps

module block();
logic clk;

wire[15:0] RD; // instruction
reg [7:0] pcout;// new pc
reg [7:0] pcin; // old pc
wire[7:0] rd1, rd2; // register file output
wire[7:0] RDDM, muxDataMemOut; //RDDM: read data data memory

wire[7:0] ALUout; // ALU output

wire[5:0] imm; // 
wire [2:0] obd, bu, sa, value4; 
assign imm = RD[5:0];
assign obd = RD[12:10]; //obd = onbir dokuz destin
assign bu = RD[6:4]; //bu = bes uc son reg
assign sa = RD[9:7]; //sa = sekiz alti ilk reg

assign value4 = 3'b111;

reg[7:0] sppd; // pcout + 1 = new pcin
wire RegWrite, ALUsrc, MemWrite, MemToReg, Branch, CheckCond; // control signal
wire[1:0] RegSrc, ALUctrl; // control signals
wire [2:0] muxra1out, muxra2out; // mux before register file (reg or imm)
wire [3:0] ALUflags;

PCPlus pplus(pcout, sppd); // pc increment
muxpc pcmux(sppd, muxDataMemOut, Branch, pcin); //  checks for branch operations
CLOCK clock(pcin, clk, pcout); // clock before instruction memory, old pc = new pc
instructionMemory im(pcout,RD); // retrieves instruction from pcout address
mux19_16 muxra1(sa, value4, RegSrc[0], muxra1out); // selects register of value of pc
mux19_16 muxra2(bu, obd, RegSrc[1], muxra2out); // selects register address if we are not using immediate values
controlUnit control(RD, RegSrc, ALUctrl, RegWrite, ALUsrc, MemWrite, MemToReg, Branch, CheckCond);
RegisterFile rf(muxra1out, muxra2out, obd, RegWrite, clk, muxDataMemOut, sppd, rd1, rd2);
ALU alu(rd1, rd2, ALUctrl, ALUout, ALUflags); 
DataMemory dataMemory(ALUout, MemWrite, clk, rd2, RDDM);
muxDataMem muxdataMem(ALUout, RDDM, MemToReg, muxDataMemOut);

endmodule