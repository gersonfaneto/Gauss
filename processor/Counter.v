module Counter (
    clock,
    reset,
    counter
);

  input wire clock;
  input wire reset;
  output reg [3:0] counter;

  always @(posedge clock) begin
    if (reset) begin
      counter <= 4'b0000;
    end else begin
      counter <= counter + 4'b0001;
    end
  end

endmodule

`timescale 1ns/100ps

module Counter_TB;

  reg clock;
  reg reset;

  wire [3:0] counter;

  Counter UUT (
      .clock  (clock),
      .reset  (reset),
      .counter(counter)
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
    $monitor("Time = %0t, Counter = %b", $time, counter);
  end

endmodule
