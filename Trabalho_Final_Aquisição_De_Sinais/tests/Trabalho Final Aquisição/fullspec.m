function [X1,F,p] = fullspec(t,x,y)
%Tamanho do Vetor X
N = length(x);
%Faz a m�dia dos vetores X e Y
Xm = mean(x);
Ym = mean(y);
%Corre��o para retirar valores com ganho nulo
x1=x-Xm;
y1=y-Ym;

%Sinal completo
p= x1 + (y1*1j);

%FFT do sinal p
P=p/N;
X = fft(P);
X1 = fftshift(X);

%Frequencia
dt = t(2)-t(1);                    
f_end = 1/dt;                      
n = length(t);
df = f_end/n;
F = (df-f_end)/2 : df : (f_end)/2; 

%Corre��o da fase para valores negativos de frequ�ncia
for k=1:1:n/2
       X1(k)=conj(X1(k));
end
 

