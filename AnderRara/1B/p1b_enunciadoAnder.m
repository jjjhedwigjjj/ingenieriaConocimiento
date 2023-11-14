%% PrÃ¡ctica 1b: IntroducciÃ³n a la TeorÃ­a y LÃ³gica Fuzzy

solutions = {};
%% 
% En esta prÃ¡ctica se va a utilizar MatLab para determinar el grado de verdad 
% de expresiones basadas en la lÃ³gica difusa, resolver problemas de selecciÃ³n 
% de candidatos en base a sistemas de reglas difusas y calcular el centro de masas 
% de los conjuntos difusos.
% 
% En primer lugar vamos a mostrar un ejemplo de creaciÃ³n de conjuntos difusos 
% utilizando MatLab para calcular el resultado de funciones de pertenencia de 
% diferentes formas (triangular, trapezoidal y gaussiana). Deseamos representar 
% la etiqueta lingÃ¼Ã­stica adulto que pertenece a la variable difusa edad. El 
% universo de discurso (referencial) de la variable edad es $[0,100]$. Es decir:

edad = 0:100
%% 
% Si deseamos modelar dicha etiqueta lingÃ¼Ã­stica mediante una funciÃ³n de 
% pertenencia triangular (considerando que una persona comienza a ser adulta a 
% los 25 aÃ±os, es totalmente adulta a los 50 aÃ±os y deja de ser adulta a los 
% 75 aÃ±os) podemos realizar lo siguiente:

muAdulto = zeros(1, length(edad));
for i = 1:length(edad)
    muAdulto(i) = trimf(edad(i), [25 50 75]);
end
figure;
plot(edad,muAdulto,'r');
legend('Adulto');
%% Ejercicio 1
% Se deben calcular y mostrar (en una figura) las funciones de pertenencia de 
% la variable difusa edad. Se deben utilizar las funciones trimf, trapmf y gaussmf. 
% En concreto:
% 
% â€¢ La funciÃ³n de pertenencia asociada a la etiqueta adulto es la de ejemplo 
% presentado anteriormente.

edad=0:100;
mu_adulto = trimf(edad,[25 50 75]);
solutions.ej1a = mu_adulto
%Mostramos las gráficas
plot(edad,mu_adulto);
legend('Adulto');
%% 
% â€¢ La etiqueta joven la queremos modelar mediante una funciÃ³n de pertenencia 
% trapezoidal (considerando que una persona es totalmente joven desde que nace 
% hasta que tiene 15 aÃ±os y que deja de ser joven cuando tiene 30 aÃ±os).

mu_joven=trapmf(edad,[0 0 15 30]);
solutions.ej1b = mu_joven
%Mostramos las gráficas
plot(edad, mu_joven);
legend('Joven');
%% 
% â€¢ La etiqueta anciano la deseamos modelar mediante una funciÃ³n de pertenencia 
% gaussiana cuya media es 100 y cuya desviaciÃ³n estÃ¡ndar es 20.

mu_anciano=gaussmf(edad,[20 100]);
solutions.ej1c = mu_anciano
%Mostrar gráficos
plot(edad,mu_anciano);
legend('Anciano');
%% Ejercicio 2
% Sea la variable lingÃ¼Ã­stica NOTA, con los posibles valores S, AP, N, SB 
% (Suspenso, Aprobado, Notable y SoBresaliente) representados por los conjuntos 
% difusos mostrados en la figura 1.
% 
% _Figura 1. Particiones de la variable lingÃ¼Ã­stica "nota"._
% 
% â€¢ Calcular y mostrar dichos conjuntos difusos. (Nota: guarda en la estructura 
% solo el resultado numÃ©rico, no la figura)

notas=1:10;
S=trapmf(notas,[0 0 4 5]);
AP=trapmf(notas,[4 5 6 7]);
N=trapmf(notas,[6 7 8 9]);
SB=trapmf(notas,[8 9 10 10]);

plot(notas, S, "r", notas, AP, "g", notas, N, "b",notas, SB, "y")
legend('Suspenso','Aprobado','Notable','Sobresaliente')

solutions.ej2a_1 = S
solutions.ej2a_2 = AP
solutions.ej2a_3 = N
solutions.ej2a_4 = SB
%% 
% â€¢ Utilizando la t-norma de Lukasiewicz $(max(0,x+y-1))$ y su t-conorma dual  
% $(min(1,x+y))$. Si tenemos una nota de 8.6, Â¿CuÃ¡l es el grado de verdad de 
% esa nota para la expresiÃ³n una nota se considera notable o sobresaliente? Nota: 
% recuerda el comentario preliminar

n=trapmf(8.6,[6 7 8 9]);
sb=trapmf(8.6,[8 9 10 10]);
tconorma=min(1,n+sb);
solutions.ej2b = tconorma
%% Ejercicio 3
% La siguiente figura (Fig. 2) muestra la funciÃ³n de pertenencia $\mu _c (x)$ 
% que describe el conjunto borroso $x$ es cerca (siendo el dominio de la distancia 
% el rango de 0 a 15 metros).

distancia = 0:0.1:15; %Â¿Que es lo que ocurre con este referencial y por que te lo doy ya hecho? Â¿Que problema podria ocurrir si no lo hiciera?
%% 
% _Figura 2. FunciÃ³n de pertenencia al conjunto difuso "Cerca"_
%% 
% * Calcular y mostrar el conjunto difuso cerca.

mu_cerca=trapmf(distancia,[0 0 4 5]);
solutions.ej3a = mu_cerca

plot(distancia,mu_cerca);
%% 
% * Calcular y mostrar, a partir del conjunto anterior, la funciÃ³n de pertenencia 
% para el conjunto borroso "lejos". Considerando "lejos" como el antÃ³nimo de 
% cerca, es decir, $\mu _L (x) = \mu  c (15â€“x)$. Recordatorio: antÃ³nimo $\neq$negaciÃ³n

mu_lejos1=trapmf(15-distancia,[0 0 4 5]);
solutions.ej3b = mu_lejos1

plot(distancia,mu_lejos1);
%% 
% * Calcular el grado de verdad de la siguiente expresiÃ³n: 4.5 m no es muy 
% cerca Ã³ 10.7 es lejos. Utilizar la t-norma producto y la t-conorma suma probabilÃ­stica.

muy=(trapmf(4.5, [0 0 4 5]))^2;
no_muy=1-muy;
lejos=trapmf(15-10.7,[0 0 4 5]);
% Suma probabilistica: x+y-xy
todo_junto=(no_muy+lejos)-no_muy.*lejos;
solutions.ej3c = todo_junto
%% Ejercicio 4
% Vamos a considerar un problema en el que debemos seleccionar a los mejores 
% candidatos para formar parte de un equipo de baloncesto. Para ello, tenemos 
% dos variables a considerar:
% 
% â€¢ Altura con las siguientes funciones trapezoidales:
% 
% o Bajo: [0 0 135 160]
% 
% o Medio: [150 160 170 180]
% 
% o Alto: [170 180 220 220]
% 
% â€¢ Ratio de acierto encestando (Ã©xito) con las siguientes etiquetas trapezoidales:
% 
% o Malo: [0 0 0.25 0.5]
% 
% o Regular: [0.25 0.4375 0.625 0.8125]
% 
% o Bueno: [0.625 0.875 1 1]
% 
% La regla de elecciÃ³n de los candidatos es:
% 
% _SI el jugador ES alto Y el jugador ES buen Ã©xito ENTONCES seleccionar_
% 
% El grado de verdad de la regla que deben cumplir los candidatos para ser seleccionados 
% debe ser mayor que 0.5. La intersecciÃ³n se debe modelar con la t-norma mÃ­nimo.
% 
% Â¿CuÃ¡les de los siguientes candidatos serÃ­an seleccionados?
% 
% $$\matrix{\text{Candidato} & \text{Altura (cm)} & \text{Ratio de Ã©xito} \cr1 
% & 167 & 0.75 \cr2 & 169 & 0.375 \cr3 & 175 & 0.9375 \cr4 & 179 & 0.75 \cr5 & 
% 183 & 1 \cr6 & 186 & 0.8125 \cr7 & 187 & 0.75 \cr8 & 190 & 0.625 \cr9 & 200 
% & 0.8125 \cr}$$

% altura=0:220;
% bajo=trapmf(altura,[0 0 135 160]);
% medio=trapmf(altura,[150 160 170 180]);
% alto=trapmf(altura,[170 180 220 220]);
% 
% ratio=0:0.1:1;
% malo=trapmf(ratio,[0 0 0.25 0.5]);
% regular=trapmf(ratio, [0.25 0.4375 0.625 0.8125]);
% bueno=trapmf(ratio,[0.625,0.875,1,1]);

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
%% Ejercicio 5
% Crea una funciÃ³n llamada â€œcentroideâ€? que nos devuelva el centro de masas 
% de un conjunto difuso. El centro de masas de un conjunto difuso se calcula como:
% 
% $$CM_\mu = \frac{\sum_{i=1}^{n}x_i * \mu(x_i )}{\sum_{i=1}^{n} \mu(x_i)}$$
% 
% Â¿CuÃ¡l es el centro de masas del conjunto difuso edad adulto obtenido en 
% el ejercicio 1?

solutions.ej5 = centroide(edad,mu_adulto)
%%
function [centro_masas] = centroide(x,mu)
    centro_masas=sum(x.*mu)/sum(mu);
end