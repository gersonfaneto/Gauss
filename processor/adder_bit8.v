module adder_bit8(
	output cout,
	output [0:7] sum,
	input [0:7] inputA,
	input [0:7] inputB,
	input cin
);


	wire [7:0] bin;
	assign bin[0] = inputB[0]^cin;
	assign bin[1] = inputB[1]^cin;
	assign bin[2] = inputB[2]^cin;
	assign bin[3] = inputB[3]^cin;
	assign bin[4] = inputB[4]^cin;
	assign bin[5] = inputB[5]^cin;
	assign bin[6] = inputB[6]^cin;
	assign bin[7] = inputB[7]^cin;
	
	wire [8:1] carry;
		full_adder FA0(carry[1], sum[0], inputA[0], bin[0], cin);
		full_adder FA1(carry[2], sum[1], inputA[1], bin[1], cin);
		full_adder FA2(carry[3], sum[2], inputA[2], bin[2], cin);
		full_adder FA3(carry[4], sum[3], inputA[3], bin[3], cin);
		full_adder FA4(carry[5], sum[4], inputA[4], bin[4], cin);
		full_adder FA5(carry[6], sum[5], inputA[5], bin[5], cin);
		full_adder FA6(carry[7], sum[6], inputA[6], bin[6], cin);
		full_adder FA7(carry[8], sum[7], inputA[7], bin[7], cin);
	assign cout = cin^carry[8];	
endmodule