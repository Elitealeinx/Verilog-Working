module bit4_parallel_subtb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg c_in;

	// Outputs
	wire [3:0] diff;
	wire b_out;

	// Instantiate the Unit Under Test (UUT)
	bit4_parallel_sub uut (
		.a(a), 
		.b(b), 
		.c_in(c_in), 
		.diff(diff), 
		.b_out(b_out)
	);

	initial begin
		// Initialize Inputs
		$monitor("Time = %0t | a = %b, b = %b, c_in = %b | diff = %b, b_out = %b", 
                 $time, a, b, c_in, diff, b_out);
		// Initialize Inputs
		a = 4'b0101;
		b = 4'b0001;
		c_in = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule
