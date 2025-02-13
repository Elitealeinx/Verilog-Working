`timescale 1ns / 1ps


 module traffic_signaltb;
	reg x,clk,reset;
	wire [7:0] main_road;
	wire [7:0] county_road;
	traffic_signal uut (
		.x(x), .clk(clk), .reset(reset), 
	.main_road(main_road), .county_road(county_road)
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
		x = 0;  #100
		x = 0;  #100
		x = 1;  #100
		x = 1;  #100
		x = 0;  #100
		x = 0;  #100
		x = 0;  #100
		x = 1;  #100
		x = 1;  #100
		x = 0;  #100
		   #100;
	end
    endmodule
