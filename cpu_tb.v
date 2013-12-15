`timescale 1 ns /100 ps

module cpu_tb();
reg clk, reset;

cpu super_processor(clk, reset);

initial
begin
  clk = 0;
  reset = 1;
end

always #100 clk=~clk;

initial 
begin
  #625 reset =0;
end

endmodule

