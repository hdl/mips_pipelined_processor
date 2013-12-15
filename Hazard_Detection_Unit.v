module Hazard_Detection_Unit(input[4:0] in1, 
                             input[4:0] in2, 
                             input[4:0] in3, 
                             input[2:0] M_input, 
                             output reg pc_write, 
                             output reg write_IF_ID, 
                             output reg out); 

    always@(in1 or in2 or in3) 
    if(M_input &((in3 == in2)|(in3 == in1))) 
    begin
           pc_write = 0; 
           write_IF_ID = 0; 
           
           out = 1; 
       end 
    else 
    begin
           pc_write = 1; 
           write_IF_ID = 1; 
           out = 1; 
     
       end 
 
endmodule 


