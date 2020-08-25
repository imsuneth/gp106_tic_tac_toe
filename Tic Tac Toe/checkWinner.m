function checkWinner(N)
global player_won;
M=zeros(3);
    for r=1:3
        for c=1:3
            if(N(r,c)==1)
                M(r,c)=1;
            elseif(N(r,c)==2)
                M(r,c)=4;
            end
        end
    end
    
        if isequal(M(:,1),[1 1 1]') || isequal(M(:,2),[1 1 1]') || isequal(M(:,3),[1 1 1]') || isequal(M(1,:),[1 1 1]) || isequal(M(2,:),[1 1 1]) || isequal(M(3,:),[1 1 1]) || isequal(diag(M),[1 1 1]) || isequal(diag(rot90(M)),[1 1 1])
            player_won=1;
            winner();
        elseif isequal(cs(1),[2 2 2]) || isequal(cs(2),[2 2 2]) || isequal(cs(3),[2 2 2])
            player_won=2;
            winner();
        end
        
    
return