function printMatrix(B)
global a;
global led_pins;

for r=1:3 %code for printing the given matrix to led panel
    for c=1:3
        if B(r,c)==1
            digitalWrite(a,led_pins(r,c),1);
        else
            digitalWrite(a,led_pins(r,c),0);
        end
    end
end

end