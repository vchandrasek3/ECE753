module reconfig_16bit ( new_x, new_y, x0, y0, x1, y1, logic_en);

output reg [15:0] new_x, new_y;
input [15:0] x0, y0, x1, y1;
input logic_en;

wire [15:0] x0_y0, x0_x1, y0_y1, x1_y1;

integer i;

//Compare signals
xor xor1 [15:0] (x0_y0, x0, y0);
xor xor2 [15:0] (x0_x1, x0, x1);
xor xor3 [15:0] (y0_y1, y0, y1);
xor xor4 [15:0] (x1_y1, x1, y1);

always @ (*) begin
	if (logic_en) begin

		for (i=0; i<=15; i=i+1) begin

			//One fault in pair 0
			if ((x0_y0[i] == 1'b0) && (x0_x1[i] == 1'b0)) begin 		//y0 fails
				new_y[i] = y1[i];
				new_x[i] = x0[i];
			end

			else if ((x0_y0[i] == 1'b0) && (y0_y1[i] == 1'b0)) begin	//x0 fails
				new_x[i] = x1[i];
				new_y[i] = y0[i];
			end
			
			//One fault in pair 1
			else if ((x1_y1[i] == 1'b0) && (x0_x1[i] == 1'b0)) begin	//y1 fails
				new_y[i] = y0[i];
				new_x[i] = x0[i];
			end

			else if ((x1_y1[i] == 1'b0) && (y0_y1[i] == 1'b0)) begin	//x1 fails
				new_x[i] = x0[i];
				new_y[i] = y0[i];
			end
			
			//Both Original pair fails
			else if ((x0_x1[i] == 1'b1) && (y0_y1[i] == 1'b0)) begin	//x0 and x1 fails
				new_x[i] = ~(y0[i]);
				new_y[i] = y0[i];
			end

			//Both Complimentary pair fails
			else if ((y0_y1[i] == 1'b1) && (x0_x1[i] == 1'b0)) begin	//y0 and y1 fails
				new_y[i] = ~x0[i];
				new_x[i] = x0[i];
			end

			//Pair 0 entirely fails
			else if ((x1_y1[i] == 1'b1) && (x0_y0[i] == 1'b0)) begin	//x0 and y0 fails
				new_x[i] = 1'bz;
				new_y[i] = 1'bz;
			end

			//Pair 1 entirely fails
			else if ((x0_y0[i] == 1'b1) && (x1_y1[i] == 1'b0)) begin	//x1 and y1 fails
				new_x[i] = 1'bz;
				new_y[i] = 1'bz;
			end

			else begin
				new_x[i] = x0[i];
				new_y[i] = y0[i];
			end
		
		end

	end
	else begin
		new_x = x0;
		new_y = y0;
	end
end
endmodule 
