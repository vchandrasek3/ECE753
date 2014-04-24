module modulo_checker(
functional_output,
clk,
rst_n,
out,
done
);

localparam 	MODULO = 419;
parameter	DATA_WIDTH = 16;

/* Inputs */
input  		[DATA_WIDTH-1:0]	functional_output;
input 							clk;
input							rst_n;

/* Outputs */
output		[15:0]	out;
output		reg		done;
//output 		[15:0] 	out;

function integer log2(input integer value);
		begin
			value = value - 1;
			for (log2 = 0; value > 0; log2 = log2 + 1) begin
				value = value >> 1;
			end
		end
endfunction

localparam	OUT_WIDTH		= log2(MODULO);


reg 	[DATA_WIDTH-1:0] 		decremental_output;
reg								new_ip;
reg		[OUT_WIDTH-1:0]			dout;
//reg		[15:0]		dout;




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
		