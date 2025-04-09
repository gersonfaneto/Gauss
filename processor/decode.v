module decode(
    input [25:0] instr,         // Instrução recebida do estágio Fetch
    output reg [3:0] opcode,    // Código da operação

    output reg [1:0] matrix_selected,
    output reg [7:0] dado_Matrix_A,
    output reg [7:0] dado_Matrix_B,
    output reg [2:0] linha,
    output reg [2:0] coluna,
    output reg [7:0] escalar,
    output reg [1:0] tamanho
    );

    always @(*) begin
    opcode = instr[25:22]; // Extrai o opcode fixo

    case (opcode)
        4'b0001: begin // Leitura
            matrix_selected = instr[21:20];
        end

        4'b0010: begin // Escrita
            dado_Matrix_A = instr[21:14];
            dado_Matrix_B = instr[13:6];
            linha = instr[5:3];
            coluna = instr[2:0];
        end

        4'b0110: begin // multiplicação por escalar
            escalar = instr[21:14];
            matrix_selected = instr[13];
        end

        4'b0111: begin // Determinante
            tamanho = instr[21:20];
            matrix_selected = instr[19];
        end

        4'b1000: begin // Transposta
            matrix_selected = instr[21];
        end

        4'b1001: begin // Inversa
            matrix_selected = instr[21];
        end
        
        default: begin
            // Zera tudo em caso de instrução inválida
            matrix_selected = 0;
            dado_Matrix_A = 0; dado_Matrix_B = 0;
            linha = 0; coluna = 0;
            escalar = 0;
            tamanho = 0;
        end
    endcase
end

endmodule
