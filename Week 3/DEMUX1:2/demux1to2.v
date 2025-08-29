module demux1to2 (
    input wire din,     
    input wire sel,     
    output wire y0,     
    output wire y1      
);

    assign y0 = (~sel) ? din : 0;   
    assign y1 = ( sel) ? din : 0;   

endmodule
