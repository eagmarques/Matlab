clear all;close all;clc;

%% Montagem do sinal original

t = 0:0.001:10;   % tempo total
s = 0.45*sin(2*pi*30*t) + 0.35*sin(2*pi*80*t); % sinal (senóide com duas frequências)
Fs = 1/(t(2)-t(1)); % recuperando a frequência de amostragem

% Plotando o primeiro segundo sinal original
figure
plot(t,s)
xlabel('Tempo [s]')
ylabel('Amplitude [m]');
axis([0,1,-0.8,0.8])
grid on

% Fazendo a FFT do sinal original
[mod,ang,f1] = fullspectrum (t,s,'','du');

% Plotando a FFT do sinal original
figure
plot(f1,mod)
xlabel('Frequência [Hz]')
ylabel('Amplitude [m]')
axis([0,100,0,0.5])
grid on

% Forma alternativa para FFT
% N = length(s);
% dF = Fs/N;
% n = 1:1:N;
% F = n.*dF;
% X = fft(s);
% X = 2/N*abs(X);

%% Acrescentando ruído ao sinal
x=zeros(1,length(t));
a=1;
for i=1:0.1:5
    for a=1:length(t)
        x(a)=x(a)+0.3*sin(600*i*t(a)+0.02*i);
    end
end

x=x+s;   % sinal contaminado com ruído

% Plotando o primeiro segundo sinal com ruído
figure
plot(t,x)
xlabel('Tempo [s]')
ylabel('Amplitude [m]');
axis([0,1,-12,12])
grid on

% Fazendo a FFT do sinal com ruído
[mod,ang,f1] = fullspectrum (t,x,'','du');

% Plotando a FFT do sinal com ruído
figure
plot(f1,mod)
xlabel('Frequência [Hz]')
ylabel('Amplitude [m]')
axis([0,600,0,0.5])
grid on

%% Projeto do filtro FIR
Fc = 85; % frequência de corte
N = 50; % ordem (testar 50, 100 e 200)
h = fir1(N+1, Fc/(Fs/2));
fvtool(h)

% Fazendo a convolução do filtro com o sinal contaminado
y_fir = filter(h,1,x);

% Plotando o sinal original e após a filtragem (Notar o transiente que está relacionado a ordem do filtro)
figure
subplot(3,1,1)
plot(t,s)
xlabel('Tempo [s]')
ylabel('Amplitude [m]');
axis([0,1,-0.8,0.8])
grid on
subplot(3,1,2)
plot(t,x)
xlabel('Tempo [s]')
ylabel('Amplitude [m]');
axis([0,1,-12,12])
grid on
subplot(3,1,3)
plot(t,y_fir)
hold on
plot(t,s)
xlabel('Tempo [s]')
ylabel('Amplitude [m]');
axis([0,1,-0.8,0.8])
grid on

% Fazendo a FFT do sinal após a filtragem
[mod,ang,f1] = fullspectrum (t,y_fir,'','du');

% Plotando a FFT do sinal após a filtragem
figure
plot(f1,mod)
xlabel('Frequência [Hz]')
ylabel('Amplitude [m]')
axis([0,250,0,0.5])
grid on

%% Projeto do filtro IIR (Butterworth)
Fc_b = 85; % frequência de corte
N_b = 50; % ordem (testar 20, 30 e 50)
d = fdesign.lowpass('N,F3dB',N_b,Fc/(Fs/2));
h_b = design(d,'butter');
fvtool(h_b)

% Fazendo a convolução do filtro com o sinal contaminado
y_iir=filter(h_b,x);

% Plotando o sinal original e após a filtragem (Notar o transiente que está relacionado a ordem do filtro e atentar a fase)
figure
subplot(3,1,1)
plot(t,s)
xlabel('Tempo [s]')
ylabel('Amplitude [m]');
axis([0,1,-0.8,0.8])
grid on
subplot(3,1,2)
plot(t,x)
xlabel('Tempo [s]')
ylabel('Amplitude [m]');
axis([0,1,-12,12])
grid on
subplot(3,1,3)
plot(t,y_iir)
hold on
plot(t,s)
xlabel('Tempo [s]')
ylabel('Amplitude [m]');
axis([0,1,-0.8,0.8])
grid on

% Fazendo a FFT do sinal após a filtragem
[mod,ang,f1] = fullspectrum (t,y_iir,'','du');

figure
plot(f1,mod)
xlabel('Frequência [Hz]')
ylabel('Amplitude [m]')
axis([0,250,0,0.5])
grid on


