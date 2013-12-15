module ID_EX(input clk,
             input reset,
             input [1:0] WB_input, 
             input [2:0] M_input, 
             input [3:0] EX_input, 
             input [31:0] RdData1_in, 
             input [31:0] RdData2_in, 
             input [31:0] sign_ext_in, 
             input [4:0] Inst_25_to_21_in, 
             input [4:0] Inst_20_to_16_in, 
             input [4:0] Inst_15_to_11_in, 
             input [5:0] Inst_5_to_0_in, 
             output reg[1:0] WB_output, 
             output reg[2:0] M_output, 
             output reg[3:0] EX_output,
             output reg[31:0] RdData1_out, 
             output reg[31:0] RdData2_out, 
             output reg[31:0] sign_ext_out, 
             output reg[4:0] Inst_25_to_21_out, 
             output reg[4:0] Inst_20_to_16_out, 
             output reg[4:0] Inst_15_to_11_out, 
             output reg[5:0] Inst_5_to_0_out); 
     
    always@ (posedge reset) begin 
        WB_output = 0; 
        M_output = 0; 
        EX_output = 0; 
        RdData1_out = 0; 
        RdData2_out = 0; 
        sign_ext_out = 0; 
        Inst_15_to_11_out = 0; 
        Inst_20_to_16_out = 0; 
        Inst_25_to_21_out = 0; 
        Inst_5_to_0_out = 0;
    end 
     
    always@ (posedge clk) begin
      if(reset == 0)begin 
        WB_output <= WB_input; 
        M_output <= M_input; 
        EX_output <= EX_input; 
        RdData1_out <= RdData1_in; 
        RdData2_out <= RdData2_in; 
        sign_ext_out <= sign_ext_in; 
        Inst_15_to_11_out <= Inst_15_to_11_in; 
        Inst_20_to_16_out <= Inst_20_to_16_in; 
        Inst_25_to_21_out <= Inst_25_to_21_in; 
        Inst_5_to_0_out <= Inst_5_to_0_in;
      end
    end 
     
endmodule 


