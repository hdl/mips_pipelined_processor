module mux_2_1 (input [31:0] in1, 
                input [31:0] in2, 
                input sel,
                output reg[31:0] out);
  
always @(sel) 
begin
  if (!sel)
    assign out = in1;
  else 
    assign out = in2;
end

endmodule
