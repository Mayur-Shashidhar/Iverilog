module boolean_function_dataflow (
    input  A,
    input  B,
    input  C,
    output F
);

    assign F = (A | C) & (A | ~B) & (~B | C);

endmodule
