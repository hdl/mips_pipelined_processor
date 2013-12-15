module Forwarding_Unit(input EX_MEM_write, 
                       input MEM_WB_write,
                       input[4:0] EX_MEM_read,
                       input[4:0] MEM_WB_read,
                       input[4:0] ID_EX_RegRs,
                       input[4:0] ID_EX_RegRt,  
                       output reg[1:0] forwardA, 
                       output reg[1:0] forwardB); 
                       
    
    //If (EX/MEM.Regwrite
    //and (EX/MEM.RegisterRd != 0)
    //and (EX/MEM.RegisterRd = ID/EX.RegisterRs)) ForwardA = 10
    //forwardA = 01, source is MEM/WB
    //forwardA = 00, source is ID/EX
     
   always@(EX_MEM_write or EX_MEM_read or ID_EX_RegRs or MEM_WB_write or MEM_WB_read) begin 
      if((EX_MEM_write)&&(EX_MEM_read != 0)&&(EX_MEM_read == ID_EX_RegRs)) 
         forwardA = 2'b10; 
      else if((MEM_WB_write)&&(MEM_WB_read != 0)&&(MEM_WB_read == ID_EX_RegRs)&&(EX_MEM_read != ID_EX_RegRs) ) 
         forwardA = 2'b01; 
      else 
         forwardA = 2'b00; 
   end 
  
    //If (EX/MEM.RegWrite
    //and (EX/MEM.RegisterRd != 0)
    //and (EX/MEM.RegisterRd = ID/EX.RegisterRt)) ForwardB = 10
    //forwardB = 00, source is ID/EX
    //forwardB = 01, source is MEM/WB
   always@(MEM_WB_write or MEM_WB_read or ID_EX_RegRt or EX_MEM_read or EX_MEM_write) begin 
      if((MEM_WB_write)&&(MEM_WB_read != 0)&&(MEM_WB_read == ID_EX_RegRt)&&(EX_MEM_read != ID_EX_RegRt) ) 
         forwardB = 2'b01; 
      else if((EX_MEM_write)&&(EX_MEM_read != 0)&&(EX_MEM_read == ID_EX_RegRt)) 
         forwardB = 2'b10; 
      else  
         forwardB = 2'b00; 
   end 
 
endmodule

