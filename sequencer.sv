class alu_sequencer extends cvm_sequencer;
    `uvm_component_utils(alu_sequencer)

    // ----------------------------------------------------------
    // Constructor
    // ----------------------------------------------------------
    function void new(string name = "alu_sequencer", uvm_component parent = null);
        super.new(name, parent);
        `uvm_info("SEQR_CLASS", "Inside Constructor", UVM_HIGH);
    endfunction

    // ----------------------------------------------------------
    // Build Phase
    // ----------------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("SEQR_CLASS", "Build Phase!", UVM_HIGH);
    endfunction

    // ----------------------------------------------------------
    // Connect Phase
    // ----------------------------------------------------------
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("SEQR_CLASS", "Connect Phase!", UVM_HIGH);
    endfunction
endclass