module IF_ID(input clk, 
             input reset,
             input write, 
             input [31:0] pc_plus_4, 
             input [31:0] instruction_input, 
             output reg[31:0] out, 
             output reg[31:0] pc_plus_4_out, 
             input flush); 
    
     
    always@ (posedge reset) begin
        out = 0; 
        pc_plus_4_out = 0; 
    end 
     
    always@ (posedge clk) begin
    if ((reset ==0) & (flush == 0)) begin 
        if(write) begin 
           out <= instruction_input; 
           pc_plus_4_out <= pc_plus_4; 
        end 
    else begin
        out = 0; 
        pc_plus_4_out = 0; 
      end
    end 
  end
 
endmodule 


