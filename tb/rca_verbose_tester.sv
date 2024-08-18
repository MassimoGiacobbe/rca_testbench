`ifndef RCA_VERBOSE_TESTER
`define RCA_VERBOSE_TESTER

`include "rca_tester.sv"

class rca_verbose_tester #(
    parameter N = 4
) extends rca_tester #(N);

input_t inq[$];

function new(virtual interface rif #(N) _if);
super.new(_if);  //inherited Constructor
inq ={};
endfunction;

task run_test(int unsigned num_cycles);

init();

rcov.cov_start();

fork

    print_op();

    repeat (num_cycles) begin: driver
    @(posedge rif.clk);
    rand_rca_in();
    inq.push_front({inputs});
	end
join

rcov.cov_stop();
endtask

task print_op();
 
 input_t prev_inputs;

        while (inq.size() > 0) begin
            @(negedge rif.clk); 
            prev_inputs = inq.pop_back();
            $display("[%07t]  | A: %b (%d) | B: %b (%d) |CIN: %B (%d)| SUM: %b (%d) | COUT: %b (%d)", $time, rif.A, rif.A, rif.B, rif.B, rif.Cin, rif.Cin, rif.SUM, rif.SUM, rif.Cout, rif.Cout );
        end
endtask

endclass

`endif
