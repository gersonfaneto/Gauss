module full_adder(
	input inputA,
	input inputB,
	input cin,
	output cout, //MSB
	output sum
	);

	assign sum = inputA^inputB^cin;
	assign cout = (inputA & inputB) | (inputA & cin) | (inputB & cin);
endmodule
