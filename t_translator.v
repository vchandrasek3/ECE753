`timescale 1ns/1ps

module t_translator;
reg c1, c2, c3, c4;
wire a21, a22, b21, b22;

translator trans(a21, a22, b21, b22, c1, c2, c3, c4);

initial begin
	c1 = 0;
	c2 = 0;
	c3 = 0;
	c4 = 0;
	#2 c1 = 1;
		 c3 = 1;
	#2 c3 = 0;
	#2 c2 = 1;
	#2 c4 = 1;
	#2 c4 = 0;
		 c3 = 1;
end

initial
#50 $stop;

initial
$monitor($time, a21, a22, b21, b22, c1, c2, c3, c4);

endmodule
