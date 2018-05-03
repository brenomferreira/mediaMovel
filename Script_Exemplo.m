% Digitalizaçao
close all; clear all; clc;

num_pont = 500;

x = 1:num_pont;
sinal = (sin(x/100)+1)*255/2;
Amostragem = 1:50:num_pont;
% pontos_amostrados = sinal(Amostragem);

plot(x,sinal);

ruido = 10*randn(1,num_pont);
plot(ruido)
ruido(1:2:num_pont) = 0;
ruido(1:3:num_pont) = 0;

sinal_ruido = sinal+ruido;
plot(sinal_ruido);
N = 25;

% [ Sinal_Filtrado ] = media_movel_by_me( Sinal,N )
[ Sinal_Filtrado ] = media_movel_by_me( sinal_ruido,N );
%%%
%   function [ Sinal_Filtrado ] = media_movel_by_me( Sinal,N )
%   %UNTITLED Summary of this function goes here
%   %   Detailed explanation goes here
%   
%   num_pont = length(Sinal);
%   vetor = zeros(1,N);
%   Sinal_Filtrado = zeros(1,num_pont);
%   for i = 1:num_pont
%   try % posterior modificação, associar ao for
%   vetor = vetor(2:(N));
%   vetor = [vetor Sinal(i)];
%   Sinal_Filtrado(i) = sum(vetor)/N;
%   
%   catch
%   end
%   end
%   end



figure

plot(x,Sinal_Filtrado,x,sinal_ruido)

figure
subplot(221)
plot(sinal)
title('Sinal Esperado')
subplot(222)
plot(sinal_ruido)
title('Sinal + Ruído')

subplot(223)
plot(Sinal_Filtrado)
title('Sinal Filtrado')

subplot(224)
plot(x,sinal,x,Sinal_Filtrado)
title('Atraso devido a Filtragem')
legend('Sinal Esperado','Sinal Filtrado','Location','SouthEast')


