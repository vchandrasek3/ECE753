`timescale 1ns/1ps

module t_comparator;
reg [14:0] x;
reg [14:0] y;
wire cmp;

comparator cmp1(cmp, x, y);

initial begin
	x = 0;
	y = 0;
	#2 x = 4;
	#2 y = 8;
	#2 x = 8;
end

initial
$monitor($time, cmp, x, y);
initial
#10 $stop;

endmodule

