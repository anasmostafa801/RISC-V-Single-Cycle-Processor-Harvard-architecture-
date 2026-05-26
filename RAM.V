module RAM (
    input clk , WE,            
    input [5:0] A,              
    input [31:0] WD,           
    output [31:0] RD         
);

//2D Array
reg [31:0] ram [0:63];           

//Sync. writing
always @(posedge clk) begin
    if (WE) begin
        ram[A] <= WD;            
    end
end

//comb. reading
assign RD = ram[A];

endmodule
