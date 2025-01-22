module bit4_parallel_sub(
    
    input [3:0] a,
    input [3:0] b,
    input c_in,
    output  reg [3:0] diff,
	 output reg b_out
    );
	 integer i;
	 reg [4:0] c;
	 
	always @(*) begin
	
	c[0]=c_in;
	 
	 for(i=0;i<=3;i=i+1) begin
	     diff[i]=a[i] ^ (~b[i]) ^ c[i];
		  c[i+1]=(((a[i] ^ (~b[i])) & c[i]) | (a[i] & (~b[i])));
    end
	 
	 b_out=c[i];
end
endmodule
