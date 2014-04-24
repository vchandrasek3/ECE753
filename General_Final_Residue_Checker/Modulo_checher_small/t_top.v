module t_top_module ();

reg [15:0] 	A;
reg [15:0] 	B;
reg [15:0] 	C;
reg			clk;
reg			rst_n;

wire 		eq;

top_module DUT(
.A (A),
.B (B),
.C (C),
.clk (clk),
.rst_n (rst_n),
.eq (eq)
);

initial begin
clk = 0;
rst_n = 0;

#5 
A = 99;
B = 67;
C = 92;

#20
rst_n = 1;


#50000000
$stop (); 

end

always begin
#5 clk = ~clk;
end

endmodule