`timescale 1ns / 1ps

module sequence_detectortb;
	reg x,reset,clk;
	wire y000,y001,y010,y011,y100,y101,y110,y111;
	
	sequence_detector uut (
		.x(x),.reset(reset),.clk(clk), .y000(y000), .y001(y001),
		.y010(y010), .y011(y011), .y100(y100),
		.y101(y101), .y110(y110), .y111(y111)
			         );
    initial begin
		clk = 0;
		forever #25 clk = ~clk;
		 end
	 initial begin 
	   reset = 1; #10 
		reset = 0;
		 end
	 initial begin 
		    x = 1; #50   x = 0; #50
	       x = 0; #50   x = 0; #50
		    x = 1; #50   x = 0; #50
		    x = 1; #50   x = 1; #50
		    x = 0; #50   x = 1; #50
			 x = 1; #50   x = 1; #50
			 x = 1; #50   x = 1; #50
			 x = 0; #50   x = 1; #50
			 x = 0; #50   x = 1; #50
			 x = 1; #50   x = 0; #50
			 x = 1; #50   x = 1; #50
		#100;
         end
  endmodule
