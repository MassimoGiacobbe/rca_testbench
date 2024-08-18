`ifndef RCA_IF_SVA_H_
`define RCA_IF_SVA_H_

int unsigned err_num = 0;

function int unsigned get_err_num();
	automatic int unsigned val =err_num;	
	err_num=0;
	return val;
endfunction : get_err_num

property p_sum;
	@(posedge clk)
		(A+B > ((1<<N)-1)) -> SUM == ((A+B)-(1<<N));
endproperty


property p_cout;
	@(posedge clk)
		(A+B > (1<<N)-1) -> Cout == 1;
endproperty


assert property(p_sum and p_cout)
else
begin
	$display("Error: ...");
	err_num ++;
end

`endif
