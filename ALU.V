module ALU (
    input  [31:0] SrcA , SrcB ,
    input  [2:0]  ALUControl,
    output  Zero ,
    output reg [31:0] ALUResult
);

always @(*) begin
    case (ALUControl)
        3'b000: ALUResult = SrcA + SrcB; //add , addi
        3'b001: ALUResult = SrcA << SrcB;  //SHL
        3'b010: ALUResult = SrcA - SrcB;  //sub
        3'b100: ALUResult = SrcA ^ SrcB; // xor
        3'b101: ALUResult = SrcA >> SrcB;  // SHR
        3'b110: ALUResult = SrcA | SrcB; // or
        3'b111: ALUResult = SrcA & SrcB; // and
        default: ALUResult = 32'b0;
    endcase
end

assign Zero = (ALUResult == 32'b0);
endmodule
