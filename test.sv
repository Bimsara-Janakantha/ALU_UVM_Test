class alu_test extends uvm_test;
    `uvm_component_utils(alu_test)

    alu_env env;
    alu_base_sequence reset_seq;
    alu_test_sequence test_seq;

    // ----------------------------------------------------------
    // Constructor
    // ----------------------------------------------------------
    function new(string name = "alu_test", uvm_component parent = null);
        super.new(name, parent);
        `uvm_info("TEST_CLASS", "Inside Constructor", UVM_HIGH);
    endfunction

    // ----------------------------------------------------------
    // Build Phase
    // ----------------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("TEST_CLASS", "Build Phase!", UVM_HIGH);

        env = alu_env::type_id::create("env", this);
    endfunction

    // ----------------------------------------------------------
    // Connect Phase
    // ----------------------------------------------------------
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("TEST_CLASS", "Connect Phase!", UVM_HIGH);

        // Connect monitor with scoreboard
    endfunction

    // ----------------------------------------------------------
    // Run Phase
    // ----------------------------------------------------------
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("TEST_CLASS", "run Phase!", UVM_HIGH);

        // ------------------------------------------------------
        // Logic
        // ------------------------------------------------------
        phase.raise_objection(this);

        // Reset Sequence
        reset_seq = alu_base_sequence::type_id::create("reset_seq");
        reset_seq.start(env.agent.seqr);

        // Test Sequence
        test_seq = alu_test_sequence::type_id::create("test_seq");
        test_seq.start(env.agent.seqr);

        phase.drop_objection(this);
    endtask
endclass