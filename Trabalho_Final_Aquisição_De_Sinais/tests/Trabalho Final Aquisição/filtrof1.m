function [Xa] = filtrof1(t,P)

dt = t(2)-t(1);                    
Fs = 1/dt;  

Fc1 = 140;
Fc2 = 260;
Banda = fir1(800, [Fc1/(Fs/2) Fc2/(Fs/2)],'bandpass');
Pfiltrado = filter(Banda,1,P);
% fvtool(Banda);
N=length(Pfiltrado);
P1=Pfiltrado/N;
X = fft(P1);
Xa = fftshift(X);

%Frequencia
dt = t(2)-t(1);                    
f_end = 1/dt;                      
n = length(t);
df = f_end/n;
F = (df-f_end)/2 : df : (f_end)/2;


