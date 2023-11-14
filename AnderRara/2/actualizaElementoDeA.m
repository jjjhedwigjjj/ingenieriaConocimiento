%Practica 2 Ander Pacheco
function elem_updated = actualizaElementoDeA(A, B, R, alpha, r, t)
    %Parte 1
    p1 = R(t,:) - max(min(A(:,t),B(:,:)));
    
    % Parte 2
    % No ponemos la i porque es una variable que va cambiando su valor
    if r==1
        % Calculamos el máx-min de todas las filas excepto de la fila 1
        aux = max(min(A(r+1:size(A,1),t),B(r+1:size(A,1),:)));
    elseif r==16
        % Calculamos el máx-min de todas las filas excepto de la última
        aux = max(min(A(1:r-1,t),B(1:r-1,:)));
    else
        aux = max(max(min(A(1:r-1,t),B(1:r-1,:))), max(min(A(r+1:size(A,1),t),B(r+1:size(A,1),:))));
    end

    % Si es cierto devuelve true, es decir, 1, si no, devuelve false, 0
    p2 = min(A(r,t),B(r,:)) >= aux;
    p3 = A(r,t)<=B(r,:);
    
    elem_updated = A(r,t)+2*alpha*sum(p1.*p2.*p3);
end