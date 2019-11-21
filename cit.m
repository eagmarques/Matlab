%Q1: vaz�o torneira 1
%Q2: vaz�o torneira 2
%x : tempo para encher o tanque
%V = (Q1*x) + (Q2*x);   => As duas torneiras juntas levam 6 horas para enchera pscina.
%V = Q1*x;              => Equacionamento Q1 entrando no tanque.
%V = (1 + 5)*Q2;        => Equacionamento Q1 entrando no tanque.
% isolando Q1 e Q2 nas ultimas duas equa��es e substituindo na primeira
% obtemos a seguinte equan��o do segundo grau:
% x^2 -7*x -30 = 0;
clc
f = [1 -7 -30];
result = roots(f);
fprintf('%i', result > 0)
fprintf('\n')