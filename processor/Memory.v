// Reference :: https://people.ece.cornell.edu/land/courses/ece5760/DE1_SOC/Memory/index.html

module Memory (

    mem_read,
    mem_write,
    clock,
    addr_read,
    addr_write,
    write_enable

);

  output reg [31:0] mem_read;
  input wire [31:0] mem_write;
  input wire [7:0] addr_read;
  input wire [7:0] addr_write;
  input wire clock;
  input wire write_enable;

  reg [31:0] memory [255];

  always @(posedge clock) begin
    if (write_enable) begin
      memory[addr_write] <= mem_write;
    end
    mem_read <= memory[addr_read]; // Take two clock cycles.
  end

endmodule
