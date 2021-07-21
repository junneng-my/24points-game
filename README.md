# 24points-game
Implemented a classic number game in verilog, 24 points. Given 4 numbers from 0 to 9, by adding, subtracting, multiplying and dividing to get 24, there are 10 questions.  
The software use is quartus prime lite 20.1 and modelsim.  
The hardware should be DE2i-150 board. Use Cyclone IV GX EP4CGX150DF31C7.  

For example, 1,1,1,8, do 1+1=2,then 2+1=3, then 3*8=24.    

Table show the question and the solution.   
![image](https://user-images.githubusercontent.com/52816448/126461306-b053dba9-4278-4291-b6e5-1fb4255b7589.png)

Step to play the game
1) Set st1 to high.
2) Set the selected switch represent the number(k1/k2/k3/k4 represent the number 
1/2/3/4 ) to high to store first value.
3) Set st2 to high.
4) Set previous selected (k1/k2/k3/k4) to low.
5) Set the selected(k1/k2/k3/k4)represent the number to high to store second value.
6) Set st3 to high.
7) Set previous selected (k1/k2/k3/k4) to low.
8) Set one of the (plus/minus/divide/multiply) to high to do 
calculation.
9) Set st4 to high.
10) Set previous selected (plus/minus/divide/multiply) to low.
11) Set the selected (k1/k2/k3/k4) represent the number to high to store third value.
12) Set st5 to high.
13) Set previous selected (k1/k2/k3/k4) to low.
14) Set selected (plus/minus/divide/multiply) to high to do calculation.
15) Set st6 high.
16) Set previous selected (plus/minus/divide/multiply) to low.
17) Set the selected (k1/k2/k3/k4) represent the number to high to store forth value.
18) Set st7 to high.
19) Set the previous selected (k1/k2/k3/k4) to low.
20) Set the selected (plus/minus/divide/multiply) to high to do calculation.
21) Set all (plus,minus,divide,multiply), (k1,k2,k3,k4),(st1,st2,st3,st4,st5,st6,st7) to zero, then repeat from step 1 to 20 to answer next question.
22) After solve all 10 questions or press wrong can set reset to high to reset the 
game.


Example step to solve questions 1
1) Set st1 to high.
2) Set k4 to high.
3) Set st2 to high.
4) Set k4 to low.
5) Set k3 to high.
6) Set st3 to high.
7) Set k3 to low.
8) Set add to high.
9) Set st4 to high.
10) Set add to low.
11) Set k2 to high.
12) Set st5 to high.
13) Set k2 to low.
14) Set add to high.
15) Set st6 high.
16) Set add to low.
17) Set k1 to high.
18) Set st7 to high.
19) set k1 to low.
20) Set multiply to high
The given 4 number should shown on the seven segment display start from right to left. The result of the calculation will show on the hex4 for first digit and hex5 for second digit. If the game is at the first question the led 0 will light up. If the game finish first question going to question 2 the led 0 and led 1 light up together. So if game complete until questions 10, led 0 until led 9 will all light up.  

Here is the testbench result
![game_tb1](https://user-images.githubusercontent.com/52816448/126465240-69b2d903-bf18-44a8-bd6b-6450d77931ca.JPG)
the y_5 shown is tens digit, and y_4 is digits, it shown in seven segment value which is 24. The questions at the end change to 1126.  
![image](https://user-images.githubusercontent.com/52816448/126469517-21f9bfa6-2920-41d4-8042-4d3caa96226b.png)  

pin planner  
![game_pin_planner1](https://user-images.githubusercontent.com/52816448/126466354-81c91b7e-b534-419a-9226-dd5c9febe091.JPG)
![game_pin_planner2](https://user-images.githubusercontent.com/52816448/126466362-85dacfbf-3593-4aa1-8e2e-2b1cf20d5d42.JPG)  
variable function explanation  
![image](https://user-images.githubusercontent.com/52816448/126468232-6d2962fa-388c-45bd-9289-d96432090831.png)  
![image](https://user-images.githubusercontent.com/52816448/126468529-36e86d5f-4c75-4d7a-bef3-0a40f946b7d6.png)  
![image](https://user-images.githubusercontent.com/52816448/126468568-26838134-4d10-476b-a153-6b6c2be6bf16.png)  
 
 
 Future Improvement  
 1) use top down design to separate different function to submodule for easy debug and test the code.
 2) use simple cpu design to run this game.
