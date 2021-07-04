`timescale 1ns / 1ps

module block();
logic CLK = 1;
wire[15:0] RD;
assign obd = RD[11:9]; //obd = onbir dokuz
assign bu = RD[5:3]; //bu = bes uc
assign sa = RD[8:6]; //sa = sekiz alti
wire cinpp4, coutpp4, cinpp8, coutpp8;
wire [3:0] sppd, spps; // pp4 output, pp8 output
logic [1:0] PC;
logic [2:0] b, c;

CLK clock(pci, CLK, pco);
instructionMemory im(CLK,PC,RD);
pp4fullAdder pp4fa(PC, b, cinpp4, sppd, coutpp4);
mux19_16 muxra1(obd, 15, RegSrc);
mux19_16 muxra2(bu, sa, RegSrc);
pp4fullAdder pp8fa(sppd, c, cinpp8, spps, coutpp8);


initial begin
forever #10 CLK = ~CLK;
end
initial begin
PC = 2'b00; #100;
PC = 2'b01; #100;
PC = 2'b10; #100;
PC = 2'b11; #100;
end
endmodule