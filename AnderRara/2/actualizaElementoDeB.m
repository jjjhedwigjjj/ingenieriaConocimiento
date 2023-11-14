%Practica 2 Ander Pacheco
function elem_updated = actualizaElementoDeB(A, B, R, alpha, r, t)
    % Ponemos la ' para definir que es una columna y no una fila
    p1=R(:,t)'-max(min(A(:,:),B(:,t)));
    
    if r==1
        % Calculamos el máx-min de todas las columnas excepto de la columna 1
        aux = max(min(A(r+1:size(A,1),:),B(r+1:size(A,1),t)));
    elseif r==16
        % Calculamos el máx-min de todas las columnas excepto de la última
         aux = max(min(A(1:r-1,:),B(1:r-1,t)));
    else
        % Parte hasta r-1
        % y parte desde r+1 hasta el final
        aux = max(max(min(A(1:r-1,:),B(1:r-1,t))), max(min(A(r+1:size(A,1),:),B(r+1:size(A,1),t))));
    end
    
    % Si es cierto devuelve true, es decir, 1, si no, devuelve false, 0
    p2 = min(A(r,:),B(r,t)) >= aux;
    p3 = A(r,:)>=B(r,t);
    
    elem_updated = B(r,t)+2*alpha*sum(p1.*p2.*p3);
end