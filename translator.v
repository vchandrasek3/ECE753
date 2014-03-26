module translator(
output a21, a22, b21, b22,
input c1, c2, c3, c4
);

or o1(a21, c1, c2);
or o2(a22, c1, c3);
or o3(b21, c3, c4);
or o4(b22, c2, c4);

endmodule
