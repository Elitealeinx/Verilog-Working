module half_adder_tb;
reg a,b;
wire sum;
wire carry;
half_substractor uut(a,b,sum,carry);
initial begin
$dumpfile("half_adder_tb.vcd");
$dumpvars(0,half_adder_tb);
a=0; b=0;
#10
a=0; b=1;
#10
a=1; b=0;
#10
a=1; b=1;
#10
$finish();
end
endmodule
