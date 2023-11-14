 %Ander Pacheco  24/11/21
function porcentajeAciertos = clasificar(nuevaBase, media, prototipos, imagenes, Y)
    Y(Y==0) = 1
    Y(Y==5) = 2
    clases = 2;
    cont=0;
    for i=1:size(imagenes,4)
        % Normalizar los datos
        %imagenes = imagenes/255;
        % Proyectar la foto en la nueva base.
        base = reshape(imagenes(:,:,1,i),[size(imagenes,1)*size(imagenes,2),1]);
        w = nuevaBase.'*(base-media);
        % Calcular la distancia entre el vector w obtenido en el paso anterior y cada uno de los prototipos.
        distancia=sum(((nuevaBase.'*prototipos)-w).^2);
        %  Calcular el mínimo de las distancias y obtener su correspondiente prototipo (índice dentro del vector de distancias). Si el prototipo correspondela clase auténtica hemos acertado.
        [~,minimo]=min(distancia);
        if minimo == Y(i)
            cont=cont+1;
        else
            fprintf('ERROR: Al numero %i se le ha asignado el numero %i \n',i,minimo);
        end
    end
    porcentajeAciertos=(cont/size(imagenes,4))*100;
    disp("Porcentaje de aciertos = "+porcentajeAciertos+"%");
 
end
