module top_level(x1, x2, x3, x4, x5, o1, o2);

parameter WIDTH = 16;
output o1, o2;
input x1, x2, x3, x4, x5;

wire firsto1, firsto2, secondo1, secondo2, thirdo1, thirdo2, fourtho1, fourtho2, f1, g1, f2, g2;

ltoetc l1(firsto1, firsto2, x1, x2);
ltoetc l2(secondo1, secondo2, x2, x3);
ltoetc l3(thirdo1, thirdo2, x3, x4);
ltoetc l4(fourtho1, fourtho2, x4, x5);

TSC TSC1(.f(f1), .g(g1), .x0(firsto1), .y0(firsto2), .x1(secondo1), .y1(secondo2));
TSC TSC2(.f(f2), .g(g2), .x0(thirdo1), .y0(thirdo2), .x1(fourtho1), .y1(fourtho2));
TSC TSC3(.f(o1), .g(o2), .x0(f1), .y0(g1), .x1(f2), .y1(g2));

endmodule

