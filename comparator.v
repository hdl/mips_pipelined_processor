module Compare(input[31:0] RdData1, 
               input[31:0] RdData2, 
               output reg sel);

always @ (RdData1 or RdData2) begin
     if(RdData1 & RdData2)
       assign sel = 1;
     else
       assign sel = 0;
end 

endmodule



