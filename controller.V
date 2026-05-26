module controller (
   input  [31:0] Instr,
   input  Zero, Signbit,
   output reg  PCSrc,
   output ResultSrc, MemWrite, ALUSrc, RegWrite,
   output [2:0] ALUControl,
   output [1:0] ImmSrc
);

//internal connections
wire [6:0] op;
wire [2:0] funct3;
wire funct7 , Branch;
wire [1:0] ALUop;

assign op = Instr[6:0];
assign funct3 = Instr[14:12];
assign funct7 = Instr[30]; 
//instantiation

main_decoder main_decoder (
    .op(op),
    .Branch(Branch),
    .ResultSrc(ResultSrc),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .ImmSrc(ImmSrc),
    .RegWrite(RegWrite),
    .ALUop(ALUop)
);

alu_decoder alu_decoder (
    .op5(op[5]),
    .funct7(funct7),
    .funct3(funct3),
    .ALUop(ALUop),
    .ALUControl(ALUControl)
);

// Branch decision logic
always @(*) begin
   if (Branch) begin
     case (funct3)
     3'b000: PCSrc = Zero;   //beq
     3'b001: PCSrc = !Zero;  //bnq
     3'b100: PCSrc = Signbit; //blt
    default: PCSrc = 1'b0;
    endcase
    end else begin
     PCSrc = 1'b0;
    end
end

endmodule
