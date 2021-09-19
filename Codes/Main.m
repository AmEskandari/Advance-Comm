%First to Run
clc
clear
close all
LT = 4;
T = 1;
BT = 0.25;
L = 4;
M = 2^(L-1);
er = -3:0.1:7;     
     
io = -5:0.1:5;

t = -3:0.01:7;
%frequency Response EQ4 Report
gfunc=@(t)(qfunc(1.88*(t-0.5-(2)))-qfunc(1.88*(t+0.5-(2))))/2;

%phase Response Eq5 Report
qqfunc = @(t) integral(gfunc,0,t);

for i=1:1001
    qf(i) = qqfunc(t(i));
end
%psi function Eq6 Report
psifunc = @(t) (pi*qqfunc(t))*(heaviside(t)-heaviside(t-LT))+(0.5*pi*(1-2*qqfunc(t-LT)))*(heaviside(t-LT));


%Laurant creator pulse Eq7 Report
sfunc= @(t,n) (sin(psifunc(t+n*T)));

%Laurant pulse
Cfuncone = @(t) sfunc(t,0)*sfunc(t,1)*sfunc(t,2)*sfunc(t,3);
Cfunctwo = @(t) sfunc(t,0)*sfunc(t,2)*sfunc(t,3)*sfunc(t,5);
Cfuncthree = @(t) sfunc(t,0)*sfunc(t,1)*sfunc(t,3)*sfunc(t,6);
Cfuncfour = @(t) sfunc(t,0)*sfunc(t,3)*sfunc(t,5)*sfunc(t,6);
Cfuncfive = @(t) sfunc(t,0)*sfunc(t,1)*sfunc(t,2)*sfunc(t,7);
Cfuncsix = @(t) sfunc(t,0)*sfunc(t,2)*sfunc(t,5)*sfunc(t,7);
Cfuncseven = @(t) sfunc(t,0)*sfunc(t,1)*sfunc(t,6)*sfunc(t,7);
Cfunceight = @(t) sfunc(t,0)*sfunc(t,5)*sfunc(t,6)*sfunc(t,7);


%define kronicker delta
defun = @(t) heaviside(t+0.1)-heaviside(t-0.1);

%Integrate 8 Laurnt pulse in one (Selectiove Luarant Pulses)
cfun = @(q,t) (Cfuncone(t) * defun(q) + Cfunctwo(t) *  defun(q-1)+ Cfuncthree(t) *defun(q-2)+ Cfuncfour(t)*defun(q-3)+Cfuncfive(t) * defun(q-4)+ Cfuncsix(t)*defun(q-5)+ Cfuncseven(t)*defun(q-6) + Cfunceight(t) * defun(q-7) );
 
%P_q_q eq18 it can be use for Eq18 But Take to much time to calculate so I
%use discreat methods (For Loops)
%Pfunc = @(i,j,theta,f) integral(@(t) cfun(i,t)*cfun(j,t-theta)*exp(-j*2*pi*f*t),-5,5,'ArrayValued',true);

%% 
%Laurant Represention

%Symbols
data = randi([0 M-1],1000,1);
a = pammod(data,M);

sqn = zeros(2,100);
for i=1:2
   for n = 1:1000
      Sqn(i,n) = Psudusymbol(i,n,a); %eq3
   end
end

tt = 0:0.1:1;
u = [];
x = []
 for i=0:10 u(1,i+1)=cfun(0,tt(i+1));  end
 for i=0:10 u(2,i+1)=cfun(1,tt(i+1));  end
 x = zeros(100,11);
 for i=1:100 %for selecting Laurant pulse I use two palse
        
    x(i,:) = u(1,:)*Sqn(1,i) +  u(2,:)*Sqn(2,i); %Represention By Laurant Palses
 end
 xx = x(:)'; %Represention By Laurant Palses of 100 CPM Symbol
 
 
 %%
 %Amir Eskandari
 %99123138
 %Advance Communication System course Project
            