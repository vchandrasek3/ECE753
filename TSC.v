module TSC (
output f, g,
input x0, y0, x1, y1
);


wire w1, w2, w3, w4;

and and1 (w1, x0, y1);
and and2 (w2, y0, x1);
and and3 (w3, x0, x1);
and and4 (w4, y0, y1);

or or1 (f, w1, w2);
or or2 (g, w3, w4);

endmodule 
