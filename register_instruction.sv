`timescale 1ns / 1ps

module register_instruction( );
logic CLK = 0;
logic[15:0] instruction; 


instruction dut(CLK,ins);

initial begin
forever #10 CLK = ~CLK;
end

initial begin
instruction = 15'b100100101001010; #50;
instruction = 15'b100101000101010; #50;
instruction = 15'b001001010101000; #50;
instruction = 15'b111010010111000; #50;

end
endmodule
