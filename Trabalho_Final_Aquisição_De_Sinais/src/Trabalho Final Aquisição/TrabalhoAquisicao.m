clear all;
clc;
%% Dado sem falha
t = importdata('tempo.txt');
x = importdata('x_original.txt');
y = importdata('y_original.txt');

X1 = fullspec(t,x,y);
[X1,F,~] = fullspec(t,x,y);
plot(F,abs(X1));
axis([-500,500,0,2]);
title('Dado Sem Falha');
figure;


% Pot=abs(X1).*abs(X1); %Comoputar espectro de potência
% plot(F,Pot);
% title('Densidade Espectral de Potência Dado Sem Falha');
% figure;

%% FALHA 1
x = importdata('Dados Falha 1/x_a2_c.txt');
y = importdata('Dados Falha 1/y_a2_c.txt');

[X1,F] = fullspec(t,x,y);
subplot(3,2,1);
plot(F,abs(X1));
axis([-500,500,0,1]);
title('Dado a2');


x = importdata('Dados Falha 1/x_a4_c.txt');
y = importdata('Dados Falha 1/y_a4_c.txt');

[X1,F] = fullspec(t,x,y);
subplot(3,2,2);
plot(F,abs(X1));
axis([-500,500,0,1]);
title('Dado a4');

x = importdata('Dados Falha 1/x_a6_c.txt');
y = importdata('Dados Falha 1/y_a6_c.txt');

[X1,F] = fullspec(t,x,y);
subplot(3,2,3);
plot(F,abs(X1));
axis([-500,500,0,1]);
title('Dado a6');

x = importdata('Dados Falha 1/x_a7_c.txt');
y = importdata('Dados Falha 1/y_a7_c.txt');

[X1,F] = fullspec(t,x,y);
subplot(3,2,4);
plot(F,abs(X1));
axis([-500,500,0,1]);
title('Dado a7');

x = importdata('Dados Falha 1/x_a8_c.txt');
y = importdata('Dados Falha 1/y_a8_c.txt');

[X1,F] = fullspec(t,x,y);
subplot(3,2,5);
plot(F,abs(X1));
axis([-500,500,0,1]);
title('Dado a8');

x = importdata('Dados Falha 1/x_a10_c.txt');
y = importdata('Dados Falha 1/y_a10_c.txt');

[X1,F] = fullspec(t,x,y);
subplot(3,2,6);
plot(F,abs(X1));
axis([-500,500,0,1]);
title('Dado a10');
figure;

%% FALHA 2
x = importdata('Dados Falha 2/x_b2_c.txt');
y = importdata('Dados Falha 2/y_b2_c.txt');

[X1,F] = fullspec(t,x,y);
subplot(3,2,1);
plot(F,abs(X1));
axis([-500,500,0,1]);
title('Dado b2');


x = importdata('Dados Falha 2/x_b4_c.txt');
y = importdata('Dados Falha 2/y_b4_c.txt');

[X1,F] = fullspec(t,x,y);
subplot(3,2,2);
plot(F,abs(X1));
axis([-500,500,0,1]);
title('Dado b4');


x = importdata('Dados Falha 2/x_b6_c.txt');
y = importdata('Dados Falha 2/y_b6_c.txt');

[X1,F] = fullspec(t,x,y);
subplot(3,2,3);
plot(F,abs(X1));
axis([-500,500,0,1]);
title('Dado b6');


x = importdata('Dados Falha 2/x_b7_c.txt');
y = importdata('Dados Falha 2/y_b7_c.txt');

[X1,F] = fullspec(t,x,y);
subplot(3,2,4);
plot(F,abs(X1));
axis([-500,500,0,1]);
title('Dado b7');


x = importdata('Dados Falha 2/x_b8_c.txt');
y = importdata('Dados Falha 2/y_b8_c.txt');

[X1,F] = fullspec(t,x,y);
subplot(3,2,5);
plot(F,abs(X1));
axis([-500,500,0,1]);
title('Dado b8');


x = importdata('Dados Falha 2/x_b10_c.txt');
y = importdata('Dados Falha 2/y_b10_c.txt');

[X1,F] = fullspec(t,x,y);
subplot(3,2,6);
plot(F,abs(X1));
axis([-500,500,0,1]);
title('Dado b10');
figure;


%% Aplicação Filtro nos Sinais de Falha
% FALHA 1
x = importdata('Dados Falha 1/x_a2_c.txt');
y = importdata('Dados Falha 1/y_a2_c.txt');

subplot(3,2,1);
[~,F,P] = fullspec(t,x,y);  
[Xa]=filtrof1(t,P); 
plot(F,abs(Xa));
axis([-500,500,0,1]);
title('Dado a2 Filtrado');

x = importdata('Dados Falha 1/x_a4_c.txt');
y = importdata('Dados Falha 1/y_a4_c.txt');

subplot(3,2,2);
[~,F,P] = fullspec(t,x,y);
[Xa]=filtrof1(t,P); 
plot(F,abs(Xa));
axis([-500,500,0,1]);
title('Dado a4 Filtrado');

x = importdata('Dados Falha 1/x_a6_c.txt');
y = importdata('Dados Falha 1/y_a6_c.txt');

subplot(3,2,3);
[~,F,P] = fullspec(t,x,y);
[Xa]=filtrof1(t,P); 
plot(F,abs(Xa));
axis([-500,500,0,1]);
title('Dado a6 Filtrado');

x = importdata('Dados Falha 1/x_a7_c.txt');
y = importdata('Dados Falha 1/y_a7_c.txt');

subplot(3,2,4);
[~,F,P] = fullspec(t,x,y);
[Xa]=filtrof1(t,P); 
plot(F,abs(Xa));
axis([-500,500,0,1]);
title('Dado a7 Filtrado');

x = importdata('Dados Falha 1/x_a8_c.txt');
y = importdata('Dados Falha 1/y_a8_c.txt');

subplot(3,2,5);
[~,F,P] = fullspec(t,x,y);
[Xa]=filtrof1(t,P); 
plot(F,abs(Xa));
axis([-500,500,0,1]);
title('Dado a8 Filtrado');

x = importdata('Dados Falha 1/x_a10_c.txt');
y = importdata('Dados Falha 1/y_a10_c.txt');

subplot(3,2,6);
[~,F,P] = fullspec(t,x,y);
[Xa]=filtrof1(t,P); 
plot(F,abs(Xa));
axis([-500,500,0,1]);
title('Dado a10 Filtrado');
figure;

%% Aplicação Filtro nos Sinais de Falha
%*********************FALHA 2******************************
x = importdata('Dados Falha 2/x_b2_c.txt');
y = importdata('Dados Falha 2/y_b2_c.txt');

subplot(3,2,1);
[~,F,P] = fullspec(t,x,y);  
[Xa]=filtrof2(t,P); 
plot(F,abs(Xa));
axis([-500,500,0,1]);
title('Dado b2 Filtrado');

x = importdata('Dados Falha 2/x_b4_c.txt');
y = importdata('Dados Falha 2/y_b4_c.txt');

subplot(3,2,2);
[~,F,P] = fullspec(t,x,y);
[Xa]=filtrof2(t,P); 
plot(F,abs(Xa));
axis([-500,500,0,1]);
title('Dado b4 Filtrado');

x = importdata('Dados Falha 2/x_b6_c.txt');
y = importdata('Dados Falha 2/y_b6_c.txt');

subplot(3,2,3);
[~,F,P] = fullspec(t,x,y);
[Xa]=filtrof2(t,P); 
plot(F,abs(Xa));
axis([-500,500,0,1]);
title('Dado b6 Filtrado');

x = importdata('Dados Falha 2/x_b7_c.txt');
y = importdata('Dados Falha 2/y_b7_c.txt');

subplot(3,2,4);
[~,F,P] = fullspec(t,x,y);
[Xa]=filtrof2(t,P); 
plot(F,abs(Xa));
axis([-500,500,0,1]);
title('Dado b7 Filtrado');

x = importdata('Dados Falha 2/x_b8_c.txt');
y = importdata('Dados Falha 2/y_b8_c.txt');

subplot(3,2,5);
[~,F,P] = fullspec(t,x,y);
[Xa]=filtrof2(t,P); 
plot(F,abs(Xa));
axis([-500,500,0,1]);
title('Dado b8 Filtrado');

x = importdata('Dados Falha 2/x_b10_c.txt');
y = importdata('Dados Falha 2/y_b10_c.txt');

subplot(3,2,6);
[~,F,P] = fullspec(t,x,y);
[Xa]=filtrof2(t,P); 
plot(F,abs(Xa));
axis([-500,500,0,1]);
title('Dado b10 Filtrado');
figure;

%% Densidade Espectral de Potência
% FALHA 1
% x = importdata('Dados Falha 1/x_a2_c.txt');
% y = importdata('Dados Falha 1/y_a2_c.txt');
% 
% [X1,F] = fullspec(t,x,y);
% subplot(3,2,1);
% P=abs(X1).*abs(X1); %Comoputar espectro de potência
% plot(F,P);
% axis([-500,500,0,0.7]);
% title('Densidade Espectral de Potência Dado a2');
% 
% 
% x = importdata('Dados Falha 1/x_a4_c.txt');
% y = importdata('Dados Falha 1/y_a4_c.txt');
% 
% [X1,F] = fullspec(t,x,y);
% subplot(3,2,2);
% P=abs(X1).*abs(X1); %Comoputar espectro de potência
% plot(F,P);
% axis([-500,500,0,0.7]);
% title('Densidade Espectral de Potência Dado a4');
% 
% x = importdata('Dados Falha 1/x_a6_c.txt');
% y = importdata('Dados Falha 1/y_a6_c.txt');
% 
% [X1,F] = fullspec(t,x,y);
% subplot(3,2,3);
% P=abs(X1).*abs(X1); %Comoputar espectro de potência
% plot(F,P);
% axis([-500,500,0,0.7]);
% title('Densidade Espectral de Potência Dado a6');
% 
% x = importdata('Dados Falha 1/x_a7_c.txt');
% y = importdata('Dados Falha 1/y_a7_c.txt');
% 
% [X1,F] = fullspec(t,x,y);
% subplot(3,2,4);
% P=abs(X1).*abs(X1); %Comoputar espectro de potência
% plot(F,P);
% axis([-500,500,0,0.7]);
% title('Densidade Espectral de Potência Dado a7');
% 
% x = importdata('Dados Falha 1/x_a8_c.txt');
% y = importdata('Dados Falha 1/y_a8_c.txt');
% 
% [X1,F] = fullspec(t,x,y);
% subplot(3,2,5);
% P=abs(X1).*abs(X1); %Comoputar espectro de potência
% plot(F,P);
% axis([-500,500,0,0.7]);
% title('Densidade Espectral de Potência Dado a8');
% 
% x = importdata('Dados Falha 1/x_a10_c.txt');
% y = importdata('Dados Falha 1/y_a10_c.txt');
% 
% [X1,F] = fullspec(t,x,y);
% subplot(3,2,6);
% P=abs(X1).*abs(X1); %Comoputar espectro de potência
% plot(F,P);
% axis([-500,500,0,0.7]);
% title('Densidade Espectral de Potência Dado a10');
% figure;
