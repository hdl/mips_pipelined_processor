module PC(input clk, 
          input reset,
          input write, 
          input[31:0] in, 
          output reg[31:0] out);
  

initial begin
  out = 32'h1000;
end

always @(posedge clk or reset) 
  begin
    if (reset == 1) 
       out = 32'h1000;
    else if (clk == 1 & write)
          out = in;
  end
endmodule
