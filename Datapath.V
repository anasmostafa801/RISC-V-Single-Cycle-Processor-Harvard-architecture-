module Datapath (
    input clk , rst , 
    input [31:0] Instr , ReadData ,
    input  RegWrite , ALUSrc , ResultSrc , PCSrc ,
    input [1:0] ImmSrc ,
    input [2:0] ALUControl ,
    output [31:0] pc , ALUResult , WriteData,
    output Zero , Signbit 
);

//internal connections
wire [31:0] pc_next , PCPlus4 , PCTarget , ImmExt , Result , RD1 , RD2 , SrcB ;

assign Signbit = ALUResult[31];
assign WriteData = RD2; 

//modules instantiations
PC PC (.pc_next(pc_next), .pc(pc), .clk(clk), .rst(rst));

MUX MUX_PC (.I0(PCPlus4), .I1(PCTarget), .sel(PCSrc), .out(pc_next));
MUX MUX_SRCB (.I0(RD2), .I1(ImmExt), .sel(ALUSrc), .out(SrcB));
MUX MUX_Result (.I0(ALUResult), .I1(ReadData), .sel(ResultSrc), .out(Result));

ADDER ADDER_PLUS4 (.A(pc), .B(32'd4), .Y(PCPlus4));
ADDER ADDER_PLUSTARGET (.A(pc), .B(ImmExt), .Y(PCTarget));

ALU ALU (.SrcA(RD1), .SrcB(SrcB), .ALUControl(ALUControl), .ALUResult(ALUResult), .Zero(Zero));

ImmExtend ImmExtend (.Imm_in(Instr), .ImmSrc(ImmSrc), .ImmExt(ImmExt));

Register_File Register_File (
    .A1(Instr[19:15]), 
    .A2(Instr[24:20]), 
    .A3(Instr[11:7]), 
    .WD3(Result), 
    .clk(clk), 
    .WE3(RegWrite), 
    .RD1(RD1), 
    .RD2(RD2)
);

endmodule
