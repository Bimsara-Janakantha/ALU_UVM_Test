class alu_env extends uvm_env;
    `uvm_component_utils(alu_env)

    // ----------------------------------------------------------
    // Constructor
    // ----------------------------------------------------------
    function new(string name = "alu_env", uvm_component parent = null);
        super.new(name, parent);
        `uvm_info("ENV_CLASS", "Inside Constructor", UVM_HIGH);
    endfunction

    // ----------------------------------------------------------
    // Build Phase
    // ----------------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("ENV_CLASS", "Build Phase!", UVM_HIGH);
    endfunction

    // ----------------------------------------------------------
    // Connect Phase
    // ----------------------------------------------------------
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("ENV_CLASS", "Connect Phase!", UVM_HIGH);
    endfunction

    // ----------------------------------------------------------
    // Run Phase
    // ----------------------------------------------------------
    task run_phase(uvm_phase phase);
        super.run_phase(phase);

        // Logic
        `uvm_info("ENV_CLASS", "run Phase!", UVM_HIGH);
    endtask
endclass