`timescale 1ns / 1ps

// Sequence detector that detects all types of 3 bit number [0 - 7],[000 - 111]
module sequence_detector(
	      input x,clk,reset,   
			output  y000,y001,
					  y010,y011,
					  y100,y101,
					  y110,y111); 			
	     sequence_detector_000  s0(.clk(clk), 
		             .reset(reset), .x(x), .y(y000));
		  sequence_detector_001  s1(.clk(clk), 
		             .reset(reset), .x(x), .y(y001));
		  sequence_detector_010  s2(.clk(clk), 
		             .reset(reset), .x(x), .y(y010));
		  sequence_detector_011  s3(.clk(clk), 
		             .reset(reset), .x(x), .y(y011));
		  sequence_detector_100  s4(.clk(clk), 
		             .reset(reset), .x(x), .y(y100));
		  sequence_detector_101  s5(.clk(clk), 
		             .reset(reset), .x(x), .y(y101));
		  sequence_detector_110  s6(.clk(clk), 
		             .reset(reset), .x(x), .y(y110));
		  sequence_detector_111  s7(.clk(clk), 
		             .reset(reset), .x(x), .y(y111));
				
	 endmodule


	 module sequence_detector_010(
	      input x,clk,reset,   //010
			output reg y
     );
	       localparam
			      sr = 2'b00, //reset state
					s0 = 2'b01, //s0- 0
					s1 = 2'b10, //s1- 01
					s2 = 2'b11; //s2- 010
	      	  
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
				y = 1'b0;
				
			case (cs)
				  sr: begin
				      if (x) nxs=sr;
						else nxs=s0;
						end
				  s0: begin
				      if (x) nxs=s1;
						else nxs=s0;
						end
				  s1: begin
				      if (x) nxs=sr;
						else nxs=s2;	
						end
				  s2: begin
				      y = 1'b1;
				      if (x) nxs=s1;
						else nxs=s0;
						end
			endcase
		end
	 endmodule
	 
	 
	 
	 
	 module sequence_detector_000(
	      input x,clk,reset,   //000
			output reg y
     );
	       localparam
			      sr = 2'b00, //reset state
					s0 = 2'b01, //s0- 0
					s1 = 2'b10, //s1- 00
					s2 = 2'b11; //s2- 000
	      	  
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
				y = 1'b0;
				
			case (cs)
				  sr: begin
				      if (x) nxs=sr;
						else nxs=s0;
						end
				  s0: begin
				      if (x) nxs=sr;
						else nxs=s1;
						end
				  s1: begin
				      if (x) nxs=sr;
						else nxs=s2;
						end
				  s2: begin
				      y = 1'b1;
				      if (x) nxs=sr;
						else nxs=s2;
						end
			endcase
		end
   endmodule







    module sequence_detector_001(
	      input x,clk,reset,   //001
			output reg y
     );
	       localparam
			      sr = 2'b00, //reset state
					s0 = 2'b01, //s0- 0
					s1 = 2'b10, //s1- 00
					s2 = 2'b11; //s2- 001
	      	  
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
				y = 1'b0;
				
			case (cs)
				  sr: begin
				      if (x) nxs=sr;
						else nxs=s0;
						end
				  s0: begin
				      if (x) nxs=sr;
						else nxs=s1;
						end
				  s1: begin
				      if (x) nxs=s2;
						else nxs=s1;
						end
				  s2: begin
				      y = 1'b1;
				      if (x) nxs=sr;
						else nxs=s0;
						end
			endcase
		end
	 endmodule
	 
	 
	
	 
	 
	 module sequence_detector_011(
	      input x,clk,reset,   //011
			output reg y
     );
	       localparam
			      sr = 2'b00, //reset state
					s0 = 2'b01, //s0- 0
					s1 = 2'b10, //s1- 01
					s2 = 2'b11; //s2- 011
	      	  
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
				y = 1'b0;
				
			case (cs)
				  sr: begin
				      if (x) nxs=sr;
						else nxs=s0;
						end
				  s0: begin
				      if (x) nxs=s1;
						else nxs=s0;
						end
				  s1: begin
				      if (x) nxs=s2;
						else nxs=s0;
						end
				  s2: begin
				      y = 1'b1;
				      if (x) nxs=sr;
						else nxs=s0;
						end
			endcase
		end
	 endmodule
	 
	 
	 
	 
	module sequence_detector_100(
	      input x,clk,reset,   //100
			output reg y
     );
	       localparam
			      sr = 2'b00, //reset state
					s0 = 2'b01, //s0- 1
					s1 = 2'b10, //s1- 10
					s2 = 2'b11; //s2- 100
	      	  
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
				y = 1'b0;
				
			case (cs)
				  sr: begin
				      if (x) nxs=s0;
						else nxs=sr;
						end
				  s0: begin
				      if (x) nxs=s0;
						else nxs=s1;
						end
				  s1: begin
				      if (x) nxs=s0;
						else nxs=s2;
						end
				  s2: begin
				      y = 1'b1;
				      if (x) nxs=s0;
						else nxs=sr;
						end
			endcase
		end
	 endmodule




   module sequence_detector_101(
	      input x,clk,reset,   //101
			output reg y
     );
	       localparam
			      sr = 2'b00, //reset state
					s0 = 2'b01, //s0- 1
					s1 = 2'b10, //s1- 10
					s2 = 2'b11; //s2- 101
	      	  
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
				y = 1'b0;
				
			case (cs)
				  sr: begin
				      if (x) nxs=s0;
						else nxs=sr;
						end
				  s0: begin
				      if (x) nxs=s0;
						else nxs=s1;
						end
				  s1: begin
				      if (x) nxs=s2;
						else nxs=sr;
						end
				  s2: begin
				      y = 1'b1;
				      if (x) nxs=s0;
						else nxs=s1;
						end
			endcase
		end
	 endmodule

	 
	 
	 module sequence_detector_110(
	      input x,clk,reset,   //110
			output reg y
     );
	       localparam
			      sr = 2'b00, //reset state
					s0 = 2'b01, //s0- 1
					s1 = 2'b10, //s1- 11
					s2 = 2'b11; //s2- 110
	      	  
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
				y = 1'b0;
				
			case (cs)
				  sr: begin
				      if (x) nxs=s0;
						else nxs=sr;
						end
				  s0: begin
				      if (x) nxs=s1;
						else nxs=sr;
						end
				  s1: begin
				      if (x) nxs=s1;
						else nxs=s2;
						end
				  s2: begin
				      y = 1'b1;
				      if (x) nxs=s0;
						else nxs=sr;
						end
			endcase
		end
    endmodule
	 
	
	 
	 
	module sequence_detector_111(
	      input x,clk,reset,   //111
			output reg y
     );
	       localparam
			      sr = 2'b00, //reset state
					s0 = 2'b01, //s0- 1
					s1 = 2'b10, //s1- 11
					s2 = 2'b11; //s2- 111
	      	  
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
				y = 1'b0;
				
			case (cs)
				  sr: begin
				      if (x) nxs=s0;
						else nxs=sr;
						end
				  s0: begin
				      if (x) nxs=s1;
						else nxs=sr;
						end
				  s1: begin
				      if (x) nxs=s2;
						else nxs=sr;
						end
				  s2: begin
				      y = 1'b1;
				      if (x) nxs=s2;
						else nxs=sr;
						end
			endcase
		end
  endmodule
