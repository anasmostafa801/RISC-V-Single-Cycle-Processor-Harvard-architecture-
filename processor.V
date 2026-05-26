module processor (
    input clk, rst,
    input [31:0] Instr, ReadData ,
    output MemWrite ,
    output [31:0] pc, ALUResult, WriteData 
);

wire RegWrite , ALUSrc , ResultSrc , PCSrc , Zero , Signbit;  
wire [1:0] ImmSrc;
wire [2:0] ALUControl;

controller controller (
    .Instr(Instr),
    .Zero(Zero),
    .Signbit(Signbit),
    .MemWrite(MemWrite),
    .RegWrite(RegWrite),
    .ImmSrc(ImmSrc),
    .ALUSrc(ALUSrc),
    .ALUControl(ALUControl),
    .ResultSrc(ResultSrc),
    .PCSrc(PCSrc)
);

Datapath Datapath (
    .clk(clk),
    .rst(rst),
    .Instr(Instr),
    .ReadData(ReadData),
    .RegWrite(RegWrite),
    .ImmSrc(ImmSrc),
    .ALUSrc(ALUSrc),
    .ALUControl(ALUControl),
    .ResultSrc(ResultSrc),
    .PCSrc(PCSrc),
    .ALUResult(ALUResult),
    .WriteData(WriteData),
    .pc(pc),          
    .Zero(Zero),      
    .Signbit(Signbit) 
);

endmodule
