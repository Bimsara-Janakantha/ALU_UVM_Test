// Object class

class alu_base_sequence extends uvm_sequence;
    `uvm_object_utils(alu_base_sequence)

    // ----------------------------------------------------------
    // Constructor
    // ----------------------------------------------------------
    function new(string name = "alu_base_sequence");
        super.new(name);
        `uvm_info("BASE_SEQ", "Inside Constructor", UVM_HIGH);
    endfunction

    // ----------------------------------------------------------
    // Body Task
    // ----------------------------------------------------------
    task body();
        `uvm_info("BASE_SEQ", "Inside Body Task", UVM_HIGH);
    endtask
endclass