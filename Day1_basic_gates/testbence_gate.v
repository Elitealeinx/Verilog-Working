module gatetb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire z;

	// Instantiate the Unit Under Test (UUT)
	and_gate uut (
		.a(a), 
		.b(b), 
		.z(z)
	);

	initial begin
		// Initialize Inputs
		     a = 0; b = 0;
		#100 a = 0; b = 1;
		#100 a = 1; b = 0;
		#100 a = 1; b = 1;

		// Wait 100 ns for global reset to finish
		#100;
		
		$finish();
	end
      
endmodule
