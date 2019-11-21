function [Xa] = filtrof2(t,P)

dt = t(2)-t(1);                    
Fs = 1/dt;  

Fc1 = 60;
Fc2 = 180;
Banda = fir1(800, [Fc1/(Fs/2) Fc2/(Fs/2)],'bandpass');
Pfiltrado = filter(Banda,1,P);


 %fvtool(Banda);
N=length(Pfiltrado);
P1=Pfiltrado/N;
Xa = fft(P1);
Xa = fftshift(Xa);