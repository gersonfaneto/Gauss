// Reference :: https://www.chipverify.com/verilog/verilog-single-port-ram

module RAM #(
    parameter ADDR_WIDTH = 4,
    parameter DATA_WIDTH = 32,
    parameter DEPTH = 16
) (
    clock,
    read,
    write,
    enable,
    addr,
    lane
);

  input clock;

  input read;
  input write;
  input enable;

  input [ADDR_WIDTH-1:0] addr;
  inout [DATA_WIDTH-1:0] lane;

  reg [DATA_WIDTH-1:0] data;
  reg [DATA_WIDTH-1:0] ram [0:DEPTH-1];

  always @(posedge clock) begin
    if (enable & write) begin
      ram[addr] <= lane;
    end
  end

  always @(posedge clock) begin
    if (enable & !write) begin
      data <= ram[addr];
    end
  end

  assign lane = enable & read & !write ? data : 'hz;
endmodule

`timescale 1ns / 100ps

module RAM_TB;

  parameter ADDR_WIDTH = 4;
  parameter DATA_WIDTH = 16;
  parameter DEPTH = 16;

  reg clock;

  reg read;
  reg write;
  reg enable;

  reg [ADDR_WIDTH-1:0] addr;
  wire [DATA_WIDTH-1:0] data;

  reg [DATA_WIDTH-1:0] tb_data;

  RAM #(
      .DATA_WIDTH(DATA_WIDTH)
  ) UUT (
      .clock (clock),
      .read  (read),
      .write (write),
      .enable(enable),
      .addr  (addr),
      .lane  (data)
  );

  always #5 clock = ~clock;

  integer i;

  initial begin
    {clock, enable, write, addr, tb_data, read} = 0;

    #20;

    for (i = 0; i < 2 ** ADDR_WIDTH; i = i + 1) begin
      @(posedge clock);
      addr = i;
      write = 1;
      enable = 1;
      read = 0;
      tb_data = $random % (2 ** DATA_WIDTH);
      $display("%h => %d", tb_data, addr);
      @(posedge clock);
      write  = 0;
      enable = 0;
    end

    for (i = 0; i < 2 ** ADDR_WIDTH; i = i + 1) begin
      @(posedge clock);
      addr   = i;
      write  = 0;
      enable = 1;
      read   = 1;
      @(posedge clock);
      enable = 0;
      read   = 0;
      $display("%h <= %d", data, addr);
    end

    #20 $stop;
  end

  assign data = !read ? tb_data : 'hz;

endmodule
