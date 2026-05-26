module alu_decoder (
    input  op5 , funct7 ,     
    input [1:0] ALUop,
    input [2:0] funct3,
    output reg [2:0] ALUControl
);

wire funct75;
assign funct75 = op5 & funct7; 

always @(*) begin
    casez ({ALUop,funct3,funct75})
        // lw and sw operations
        6'b00_???_? : ALUControl = 3'b000; // add
        // b-type operations
        6'b01_000_? : ALUControl = 3'b010; // beq
        6'b01_001_? : ALUControl = 3'b010; // bne
        6'b01_100_? : ALUControl = 3'b010; // blt
        // r-type operations
        6'b10_000_0 : ALUControl = 3'b000; // add
        6'b10_000_1 : ALUControl = 3'b010; // sub
        6'b10_001_? : ALUControl = 3'b001; // sll
        6'b10_100_? : ALUControl = 3'b100; // xor
        6'b10_101_? : ALUControl = 3'b101; // srl
        6'b10_110_? : ALUControl = 3'b110; // or
        6'b10_111_? : ALUControl = 3'b111; // and
        default: ALUControl = 3'b000; 
    endcase
end

endmodule
