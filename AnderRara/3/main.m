 %Ander Pacheco  24/11/21
function accuracy = main()
    [media, A, nuevaBase] = aprendeBase(XTrain);
    prototipos = creaPrototipos(A,YTrain);
    porcentajeAciertos=clasificar(nuevaBase,media,prototipos, XTest, YTest)
end
