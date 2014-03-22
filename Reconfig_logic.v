module reconfig_logic ( new_x, new_y, x0, y0, x1, y1, logic_en);

output reg new_x, new_y;
input x0, y0, x1, y1, logic_en;

wire x0_y0, x0_x1, y0_y1, x1_y1;

// Compare signals
xor (x0_y0, x0, y0);
xor (x0_x1, x0, x1);
xor (y0_y1, y0, y1);
xor (x1_y1, x1, y1);



always @ (*) begin
	if (logic_en) begin
			if (x0_y0 == 1'b0) begin // Pair 0 faulty
				if (x0_x1 == 1'b0)
					new_x = x0;
				else 
					new_x = x1;
				
				if (y0_y1 == 1'b0)
					new_y = y0;
				else	
					new_y = y1;
			end

			if (x1_y1 == 1'b0) begin // Pair 1 faulty
				if (x0_x1 == 1'b0)
					new_x = x1;
				else 
					new_x = x0;
				
				if (y0_y1 == 1'b0)
					new_y = y1;
				else	
					new_y = y0;
			end
	end
	else begin
		new_x = x0;
		new_y = y0;
	end
end
endmodule 