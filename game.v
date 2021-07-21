
module game(
input clock,
		st1,
		st2,
		st3,
		st4,
		st5,
		st6,
		st7,
		plus,
		minus,
		divide,
		multiply,
		k1,
		k2,
		k3,
		k4,
		reset,
output reg [6:0]  y,
						y_1,
						y_2,
						y_3,
						y_4,
						y_5,
output reg L0,
			  L1,
			  L2,
			  L3,
			  L4,
			  L5,
			  L6,
			  L7,
			  L8,
			  L9);
				


reg [3:0]z,z_1,z_2,z_3,z_4,z_5;
reg [3:0] count=1;
reg [3:0] v1,v2,v3,v4,set1,set2,set3,set4;
reg [5:0] c1,c2,c3;
reg [3:0] current_state,next_state;
	
	parameter g1 = 16'h1118,
				 g2 = 16'h1126,
				 g3 = 16'h1144,
				 g4 = 16'h1128,
				 g5 = 16'h1145,
				 g6 = 16'h1234,
				 g7 = 16'h1134,
				 g8 = 16'h1188,
				 g9 = 16'h1137,
				 g10 = 16'h1229;
				 
always @(posedge clock or posedge reset) begin       
    if(reset) begin          
        current_state <= 0;        
    end       
    else begin           
        current_state <= next_state;      
    end   
end

always @(*) begin 
case({st7,st6,st5,st4,st3,st2,st1})
      
 7'b0000000:next_state = 0;
 7'b0000001:next_state = 1; 
 7'b0000011:next_state = 2;
 7'b0000111:next_state = 3;
 7'b0001111:next_state = 4;
 7'b0011111:next_state = 5; 
 7'b0111111:next_state = 6;
 7'b1111111:next_state = 7;
 
 
 
 endcase		
      
end		
		always @(current_state) begin
    if(reset) begin
        {v4,v3,v2,v1,set4,set3,set2,set1,c1,c2,c3}=13'b00_000_000_000;
		  count=1;
    end
    else begin
        case(current_state)
            0: begin
               case (count)
					1:{v4,v3,v2,v1}=g1;
					2:{v4,v3,v2,v1}=g2;
					3:{v4,v3,v2,v1}=g3;
					4:{v4,v3,v2,v1}=g4;
					5:{v4,v3,v2,v1}=g5;
					6:{v4,v3,v2,v1}=g6;
					7:{v4,v3,v2,v1}=g7;
					8:{v4,v3,v2,v1}=g8;
					9:{v4,v3,v2,v1}=g9;
				  10:{v4,v3,v2,v1}=g10;
				  endcase
            end
            1: begin
                case({k4,k3,k2,k1})
					 4'b0001:set1=v1;
					 4'b0010:set1=v2;
					 4'b0100:set1=v3;
					 4'b1000:set1=v4;
					 endcase
            end
            2: begin
               case({k4,k3,k2,k1})
					 4'b0001:set2=v1;
					 4'b0010:set2=v2;
					 4'b0100:set2=v3;
					 4'b1000:set2=v4;
					 endcase
					
            end
				3: begin
					case({plus,minus,divide,multiply})
					 4'b0001:
				
					 c1=set1*set2;
				
					 4'b0010:
				
					 c1=set1/set2;
				
					 4'b0100:
				
					 c1=set1-set2;
			
					 4'b1000:
				
					 c1=set1+set2;
				
               endcase
					
            end
				4: begin
               case({k4,k3,k2,k1})
					 4'b0001:set3=v1;
					 4'b0010:set3=v2;
					 4'b0100:set3=v3;
					 4'b1000:set3=v4;
					 endcase
					
            end
            5: begin
					case({plus,minus,divide,multiply})
					 4'b0001:
				
					 c2=c1*set3;
				
					 4'b0010:
				
					 c2=c1/set3;
				
					 4'b0100:
				
					 c2=c1-set3;
				
					 4'b1000:
				
					 c2=c1+set3;
				
               endcase
					
            end
				6: begin
               case({k4,k3,k2,k1})
					 4'b0001:set4=v1;
					 4'b0010:set4=v2;
					 4'b0100:set4=v3;
					 4'b1000:set4=v4;
					 endcase
					
            end
				7: begin
					case({plus,minus,divide,multiply})
					 4'b0001:
				
					 c3=c2*set4;
				
					 4'b0010:
				
					 c3=c2/set4;
				
            
					 4'b0100:
				
					 c3=c2-set4;
					
					 4'b1000:
					
					 c3=c2+set4;
					
               endcase
					
					count=count+1;
            end
        endcase
    end
end	

always @(*)	
begin
z_4=c3%10;
z_5=c3/10;
end

		
		
		
		
		
		
		
		

always @(*)
begin
z_3 = v4;
z_2 = v3;
z_1 = v2;
  z = v1;
case(count)
 1:{L9,L8,L7,L6,L5,L4,L3,L2,L1,L0}=10'b0_000_000_001;
 2:{L9,L8,L7,L6,L5,L4,L3,L2,L1,L0}=10'b0_000_000_011;
 3:{L9,L8,L7,L6,L5,L4,L3,L2,L1,L0}=10'b0_000_000_111;
 4:{L9,L8,L7,L6,L5,L4,L3,L2,L1,L0}=10'b0_000_001_111;
 5:{L9,L8,L7,L6,L5,L4,L3,L2,L1,L0}=10'b0_000_011_111;
 6:{L9,L8,L7,L6,L5,L4,L3,L2,L1,L0}=10'b0_000_111_111;
 7:{L9,L8,L7,L6,L5,L4,L3,L2,L1,L0}=10'b0_001_111_111;
 8:{L9,L8,L7,L6,L5,L4,L3,L2,L1,L0}=10'b0_011_111_111;
 9:{L9,L8,L7,L6,L5,L4,L3,L2,L1,L0}=10'b0_111_111_111;
10:{L9,L8,L7,L6,L5,L4,L3,L2,L1,L0}=10'b1_111_111_111;
endcase
end

	
	
	
		


always @(*)
		begin

		case (z)
		0:y=7'b1000000;
		1:y=7'b1111001;
		2:y=7'b0100100;
		3:y=7'b0110000;
		4:y=7'b0011001;	
		5:y=7'b0010010;	
		6:y=7'b0000010;	
		7:y=7'b1111000;	
		8:y=7'b0000000;	
		9:y=7'b0010000;
		endcase

		end
always @(*)
		begin

		case (z_1)
		0:y_1=7'b1000000;	
		1:y_1=7'b1111001;
		2:y_1=7'b0100100;
		3:y_1=7'b0110000;
		4:y_1=7'b0011001;	
		5:y_1=7'b0010010;
		6:y_1=7'b0000010;	
		7:y_1=7'b1111000;
		8:y_1=7'b0000000;	
		9:y_1=7'b0010000;
		endcase

		end
always @(*)
		begin

		case (z_2)
		0:y_2=7'b1000000;
		1:y_2=7'b1111001;
		2:y_2=7'b0100100;
		3:y_2=7'b0110000;
		4:y_2=7'b0011001;
		5:y_2=7'b0010010;
		6:y_2=7'b0000010;
		7:y_2=7'b1111000;
		8:y_2=7'b0000000;
		9:y_2=7'b0010000;
		endcase

		end
always @(*)
		begin

		case (z_3)
		0:y_3=7'b1000000;	
		1:y_3=7'b1111001;
		2:y_3=7'b0100100;
		3:y_3=7'b0110000;
		4:y_3=7'b0011001;
		5:y_3=7'b0010010;
		6:y_3=7'b0000010;
		7:y_3=7'b1111000;	
		8:y_3=7'b0000000;
		9:y_3=7'b0010000;
		endcase

		end
		
always @(*)
		begin

		case (z_4)
		0:y_4=7'b1000000;
		1:y_4=7'b1111001;
		2:y_4=7'b0100100;
		3:y_4=7'b0110000;
		4:y_4=7'b0011001;
		5:y_4=7'b0010010;
		6:y_4=7'b0000010;
		7:y_4=7'b1111000;
		8:y_4=7'b0000000;
		9:y_4=7'b0010000;
		endcase

		end
		always @(*)
		begin

		case (z_5)
		0:y_5=7'b1000000;
		1:y_5=7'b1111001;
		2:y_5=7'b0100100;
		3:y_5=7'b0110000;
		4:y_5=7'b0011001;
		5:y_5=7'b0010010;
		6:y_5=7'b0000010;
		7:y_5=7'b1111000;
		8:y_5=7'b0000000;
		9:y_5=7'b0010000;
		endcase

		end

		


		


		

 endmodule 