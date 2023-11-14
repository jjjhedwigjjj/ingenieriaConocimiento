%Ander Pacheco pacheco.127140
% Ejercicio 1.
% Adulto. Trimf para una función triangular
edad=0:100;
mu_adulto = trimf(edad,[25 50 75]);
solutions.ej1a = mu_adulto
plot(edad,mu_adulto);
hold on;
legend('Adulto');
%trampf. Para trapezoidal
% totalmente joven con 0-15, deja de ser joven con 30
mu_joven=trapmf(edad,[0 0 15 30]);
solutions.ej1b = mu_joven
plot(edad, mu_joven);
legend('Joven');
% % Gaussmf. (x, desviación, media)
mu_anciano=gaussmf(edad,[20 100]);
solutions.ej1c = mu_anciano
plot(edad,mu_anciano);
legend('Anciano');
hold off;
%%
% % Ejercicio 2

nota=0:10;
S=trapmf(nota,[0 0 4 5]);
plot(nota,S);
hold on;
AP=trapmf(nota,[4 5 6 7]);
plot(nota,AP);
N=trapmf(nota,[6 7 8 9]);
plot(nota,N);
SB=trapmf(nota,[8 9 10 10]);
plot(nota,SB);
legend('Suspenso','Aprobado','Notable','Sobresaliente');
hold off;

solutions.ej2a_1 = S
solutions.ej2a_2 = AP
solutions.ej2a_3 = N
solutions.ej2a_4 = SB

n=trapmf(8.6,[6 7 8 9]);

sb=trapmf(8.6,[8 9 10 10]);
tconorma=min(1,n+sb);
solutions.ej2b = tconorma


%%
% Ejercicio 3
% Calcular y mostrar el conjunto difuso cerca
distancia=0:0.1:15;
mu_cerca=trapmf(distancia,[0 0 4 5]);
solutions.ej3a = mu_cerca
% Función de pertenencia
mu_lejos1=trapmf(15-distancia,[0 0 4 5]);
solutions.ej3b = mu_lejos1
plot(distancia,mu_lejos1);
% Grado de verdad: t-norma producto y t-conorma suma prob
muy=(trapmf(4.5, [0 0 4 5]))^2;
no_muy=1-muy;
lejos=trapmf(15-10.7,[0 0 4 5]);

% Suma probabilistica: x+y-xy
todo_junto=(no_muy+lejos)-no_muy.*lejos;
solutions.ej3c = todo_junto

%%
% Ejercicio 4
altura=0:220;
bajo=trapmf(altura,[0 0 135 160]);
medio=trapmf(altura,[150 160 170 180]);
alto=trapmf(altura,[170 180 220 220]);

ratio=0:0.1:1;
malo=trapmf(ratio,[0 0 0.25 0.5]);
regular=trapmf(ratio, [0.25 0.4375 0.625 0.8125]);
bueno=trapmf(ratio,[0.625,0.875,1,1]);

alturas=[167 169 175 179 183 186 187 190 200];
ratios=[0.75 0.375 0.9375 0.75 1 0.812 0.75 0.625 0.8125];

es_alto=zeros(1,9);
buen_exito=zeros(1,9);
for x=1:9
    es_alto(x)=trapmf(alturas(x),[170 180 220 220]);  
    buen_exito(x)=trapmf(ratios(x),[0.625,0.875,1,1]);  
end
grado=min(es_alto,buen_exito);
respuesta=find(grado>0.5);

solutions.ej4 = respuesta
%%
% Ejercicio 5

solutions.ej5 = centroide(edad,mu_adulto)
%%
function [centro_masas] = centroide(x,mu)
    centro_masas=sum(x.*mu)/sum(mu);
end






