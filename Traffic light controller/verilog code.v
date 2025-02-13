`timescale 1ns / 1ps


 module traffic_signal(
     input x,clk,reset,   
	  output reg [7:0] main_road,county_road
     );
	       localparam
			      sr = 2'b00, //main_road- Green, county_road- Red
					s0 = 2'b01, //main_road- Yellow, county_road- Red
					s1 = 2'b10, //main_road- Red, county_road- Green
					s2 = 2'b11, //main_road- Red, county_road- Yellow
					
					green = 8'b01000111,
					yellow = 8'b01011001,
					red = 8'b01010010;
	      	  
     reg [1:0] cs,nxs; //cs - current state
		                 //nxs - next state
		always @ (posedge clk or posedge reset) begin
		          if (reset) 
					     cs <= sr;
					else
					     cs <= nxs;
		 end
		 
		always @ (*) begin
		      nxs = cs;
				case (cs)
				  sr: begin
				      main_road = green;
						county_road = red;
				      if (x) nxs=s0;
						else nxs=sr;
						end
				  s0: begin
				      main_road = yellow;
						county_road = red;
				      nxs=s1;
						end
				  s1: begin
				      main_road = red;
						county_road = green;
						if (x) nxs = s1;
				      else nxs=s2;
						end
				  s2: begin
				      main_road = red;
						county_road = yellow;
				      nxs=sr;
						end
			endcase
		end
 endmodule
