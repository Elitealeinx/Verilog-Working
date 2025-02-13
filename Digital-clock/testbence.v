`timescale 1ns / 1ps
 module digital_clocktb;
	reg clk,reset;
	wire [5:0] second,min;
	wire [5:0] hour;
	
    digital_clock uut (
		.clk(clk), .reset(reset), .second(second), 
		.min(min), .hour(hour)
	  );
	initial begin
		clk = 0;
		forever #0.001 clk=~clk;
	  end
	initial begin 
		reset = 1; #1
		reset = 0;
		  #100;
      end
   endmodule
