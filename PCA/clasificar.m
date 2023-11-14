function porcentajeAciertos = clasificar(nuevaBase, media, prototipos, imagenes, Y)
    for i = 1:test_lim
        a = imagenes (:,:,1,i);
        R = [R a(:)];
        w=nuevaBase'*(R-media);
        distancia=sum((prototipos-w).^2);
        m = min(d);
        est = [est m(2)];
    end
    aciertos = 0;
    for i = 1:test_lim
        if(est(i)==Y(i))
            aciertos=aciertos+1;
        end
    end
    resul = (aciertos/test_lim)*100
end