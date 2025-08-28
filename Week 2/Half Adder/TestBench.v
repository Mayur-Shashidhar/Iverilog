`timescale 1ns / 1ps

module tb_half_adder;

    reg A;
    reg B;

    wire S;
    wire C;

    half_adder uut (
        .A(A),
        .B(B),
        .S(S),
        .C(C)
    );

    initial begin
        $dumpfile("half_adder.vcd");
        $dumpvars(0, tb_half_adder);
    end

    initial begin
        #10 A = 1'b0; B = 1'b0;
        #10 A = 1'b0; B = 1'b1;
        #10 A = 1'b1; B = 1'b0;
        #10 A = 1'b1; B = 1'b1;
        #10 $finish;
    end

endmodule