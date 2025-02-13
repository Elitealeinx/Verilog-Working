 module ALU_unitTb;
   reg [7:0] operand_1;
	reg [7:0] operand_2;
	reg [3:0] operator;
   wire [7:0] Answer1;
	wire [7:0] Answer2;

	arithmetic_logical_unit uut (
		.operand_1(operand_1), .operand_2(operand_2), 
		.operator(operator), 
		.Answer1(Answer1), .Answer2(Answer2)
	);

	initial begin
		operand_1 = 8'd6; operand_2 = 8'd5; operator = 4'd0; #50
		operand_1 = 8'd6; operand_2 = 8'd5; operator = 4'd1; #50
		operand_1 = 8'd6; operand_2 = 8'd5; operator = 4'd2; #50
		operand_1 = 8'd6; operand_2 = 8'd5; operator = 4'd3; #50
		operand_1 = 8'd8; operand_2 = 8'd5; operator = 4'd4; #50
		operand_1 = 8'd6; operand_2 = 8'd5; operator = 4'd5; #50
		operand_1 = 8'd6; operand_2 = 8'd5; operator = 4'd6; #50
		operand_1 = 8'd16; operand_2 = 8'd51; operator = 4'd0; #50
		operand_1 = 8'd20; operand_2 = 8'd8; operator = 4'd1; #50
		operand_1 = 8'd23; operand_2 = 8'd55; operator = 4'd2; #50
		operand_1 = 8'd56; operand_2 = 8'd90; operator = 4'd3; #50
		operand_1 = 8'd09; operand_2 = 8'd3; operator = 4'd4; #50
		operand_1 = 8'd2; operand_2 = 8'd1; operator = 4'd5; #50
		operand_1 = 8'd5; operand_2 = 8'd0; operator = 4'd6; #50

		#100;
     

	end
      
endmodule
