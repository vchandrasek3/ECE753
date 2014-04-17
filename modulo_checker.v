module modulo_checker(
functional_output,
clk,
rst_n,
out
);

parameter 			MODULO = 15;

/* Inputs */
input  		[15:0]	functional_output;
input 				clk;
input				rst_n;

/* Outputs */
output 		[15:0] 	out;


reg 	[15:0] 		decremental_output;
reg					new_ip;
reg		[15:0]		dout;
reg					done;


assign out = done ? dout : 0;


always @ (posedge clk) begin
if (!rst_n) begin
		decremental_output <= 0;
		dout <= 0;
		new_ip <= 1;
		done <= 0;
end
else begin
		new_ip <= 0;
	if (decremental_output > 0) begin
		decremental_output <= decremental_output - 1;
		done <= 0;
		if (dout < MODULO-1)
			dout <= dout + 1;
		else
			dout <= 0;
	end
	else begin
		decremental_output <= new_ip ? functional_output : decremental_output;
		dout <= new_ip ? 0 : dout;
		done <= new_ip ? 0 : 1;
	end
end  // else block
end // always block

endmodule
		