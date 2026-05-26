module ADDER (
    input  [31:0] A,
    input  [31:0] B,
    output [31:0] Y
);

//32-bit Adder
assign Y = A + B; 

endmodule
