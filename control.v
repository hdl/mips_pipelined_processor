module Control(input [5:0] opcode,
               output [8:0] control_out);

reg [8:0] instruction;
    
always @ (opcode)
begin
case(opcode)
  6'b000000: instruction <= 9'b100001000; // add
  6'b001000: instruction <= 9'b100000000; // addi
  6'b000100: instruction <= 9'b001000100; // beq
  6'b000010: instruction <= 9'b001000110; // j 
  6'b100011: instruction <= 9'b010101100; // lw
  6'b101011: instruction <= 9'b010010000; // sw
  6'b111111: instruction <= 9'b000000001; // HLT
  default:   instruction <= 9'b000000000; 
endcase

end

assign RegDst =   instruction[8];
assign ALUSrc =   instruction[7];
assign Branch =   instruction[6];
assign MemRead =  instruction[5];
assign MemWrite = instruction[4];
assign RegWrite = instruction[3];
assign MemtoReg = instruction[2];
assign Jump =     instruction[1];
assign HLT =      instruction[0];  //End the program
 
assign control_out = instruction; 

endmodule



