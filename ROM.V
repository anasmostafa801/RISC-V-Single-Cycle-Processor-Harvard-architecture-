module ROM (
    input [5:0] A ,
    output [31:0] RD
);
//2D Array of  64 words each of 32-bit wide
reg [31:0] rom [0:63] ;
//comb writing  
initial $readmemh("risc.dat",rom);
//comb. fetching
assign RD = rom[A] ;

endmodule