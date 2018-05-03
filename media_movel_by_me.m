function [ Sinal_Filtrado ] = media_movel_by_me( Sinal,N )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

num_pont = length(Sinal);
vetor = zeros(1,N);
Sinal_Filtrado = zeros(1,num_pont);
for i = 1:num_pont
try % posterior modificação, associar ao for
    vetor = vetor(2:(N));
    vetor = [vetor Sinal(i)];
    Sinal_Filtrado(i) = sum(vetor)/N;
    
    catch
end
end
end

