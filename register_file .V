module Register_File (
    input  [4:0] A1, A2, A3,       
    input  [31:0] WD3,              
    input  clk, WE3,         
    output [31:0] RD1, RD2          
);
//2-D Array of 32 by 32 bit 
reg [31:0] rf [0:31];              

// Combin. read
assign RD1 = (A1 == 5'b00000) ? 32'b0 : rf[A1]; 
assign RD2 = (A2 == 5'b00000) ? 32'b0 : rf[A2];  

// Sync. write
always @(posedge clk) begin
    if (WE3 && (A3 != 5'b00000)) begin
        rf[A3] <= WD3;              
    end
end

endmodule
