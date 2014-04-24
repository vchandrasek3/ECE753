module residue_ip1 (
input 			clk,
input 			rst_n,
input 	[15:0]	A,
input	[15:0]	B,
input	[15:0]	C,
output	[15:0]	out
);

wire [32:0] functional_output;

assign functional_output = A*B+C;

modulo_checker #(
.DATA_WIDTH (33)
)
inst1(
.functional_output (functional_output),
.clk (clk),
.rst_n (rst_n),
.out (out),
.done ()
);

endmodule