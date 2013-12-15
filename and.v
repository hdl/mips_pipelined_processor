module And(in1, in2, sel);

input in1, in2;
output reg sel;

always @ (in1 or in2) begin
     if((in1 == 1) & (in2 == 1))
       assign sel = 1;
     else
       assign sel = 0;
end 

endmodule



