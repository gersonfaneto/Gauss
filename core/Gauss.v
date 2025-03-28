/*
 * What's missing?
 *
 *   - `Buffer` :: Where the user data is going to be writen to and temporarily
 *     stored.
 *
 *   - `Decoder` :: Gets the data held by the buffer and unwraps it.
 *
 *   - `Controller` :: Analyzes the received instruction/information and handles
 *     it to the proper parts of the circuit.
 *
 *   - `ALU` :: Where the ¹main operations are performed.
 *
 * ¹ The smaller operations (e.g. like adding two numbers) may be implemented
 * on a separate module.
 */

module Gauss (
    clock
);

  input wire clock;

endmodule
