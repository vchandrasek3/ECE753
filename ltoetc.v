module ltoetc(o1, o2, x1, y1);

parameter WIDTH = 16;
output o1, o2;
input [WIDTH-1:0] x1;
input [WIDTH-1:0] y1;

wire x0, y0;
wire co1, co2;
wire a11, a12, b11, b12;
wire b1, b2;
wire c1, c2, c3, c4;
wire a21, a22, b21, b22;
wire a31, b31, a32, b32;

comparator comp1(.cmp(co1), .x(x1[WIDTH-2:0]), .y(y1[WIDTH-2:0]));
comparator comp2(.cmp(co2), .x(x1[WIDTH-2:0]), .y(y1[WIDTH-2:0]));

xor xor1(a11, x1[15], y1[15]);
xor xor2(a12, co1, y1[15]);
xor xor3(b1, x1[15], y1[15]);
xor xor4(b2, co2, y1[15]);
not not1(b11, b1);
not not2(b12, b2);

generator gen(.c1(c1), .c2(c2), .c3(c3), .c4(c4), .x1(x1[15]), .y1(y1[15]), .c0(co2));
translator trans(.c1(c1), .c2(c2), .c3(c3), .c4(c4), .a21(a21), .a22(a22), .b21(b21), .b22(b22));

TSC TSC1(.f(a31), .g(b31), .x0(a11), .y0(b11), .x1(a12), .y1(b12));
TSC TSC2(.f(a32), .g(b32), .x0(a21), .y0(b21), .x1(a22), .y1(b22));
TSC TSC3(.f(o1), .g(o2), .x0(a31), .y0(b31), .x1(a32), .y1(b32));

endmodule
