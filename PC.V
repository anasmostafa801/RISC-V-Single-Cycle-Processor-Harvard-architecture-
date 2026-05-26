module PC (
    input  [31:0] pc_next,
    input clk,rst,      
    output reg [31:0] pc
);

always @(posedge clk or negedge rst) begin
    if (!rst) begin
     pc <= 32'b0;
    end 
    else begin
     pc <= pc_next;
    end
end

endmodule
