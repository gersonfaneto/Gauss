module MTRX_Multiplier (
    input wire clock,
    input wire reset,
    input wire mode, // 0 :: Matrix-Matrix | 1 :: Matrix-Scalar
    input wire [7:0] scalar,
    input wire [199:0] a,
    input wire [199:0] b,
    output reg [199:0] c
);

  integer row, col, k;
  reg [15:0] sum;

  always @(posedge clock or posedge reset) begin
    if (reset) begin
      c <= 200'b0;
    end else begin
      if (mode == 0) begin
        for (row = 0; row < 5; row = row + 1) begin
          for (col = 0; col < 5; col = col + 1) begin
            sum = 0;
            for (k = 0; k < 5; k = k + 1) begin
              sum = sum + a[(row*5+k)*8+:8] * b[(k*5+col)*8+:8];
            end
            c[(row*5+col)*8+:8] <= sum[7:0];
          end
        end
      end else if (mode == 1) begin
        for (row = 0; row < 5; row = row + 1) begin
          for (col = 0; col < 5; col = col + 1) begin
            c[(row*5+col)*8+:8] <= a[(row*5+col)*8+:8] * scalar;
          end
        end
      end
    end
  end

endmodule

module MTRX_Multiplier_TB;

  reg clock;
  reg reset;
  reg mode;
  reg [7:0] scalar;
  reg [199:0] a;
  reg [199:0] b;
  wire [199:0] c;

  MTRX_Multiplier UUT (
      .clock(clock),
      .reset(reset),
      .mode(mode),
      .scalar(scalar),
      .a(a),
      .b(b),
      .c(c)
  );

  integer row, col;
  reg [199:0] expected_c;

  task display_matrix;
    input [199:0] matrix;

    begin
      for (row = 0; row < 5; row = row + 1) begin
        for (col = 0; col < 5; col = col + 1) begin
          $write("%d ", matrix[(row*5+col)*8+:8]);
        end
        $write("\n");
      end
    end
  endtask

  initial begin
    clock = 0;
    forever #5 clock = ~clock;
  end

  initial begin
    reset = 1;
    a = 200'b0;
    b = 200'b0;
    scalar = 8'd0;
    mode = 0;

    #10;
    reset = 0;

    mode = 0;

    // verilog_format: off
    a = {
      8'd1, 8'd2, 8'd1, 8'd2, 8'd1,
      8'd2, 8'd1, 8'd2, 8'd1, 8'd2,
      8'd1, 8'd2, 8'd1, 8'd2, 8'd1,
      8'd2, 8'd1, 8'd2, 8'd1, 8'd2,
      8'd1, 8'd2, 8'd1, 8'd2, 8'd1
    };

    b = {
      8'd1, 8'd1, 8'd1, 8'd1, 8'd1,
      8'd1, 8'd1, 8'd1, 8'd1, 8'd1,
      8'd1, 8'd1, 8'd1, 8'd1, 8'd1,
      8'd1, 8'd1, 8'd1, 8'd1, 8'd1,
      8'd1, 8'd1, 8'd1, 8'd1, 8'd1
    };
    // verilog_format: on

    #10;
    $display("Matrix A");
    display_matrix(a);
    $display("Matrix B");
    display_matrix(b);
    $display("Matrix C");
    display_matrix(c);

    if (c == {
      8'd7, 8'd7, 8'd7, 8'd7, 8'd7,
      8'd8, 8'd8, 8'd8, 8'd8, 8'd8,
      8'd7, 8'd7, 8'd7, 8'd7, 8'd7,
      8'd8, 8'd8, 8'd8, 8'd8, 8'd8,
      8'd7, 8'd7, 8'd7, 8'd7, 8'd7
    }) begin
      $display("Matrix-Matrix Test Passed!");
    end else begin
      $display("Matrix-Matrix Test Failed!");
    end

    mode   = 1;
    scalar = 8'd2;

    #10;
    $display("Matrix A");
    display_matrix(a);
    $display("Scalar: %d", scalar);
    $display("Matrix C");
    display_matrix(c);

    if (c == {
      8'd2, 8'd4, 8'd2, 8'd4, 8'd2,
      8'd4, 8'd2, 8'd4, 8'd2, 8'd4,
      8'd2, 8'd4, 8'd2, 8'd4, 8'd2,
      8'd4, 8'd2, 8'd4, 8'd2, 8'd4,
      8'd2, 8'd4, 8'd2, 8'd4, 8'd2
    }) begin
      $display("Matrix-Scalar Test Passed!");
    end else begin
      $display("Matrix-Scalar Test Failed!");
    end

    #10;
    $stop;
  end

endmodule
