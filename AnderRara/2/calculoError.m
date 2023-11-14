%Practica 2 Ander Pacheco
function error = calculoError(A, B, R)
    % Construimos la matriz R' partiendo de A y B.
    % Matriz con tantas filas como elementos en A y con tantas columnas
    % como elementos en B
    R_gorro=zeros(length(A),length(B));
    % Rellenamos la matriz por filas
    for i=1:length(A)
        % Rellenamos la matriz por columnas
        for j=1:length(B)
            R_gorro(i,j)=max(min(A(:,i),B(:,j)));
        end
    end
    error=sum(sum((R-R_gorro).^2));
    
    % Para mostrar la imagen que crean A y B
    %imshow(R_gorro);
end