module Adder(input [31:0] a, b,
              output reg [31:0] c);

always@(a or b) 
begin
  c = a + b;
end
endmodule