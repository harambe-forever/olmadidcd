`timescale 1ns / 1ps

module block();
logic clk = 0;
wire[15:0] RD, pcin, pcout, muxDataMemOut;
wire[7:0] rd1, rd2, ALUout, RDDM; //RDDM: read data data memory
assign imm = RD[5:0];
assign obd = RD[11:9]; //obd = onbir dokuz
assign bu = RD[5:3]; //bu = bes uc
assign sa = RD[8:6]; //sa = sekiz alti
wire cinpp4, coutpp4, cinpp8, coutpp8, cinpcmux;
wire [3:0] sppd, spps, muxra1out, muxra2out, ALUflags; // pp4 output, pp8 output
//logic [1:0] PC;
logic [2:0] b, c;

muxpc pcmux(sppd, muxDataMemOut, cinpcmux, pcin);
CLOCK clock(pcin, clk, pcout);
instructionMemory im(CLK,pcout,RD);
pp4fullAdder pp4fa(pcout, b, cinpp4, sppd, coutpp4);
mux19_16 muxra1(obd, 15, RegSrc, muxra1out);
mux19_16 muxra2(bu, sa, RegSrc, muxra2out);
pp4fullAdder pp8fa(sppd, c, cinpp8, spps, coutpp8);
RegisterFile rf(muxra1out, muxra2out, bu, RegWrite, clk, WD, rd1, rd2);
ALU alu(rd1, rd2, ALUctrl, ALUout, ALUflags); 
DataMemory dataMemory(ALUout, MemWrite, clk, rd2, RDDM);
muxDataMem muxdataMem(ALUout, RDDM, MemToReg, muxDataMemOut);


initial begin
forever #10 clk = ~clk;
end
/*initial begin
PC = 2'b00; #100;
PC = 2'b01; #100;
PC = 2'b10; #100;
PC = 2'b11; #100;
end*/
endmodule