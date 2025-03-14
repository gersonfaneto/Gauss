module Counter (

    clock,
    reset,
    direction,
    load,
    data,
    counter

);

  input wire clock;
  input wire reset;
  input wire direction;
  input wire load;
  input wire [3:0] data;
  output reg [3:0] counter;

  always @(posedge clock) begin
    if (reset) begin
      counter <= 0;
    end else if (load) begin
      counter <= data;
    end else if (direction) begin
      counter <= counter + 1;
    end else begin
      counter <= counter - 1;
    end
  end

endmodule
