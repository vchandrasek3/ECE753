module residue_ip2 (
input 			clk,
input 			rst_n,
input 	[15:0]	A,
input	[15:0]	B,
input	[15:0]	C,
output	[15:0]	out
);

wire [16:0] functional_output;
wire [15:0]	out_A;
wire [15:0]	out_B;
wire [15:0]	out_C;
wire [15:0]	out_AB;
wire [31:0]	AB;

wire rst_n_AB, rst_n_ABC;
wire done_A, done_B, done_C, done_AB, done_ABC;
assign AB = out_A * out_B;

assign rst_n_AB = done_A & done_B;
assign rst_n_ABC = done_AB & done_C;

assign functional_output = out_AB + out_C;

modulo_checker inst_A(
.functional_output (A),
.clk (clk),
.rst_n (rst_n),
.out (out_A),
.done (done_A)
);

modulo_checker inst_B(
.functional_output (B),
.clk (clk),
.rst_n (rst_n),
.out (out_B),
.done (done_B)
);

modulo_checker inst_C(
.functional_output (C),
.clk (clk),
.rst_n (rst_n),
.out (out_C),
.done (done_C)
);



modulo_checker #(
.DATA_WIDTH (32)
)
inst_AB
(
.functional_output (AB),
.clk (clk),
.rst_n (rst_n_AB),
.out (out_AB),
.done (done_AB)
);



modulo_checker #(
.DATA_WIDTH (17)
)
inst_ABC(
.functional_output (functional_output),
.clk (clk),
.rst_n (rst_n_ABC),
.out (out),
.done (done_ABC)
);


endmodule