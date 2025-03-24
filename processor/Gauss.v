module Gauss (
    clock,
    reset,
    counter
);

  input wire clock;
  input wire reset;
  output wire [3:0] counter;

  Counter C0 (
      .clock  (clock),
      .reset  (reset),
      .counter(counter)
  );

endmodule
