`timescale 1ns / 1ps

module testbench_dataflow;

    reg A, B, C;
    wire F;

    boolean_function_dataflow dut (
        .A(A),
        .B(B),
        .C(C),
        .F(F)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, testbench_dataflow);

        $monitor("Time(ns) | A | B | C | F");
        $monitor("--------------------------");

        #10; A = 0; B = 0; C = 0;
        #10; A = 0; B = 0; C = 1;
        #10; A = 0; B = 1; C = 0;
        #10; A = 0; B = 1; C = 1;
        #10; A = 1; B = 0; C = 0;
        #10; A = 1; B = 0; C = 1;
        #10; A = 1; B = 1; C = 0;
        #10; A = 1; B = 1; C = 1;

        #10;
        $finish;
    end

endmodule