module generator(
output c1, c2, c3, c4,
input x1, y1, c0
);

wire w1;

assign c2 = y1;
not n1(c1, x1);
not n2(w1, y1);
not n3(c3, c0);
and a1(c4, x1, w1, c0);

endmodule
