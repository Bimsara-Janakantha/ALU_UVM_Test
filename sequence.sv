// Object class

class alu_base_sequence extends uvm_sequence;
    `uvm_object_utils(alu_base_sequence)

    alu_txn_pkt reset_pkt;

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

        reset_pkt = alu_txn_pkt::type_id::create("reset_pkt");
        start_item(reset_pkt);
        reset_pkt.randomize() with {reset == 1;};
        finish_item(reset_pkt);
    endtask
endclass: alu_base_sequence

class alu_test_sequence extends alu_base_sequence;
    `uvm_object_utils(alu_test_sequence)

    alu_txn_pkt pkt;

    // ----------------------------------------------------------
    // Constructor
    // ----------------------------------------------------------
    function new(string name = "alu_test_sequence");
        super.new(name);
        `uvm_info("TEST_SEQ", "Inside Constructor", UVM_HIGH);
    endfunction

    // ----------------------------------------------------------
    // Body Task
    // ----------------------------------------------------------
    task body();
        `uvm_info("TEST_SEQ", "Inside Body Task", UVM_HIGH);

        pkt = alu_txn_pkt::type_id::create("pkt");
        start_item(pkt);
        pkt.randomize() with {reset == 0;};
        finish_item( pkt);
    endtask
endclass: alu_test_sequence