interface rca_if #(parameter N = 2);

//interface signlas

logic clk; //the design is combinational and asynchronous, we use the clock to give timing to the simulation
logic Cin;
logic [N-1:0] A;
logic [N-1:0] B;
logic [N-1:0] SUM;
logic Cout;
logic Cin;

\\interface port
modport rca_port(
input A;
input B;
input Cin;
output SUM;
output Cout;
);


initial begin: initial
clk =1'b1;
end

always #5ns begine: clk_gen
clk=~clk;
    end

