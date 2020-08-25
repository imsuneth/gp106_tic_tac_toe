function printMatrix(B)
global a;
array=[2,3,4; 5,6,7; 8,9,10];

for r=1:3
    for c=1:3
        if B(r,c)==1
            digitalWrite(a,array(r,c),1);
        else
            digitalWrite(a,array(r,c),0);
        end
    end
end

end