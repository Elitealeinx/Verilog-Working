module tinput_xor_tb;
reg a,b,c;
wire z;
tinput_xor uut (.a(a), .b(b), .c(c), .z(z));
initial begin
$dumpfile("tinput_xor_tb.vcd");
$dumpvars(0,tinput_xor_tb);
a=0; b=0; c=0;
#10
a=0; b=0; c=1;
#10
a=0; b=1; c=0;
#10
a=0; b=1; c=1;
#10
a=1; b=0; c=0;
#10
a=1; b=0; c=1;
#10
a=1; b=1; c=0;
#10
a=1; b=1; c=1;
#10

$finish();
end
endmodule
