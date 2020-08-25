function winAnim()
    global a; %taking global variable to the scope
    global led_pins;
    global wonM;
    
    animDelay=0.05; 
    
    blinkMatrix(wonM,10,0.1); %calls a function to blink a particular matrix
    
    for r=1:3 %turn of all leds
        for c=1:3
            digitalWrite(a,led_pins(r,c),0);
        end 
    end
    
    for x=1:3 %Animation for winning
        for c=1:3
            digitalWrite(a,led_pins(1,c),1);
            pause(animDelay);
            digitalWrite(a,led_pins(1,c),0);
        end
        for r=2:3
            digitalWrite(a,led_pins(r,3),1);
            pause(animDelay);
            digitalWrite(a,led_pins(r,3),0);
        end
        for c=2:-1:1
            digitalWrite(a,led_pins(3,c),1);
            pause(animDelay);
            digitalWrite(a,led_pins(3,c),0);
        end
        for r=2:-1:2
            digitalWrite(a,led_pins(r,1),1);
            pause(animDelay);
            digitalWrite(a,led_pins(r,1),0);
        end
    end
    blinkMatrix(ones(3),2,0.3);
end