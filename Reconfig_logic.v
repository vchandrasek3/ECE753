module reconfig_logic ( new_x, new_y, x0, y0, x1, y1, logic_en);

output reg new_x, new_y;
input x0, y0, x1, y1, logic_en;

wire x0_y0, x0_x1, y0_y1, x1_y1;

//Compare signals
xor (x0_y0, x0, y0);
xor (x0_x1, x0, x1);
xor (y0_y1, y0, y1);
xor (x1_y1, x1, y1);



always @ (*) begin
	if (logic_en) begin
			//One fault in pair 0
			if ((x0_y0 == 1'b0) && (x0_x1 == 1'b0)) begin 		//y0 fails
				new_y = y1;
				new_x = x0;
			end

			else if ((x0_y0 == 1'b0) && (y0_y1 == 1'b0)) begin	//x0 fails
				new_x = x1;
				new_y = y0;
			end
			
			//One fault in pair 1
			else if ((x1_y1 == 1'b0) && (x0_x1 == 1'b0)) begin	//y1 fails
				new_y = y0;
				new_x = x0;
			end

			else if ((x1_y1 == 1'b0) && (y0_y1 == 1'b0)) begin	//x1 fails
				new_x = x0;
				new_y = y0;
			end
			
			//Both Original pair fails
			else if ((x0_x1 == 1'b1) && (y0_y1 == 1'b0)) begin	//x0 and x1 fails
				new_x = ~y0;
				new_y = y0;
			end

			//Both Complimentary pair fails
			else if ((y0_y1 == 1'b1) && (x0_x1 == 1'b0)) begin	//y0 and y1 fails
				new_y = ~x0;
				new_x = x0;
			end

			//Pair 0 entirely fails
			else if ((x1_y1 == 1'b1) && (x0_y0 == 1'b0)) begin	//x0 and y0 fails
				new_x = 1'bz;
				new_y = 1'bz;
			end

			//Pair 1 entirely fails
			else if ((x0_y0 == 1'b1) && (x1_y1 == 1'b0)) begin	//x1 and y1 fails
				new_x = 1'bz;
				new_y = 1'bz;
			end

	end
	else begin
		new_x = x0;
		new_y = y0;
	end
end
endmodule 
