module neg_matrix(
	input[0:199] matrixA,
	output[0:199] matrixB
);

	negative_bit8 E1(matrixA[0:7], matrixB[0:7]);
	negative_bit8 E2(matrixA[8:15], matrixB[8:15]);
	negative_bit8 E3(matrixA[16:23], matrixB[16:23]);
	negative_bit8 E4(matrixA[24:31], matrixB[24:31]);
	negative_bit8 E5(matrixA[32:39], matrixB[32:39]);
	negative_bit8 E6(matrixA[40:47], matrixB[40:47]);
	negative_bit8 E7(matrixA[48:55], matrixB[48:55]);
	negative_bit8 E8(matrixA[56:63], matrixB[56:63]);
	negative_bit8 E9(matrixA[64:71], matrixB[64:71]);
	negative_bit8 E10(matrixA[72:79], matrixB[72:79]);
	negative_bit8 E11(matrixA[80:87], matrixB[80:87]);
	negative_bit8 E12(matrixA[88:95], matrixB[88:95]);
	negative_bit8 E13(matrixA[96:103], matrixB[96:103]);
	negative_bit8 E14(matrixA[104:111], matrixB[104:111]);
	negative_bit8 E15(matrixA[112:119], matrixB[112:119]);
	negative_bit8 E16(matrixA[120:127], matrixB[120:127]);
	negative_bit8 E17(matrixA[128:135], matrixB[128:135]);
	negative_bit8 E18(matrixA[136:143], matrixB[136:143]);
	negative_bit8 E19(matrixA[144:151], matrixB[144:151]);
	negative_bit8 E20(matrixA[152:159], matrixB[152:159]);
	negative_bit8 E21(matrixA[160:167], matrixB[160:167]);
	negative_bit8 E22(matrixA[168:175], matrixB[168:175]);
	negative_bit8 E23(matrixA[176:183], matrixB[176:183]);
	negative_bit8 E24(matrixA[184:191], matrixB[184:191]);
	negative_bit8 E25(matrixA[192:199], matrixB[192:199]);
	
endmodule