`ifndef RCA_IF_SVA
`define ALU_IF_SVA
`define PRINT_OP(A, B, Cin, SUM, Cout,) \
    $sformatf("A: %h | B: %h (%d) | Cin: %b (%d) | SUM: %h (%d) | Cout: %b", $past(A), $past(B), $past(Cin), $past(SUM), $past(Cout))

int unsigned err_num=0;

function int unsigned get_err_num();
    automatic int unsigned n = err_num;
    err_num = 0;
    return n;
endfunction: get_err_num


property p_result:
   logic [N-1:0] expected_sum;
    logic expected_cout;
    @(negedge clk)
    if (resetn) begin
        // Calculate the expected sum and carry out
        expected_sum = A + B + Cin;
        expected_cout = (A + B + Cin) >= (1 << N);
        
        // Check if the actual sum and carry out match the expected values
        if (SUM !== expected_sum || Cout !== expected_cout) begin
            $display("Error detected: %s", `PRINT_OP(A, B, Cin, SUM, Cout));
            err_num++;
        end
    end
endproperty: p_result

// Assertion instantiation
a_result: assert property (p_result)
    else begin
     $error("Ripple Carry Adder check failed.");
    end
`endif // RCA_IF_SVA