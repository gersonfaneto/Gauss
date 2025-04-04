// Reference :: https://www.chipverify.com/verilog/verilog-4-bit-counter

module Counter (
    clock,
    reset,
    data
);

  input wire clock;
  input wire reset;

  reg [3:0] counter;

  output wire [3:0] data;

  always @(posedge clock) begin
    if (reset) begin
      counter <= 4'b0000;
    end else begin
      counter <= counter + 4'b0001;
    end
  end

  assign data = counter;

endmodule

`timescale 1ns / 100ps

module Counter_TB;

  reg clock;
  reg reset;

  wire [3:0] data;

  Counter UUT (
      .clock(clock),
      .reset(reset),
      .data (data)
  );

  always #5 clock = ~clock;

  initial begin
    clock = 0;
    reset = 0;

    #100;

    reset = 1;
    #10;
    reset = 0;

    #100;

    $stop;
  end

  initial begin
    $monitor("Time = %0t, Counter = %b", $time, data);
  end

endmodule
