module Gauss (

    clock,

    // reset,
    // direction,
    // load,
    // data,
    // counter,

    mem_read,
    mem_write,
    addr_read,
    addr_write,
    write_enable

);

  input wire clock;

  // input wire reset;
  // input wire direction;
  // input wire load;
  // output reg [3:0] data;
  // output reg [3:0] counter;

  output reg [31:0] mem_read;
  input wire [31:0] mem_write;
  input wire [7:0] addr_read;
  input wire [7:0] addr_write;
  input wire write_enable;

  // Counter C0 (
  //     .clock(clock),
  //     .reset(reset),
  //     .direction(direction),
  //     .load(load),
  //     .data(data),
  //     .counter(counter)
  // );

  Memory M0 (
      .mem_read(mem_read),
      .mem_write(mem_write),
      .clock(clock),
      .addr_read(addr_read),
      .addr_write(addr_write),
      .write_enable(write_enable)
  );

endmodule
