module top_module(
input 			clk,
input 			rst_n,
input 	[15:0]	A,
input	[15:0]	B,
input	[15:0]	C,
output			eq
);

wire [15:0] out_residue_ip1;
wire [15:0] out_residue_ip2;

residue_ip1 inst1(
.clk (clk),
.rst_n (rst_n),
.A (A),
.B (B),
.C (C),
.out (out_residue_ip1)
);

residue_ip2 inst2(
.clk (clk),
.rst_n (rst_n),
.A (A),
.B (B),
.C (C),
.out (out_residue_ip2)
);

residue_comparator inst3(
.out_residue_ip1 (out_residue_ip1),
.out_residue_ip2 (out_residue_ip2),
.eq (eq)
);

endmodule