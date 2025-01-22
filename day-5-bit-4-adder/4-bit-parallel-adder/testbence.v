module bit4_parallel_addertb;
	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg c_in;

	// Outputs
	wire [3:0] sum;
	wire c_out;

	// Instantiate the Unit Under Test (UUT)
	bit4_parallel_adder uut (
		.a(a), 
		.b(b), 
		.c_in(c_in), 
		.sum(sum), 
		.c_out(c_out)
	);

	initial begin
	  $monitor("Time = %0t | a = %b, b = %b, c_in = %b | sum = %b, c_out = %b", 
                 $time, a, b, c_in, sum, c_out);
		// Initialize Inputs
		a = 4'b0101;
		b = 4'b1101;
		c_in = 0;
		// Wait 100 ns for global reset to finish
		#100;
      

	end
 endmodule
