`timescale 1ns/1ns

import uvm_pkg::*;
`include "uvm_macros.svh"


// --------------------------------------------------------------
// Include Files
// --------------------------------------------------------------
`include "interface.sv"
`include "txn_pkt.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"

module top;
    // ----------------------------------------------------------
    // Internal Signals
    // ----------------------------------------------------------

    logic clock;

    // ----------------------------------------------------------
    // Instantiation
    // ----------------------------------------------------------

    alu_interface intf(.clock(clock));

    alu dut(
        .clock(intf.clock),
        .reset(intf.reset),
        .A(intf.a),
        .B(intf.b),
        .ALU_Sel(intf.op_code),
        .ALU_Out(intf.result),
        .CarryOut(intf.carry_out)
    );

    // ----------------------------------------------------------
    // Interface Setting
    // ----------------------------------------------------------

    

    // ----------------------------------------------------------
    // Start the Test
    // ----------------------------------------------------------

    initial begin
        run_test();
    end

    // ----------------------------------------------------------
    // Clock Generation
    // ----------------------------------------------------------
    initial begin
        clock = 0;
        forever #2 clock = ~clock;
    end

    initial begin
        #5000;
        $display("Simulation Finished!");
        $finish();
    end

endmodule: top