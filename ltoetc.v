module ltoetc(x1, y1, o1, o2);

parameter WIDTH = 16;
output o1, o2;
input [WIDTH-1:0] x1, y1;

wire [WIDTH-2:0] x_cmp, y_cmp;
wire x0, y0;
wire co1, co2;
wire a11, a12, b1, b2, b11, b12;
wire c1, c2, c3, c4;
wire a21, a22, b21, b22;
wire a31, b31, a32, b32;

assign x0 = x1[0];
assign y0 = y1[0];
assign x_cmp[WIDTH-2:0] = x1[WIDTH-1:1];
assign y_cmp[WIDTH-2:0] = y1[WIDTH-1:1];

comparator comp1(.cmp(co1), .x(x_cmp), .y(y_cmp));
comparator comp2(.cmp(co2), .x(x_cmp), .y(y_cmp));

xor xor1(a11, x0, y0);
xor xor2(a12, co1, y0);
xor xor3(b1, x0, y0);
xor xor4(b2, co2, y0);
not not1(b11, b1);
not not2(b12, b2);

generator gen(.c1(c1), .c2(c2), .c3(c3), .c4(c4), .x1(x0), .y1(y0), .c0(c02));
translator trans(.c1(c1), .c2(c2), .c3(c3), .c4(c4), .a21(a21), .a22(a22), .b21(b21), .b22(b22));
TSC TSC1(.f(b31), .g(a31), .x0(a11), .y0(b11), .x1(a12), .y1(b12));
TSC TSC2(.f(b32), .g(a32), .x0(a21), .y0(b21), .x1(a22), .y1(b22));
TSC TSC3(.f(o2), .g(o1), .x0(a31), .y0(b31), .x1(a32), .y1(b32));

endmodule
