function Delta = DeltaFunction(m,i,j)
%Eq26 Ref 6
B = [0,0,0;1,0,0;0,1,0;1,1,0;0,0,1;1,0,1;0,1,1;1,1,1]; 
Delta = 0;

if abs(m) <= 3
   Delta = Delta + abs(m) + sum(B(i,:)) + sum(B(j,:));
   
    if -3 < m <= -2
        Delta = Delta + B(i,1);
    end
    
    if 2 <= m < 3
       Delta = Delta + B(j,1); 
    end
    
    if -2 <= m < -1
        Delta = Delta + B(i,3) * B(j,1);
    end
    
    if -1 <= m < 0
        Delta = Delta + B(i,3) * B(j,2) + B(i,2) * B(j,1);
    end
    
    if m == 0
           Delta = Delta + B(i,1) * B(j,1) + B(i,2) * B(j,2) + B(i,3) * B(j,3);
    end
    
    if 0 < m <= 1
        Delta = Delta + B(i,1) * B(j,2) + B(i,2) * B(j,3);
    end
    
    if 1 < m <= 2
         Delta = Delta + B(i,1) * B(j,3);
    end
    
else
    Delta = Delta +  abs(m + sum(B(i,:))-sum(B(j,:)));
end

end

 %%
 %Amir Eskandari
 %99123138
 %Advance Communication System course Project