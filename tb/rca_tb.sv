`include "rca_tester.sv"
`include "rca_verbose_tester.sv"


module rca_tb;

localparam N=4;
//interface
rca_if #(N) rif();
//wrap
rca_wrap #(N) rw(rif.rca_port);
//quiet tester 
rca_tester #(N) tst;
//verbose tester 
rca_verbose_tester vbs_tst;


int unsigned test_cycles = 10;
int unsigen err_num = 0;

initial begin

//testers Constructors

tst=new(rif);
vbs_tst=new(rif);

\\run quiet test

tst.run_test(num_cycles);

vbs_tst.run_test(num_cycles);

$display("\nTOTAL FUNCTIONAL COVERAGE: %.2f%%", tst.get_cov());

err_num = rif.get_err_num();

if(err_num>0) begin
$error("### TEST FAILED with %0d errors", err_num);
        end else $display("### TEST PASSED!");

$stop;
end
endmodule
