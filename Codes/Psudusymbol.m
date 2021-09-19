function S = Psudusymbol(i,n,a)
%Eq3 Implemention I use If and else to implement this Equation

h = 0.5;
L = 4;
S = 0;
B = [0,0,0;1,0,0;0,1,0;1,1,0;0,0,1;1,0,1;0,1,1;1,1,1];
if n >4
    S = S + exp(j*pi*h*(sum(a(1:n))-a(n-1)*B(i,1)+a(n-2)*B(i,2)+a(n-3)*B(i,3)))
end
if n ==4
    S = S + (j*pi*h*(sum(a(1:4))-(a(3)*B(i,1)+a(2)*B(i,2)+a(1)*B(i,1))));
end
if n==3
    S = S + (j*pi*h*(sum(a(1:3))-(a(2)*B(i,1)+a(1)*B(i,2))));
end
if n == 2
     S = S + (j*pi*h*(sum(a(1:2))-(a(1)*B(i,1))));
 if n == 1
      S = S + (j*pi*h*(a(1)));
 end
    
end

end

 %%
 %Amir Eskandari
 %99123138
 %Advance Communication System course Project