clear all; %clear work space first
global a; %define arduino object as a global variable
global led_pins; %define a matrix to hold pin numbers connected to leds

a=arduino('COM5'); %arduino object on COM5 port
led_pins=[11 12 13; 14 15 16; 17 18 19];
button_pins=[2 3 4;5 6 7;8 9 10];

for x=11:19  %two loops to define output pins and input pins
    pinMode(a,x,'OUTPUT');
end
for x=2:10
    pinMode(a,x,'INPUT');
end
drawAnim();
while(true)  %the main infinite loop which will help to repeat the game after winning or a draw
    Pins=zeros(3); %a matrix to hold current state of switches
    M=zeros(3); %a matrix to hold state of the game with the player number
    B=zeros(3); %a matrix to represent the led boad
    
    i=1;  %a switching variable (1 or 0) thoughout the main while loop to keep blinking the leds of player 2
    count=0; %a counter to store the number of moves made
    player=1; %a variable to hold the player number who is playing now
    
    while(true) %the sub while loop to run each game
        for r=1:3 %two nested for loops to read the states of the switches and update the matrix Pins
            for c=1:3
                if digitalRead(a,button_pins(r,c))==1
                    Pins(r,c)=1;
                end
            end
        end
        
        for r=1:3 %two nested for loops to update the matrix M according to the player number
            for c=1:3
                if Pins(r,c)==1 && M(r,c)==0
                    M(r,c)=player;
                    player=player+3*(-1)^(player+1); %player number changes from 1-->4 and 4-->1 (4 represents the 2nd player)
                    count=count+1;
                end
            end
        end
        
        for r=1:3       %two nested for loops to update the matrix B(which represents led board)
            for c=1:3   %and controls the blinking of 2nd player
                if M(r,c)==1
                    B(r,c)=1;
                elseif (M(r,c)==4)
                    B(r,c)=i;
                else
                    B(r,c)=0;
                end
            end
        end
        
        clc;
        disp(M);  
        disp(B);
        printMatrix(B); %calls a function which light up the led panel according to B
        
        winner=checkWinner(M);
        if winner~=0 %calls a function of winner checking and player animations according to the state
            disp(['Player ' num2str(winner) ' won']);
            winAnim(); %calls a function winAnim, if won
            break;  %after the animation breaks the sub while loop and a new game will be started
        elseif count==9 %check whether the match is draw
            disp('Draw');
            drawAnim(); %calls to play the animation for draw
            break; %breaks the sub while loop
        end
        i=i+(-1)^i;  %switched the variablr i between 1 and 0 for blinking operation
        pause(.01); %represents the delay of the blinking and the sub loop
    end
end

