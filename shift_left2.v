module shift_left2(input [31:0] a,
                  output [31:0] b);

reg [31:0] temp;

always@(a)
begin
temp[31:2] = a[29:0];
temp[1:0] = 0;
end

assign b = a;

endmodule
