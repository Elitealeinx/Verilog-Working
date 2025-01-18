module full_adder (a,b,Cin,sum,carry);
input a,b,Cin;
output reg sum,carry;
reg w1;

always@(*) begin

   w1=a^b;
   sum=w1^Cin;
   carry=((w1 & Cin) | (a & b));

end
endmodule
