%Exercícios Lathi, Capítulo 1 - Sinais e Sistemas%

%Exercício 1.1 -  Funções Inline
%m objeto inline fornece uma representação simbólica de uma função definida em termos de operadores e funções do MATLAB.
%Considere a definição da senóide exponencialmente amortecida f(t) = e^{−t} * cos (2πt)


f = inline ('exp(-t).*cos(2*pi*t)','t');

f(0); %Resulta em 1

%Vamos traçar f(t) -2<= t <=2


t =(-2:0.01:2);

subplot(3,1,1);%Mais de um plot por imagem
plot(t,f(t));
xlabel('t');
ylabel('f(t)');
title('Exercício 1.1');
grid;

%Exercício 1.2 - Operadores Relacionais e a Função Degrau Unitário

u = inline('(t>=0)','t'); %DEGRAU

%Para realizar uma janela


p = inline('(t>=0)&(t<1)','t');
t =(-2:0.01:2); %Ajuste do gráfico


subplot(3,1,2); %Mais de um plot por imagem
plot(t,p(t));
xlabel('t');
ylabel('p(t) = u(t) - u(t-1)');
axis([-2 2 -0.1 1.5]);
title('Exercício 1.2');


%Exercício 1.3 - Visualizando Operações na Variável Independente

%Seja g(t) = f(t)u(t) -> OU SEJA, definimos a função para t>0
%f(t) = e^{−t} * cos (2πt), o mesmo da questão 1.1
%Portanto g seŕa

g = inline ('exp(-t).*cos(2*pi*t).*(t>=0)','t'); %Prestar atenção com o . element wise


%Vamos considerar que queremos g(2t+1), deslocado 1 para a esquerda e
%comprimido por um fator 2

subplot(3,1,3); %Mais de um plot por imagem
plot(t,g(2*t+1)); %PERCEBA A ANALISE
xlabel('t');
ylabel('g(2t+1)');
grid;
title('Exercício 1.3');

%Exercício 1.4 - Integração Numérica e Estimação da Energia do Sinal
%Vamos considerar uma função x(t) = e^{-t}*(u(t) - u(t-1))
%Para achar a energia desse sinal, ele é integrado de -inf até inf

x = inline ('exp(-t).*((t>=0)&(t<1))','t');

%Fazendo Δt = 0.01, um vetor tempo adequado é criado.
%Vamos somar todos esses pequenos intervalos, mas ainda não é uma integral
t = (0:0.01:1);
E_x = sum(x(t).*x(t)*0.01)

%A função quad do MATLAB implementa uma técnica de integração melhor, 
%chamada de quadratura recursiva adaptativa de Simpson.

x_squared = inline ('exp(-2*t).*((t>=0)&(t<1))','t');

E_xa = quad(x_squared,0,1);
