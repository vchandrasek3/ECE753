module TSC_Reconfig (new_x, new_y, final_x, final_y, x0, y0, x1, y1);

output [15:0] new_x, new_y, final_x, final_y;
input [15:0] x0, x1, y0, y1;

wire f, g, logic_en;

TSC_16bit DUT1 (.f (f), .g (g), .x0 (x0), .x1 (x1), .y0 (y0), .y1 (y1) );

assign logic_en = ~(f^g);

reconfig_16bit DUT2 (.new_x (new_x), .new_y (new_y), .x0 (x0), .y0 (y0), .x1 (x1), .y1 (y1), .logic_en (logic_en) );

mux_16bit DUT3 (.y(final_x), .a(x), .b(new_x), .sel(logic_en) );

mux_16bit DUT4 (.y(final_y), .a(y), .b(new_y), .sel(logic_en) );

endmodule
