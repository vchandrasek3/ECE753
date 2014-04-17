module t_modulo_checker_small ();

reg [15:0] functional_output;
reg			clk;
reg			rst_n;

wire [15:0] out;

modulo_checker_small DUT(
.functional_output (functional_output),
.clk (clk),
.rst_n (rst_n),
.out (out)
);

initial begin
clk = 0;
rst_n = 0;

#5 
functional_output = 65535;

#20
rst_n = 1;


#5000
$stop (); 

end

always begin
#5 clk = ~clk;
end

endmodule