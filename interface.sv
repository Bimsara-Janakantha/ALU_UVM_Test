interface alu_interface(input logic clock);

    // Input Signals
    logic       reset;
    logic [7:0] a;
    logic [7:0] b;
    logic [3:0] op_code;

    // Output Signals
    logic [7:0] result;  
    logic       carry_out;

endinterface: alu_interface