
`timescale 1ns/1ps // Specify the time scale

module and_tb;
    reg a, b;        // Declare inputs as registers
    wire y;         // Declare output as wire

    // Instantiate the AND gate
    and_gate my_and (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Dump VCD file
        $dumpfile("and_gate.vcd"); // Specify the name of the VCD file
        $dumpvars(0, and_tb);       // Dump all variables in the and_tb module

        // Test cases
        $monitor("At time %t: a = %b, b = %b, y = %b", $time, a, b, y);

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        $finish; // End the simulation
    end
endmodule
