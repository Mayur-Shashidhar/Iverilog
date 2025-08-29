`timescale 1ns/1ps

module tb_mux2to1;
    reg a;
    reg b;
    reg sel;
    wire y;
    mux2to1 uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );
    initial begin
        $dumpfile("mux2to1.vcd");  
        $monitor("Time=%0t | a=%b b=%b sel=%b -> y=%b", $time, a, b, sel, y);
        a = 0; b = 0; sel = 0; #10;
        a = 0; b = 1; sel = 0; #10;
        a = 1; b = 0; sel = 0; #10;
        a = 1; b = 1; sel = 0; #10;
        a = 0; b = 0; sel = 1; #10;
        a = 0; b = 1; sel = 1; #10;
        a = 1; b = 0; sel = 1; #10;
        a = 1; b = 1; sel = 1; #10;
        $finish;
    end
endmodule
