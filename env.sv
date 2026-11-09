import uvm_pkg::*;
`include "uvm_macros.svh"

class alu_env extends uvm_env;
    `uvm_component_utils(alu_env)

    alu_agent agent;
    alu_scoreboard scb;

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

        agent = alu_agent::type_id::create("agent", this);
        scb = alu_scoreboard::type_id::create("scb", this);
    endfunction

    // ----------------------------------------------------------
    // Connect Phase
    // ----------------------------------------------------------
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("ENV_CLASS", "Connect Phase!", UVM_HIGH);

        agent.mon.monitor_port.connect(scb.scoreboard_port);
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