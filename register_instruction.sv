`timescale 1ns / 1ps

module register_instruction( );
logic CLK = 0;
logic[15:0] instruction; 


instructionMemory dut(CLK,ins);

initial begin
forever #10 CLK = ~CLK;
end

initial begin
instruction = 16'b000_000_001_010_00_00;
instruction = 16'b000_001_011_001_00_01;

end
endmodule
