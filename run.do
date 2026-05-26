vlib work
vlog *.v
vsim -voptargs=+acc work.top_tb 
add wave clk
add wave rst
add wave top.processor.controller.MemWrite
add wave top.processor.controller.RegWrite
add wave top.processor.controller.ImmSrc
add wave top.processor.controller.ALUSrc
add wave top.processor.controller.ALUControl
add wave top.processor.controller.ResultSrc
add wave top.processor.controller.PCSrc
add wave top.ROM.A
add wave top.processor.Datapath.Instr
add wave top.processor.Datapath.Register_File.A1
add wave top.processor.Datapath.Register_File.A2
add wave top.processor.Datapath.Register_File.A3
add wave top.processor.Datapath.Register_File.WD3
add wave top.processor.Datapath.Register_File.RD1
add wave top.processor.Datapath.Register_File.RD2
add wave top.processor.Datapath.PCPlus4
add wave top.processor.Datapath.PCTarget
add wave top.processor.Datapath.ImmExtend.ImmExt
add wave top.RAM.A
add wave top.RAM.RD
add wave ALUResult
add wave WriteData
run -all