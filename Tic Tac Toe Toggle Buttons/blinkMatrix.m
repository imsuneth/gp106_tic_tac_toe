function blinkMatrix(A,times,delay)

global a; %taking global variables to the scope
global led_pins;

for i=1:9 %turn all leds off
    digitalWrite(a,led_pins(i),0);
end


i=0;  %code for blink all leds for a number of times
for x=1:times
    for r=1:3
        for c=1:3
            if A(r,c)~=0
                digitalWrite(a,led_pins(r,c),i);
            end
        end
    end
    pause(delay);
    i=i+(-1)^i;
end

end