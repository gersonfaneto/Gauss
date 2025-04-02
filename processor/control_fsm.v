module control_fsm(
    input clk, reset,
    input [3:0] opcode,
    output reg alu_op, mem_read, mem_write, reg_write
);

    typedef enum reg [2:0] {
        FETCH = 3'b000, 
        DECODE = 3'b001, 
        EXECUTE = 3'b010, 
        WRITEBACK = 3'b011
    } state_t;

    state_t state, next_state;

    // Atualização do estado a cada ciclo de clock
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= FETCH;
        else
            state <= next_state;
    end

    // Lógica de transição entre estados
    always @(*) begin
        case (state)
            FETCH: next_state = DECODE;
            DECODE: next_state = EXECUTE;
            EXECUTE: next_state = WRITEBACK;
            WRITEBACK: next_state = FETCH;
            default: next_state = FETCH;
        endcase
    end

    // Geração dos sinais de controle
    always @(*) begin
        // Resetando sinais
        mem_read = 0; mem_write = 0; alu_op = 0; reg_write = 0;

        case (state)
            FETCH: begin
                mem_read = 1; // Buscar instrução da memória
            end
            DECODE: begin
                // Nenhum sinal ativado, apenas decodificando
            end
            EXECUTE: begin
                if (opcode == 4'b0001) alu_op = 1; // Se for ADD, ativa a ALU
                if (opcode == 4'b0010) mem_read = 1; // Se for LOAD, ativa leitura de memória
                if (opcode == 4'b0011) mem_write = 1; // Se for STORE, ativa escrita na memória
            end
            WRITEBACK: begin
                if (opcode == 4'b0001) reg_write = 1; // Se for ADD, escreve no registrador
                if (opcode == 4'b0010) reg_write = 1; // Se for LOAD, escreve no registrador
            end
        endcase
    end

endmodule
