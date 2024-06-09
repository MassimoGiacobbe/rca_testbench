//`include "rca_if_sva.sh"

interface rca_if #(parameter N = 2);

//interface signals

logic clk; //the design is combinational and asynchronous, we use the clock to give timing to the simulation
logic Cin;
logic [N-1:0] A;
logic [N-1:0] B;
logic [N-1:0] SUM;
logic Cout;

//interface port
modport rca_port(
input A,
input B,
input Cin,
output SUM,
output Cout
);


initial begin: init
clk =1'b1;
end

always #5ns begin: clk_gen
clk=~clk;
    end
endinterface
