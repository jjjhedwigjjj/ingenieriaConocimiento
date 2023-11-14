function [media, A, nuevaBase] = aprendeBase(XTrain)
    R = [];
    for i = 1:80
        a = XTrain (:,:,1,i);
        R = [R a(:)];
    end
    media = mean (R,2);
    A = R-media;
    C=A'*A;
    [v,u] = eig(C);
    nuevaBase= [];
    for i=1:80
        nuevaBase=[nuevaBase (1/sqrt(u(i,i))*A*v(:,i))];
    end
end