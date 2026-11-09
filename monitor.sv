import uvm_pkg::*;
`include "uvm_macros.svh"

class alu_monitor extends uvm_monitor;
    `uvm_component_utils(alu_monitor)

    virtual alu_interface vif_monitor;
    alu_txn_pkt pkt;

    uvm_analysis_port #(alu_txn_pkt) monitor_port;

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

        monitor_port = new("monitor_port", this);

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
        `uvm_info("MONITOR_CLASS", "run Phase!", UVM_HIGH);

        forever begin
            pkt = alu_txn_pkt::type_id::create("pkt");

            // Wait for reset to be deasserted
            wait(!vif_monitor.reset); 

            // Sample the inputs
            @(posedge vif_monitor.clock);
            pkt.a       = vif_monitor.a;
            pkt.b       = vif_monitor.b;
            pkt.op_code = vif_monitor.op_code;

            // Sample the outputs (wait for next cycle)
            @(posedge vif_monitor.clock);
            pkt.result  = vif_monitor.result;
            
            // Send the transaction to the scoreboard
            monitor_port.write(pkt);
        end
    endtask
endclass