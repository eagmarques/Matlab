% Julia Trettel RA: 171154

clear; close all; clc;
load('solo.mat');
N = length(y);
t = (0:N-1)/Fs;
solo = audioplayer(y, Fs);
solo.playblocking;

figure();
plot(t, y);
title('frequencias do solo original');

% encontrando o espectro das frequencias:
fft1 = fftshift(fft(y));
fshift = ((-N/2):(N/2-1))*(Fs/N);
amp = abs(fft1)./N;
figure();
plot(fshift(N/2:N/2 + 2200), amp(N/2:N/2 + 2200));
title('espectro do sinal');

% a partir do espectro, identificamos as frequencias corretas e a incorreta
% a frequencia incorreta é a Si, que no espectro tem valor máximo de 232.1 Hz
% no ponto x = 3.736 s
% intervalo da nota si no gráfico original em função do tempo:
% floor(3.631*Fs):floor(4.083*Fs)
x0 = y(1:floor(3.631*Fs));
x = y(floor(3.631*Fs):floor(4.083*Fs));
x1 = y(floor(4.083*Fs):N);

% encontrando alpha:
alpha = 246.9/232.1;

% ajustando a frequencia errada do sinal
[M, L] = rat(alpha);
tamSi = length(x);
amostraSi = tamSi*L;
vetor = zeros(amostraSi, 1);

% construindo o sinal auxiliar:
for n = L:L:amostraSi;
    k = n/L;
    if k == floor(k);
        vetor(n) = x(k);
    end
end

% implementando o filtro FIR para suprimir o aliasing
n = -L:L;
h = 1.-(abs(n)./L);
H = conv(vetor, h, 'same');
f = Fs/2;
FIR = fir1(150, min(pi/L, pi/M)/f);
FIRlowPass = filter(FIR, 1, H);
figure()
freqz(FIR);

% decimador
x = floor(amostraSi/M);
xd = zeros(x, 1);
for n = 1:x
    xd(n) = FIRlowPass(n*M);
end

% reconstruindo o sinal final
sinal_final = cat(1, x0, xd, x1);
final = audioplayer(sinal_final, Fs);
final.play;

Nfinal = length(sinal_final);
N2 = floor(Nfinal/2);
nfshift = ((-Nfinal/2):((Nfinal/2) - 1)) * (Fs/Nfinal);
nfft = fftshift(fft(sinal_final));
ampfinal = abs(nfft)./Nfinal;
figure()
plot(nfshift(N2:N2 + 2200), ampfinal(N2:N2 + 2200));
title('espectro do sinal com a nota ajustada inserida');