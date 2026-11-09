 class alu_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(alu_scoreboard)

    uvm_analysis_imp #(alu_txn_pkt, alu_scoreboard) scoreboard_port;

    alu_txn_pkt transactions[$];

    // ----------------------------------------------------------
    // Constructor
    // ----------------------------------------------------------
    function new(string name = "alu_scoreboard", uvm_component parent = null);
        super.new(name, parent);
        `uvm_info("SCB_CLASS", "Inside Constructor", UVM_HIGH);
    endfunction

    // ----------------------------------------------------------
    // Build Phase
    // ----------------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("SCB_CLASS", "Build Phase!", UVM_HIGH);

        scoreboard_port = new("scoreboard_port", this);
    endfunction

    // ----------------------------------------------------------
    // Connect Phase
    // ----------------------------------------------------------
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("SCB_CLASS", "Connect Phase!", UVM_HIGH);
    endfunction

    // ----------------------------------------------------------
    // Write Method
    // ----------------------------------------------------------
    function void write(alu_txn_pkt pkt);
        transactions.push_back(pkt);
        `uvm_info("SCB_CLASS", $sformatf("Transaction received: a=%0d, b=%0d, op_code=%0d, result=%0d", pkt.a, pkt.b, pkt.op_code, pkt.result), UVM_HIGH);
    endfunction

    // ----------------------------------------------------------
    // Run Phase
    // ----------------------------------------------------------
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("SCB_CLASS", "Run Phase!", UVM_HIGH);

        forever begin
            // Get the packet
            alu_txn_pkt current_pkt;
            wait(transactions.size() > 0);
            current_pkt = transactions.pop_front();

            // Compare with actual result
            compare(current_pkt);

            // Score the transaction accordingly
        end
    endtask

    // ----------------------------------------------------------
    // Compare Method
    // ----------------------------------------------------------
    task compare(alu_txn_pkt curr_pkt);
        logic [7:0] expected_result;
        logic [7:0] actual_result;

        // Generate expected result
        case (curr_pkt.op_code)
            0: expected_result = curr_pkt.a + curr_pkt.b; // ADD (A + B)
            1: expected_result = curr_pkt.a - curr_pkt.b; // SUB (A - B)
            2: expected_result = curr_pkt.a * curr_pkt.b; // MUL (A * B)
            3: expected_result = curr_pkt.a / curr_pkt.b; // DIV (A / B)
            default: expected_result = 8'hXX; // Undefined operation
        endcase

        // Parse the actual result from the current packet
        actual_result = curr_pkt.result;

        // Compare with actual result
        if(actual_result !== expected_result) begin
            `uvm_error("COMPARE", $sformatf("Mismatch! Expected: %0d, Actual: %0d for a=%0d, b=%0d, op_code=%0d", expected_result, actual_result, curr_pkt.a, curr_pkt.b, curr_pkt.op_code));
        end else begin
            `uvm_info("COMPARE", $sformatf("Match! Expected: %0d, Actual: %0d for a=%0d, b=%0d, op_code=%0d", expected_result, actual_result, curr_pkt.a, curr_pkt.b, curr_pkt.op_code), UVM_LOW);
        end
    endtask
 endclass