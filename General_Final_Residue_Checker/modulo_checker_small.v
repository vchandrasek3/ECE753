module modulo_checker_small(
functional_output,
clk,
rst_n,
out,
done
);

parameter 			MODULO = 65536;

/* Inputs */
input  		[15:0]	functional_output;
input 				clk;
input				rst_n;

/* Outputs */
output 	 reg [15:0] 	out;

wire done;
assign done = |out;

/*
reg			[15:0]	find_bus_select;
reg			[4:0]	count;
reg			[15:0]	dout;
reg					done;


assign out = done ? dout : 0;
*/



always @ (posedge clk)
if (!rst_n) 
	out <= 16'b0;
else begin
case (MODULO) 

		17'd2 		: out <= {15'b0,functional_output[0]};
		17'd4 		: out <= {14'b0,functional_output[1:0]};
		17'd8 		: out <= {13'b0,functional_output[2:0]};
		17'd16 		: out <= {12'b0,functional_output[3:0]};
		17'd32 		: out <= {11'b0,functional_output[4:0]};
		17'd64 		: out <= {10'b0,functional_output[5:0]};
		17'd128 	: out <= {9'b0,functional_output[6:0]};
		17'd256 	: out <= {8'b0,functional_output[7:0]};
		17'd512 	: out <= {7'b0,functional_output[8:0]};
		17'd1024 	: out <= {6'b0,functional_output[9:0]};
		17'd2048 	: out <= {5'b0,functional_output[10:0]};
		17'd4096 	: out <= {4'b0,functional_output[11:0]};
		17'd8192 	: out <= {3'b0,functional_output[12:0]};
		17'd16384 	: out <= {2'b0,functional_output[13:0]};
		17'd32768 	: out <= {1'b0,functional_output[14:0]};
		17'd65536 	: out <= {functional_output[15:0]};

endcase
end

/*

always @ (posedge clk) begin
if (!rst_n) begin
		dout <= 15'b0;
		find_bus_select <= MODULO;
end
else begin
		if (find_bus_select[0] == 0) begin
			find_bus_select <= find_bus_select >> 1;
			count <= count+1;
			done <= 0;
		end
		else begin	
			count <= count;
			done <= 1;
			dout <= find_bus_select[count-1:0];
		end
	end
end

*/

endmodule