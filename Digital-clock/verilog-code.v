`timescale 1ns / 1ps

module digital_clock(
      input clk,reset,
		output reg [5:0] second,
		output reg [5:0] min,
		output reg [5:0] hour
    );
	 
	 always @(posedge clk or posedge reset) begin
	       if (reset) begin
			     second = 6'd0;
				  min = 6'd0;
				  hour = 6'd0;
				end
			else begin
			    if (second == 6'd59) begin
				      second = 6'd0;
						if (min == 6'd59) begin 
						    min = 6'd0;
							 
							 if (hour == 6'd23) begin
							     hour = 6'd0;
								 end
							 else begin
							     hour = hour + 6'd1;
								 end
							end
						else begin
						     min = min + 6'd1;
							end
					 end
				 else begin 
				     second = second + 6'd1;
					 end
				end						    
	     end
      endmodule
