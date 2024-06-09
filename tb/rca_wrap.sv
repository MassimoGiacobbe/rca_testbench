module rca_wrap #(parameter N = 4)( rca_if.rca_port p);

rca #(N) rca_u(
.clk     (p.clk),  
.Cin     (p.Cin),
.A       (p.A),            
.B       (p.B),
.SUM     (p.SUM),
.Cout    (p.Cout),
.Cin      (p.Cin)  


);
endmodule