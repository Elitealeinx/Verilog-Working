module half_substractor (a,b,diff,borrow);
input a;
input b;
output reg diff;
output reg borrow;

always@(a or b) begin

  diff=a^b;
  borrow=(~a)&b;

end
endmodule
