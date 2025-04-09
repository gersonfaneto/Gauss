module fetch(
    input clk,                
    input reset,              
    input branch,              // sinal para indicar desvio 
    input [15:0] branch_addr,  // endereço para desvio na instrução
    input instr_done,          // Indica que a instrução foi executada
    output reg [25:0] instr,  
    output reg [15:0] pc      
);

    reg [25:0] instruction_memory [0:255]; 
    
    initial begin
        $readmemh("instructions.hex", instruction_memory);  // tem que colocar uma lista de instruções verdadeira
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pc <= 16'b0; 
        end else if (instr_done) begin // Só busca a próxima se a atual terminou
            instr <= instruction_memory[pc]; 
            pc <= branch ? branch_addr : pc + 1; // se não houver uym desvio na instrução, segue o fluxo para pc+1 
        end
    end

endmodule
