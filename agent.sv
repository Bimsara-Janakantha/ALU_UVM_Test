class alu_agent extends uvm_agent;
    `uvm_commponent_utils(alu_agent)

    // ----------------------------------------------------------
    // Constructor
    // ----------------------------------------------------------
    function new(string name = "alu_agent", uvm_component parent = null);
        super.new(name, parent);
        `uvm_info("AGENT_CLASS", "Inside Constructor", UVM_HIGH);        
    endfunction

    // ----------------------------------------------------------
    // Build Phase
    // ----------------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("AGENT_CLASS", "Build Phase!", UVM_HIGH);
    endfunction

    // ----------------------------------------------------------
    // Connect Phase
    // ----------------------------------------------------------
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("AGENT_CLASS", "Connect Phase!", UVM_HIGH);
    endfunction

    // ----------------------------------------------------------
    // Run Phase
    // ----------------------------------------------------------
    task run_phase(uvm_phase phase);
        super.run_phase(phase);

        // Logic
        `uvm_info("AGENT_CLASS", "run Phase!", UVM_HIGH);
    endtask
endclass