module bcd_converter (
    input  [3:0] binary_in,   
    output [7:0] bcd_out      
);
    wire [3:0] ones_digit;
    wire [3:0] tens_digit; 
    assign ones_digit = (binary_in <= 4'd9) ? binary_in : (binary_in - 4'd10);
    assign tens_digit = (binary_in <= 4'd9) ? 4'd0 : 4'd1;
    assign bcd_out = {tens_digit, ones_digit};
endmodule
