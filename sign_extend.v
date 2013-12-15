module sign_extend(input [15:0] a,
                    output reg [31:0] b);

always@(a) begin
  b = {{16{a[15]}}, a[15:0]};
end


endmodule

