module full_substractor (a,b,Bin,diff,borrow);
input a,b,Bin;
output reg diff,borrow;
reg w1;

always@(*) begin

   w1=a^b;
   diff=w1^Bin;
   borrow=(((~w1) & Bin) | ((~a) & b));

end
endmodule
