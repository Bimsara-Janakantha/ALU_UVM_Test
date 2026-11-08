class alu_driver extends uvm_driver#(alu_txn_pkt);
    `uvm_component_utils(alu_driver)

    virtual alu_interface vif_driver;

    // ----------------------------------------------------------
    // Constructor
    // ----------------------------------------------------------
    function new(string name = "alu_driver", uvm_component parent = null);
        super.new(name, parent);
        `uvm_info("DRIVER_CLASS", "Inside Constructor", UVM_HIGH);        
    endfunction

    // ----------------------------------------------------------
    // Build Phase
    // ----------------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("DRIVER_CLASS", "Build Phase!", UVM_HIGH);

        if(!(uvm_config_db #(virtual alu_interface)::get(this, "*", "vif", vif_driver))) begin
            `uvm_error("DRIVER_CLASS", "Failed to get virtual interface from config db!");
        end
    endfunction

    // ----------------------------------------------------------
    // Connect Phase
    // ----------------------------------------------------------
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("DRIVER_CLASS", "Connect Phase!", UVM_HIGH);
    endfunction

    // ----------------------------------------------------------
    // Run Phase
    // ----------------------------------------------------------
    task run_phase(uvm_phase phase);
        super.run_phase(phase);

        // Logic
        `uvm_info("DRIVER_CLASS", "run Phase!", UVM_HIGH);
    endtask
endclass