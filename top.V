module top (
    input clk , rst ,
    output [31:0] WriteData, ALUResult,
    output MemWrite 
    // The output Signals for viewing Testbench Results, they don't actually exist
);

wire [31:0] pc, Instr, ReadData;

processor processor (
    .clk(clk),
    .rst(rst),
    .Instr(Instr),
    .pc(pc),
    .ALUResult(ALUResult),
    .WriteData(WriteData),
    .ReadData(ReadData),
    .MemWrite(MemWrite)
);

ROM ROM (
    .A(pc[7:2]),   
    .RD(Instr)
);

RAM RAM (
    .clk(clk),
    .WE(MemWrite),
    .A(ALUResult[7:2]), 
    .WD(WriteData),
    .RD(ReadData)
);

endmodule
