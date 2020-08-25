function won=checkWinner(M)
global wonM; %take the global variable to the scope
d1=trace(M); %take the sum of the main diagonal of matrix M
d2=trace(flip(M)); %take the sum of the sub diagonal of matrix M
wonM=zeros(3); %creates a zero matrix of 3x3 for animating purposes

if d1==3 || d1==12 %checking the winning situations
    won=1;
    wonM(logical(eye(size(wonM)))) = 1; %assign values to the sub diagnal 
elseif d2==3 ||  d2==12
    won=1;
    wonM(logical(eye(size(wonM)))) = 1;
    wonM=flip(wonM);
else
    r=sum(M'); %sum of rows
    c=sum(M); %sum of columns
    for i=1:3
        
        if r(i)==3 ||  r(i)==12
            won=1;
            wonM(i,:)=[1 1 1];
            break;
        elseif c(i)==3 || c(i)==12
            won=1;
            wonM(:,i)=[1 1 1];
            break;
        else
            won=0;
        end
    end
end
return