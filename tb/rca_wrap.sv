module rca_wrap #(parameter N = 4)( rca_if.rca_port p);

ripple_carry_adder #(N) rca_u(
.Cin     (p.Cin),
.A       (p.A),            
.B       (p.B),
.SUM     (p.SUM),
.Cout    (p.Cout)  


);
endmodule
