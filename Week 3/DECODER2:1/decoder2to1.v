module decoder2to4 (
    input  wire [1:0] sel,   
    input  wire en,          
    output wire y0,          
    output wire y1,          
    output wire y2,          
    output wire y3          
);

    assign y0 = (en && sel == 2'b00);
    assign y1 = (en && sel == 2'b01);
    assign y2 = (en && sel == 2'b10);
    assign y3 = (en && sel == 2'b11);

endmodule
