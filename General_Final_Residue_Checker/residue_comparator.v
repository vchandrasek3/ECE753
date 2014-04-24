module residue_comparator(
input 	[15:0]	out_residue_ip1,
input 	[15:0]	out_residue_ip2,
output			eq
);


assign eq = (out_residue_ip1 == out_residue_ip2) ? 1'b1 : 1'b0;

endmodule
