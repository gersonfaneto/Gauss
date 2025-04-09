module negative_bit8(
	input [0:7] inputA,
	output [0:7] negativeA
);

assign negativeA[0:7] = ~inputA[0:7] + 1'b1;

endmodule
