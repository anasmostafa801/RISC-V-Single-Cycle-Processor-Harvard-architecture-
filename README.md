# RISC-V-Single-Cycle-Processor-Harvard-architecture-
A 32-bit Single-Cycle RISC-V Processor Core designed and implemented in Verilog HDL using Harvard Architecture principles. The project features instruction decoding, ALU and register file integration, ROM/RAM memory systems, branching support, and full functional verification using QuestaSim waveform and simulation analysis.



#Detailed Description : 
# Single-Cycle 32-bit RISC-V Processor Core

This project presents the design, implementation, and functional verification of a 32-bit Single-Cycle RISC-V Processor Core developed using Verilog HDL. The processor follows the Harvard Architecture model by separating Instruction Memory (ROM) and Data Memory (RAM), allowing simultaneous instruction fetch and data access while avoiding structural memory hazards.

The processor was built entirely at the RTL level and includes the main architectural components required for instruction execution, including:

* Program Counter (PC)
* Instruction Memory (ROM)
* Control Unit
* Main Decoder
* ALU Decoder
* Register File
* Immediate Extension Unit
* Arithmetic Logic Unit (ALU)
* Data Memory (RAM)
* Branch and PC Control Logic
* Multiplexers and Adders

The implemented datapath supports essential RISC-V instruction types, including:

* R-Type arithmetic and logical operations
* Immediate instructions
* Load and Store operations
* Conditional branching instructions

The Control Unit generates all required control signals for datapath operation, while the ALU Decoder interprets instruction fields (`funct3`, `funct7`) to select the appropriate ALU operation. Branch instructions such as `beq`, `bne`, and `blt` are supported using dedicated branch evaluation logic based on processor status flags.

The project was verified using QuestaSim through a fully automated simulation environment that includes:

* Self-checking Verilog testbench
* Waveform analysis
* Runtime memory verification
* Automated simulation scripts

A Fibonacci program was loaded into the instruction memory using a hexadecimal initialization file (`risc.dat`) to validate processor functionality. During simulation, the processor successfully executed the program and stored the generated sequence into RAM, confirming correct instruction execution, memory access, arithmetic operations, and branch handling.

This project provided practical experience in:

* RTL Digital Design
* Computer Architecture
* Verilog HDL Development
* Processor Datapath Design
* Control Unit Design
* Hardware Verification and Simulation
* Waveform Debugging and Analysis

## Tools & Technologies

* Verilog HDL
* QuestaSim / ModelSim
* RISC-V ISA
* RTL Design Methodology

## Project Features

* 32-bit Single-Cycle Processor
* Harvard Architecture
* Word-Aligned Instruction & Data Memory
* Modular RTL Design
* Branch Control Logic
* Functional Verification Environment
* Fibonacci Program Execution Demo

