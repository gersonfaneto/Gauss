module trans_matrix(
	input[0:199] matrixA,
	output[0:199] matrixB
);
	assign matrixB[0:7] = matrixA[0:7]; // 1 1
	assign matrixB[8:15] = matrixA[40:47]; // 1 2 
	assign matrixB[16:23] = matrixA[80:87]; // 1 3
	assign matrixB[24:31] = matrixA[120:127]; // 1 4
	assign matrixB[32:39] = matrixA[160:167]; // 1 5
	assign matrixB[40:47] = matrixA[8:15]; // 2 1
	assign matrixB[48:55] = matrixA[48:55]; // 2 2
	assign matrixB[56:63] = matrixA[88:95]; // 2 3
	assign matrixB[64:71] = matrixA[128:135];// 2 4
	assign matrixB[72:79] = matrixA[168:175]; // 2 5
	assign matrixB[80:87] = matrixA[16:23]; // 3 1
	assign matrixB[88:95] = matrixA[56:63]; // 3 2
	assign matrixB[96:103] = matrixA[96:103]; // 3 3
	assign matrixB[104:111] = matrixA[136:143]; // 3 4
	assign matrixB[112:119] = matrixA[176:183]; // 3 5
	assign matrixB[120:127] = matrixA[24:31]; // 4 1
	assign matrixB[128:135] = matrixA[64:71]; // 4 2
	assign matrixB[136:143] = matrixA[104:111]; // 4 3
	assign matrixB[144:151] = matrixA[144:151]; // 4 4
	assign matrixB[152:159] = matrixA[184:191]; // 4 5
	assign matrixB[160:167] = matrixA[32:39]; // 5 1	
	assign matrixB[168:175] = matrixA[72:79]; // 5 2	
	assign matrixB[176:183] = matrixA[112:119]; // 5 3	
	assign matrixB[184:191] = matrixA[152:159]; // 5 4
	assign matrixB[192:199] = matrixA[192:199]; // 5 5
endmodule