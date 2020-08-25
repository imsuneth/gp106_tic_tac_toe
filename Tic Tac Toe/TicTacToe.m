clear all;
global a;

a=arduino('COM14');

global e;
e=0;


global array;

array=[2,3,4; 5,6,7; 8,9,10];

global player_won;
player_won=0;

for r=1:3
    for c=1:3
        pinMode(a,array(r,c),'OUTPUT');
    end
end

global M;
M=zeros(3);

B=zeros(3);
i=1;
board();
while(true)
    for r=1:3
        for c=1:3
            if M(r,c)==1
                B(r,c)=1;
            elseif (M(r,c)==2)
                B(r,c)=i;
            else 
                B(r,c)=0;
            end
        end
    end
    
    %checkWinner(M);

    clc;
    disp(M);
    disp(B);
    printMatrix(B);
    i=i*-1+1;
    if(e==1)
        break;
    end
    pause(.05);
end

