module comparator(cmp, x, y);
parameter WIDTH = 15;
input [WIDTH-1:0] x;
input [WIDTH-1:0] y;
output cmp;

assign cmp = (x >= y) ? 1'b1 : 1'b0;

endmodule
