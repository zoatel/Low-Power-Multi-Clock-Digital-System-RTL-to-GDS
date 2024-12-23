module RST_SYNC #(
    parameter NUM_STAGES = 2
) (
    input  wire     CLK,
    input  wire     RST,
    output wire     SYNC_RST
);
/*
reg [NUM_STAGES - 1 : 0] sync_reg;

integer i;

always @(posedge CLK, negedge RST) 
begin
    if(!RST)
        begin
            sync_reg <= 'b0;
        end
    else
        begin
            sync_reg[0] <= 1'b1;
            for(i = 0; i < (NUM_STAGES - 1); i = i + 1)
                sync_reg[i + 1] <= sync_reg [i];
                
            SYNC_RST <= sync_reg[NUM_STAGES - 1];
        end
end
*/

		
reg   [NUM_STAGES-1:0]    sync_reg;

always @(posedge CLK or negedge RST)
 begin
  if(!RST)      // active low
   begin
    sync_reg <= 'b0 ;
   end
  else
   begin
    sync_reg <= {sync_reg[NUM_STAGES-2:0],1'b1} ;
   end  
 end
 
 
assign  SYNC_RST = sync_reg[NUM_STAGES-1] ;
 
endmodule
