`timescale 1 ns /100 ps
module RegFile(input[4:0] RdAddr1, 
                            input[4:0] RdAddr2, 
                            output reg[31:0] RdData1, 
                            output reg[31:0] RdData2,
                            input[4:0] WrAddr, 
                            input[31:0] WrData, 
                            input WriteReg, 
                            input reset, 
                            input clk);
  
  
  
reg [31:0] registerfile[31:0];

always@ (posedge clk) begin
  if (reset == 0 && WriteReg == 1)begin
     registerfile[WrAddr] <= WrData;
   end
 else begin
   if (reset == 1) begin
        registerfile[0] <= 0;
        registerfile[1] <= 0;
        registerfile[2] <= 0;
        registerfile[3] <= 0;
        registerfile[4] <= 0;
        registerfile[5] <= 0;
        registerfile[6] <= 0;
        registerfile[7] <= 0;
        registerfile[8] <= 0;
        registerfile[9] <= 0;
        registerfile[10] <= 0;
        registerfile[11] <= 0;
        registerfile[12] <= 0;
        registerfile[13] <= 0;
        registerfile[14] <= 0;
        registerfile[15] <= 0;
        registerfile[16] <= 0;
        registerfile[17] <= 0;
        registerfile[18] <= 0;
        registerfile[19] <= 0;
        registerfile[20] <= 0;
        registerfile[21] <= 0;
        registerfile[22] <= 0;
        registerfile[23] <= 0;
        registerfile[24] <= 0;
        registerfile[25] <= 0;
        registerfile[26] <= 0;
        registerfile[27] <= 0;
        registerfile[28] <= 0;
        registerfile[29] <= 0;
        registerfile[30] <= 0;
        registerfile[31] <= 0;
    end
  end

  #4
  if (reset == 0) begin
   RdData1 <= registerfile[RdAddr1];
   RdData2 <= registerfile[RdAddr2];
 end
 else begin
   RdData1 <= 0;
   RdData2 <= 0;
   end
end

endmodule

