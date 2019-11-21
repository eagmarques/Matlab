t = importdata('tempo.txt');
x = importdata('x_original.txt');
y = importdata('y_original.txt');

N = length(x);

Xm = mean(x);
Ym = mean(y);

p = x + y.*1i;
X = fft(p);

plot(X);