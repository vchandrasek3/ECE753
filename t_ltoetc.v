`timescale 1ns/1ps

module t_ltoetc;
reg [15:0] x1;
reg [15:0] y1;
wire o1, o2;

ltoetc DUT(o1, o2, x1, y1);

initial begin
	x1 = 0;
	y1 = 0;
	#2 x1 = 4;
	#2 y1 = 8;
	#2 x1 = 8;
end

initial
$monitor($time, o1, o2, x1, y1);

initial
#20 $stop;

endmodule
