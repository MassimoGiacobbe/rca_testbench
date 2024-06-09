

`ifndef RCA_COV
`define RCA_COV

class rca_cov #(parameter N = 4);
    
    // Adder interface
    local virtual interface rca_if #(N) rif;
    
   
    // RCA coverage
    covergroup rca_cg;
        // Cover points for inputs
        a_cp: coverpoint rif.A iff (rif.rst_n) {
            bins corner[] = {0, (1<<N)-1, (1<<(N-1))-1};
            bins others   = default;
        }
        b_cp: coverpoint rif.B iff (rif.rst_n) {
            bins corner[] = {0, (1<<N)-1, (1<<(N-1))-1};
            bins others   = default;
        }
        cin_cp: coverpoint rif.Cin iff (rif.rst_n) {
            bins zero = {0};
            bins one  = {1};
        }
        
        // Cover points for outputs
        sum_cp: coverpoint rif.SUM iff (rif.rst_n) {
            bins full_range[] = {[0:(1<<N)-1]};
        }
        cout_cp: coverpoint rif.Cout iff (rif.rst_n) {
            bins zero = {0};
            bins one  = {1};
        }
    endgroup: rca_cg

    // Constructor
    function new(virtual interface rca_if #(N) _if);
        rif         = _if;
        rca_cg      = new();

        // Disable the covergroup by default
        rca_cg.stop();
    endfunction: new

    // Enable coverage
    function void cov_start();
        rca_cg.start();
    endfunction: cov_start

    // Disable coverage
    function void cov_stop();
        rca_cg.stop();
    endfunction: cov_stop

    // Sample coverage
    function void cov_sample();
        rca_cg.sample();
    endfunction: cov_sample

    // Return coverage
    function real get_cov();
        return rca_cg.get_inst_coverage();
    endfunction: get_cov
    
endclass // rca_cov

`endif /* RCA_COV_SVH_ */
