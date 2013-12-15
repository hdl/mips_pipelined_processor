module mux_3_1 (input[31:0] in1, 
                input[31:0] in2, 
                input[31:0] in3,
                input [1:0] sel, 
                output reg[31:0] out);
  
always @(sel) 
begin
  if (sel == 2'b00)
    assign out = in1;
  else if (sel == 2'b01)
    assign out = in2;
  else
    assign out = in3;
end

endmodule