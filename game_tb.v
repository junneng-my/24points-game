module game_tb;
						reg   st1=0,
								st2=0,
								st3=0,
								st4=0,
								st5=0,
								st6=0,
								st7=0,
								plus=0,
								minus=0,
								divide=0,
								multiply=0,
								k1=0,
								k2=0,
								k3=0,
								k4=0,
								reset=0;
						reg   clock=0;
	          wire [6:0] y,
								y_1,
								y_2,
								y_3,
								y_4,
								y_5;
                   wire L0,
								L1,
								L2,
								L3,
								L4,
								L5,
								L6,
								L7,
								L8,
								L9;

game DUT(clock,
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
			y,
			y_1,
			y_2,
			y_3,
			y_4,
			y_5,
			L0,
			L1,
			L2,
			L3,
			L4,
			L5,
			L6,
			L7,
			L8,
			L9);
			
always #10 clock=~clock;


initial 
begin
#500000000;
st1 =1;
k4 =1;
#500000000;
st2 =1;
k4 =0;
k3 =1;


#500000000;
st3 =1;
k3 =0;

plus =1;
#500000000;
st4=1;
plus =0;

k2=1;

#500000000;
st5=1;
k2=0;

plus=1;
#500000000;
st6=1;
plus=0;

k1=1;

#500000000;
st7=1;
k1=0;

multiply=1;
#500000000;
{st7,st6,st5,st4,st3,st2,st1}= 7'b0000000;
#500000000;
$stop;

end

endmodule
