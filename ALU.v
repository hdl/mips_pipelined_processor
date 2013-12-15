module ALU (input[31:0] in1, 
            input[31:0] in2, 
            input[5:0] opcode, 
            input[5:0] funccode, 
            output[31:0] out);
  
reg [31:0] eval;


always @(opcode or funccode or in1 or in2)
begin
case (opcode)
  6'b000000: begin
    if(funccode == 6'b100000) begin
      eval = in1 + in2;
    end
    else begin
      eval = 0;
    end 
  end 
  6'b001000: begin
    eval = in1 [15:0] + in2 [15:0];
  end
  6'b000100: begin
    if (in1 == in2) begin
      eval = 0;
    end
    else begin
      eval = 0;
    end
  end
  6'b100011: begin
    eval = in1 + in2 [15:0];
  end
  6'b101011: begin
    eval = in1 + in2 [15:0];
  end
  endcase
end

assign out = eval;

endmodule



