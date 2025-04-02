module decode(
    input [15:0] instr,         // Instrução recebida do estágio Fetch
    output reg [3:0] opcode,    // Código da operação
    output reg [3:0] dest,      // Registrador de destino
    output reg [3:0] src1,      // Primeiro operando
    output reg [3:0] src2       // Segundo operando
);

    always @(*) begin
        opcode = instr[15:12];  // Bits 15-12 são o opcode
        dest   = instr[11:8];   // Bits 11-8 são o registrador de destino
        src1   = instr[7:4];    // Bits 7-4 são o primeiro operando
        src2   = instr[3:0];    // Bits 3-0 são o segundo operando
    end

endmodule
