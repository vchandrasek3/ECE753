module mux_16bit (y, a, b, sel);

output [15:0] y;

input [15:0] a, b;
input sel;

wire [15:0] y, a, b;
wire sel;

assign y = (sel) ? b : a;

endmodule
