module full_adder_tb;
reg a,b,Cin;
wire sum,carry;
full_adder uut (.a(a), .b(b), .Cin(Cin), .sum(sum), .carry(carry));
initial begin
$dumpfile("full_adder_tb.vcd");
$dumpvars(0,full_adder_tb);
a=0; b=0; Cin=0;
#10
a=0; b=0; Cin=1;
#10
a=0; b=1; Cin=0;
#10
a=0; b=1; Cin=1;
#10
a=1; b=0; Cin=0;
#10
a=1; b=0; Cin=1;
#10
a=1; b=1; Cin=0;
#10
a=1; b=1; Cin=1;
#10

$finish();
end
endmodule
