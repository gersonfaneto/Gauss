module MTRX_Subtractor (
    input wire clock,
    input wire reset,
    input wire [199:0] a,
    input wire [199:0] b,
    output reg [199:0] c
);

  integer i;

  always @(posedge clock or posedge reset) begin
    if (reset) begin
      c <= 200'b0;
    end else begin
      for (i = 0; i < 25; i = i + 1) begin
        c[i*8+:8] <= $signed(a[i*8+:8]) - $signed(b[i*8+:8]);
      end
    end
  end

endmodule

module MTRX_Subtractor_TB;

  reg clock;
  reg reset;
  reg [199:0] a;
  reg [199:0] b;
  wire [199:0] c;

  MTRX_Subtractor UUT (
      .clock(clock),
      .reset(reset),
      .a(a),
      .b(b),
      .c(c)
  );

  initial begin
    clock = 0;
    forever #5 clock = ~clock;
  end

  initial begin
    reset = 1;
    a = 200'b0;
    b = 200'b0;

    #10;
    reset = 0;

    // verilog_format: off
    a = {
       8'd26, 8'd25, 8'd24, 8'd23, 8'd22,
       8'd21, 8'd20, 8'd19, 8'd18, 8'd17,
       8'd16, 8'd15, 8'd14, 8'd13, 8'd12,
       8'd11, 8'd10,  8'd9,  8'd8,  8'd7,
        8'd6,  8'd5,  8'd4,  8'd3,  8'd2
    };

    b = {
        8'd1,  8'd2,  8'd3,  8'd4,  8'd5,
        8'd6,  8'd7,  8'd8,  8'd9, 8'd10,
       8'd11, 8'd12, 8'd13, 8'd14, 8'd15,
       8'd16, 8'd17, 8'd18, 8'd19, 8'd20,
       8'd21, 8'd22, 8'd23, 8'd24, 8'd25
    };
    // verilog_format: on

    #10;

    $display("Matrix A: %h", a);
    $display("Matrix B: %h", b);
    $display("Result C: %h", c);

    if (c == {
       8'd25,   8'd23,  8'd21,  8'd19,  8'd17,
       8'd15,   8'd13,  8'd11,   8'd9,   8'd7,
        8'd5,    8'd3,   8'd1, 8'd255, 8'd253,
       8'd251, 8'd249, 8'd247, 8'd245, 8'd243,
       8'd241, 8'd239, 8'd237, 8'd235, 8'd233
    }) begin
      $display("Test Passed!");
    end else begin
      $display("Test Failed!");
    end

    #10;
    $stop;
  end

endmodule
