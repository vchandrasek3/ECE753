module range_checker(high_range, low_range, input_val, o1, o2);
parameter WIDTH = 16;
input [WIDTH-1 : 0] high_range, low_range, input_val;
output o1, o2;

wire firsto1, firsto2, secondo1, secondo2;

ltoetc l1(firsto1, firsto2, high_range, input_val);
ltoetc l2(secondo1, secondo2, input_val, low_range);

TSC TSC1(.f(o1), .g(o2), .x0(firsto1), .y0(firsto2), .x1(secondo1), .y1(secondo2));

endmodule
