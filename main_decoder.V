module main_decoder (
    input  [6:0] op,
    output reg Branch, ResultSrc, MemWrite, ALUSrc, RegWrite,
    output reg [1:0] ImmSrc, ALUop
);


always @(*) begin
    casez(op)
        7'b0000011: {RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUop} = 9'b1_00_1_0_1_0_00; // lw
        7'b0100011: {RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUop} = 9'b0_01_1_1_0_0_00; // sw
        7'b0110011: {RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUop} = 9'b1_??_0_0_0_0_10; // r-type 
        7'b1100011: {RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUop} = 9'b0_10_0_0_0_1_01; // b-type
        7'b0010011: {RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUop} = 9'b1_00_1_0_0_0_10; // addi
        default:    {RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUop} = 9'b0_00_0_0_0_0_00; 
    endcase
end

endmodule
