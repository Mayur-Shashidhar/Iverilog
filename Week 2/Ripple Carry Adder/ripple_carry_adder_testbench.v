`timescale 1ns / 1ps

module tb_rca;

    reg [3:0] A;
    reg [3:0] B;
    reg Cin;
    wire [3:0] S;
    wire Cout;

   
    rca uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        $dumpfile("rca.vcd");
        $dumpvars(0, tb_rca);
    end

    initial begin
        
        #10 A = 4'b0000; B = 4'b0000; Cin = 1'b0;

        
        #10 A = 4'b0101; B = 4'b0011; Cin = 1'b0; 

        
        #10 A = 4'b0111; B = 4'b1001; Cin = 1'b1; 

        
        #10 A = 4'b1111; B = 4'b1111; Cin = 1'b0; 
        
        #10 $finish;
    end

endmodule
