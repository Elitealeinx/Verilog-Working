module half_adder (a,b,sum,carry);
input a;
input b;
output reg sum;
output reg carry;

always@(a or b) begin

  sum=a^b;
  carry=a&b;

end
endmodule
