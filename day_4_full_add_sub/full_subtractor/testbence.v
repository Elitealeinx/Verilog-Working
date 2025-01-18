module full_substractor_tb;
reg a,b,Bin;
wire diff,borrow;
full_substractor uut (.a(a), .b(b), .Bin(Bin), .diff(diff), .borrow(borrow));
initial begin
$dumpfile("full_substractor_tb.vcd");
$dumpvars(0,full_substractor_tb);
a=0; b=0; Bin=0;
#10
a=0; b=0; Bin=1;
#10
a=0; b=1; Bin=0;
#10
a=0; b=1; Bin=1;
#10
a=1; b=0; Bin=0;
#10
a=1; b=0; Bin=1;
#10
a=1; b=1; Bin=0;
#10
a=1; b=1; Bin=1;
#10

$finish();
end
endmodule
