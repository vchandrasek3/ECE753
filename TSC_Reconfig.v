module TSC_Reconfig (new_x, new_y, x0, y0, x1, y1);

output new_x, new_y;
input x0, x1, y0, y1;

wire f, g, logic_en;

TSC DUT1 (
.f (f),
.g (g),
.x0 (x0),
.x1 (x1),
.y0 (y0),
.y1 (y1)
);

assign logic_en = ~(f^g);

reconfig_logic DUT2 (
.new_x (new_x),
.new_y (new_y),
.x0 (x0),
.y0 (y0),
.x1 (x1),
.y1 (y1),
.logic_en (logic_en)
);

endmodule