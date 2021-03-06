`timescale 1ns/1ps

module t_generator;
reg x1, y1, c0;
wire c1, c2, c3, c4;

generator gen(c1, c2, c3, c4, x1, y1, c0);

initial begin
	x1 = 0;
	y1 = 0;
	c0 = 0;
	#4 x1 = 1;
	#4 y1 = 1;
	#4 c0 = 1;
	#4 x1 = 0;
	#4 c0 = 0;
	#4 c0 = 1;
	   y1 = 0;
	#4 x1 = 1;
		 y1 = 0;
		 c0 = 1;
end


initial 
#100 $stop;

initial
$monitor($time, x1, y1, c0, c1, c2, c3, c4);

endmodule
