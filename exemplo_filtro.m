% Digitalizaçao
close all; clear all; clc

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

sinal_ruido = sinal+ruido
plot(sinal_ruido)
N = 25
vetor = ones(1,N)*300
sinal_filtrado = zeros(1,num_pont);
for i = 1:num_pont
try
    vetor = vetor(2:(N));
    vetor = [vetor sinal_ruido(i)];
    sinal_filtrado(i) = sum(vetor)/N;
    
    
    
catch
end

end

figure

plot(x,sinal_filtrado,x,sinal_ruido)

figure
subplot(221)
plot(sinal)
title('Sinal Esperado')
subplot(222)
plot(sinal_ruido)
title('Sinal + Ruído')

subplot(223)
plot(sinal_filtrado)
title('Sinal Filtrado')

subplot(224)
plot(x,sinal,x,sinal_filtrado)
title('Atraso devido a Filtragem')
legend('Sinal Esperado','Sinal Filtrado','Location','SouthEast')



% % figure1 = figure
% subplot(211)
% plot(x,sinal,Amostragem,pontos_amostrados,'r*');
% axis([0 num_pont 0 256])
% y = [63 127 255]
% %  xx = [[1 101 201 301 401 num_pont 601 701 801 901];
% %  set(gca,'XTick',xx)
% %  set(gca,'XTickLabel',sprintf('%3.0f|',xx))
% set(gca,'YTick',y)
% set(gca,'YTickLabel',sprintf('%+1.0f|',y))
% ylabel('Amplitude [digital]')
% xlabel('tempo de aquisição "t"')
% legend('Sinal Analógico','Pontos amostrados','Location','SouthEast')
% 
% 
% 
% 
% subplot(212)
% stairs(Amostragem,floor(pontos_amostrados));
% hold on
% plot(x,sinal,'k-.',Amostragem,pontos_amostrados,'r*');
% hold off
% set(gca,'YTick',y)
% set(gca,'YTickLabel',sprintf('%+1.0f|',y))
% ylabel('Amplitude [digital]')
% xlabel('tempo de aquisição "t"')
% legend('Digitalização','Sinal Analógico','Pontos amostrados','Location','SouthEast')
% 
% % annotation(figure1,'rectangle',...
% %     [0.302785714285714 0.245238095238095 0.1365 0.15],'FaceColor','flat');
% 
% axis([0 num_pont 0 256])
% 
% print('Fig01','-dpng')
% 
% figure
% stairs(Amostragem,floor(pontos_amostrados));
% hold on
% plot(x,sinal,'k-.',Amostragem,pontos_amostrados,'r*');
% hold off
% set(gca,'YTick',y)
% set(gca,'YTickLabel',sprintf('%+1.0f|',y))
% ylabel('Amplitude [digital]')
% xlabel('tempo de aquisição "t"')
% legend('Digitalização','Sinal Analógico','Pontos amostrados','Location','SouthEast')
% axis([145 250 230 260])
% title('Erros acarretados pela aproximação')
% print('Fig02','-dpng')
% 
