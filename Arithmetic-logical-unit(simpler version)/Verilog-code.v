`timescale 1ns / 1ps


module arithmetic_logical_unit(
       input [7:0] operand_1,operand_2, 
		 input [3:0] operator,
		 output reg [7:0] Answer1,Answer2

    );
	 
	 /*  operator--------------------
	     0000- " = " Check equal [Answer1]
		  0001- " > " Check operator_1 is greater than operator_2  [Answer1]
		  0010- " < " Check operator_1 is smaller than operator_2  [Answer1]
		  0011- " + " Addition   [Answer1- sum, Answer2- carry]
		  0100- " - " Substraction   [Answer1- difference, Answer2 - borrow]
		  0101- " * " Multiplication  [Answer1]
		  0110- " / " Division  [Answer1- Quotient,  Answer2- remainder]
	 */
	 
	 wire aGTb,aEQb,aLTb,carry,borrow;
	 wire [7:0] sum,diff,product,Q,R;
	 
	 bit8_comparator a0 (.a(operand_1), .b(operand_2), .aGTb(aGTb), .aEQb(aEQb), .aLTb(aLTb));
	 bit8_adder a1 (.a(operand_1), .b(operand_2), .sum(sum), .c_out(carry));
	 bit8_subtractor a2 (.a(operand_1), .b(operand_2), .diff(diff), .b_out(borrow));
	 bit4_multiplier a3 (.a(operand_1[3:0]), .b(operand_2[3:0]), .p(product));
	 binary_divider a4 (.divdend(operand_1), .divisor(operand_2), .quotient(Q), .remainder(R));
	 
	 always @(*) begin
	      Answer1 = 8'd0;
			Answer2 = 8'd0;
	      case (operator)
			    4'b0000: begin
				    Answer1[0] = aEQb;  // if ans is 1 means true , 0- means false
				  end
				 4'b0001: begin
				    Answer1[0] = aGTb;
				  end
				 4'b0010: begin
				    Answer1[0] = aLTb;
				  end
				 4'b0011: begin  //additon
				    Answer1 = sum;
					 Answer2[0] = carry;
				  end
				 4'b0100: begin  // substraction
				    Answer1 = diff;
					 Answer2[0] = borrow;
				  end
				 4'b0101: begin  // multiplication only apllicabe for 4 bit range
				    Answer1 = product;
				  end
				 4'b0110: begin  // operand_1 must be dividend, operand_2 must be divisior
				    Answer1[3:0] = Q;  // both has to be 4 bit and divisor has to be less than dividend
					 Answer2[4:0] = R;
				  end
			endcase
	 end
endmodule


module full_adder (
input a,
input b,
input cin,
output sum,
output cout);

assign sum = (a^b^cin);
assign cout = (a&&b)||(b&&cin)||(a&&cin);

endmodule

module full_sub (
input a,
input b,
input bin,
output diff,
output bout);

assign diff = (a^b^bin);
assign bout = ((a ~^ b) & bin) | (~a & b);
 
endmodule

module IC7483(
input a0,
input a1,
input a2,
input a3,
input b0,
input b1,
input b2,
input b3,
input cin,
output s0,
output s1,
output s2,
output s3,
output cout);

wire c1,c2,c3;

full_adder FA1 (.a(a0), .b(b0), .cin(cin), .sum(s0), .cout(c1));
full_adder FA2 (.a(a1), .b(b1), .cin(c1), .sum(s1), .cout(c2));
full_adder FA3 (.a(a2), .b(b2), .cin(c2), .sum(s2), .cout(c3));
full_adder FA4 (.a(a3), .b(b3), .cin(c3), .sum(s3), .cout(cout));

endmodule

module bit4_multiplier(
    input [3:0] a,
    input [3:0] b,
    output [7:0] p
    );
	 
	 wire [3:0] c,d;
	 wire [3:0] p_add0, p_add1, p_add2, p_add3;
	 
	 assign p_add0={{4{b[0]}} & a};
    assign p_add1={{4{b[1]}} & a}; 
	 assign p_add2={{4{b[2]}} & a}; 
	 assign p_add3={{4{b[3]}} & a};
	 
	 assign p[0] = p_add0[0];
	 
	 IC7483 ic1 (.a0(p_add0[1]), .a1(p_add0[2]), .a2(p_add0[3]), .a3(0),
	             .b0(p_add1[0]), .b1(p_add1[1]), .b2(p_add1[2]), .b3(p_add1[3]), .cin(0),
					 .s0(p[1]), .s1(c[0]), .s2(c[1]), .s3(c[2]), .cout(c[3]));
					 
	 IC7483 ic2 (.a0(c[0]), .a1(c[1]), .a2(c[2]), .a3(c[3]),
	             .b0(p_add2[0]), .b1(p_add2[1]), .b2(p_add2[2]), .b3(p_add2[3]), .cin(0),
					 .s0(p[2]), .s1(d[0]), .s2(d[1]), .s3(d[2]), .cout(d[3]));
					 
	 IC7483 ic3 (.a0(d[0]), .a1(d[1]), .a2(d[2]), .a3(d[3]),
	             .b0(p_add3[0]), .b1(p_add3[1]), .b2(p_add3[2]), .b3(p_add3[3]), .cin(0),
					 .s0(p[3]), .s1(p[4]), .s2(p[5]), .s3(p[6]), .cout(p[7]));
	
 endmodule

 module bit8_adder(
    input [7:0] a,
    input [7:0] b,
    output  reg [7:0] sum,
	 output reg c_out
    );
	 integer i;
	 reg [8:0] c;
	 
	always @(*) begin
	
	c[0]=1'b0;
	 
	 for(i=0;i<=7;i=i+1) begin
	     sum[i]=a[i] ^ b[i] ^ c[i];
		  c[i+1]=(((a[i] ^ b[i]) & c[i]) | (a[i] & b[i]));
    end
	 
	 c_out=c[i];
 end
 endmodule

module bit8_subtractor(
    input [7:0] a,
    input [7:0] b,
    output [7:0] diff,
	 output b_out
    );
	 wire [7:0] c;
	 
	full_sub f0 (.a(a[0]), .b(b[0]), .bin(0), .diff(diff[0]), .bout(c[0]));
	full_sub f1 (.a(a[1]), .b(b[1]), .bin(c[0]), .diff(diff[1]), .bout(c[1]));
	full_sub f2 (.a(a[2]), .b(b[2]), .bin(c[1]), .diff(diff[2]), .bout(c[2]));
	full_sub f3 (.a(a[3]), .b(b[3]), .bin(c[2]), .diff(diff[3]), .bout(c[3]));
	full_sub f4 (.a(a[4]), .b(b[4]), .bin(c[3]), .diff(diff[4]), .bout(c[4]));
	full_sub f5 (.a(a[5]), .b(b[5]), .bin(c[4]), .diff(diff[5]), .bout(c[5]));
	full_sub f6 (.a(a[6]), .b(b[6]), .bin(c[5]), .diff(diff[6]), .bout(c[6]));
	full_sub f7 (.a(a[7]), .b(b[7]), .bin(c[6]), .diff(diff[7]), .bout(c[7]));
	 
	assign b_out = c[7];

endmodule

module binary_divider(
          input [3:0] divdend,
			 input [3:0] divisor,
			 output reg [3:0] quotient,       //restoring algorithm..................
			 output reg [4:0] remainder
      );
		reg [4:0] acc,m;
		reg [8:0] rg;
	   integer i;

		always @(*) begin
		      acc=5'b00000;
				m={1'b0, divisor};
				rg={acc, divdend};
				
				for (i=3;i>=0;i=i-1) begin
				     rg = rg << 1;
					  rg[8:4] = rg[8:4] - m;
					  
					  if (rg[8]==1) begin
					      quotient[i] = 0;
							rg[8:4] = rg[8:4] + m;
							end
						else if (rg[8] == 0) begin
						   quotient[i] = 1;
							end
						end
				remainder = rg[8:4];
			end
			
endmodule



  	  module bit1_comparator(
            input a,
				input b,
				output aGTb,
				output aEQb,
				output aLTb
      );
		
		assign aGTb=(~b) & a;
		assign aEQb= a ^~ b;
		assign aLTb= (~a) & b;


     endmodule
		
		
		module bit8_comparator(
            input [7:0] a,
				input [7:0] b,
				output aGTb,
				output aEQb,
				output aLTb
      );
		
		wire [7:0] wgt,weq,wlt;
		
		bit1_comparator C0 (.a(a[0]), .b(b[0]),
		                    .aGTb(wgt[0]), .aEQb(weq[0]), .aLTb(wlt[0]));
		bit1_comparator C1 (.a(a[1]), .b(b[1]),
		                    .aGTb(wgt[1]), .aEQb(weq[1]), .aLTb(wlt[1]));						  
		bit1_comparator C2 (.a(a[2]), .b(b[2]),
		                    .aGTb(wgt[2]), .aEQb(weq[2]), .aLTb(wlt[2]));
		bit1_comparator C3 (.a(a[3]), .b(b[3]),
		                    .aGTb(wgt[3]), .aEQb(weq[3]), .aLTb(wlt[3]));
		bit1_comparator C4 (.a(a[4]), .b(b[4]),
		                    .aGTb(wgt[4]), .aEQb(weq[4]), .aLTb(wlt[4]));
		bit1_comparator C5 (.a(a[5]), .b(b[5]),
		                    .aGTb(wgt[5]), .aEQb(weq[5]), .aLTb(wlt[5]));
		bit1_comparator C6 (.a(a[6]), .b(b[6]),
		                    .aGTb(wgt[6]), .aEQb(weq[6]), .aLTb(wlt[6]));
		bit1_comparator C7 (.a(a[7]), .b(b[7]),
		                    .aGTb(wgt[7]), .aEQb(weq[7]), .aLTb(wlt[7]));
		
		
		assign aGTb = (wgt[7] | (weq[7] & wgt[6]) | 
		       (weq[7] & weq[6] & wgt[5]) | 
				 (weq[7] & weq[6] & weq[5] & wgt[4]) | 
				 (weq[7] & weq[6] & weq[5] & weq[4] & wgt[3]) | 
				 (weq[7] & weq[6] & weq[5] & weq[4] & weq[3] & wgt[2] ) | 
				 (weq[7] & weq[6] & weq[5] & weq[4] & weq[3] & weq[2] & wgt[1]) | 
				 (weq[7] & weq[6] & weq[5] & weq[4] & weq[3] & weq[2] & weq[1] & wgt[0])); 
				 
		assign aEQb = weq[7] & weq[6] & weq[5] & weq[4] & weq[3] & weq[2] & weq[1] & weq[0];
		assign aLTb = (wlt[7] | (weq[7] & wlt[6]) | 
		       (weq[7] & weq[6] & wlt[5]) | 
				 (weq[7] & weq[6] & weq[5] & wlt[4]) | 
				 (weq[7] & weq[6] & weq[5] & weq[4] & wlt[3]) | 
				 (weq[7] & weq[6] & weq[5] & weq[4] & weq[3] & wlt[2] ) | 
				 (weq[7] & weq[6] & weq[5] & weq[4] & weq[3] & weq[2] & wlt[1]) | 
				 (weq[7] & weq[6] & weq[5] & weq[4] & weq[3] & weq[2] & weq[1] & wlt[0]));


      endmodule
