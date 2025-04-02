module fetch(
    input clk,                
    input reset,              
    input branch,             
    input [15:0] branch_addr, 
    input instr_done,          // Indica que a instrução foi executada
    output reg [15:0] instr,  
    output reg [15:0] pc      
);

    reg [15:0] instruction_memory [0:255]; 
    
    initial begin
        $readmemh("instructions.hex", instruction_memory);
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pc <= 16'b0; 
        end else if (instr_done) begin // Só busca a próxima se a atual terminou
            instr <= instruction_memory[pc]; 
            pc <= branch ? branch_addr : pc + 1; 
        end
    end

endmodule
