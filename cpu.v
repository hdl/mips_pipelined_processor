`timescale 1 ns /100 ps
module cpu(clk, reset);
  input clk; 
  input reset;
  wire [31:0] instr, data_out;
  wire [1:0] forwardA;
  wire [1:0] forwardB;
  wire [31:0] mux4_out;
  wire [4:0] mux5_out;
  wire [31:0] out_ALU;
  wire [1:0] WB2_output;
  wire [4:0] ID_EX_RegRt;
  wire [4:0] instruction_mux_out;
  wire [2:0] M2_output;
  wire [31:0] RdData2_out2;
  wire [31:0] ReadData_out, ALU2_out;
  wire write_IF_ID;
  wire [31:0] instr_out; 
  wire [31:0] PC_Plus4_out;
  wire [31:0] instruction_output;
  wire [31:0] outforpc_mux;
  wire mux8_select;
  wire [4:0] Inst_20_to_16; 
  wire [4:0] Inst_15_to_11;
  wire [1:0] WB3_output; 
  wire [4:0] instruction_mux2_out;
  wire [31:0] RdData1; 
  wire [31:0] RdData2; 
  wire [31:0] mux6_out; 
  wire [31:0] ssl2_br_output;
  wire [8:0] control_out;
  wire and_sel;
  wire compare_sel;
  wire [31:0] PC_out;
  wire PCWrite;
  wire [31:0] adder1output;
  wire [31:0] adder2output;
  wire [31:0] pc_out;
  wire [2:0] M_output;
  wire mux1_sel_out;
  wire [8:0] mux1_out;
  wire [1:0] WB_output;  
  wire [3:0] EX_output; 
  wire [3:0] EX_input;
  wire [31:0] RdData1_in, RdData1_out, RdData2_out, sign_ext_out;
  wire [4:0] Inst_20_to_16_out;
  wire [4:0] Inst_15_to_11_out;
  wire [4:0] Inst_25_to_21_out;
  wire [5:0] Inst_5_to_0_out;
  assign EX_input[0] = mux1_out [8];
  assign EX_input[1] = mux1_out [1];
  assign EX_input[2] = mux1_out [7];
  assign EX_input[3] = mux1_out [0];
  wire [31:0] mux2_out; 
  wire [31:0] ALU_out;
  wire [31:0] mux3_out;

  
  PC pc_register(.clk(clk), .reset(reset), .write(PCWrite), .in(pc_out), .out(PC_out));
  
  Memory memorymodule1(.inst_addr(PC_out), .instr(instr), .data_addr(ALU_out), .data_in(RdData2_out2), .mem_read(M2_output[1]), .mem_write(M2_output[2]), .data_out(data_out));
  
  Adder adder1(.a(PC_out),.b(4),.c(adder1output));  
  
  IF_ID IF_IDRegister(.clk(clk), .reset(reset), .write(write_IF_ID), .pc_plus_4(adder1output), .instruction_input(instr), .out(instruction_output), .pc_plus_4_out(PC_Plus4_out), .flush(and_sel || control_out[1]));


  //Decode
  
  Compare compare_unit(.RdData1(RdData1), .RdData2(RdData2), .sel(compare_sel));
  
  mux_2_1 mux7(.in1(adder1output), .in2(adder2output), .sel(and_sel), .out(pc_out));

  mux_2_1 mux8(.in1(pc_out), .in2(adder2output), .sel(control_out[1]), .out(outforpc_mux));

  Control control_unit(.opcode(instruction_output[31:26]), .control_out(control_out));
  
  And and_modified(.in1(compare_sel), .in2(control_out[6]), .sel(and_sel));
  
  RegFile register(.RdAddr1(instruction_output[25:21]), .RdAddr2(instruction_output[20:16]), .RdData1(RdData1), .RdData2(RdData2), .WrAddr(instmux2_out), .WrData(mux6_out), .WriteReg(WB3_output[0]), .reset(reset), .clk(clk)); 
  
  sign_extend sign_extended(.a(instruction_output[15:0]), .b(instr_out));
  
  Adder adder2(.a(adder1output), .b(ssl2_br_output), .c(adder2output));
  
  shift_left2 ssl2_br(.a(instr_out), .b(ssl2_br_output));

  Hazard_Detection_Unit Hazard(.in1(instruction_output[25:21]),.in2(instruction_output[20:16]), .in3(instruction_output[20:16]), .M_input(M_output), .pc_write(PCWrite), .write_IF_ID(write_IF_ID), .out(mux1_sel_out)); 
  
  mux_2_1 mux1(.in2(9'b0), .in1(control_out), .out(mux1_out), .sel(mux1_sel_out));
    
  ID_EX ID_EX_Register(.WB_input(mux1_out[3:2]), .M_input(mux1_out[6:4]), .EX_input(EX_input), .RdData1_in(RdData1), .RdData2_in(RdData2), .sign_ext_in(instr_out), .Inst_25_to_21_in(instr_out[25:21]), .Inst_20_to_16_in(instr_out[20:16]), .Inst_15_to_11_in(instr_out[15:11]), .Inst_5_to_0_in(instr_out[5:0]), .WB_output(WB_output), .M_output(M_output), .EX_output(EX_output), .RdData1_out(RdData1_out), .RdData2_out(RdData2_out), .sign_ext_out(sign_ext_out), .Inst_25_to_21_out(Inst_25_to_21_out), .Inst_20_to_16_out(Inst_20_to_16_out), .Inst_15_to_11_out(Inst_15_to_11_out), .Inst_5_to_0_out(Inst5to0_out), .clk(clk), .reset(reset)); 
  
  
  
  //Execute
  
  mux_2_1 mux5(.in1(instruction_output[20:16]), .in2(instruction_output[15:11]), .sel(EX_output[0]), .out(mux5_out));
  
  ALU alu(.in1(mux3_out), .in2(mux4_out), .opcode(instr_out[31:26]), .funccode(Inst5to0_out), .out(out_ALU));
  
  Forwarding_Unit testing(.EX_MEM_write(WB2_output[0]), .MEM_WB_write(WB3_output[0]), .EX_MEM_read(instruction_mux_out), .MEM_WB_read(Instmux2_out), .ID_EX_RegRs(instr_out[25:21]), .ID_EX_RegRt(ID_EX_RegRt), .forwardA(forwardA), .forwardB(forwardB)); 
  
  mux_3_1 mux2(.in1(RdData2_out), .in2(mux6_out), .in3(ALU_out), .sel(forwardB), .out(mux2_out));
  
  mux_3_1 mux3(.in1(RdData1_out), .in2(mux6_out), .in3(ALU_out), .sel(forwardA), .out(mux3_out));
  
  mux_2_1 mux4(.in1(mux2_out), .in2(sign_ext_out), .sel(EX_output[2]), .out(mux4_out));
  
  EX_MEM EX_MEM_Register(.clk(clk), .reset(reset), .WB2_input(WB_output), .M2_input(M_output), .ALU_input(out_ALU), .instruction_mux_in(mux5_out), .RdData2_in(mux2_out), .M2_output(M2_output), .WB2_output(WB2_output), .ALU_output(ALU_out), .instruction_mux_out(instruction_mux_out), .RdData2_out(RdData2_out2));
  
  
  //Memory
  Memory memorymodule2(.inst_addr(PC_out), .instr(instr), .data_addr(ALU_out), .data_in(RdData2_out2), .mem_read(M2_output[1]), .mem_write(M2_output[2]), .data_out(data_out));
  
  MEM_WB MEM_WB_Register(.clk(clk), .reset(reset), .WB3_in(WB2_output), .ReadData_in(data_out), .ALU2_in(ALU_out), .instruction_mux2_in(instruction_mux_out), .WB3_out(WB3_output), .ReadData_out(ReadData_out), .ALU2_out(ALU2_out), .instruction_mux2_out(instruction_mux2_out)); 
  
  
  //Writeback
  mux_2_1 mux6(.in1(ALU2_out), .in2(ReadData_out), .sel(WB3_output[1]), .out(mux6_out));

endmodule