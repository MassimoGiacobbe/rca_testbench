`ifndef RCA_TESTER
`define RCA_TESTER
`include "rca_cov.sv"

class rca_tester #(parameter N = 4);

virtual interface rca_if #(N) rif;

typedef struct packed {
    logic[N-1:0]  A;
    logic[N-1:0]  B;
    logic         Cin;
}input_t;


protected rand input_t inputs;

protected static rca_cov #(N) rcov;

//Constructor
function new(virtual interface rca_if #(N) _if);
    rif = _if;
    rcov = new(_if);
endfunction

task run_test(int unsigned num_cycles);
init();

rcov.cov_start();

repeat (num_cycles) begin: driver
@(posedge rif.clk);
rand_rca_in();
end

@(posedge rif.clk);

rcov.cov_stop();

endtask //run_test

protected task init();

rif.A='0;
rif.B='0;
rif.Cin='0;

@(posedge rif.clk);
endtask

function void rand_rca_in();
assert (this.randomize())   // check the method's return value
        else   $error("ERROR while calling 'randomize()' method");
//assign random values to the inputs
rif.A = inputs.A;
rif.B = inputs.B;
rif.Cin = inputs.Cin;

rcov.cov_sample();
endfunction

function real get_cov();
    return rcov.get_cov();
endfunction

endclass

`endif
