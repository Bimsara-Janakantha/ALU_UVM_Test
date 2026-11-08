// Object Class

class alu_txn_pkt extends uvm_sequence_item;
    `uvm_object_utils(alu_txn_pkt)

    // ----------------------------------------------------------
    // Instantiation
    // ----------------------------------------------------------
    
    // Input Signals
    rand logic       reset;
    rand logic [7:0] a;
    rand logic [7:0] b;
    rand logic [3:0] op_code;

    // Output Signals
    logic [7:0] result;  
    logic       carry_out;

    // ----------------------------------------------------------
    // Constructor
    // ----------------------------------------------------------
    function new(string name = "alu_txn_pkt");
        super.new(name);
        `uvm_info("TXN_PKT_CLASS", "Inside Constructor", UVM_HIGH);
    endfunction
endclass