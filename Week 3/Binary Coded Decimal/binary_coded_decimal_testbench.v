`timescale 1ns/1ps
module bcd_converter_tb;
    reg  [3:0] binary_in;
    wire [7:0] bcd_out;
    wire [3:0] tens_digit;
    wire [3:0] ones_digit;
    assign tens_digit = bcd_out[7:4];
    assign ones_digit = bcd_out[3:0];
    bcd_converter uut (
        .binary_in(binary_in),
        .bcd_out(bcd_out)
    );
    initial begin
        $display("BCD Converter Testbench");
        $display("========================");
        $display("Time\tBinary\tBCD\tTens\tOnes\tExpected");
        $display("----\t------\t---\t----\t----\t--------");
        for (integer i = 0; i < 16; i = i + 1) begin
            binary_in = i;
            #10;
            $display("%0t\t%4b\t%8b\t%4b\t%4b\t%0d%0d", 
                     $time, binary_in, bcd_out, tens_digit, ones_digit,
                     (i > 9) ? 1 : 0, (i > 9) ? (i-10) : i);
        end
        $display("\nVerification:");
        $display("=============");
        binary_in = 4'd0;  #10; check_result(0, 0);
        binary_in = 4'd5;  #10; check_result(0, 5);
        binary_in = 4'd9;  #10; check_result(0, 9);
        binary_in = 4'd10; #10; check_result(1, 0);
        binary_in = 4'd15; #10; check_result(1, 5);
        $display("\nTestbench completed successfully!");
        $finish;
    end
    task check_result;
        input [3:0] expected_tens;
        input [3:0] expected_ones;
        begin
            if (tens_digit == expected_tens && ones_digit == expected_ones) begin
                $display("PASS: Binary %2d -> BCD %d%d", binary_in, tens_digit, ones_digit);
            end else begin
                $display("FAIL: Binary %2d -> BCD %d%d (Expected: %d%d)", 
                         binary_in, tens_digit, ones_digit, expected_tens, expected_ones);
            end
        end
    endtask
    initial begin
        $monitor("Time=%0t: binary_in=%4b, bcd_out=%8b (tens=%d, ones=%d)", 
                 $time, binary_in, bcd_out, tens_digit, ones_digit);
    end
    initial begin
        $dumpfile("bcd_converter.vcd");
        $dumpvars(0, bcd_converter_tb);
    end
endmodule
