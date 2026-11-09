import uvm_pkg::*;
`include "uvm_macros.svh"

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
    // Default Constraint
    // ----------------------------------------------------------
    constraint input1_c {a inside {[10:20]};}
    constraint input2_c {b inside {[1:10]};}
    constraint op_code_c {op_code inside {0,1,2,3};}
    
    //------------------------------------------------------
    // Constructor
    // ----------------------------------------------------------
    function new(string name = "alu_txn_pkt");
        super.new(name);
        `uvm_info("TXN_PKT_CLASS", "Inside Constructor", UVM_HIGH);
    endfunction
endclass