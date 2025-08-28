`timescale 1ns / 1ps

module tb_full_adder;

    
    reg A;
    reg B;
    reg Cin;

    
    wire S;
    wire Cout;

    
    full_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    
    initial begin
        $dumpfile("full_adder.vcd");
        $dumpvars(0, tb_full_adder);
    end

  
    initial begin
        #10 A = 1'b0; B = 1'b0; Cin = 1'b0;
        #10 A = 1'b0; B = 1'b0; Cin = 1'b1;
        #10 A = 1'b0; B = 1'b1; Cin = 1'b0;
        #10 A = 1'b0; B = 1'b1; Cin = 1'b1;
        #10 A = 1'b1; B = 1'b0; Cin = 1'b0;
        #10 A = 1'b1; B = 1'b0; Cin = 1'b1;
        #10 A = 1'b1; B = 1'b1; Cin = 1'b0;
        #10 A = 1'b1; B = 1'b1; Cin = 1'b1;
        #10 $finish;
    end

endmodule