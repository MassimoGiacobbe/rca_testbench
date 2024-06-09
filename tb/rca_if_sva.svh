`ifndef RCA_IF_SVA
`define RCA_IF_SVA


int unsigned err_num=0;

function int unsigned get_err_num();
    automatic int unsigned n = err_num;
    err_num = 0;
    return n;
endfunction: get_err_num


property SUM_result;
    	@(negedge clk)
        // Calculate the expected sum and carry out
        SUM == A + B + Cin;
       // Cout == (A + B + Cin) >= (1 << N);        
		
endproperty

// Assertion instantiation
/* assert property(SUM_result);
    else begin
	err_num++;     
	$error("Ripple Carry Adder check failed.");
    end
*/	
`endif // RCA_IF_SVA
