`timescale 1ns/1ps

module tb_encoder4to1;
    reg [3:0] din;
    wire [1:0] y;
    encoder4to1 uut (
        .din(din),
        .y(y)
    );

    initial begin
        $dumpfile("encoder4to1.vcd");
        $dumpvars(0, tb_encoder4to1);
        $monitor("Time=%0t | din=%b -> y=%b", $time, din, y);
        din = 4'b0001; #10;   
        din = 4'b0010; #10;   
        din = 4'b0100; #10;   
        din = 4'b1000; #10;  
        din = 4'b0000; #10;   
        din = 4'b1010; #10; 
        $finish;
    end
endmodule
