module half_substractor_tb;
reg a,b;
wire diff;
wire borrow;
half_substractor uut(a,b,diff,borrow);
initial begin
$dumpfile("half_substarctor_tb.vcd");
$dumpvars(0,half_substractor_tb);
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
