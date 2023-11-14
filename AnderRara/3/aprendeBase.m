 %Ander Pacheco 24/11/21
function [media, A, nuevaBase] = aprendeBase(X)
    % Cargar el conjunto de datos inicial. 
    % Número de píxeles (28*28 = 784) y número de fotos (80)
    numPixeles=(size(X,1)*size(X,2));
    numFotos = size(X,4);
    R = zeros(numPixeles,numFotos);   
    % Añadir cada foto como una columna de la lista
    for i=1:numFotos
        % Normalizar los datos. Como ya están normalizados no hace falta
        R(:,i) = reshape(X(:,:,1,i),[numPixeles,1]);
    end
    
    % Calcular la media por filas de la matriz R y almacenarla en una variable llamada media. 
    % Es decir, un vector columna en el que cada elemento i será la media de los elementos de R en la fila i.
    media = mean(R,2);
    
    % Calcular los vectores con media nula. Es decir, a cada foto (columna de R) se le debe restar el vector
    % media calculado en el paso anterior. Almacenar cada vector obtenido en la resta en una columna de una
    % matriz llamada A. Las dimensiones de A son iguales a las de R.
    A = R-media;

    % Calcular la matriz de correlación C. Para ello hay que multiplicar la matriz A transpuesta por la matriz A.
    % La matriz C es una matriz cuadrada compuesta por NumeroFotos x NumeroFotos elementos.
    C = transpose(A)*A; % O puedo poner tambien A'*A
    
    % Calcular los NumeroFotos valores y vectores propios de C
    [v,mu] = eig(C);
    
    % Para cada vector propio, (y su correspondiente valor propio, ) vamos a obtener su correspondiente
    % vector propio, , de NumeroPixeles elementos
     nuevaBase=zeros(numPixeles,size(v,1));  
     for i=1:size(v,1)
         nuevaBase(:,i) = (A*v(:,i))/sqrt(mu(i,i));
     end
end
