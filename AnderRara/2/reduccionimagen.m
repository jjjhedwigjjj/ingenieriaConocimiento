%Practica 2 Ander Pacheco
function [A, B] = reduccionimagen(nombre, alpha, threshold, max_iter, C)
    % Lectura y normalización de la imagen a tratar
    R = double(imread(nombre));
    R = R/255;
    % Creación de las matrices aleatorias A y B
    A = rand(C,size(R,1)); % Me crea una matriz de 16 * numero de filas de R
    B = rand(C,size(R,2)); % Me crea una matriz de 16 * numero de columnas de R
    % Cálculo del error y creación de la matriz
    errorActual=calculoError(A, B, R);
    % Proceso iterativo hasta que se cumpla la condición de parada
    iteraciones=0;
    errorAnterior=Inf;
    while iteraciones < max_iter && abs(errorActual-errorAnterior)>=threshold
        auxA=zeros(C,size(R,1));
        % For para recorrer todos los valores de la matriz A
        for r=1:C
            for t=1:size(R,1)
                auxA(r,t)=actualizaElementoDeA(A, B, R, alpha, r, t);
            end
        end
        %For para recorrer todos los valores de la matriz B
        auxB=zeros(C,size(R,2));
        for r=1:C
            for t=1:size(R,2)
                auxB(r,t)=actualizaElementoDeB(A, B, R, alpha, r, t);
            end
        end
        A=auxA;
        B=auxB;  
        errorAnterior=errorActual;
        errorActual = calculoError(A, B, R); 
        iteraciones=iteraciones+1
    end
end