module tinput_xor (a,b,c,z);
input a,b,c;
output reg z;
reg w1;

always@(*) begin

   w1=a^b;
   z=w1^c;

end
endmodule


