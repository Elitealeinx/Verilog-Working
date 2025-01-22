module bit4_parallel_adder(
    input [3:0] a,
    input [3:0] b,
    input c_in,
    output  reg [3:0] sum,
	 output reg c_out
    );
	 integer i;
	 reg [4:0] c;
	 
	always @(*) begin
	
	c[0]=c_in;
	 
	 for(i=0;i<=3;i=i+1) begin
	     sum[i]=a[i] ^ b[i] ^ c[i];
		  c[i+1]=(((a[i] ^ b[i]) & c[i]) | (a[i] & b[i]));
    end
	 
	 c_out=c[i];
end
endmodule
