class alu_monitor extends uvm_monitor;
    `uvm_component_utils(alu_monitor)

    virtual alu_interface vif_monitor;

    // ----------------------------------------------------------
    // Constructor
    // ----------------------------------------------------------
    function new(string name = "alu_monitor", uvm_component parent = null);
        super.new(name, parent);
        `uvm_info("MONITOR_CLASS", "Inside Constructor", UVM_HIGH);
    endfunction

    // ----------------------------------------------------------
    // Build Phase
    // ----------------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("MONITOR_CLASS", "Build Phase!", UVM_HIGH);

        if(!(uvm_config_db #(virtual alu_interface)::get(this, "*", "vif", vif_monitor))) begin
            `uvm_error("MONITOR_CLASS", "Failed to get virtual interface from config db!");
        end
    endfunction

    // ----------------------------------------------------------
    // Connect Phase
    // ----------------------------------------------------------
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("MONITOR_CLASS", "Connect Phase!", UVM_HIGH);
    endfunction

    // ----------------------------------------------------------
    // Run Phase
    // ----------------------------------------------------------
    task run_phase(uvm_phase phase);
        super.run_phase(phase);

        // Logic
        `uvm_info("MONITOR_CLASS", "run Phase!", UVM_HIGH);
    endtask
endclass