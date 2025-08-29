`timescale 1ns/1ps

module tb_decoder2to4;
    reg [1:0] sel;
    reg en;
    wire y0, y1, y2, y3;
    decoder2to4 uut (
        .sel(sel),
        .en(en),
        .y0(y0),
        .y1(y1),
        .y2(y2),
        .y3(y3)
    );

    initial begin
        $dumpfile("decoder2to4.vcd");
        $dumpvars(0, tb_decoder2to4);
        $monitor("Time=%0t | en=%b sel=%b -> y0=%b y1=%b y2=%b y3=%b",
                  $time, en, sel, y0, y1, y2, y3);
        en = 0; sel = 2'b00; #10;   
        en = 1; sel = 2'b00; #10;   
        en = 1; sel = 2'b01; #10;   
        en = 1; sel = 2'b10; #10;   
        en = 1; sel = 2'b11; #10;  
        en = 0; sel = 2'b10; #10;   
        $finish;
    end
endmodule
