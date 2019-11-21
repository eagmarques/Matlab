function [Ps,F] = filtro(t,P)

dt = t(2)-t(1);                    
Fs = 1/dt;  

Fc1 = 160;
Fc2 = 240;
Banda = fir1(800, [Fc1/(Fs/2) Fc2/(Fs/2)],'bandpass');
Pfilt = filter(Banda,1,P);
% fvtool(Banda);

N=length(Pfilt);
P=Pfilt/N;
Ps = fft(P);
Ps = fftshift(Ps);

%Frequencia
dt = t(2)-t(1);                    
f_end = 1/dt;                      
n = length(t);
df = f_end/n;
F = (df-f_end)/2 : df : (f_end)/2; 