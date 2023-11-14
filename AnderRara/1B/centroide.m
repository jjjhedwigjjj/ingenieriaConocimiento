function [centro_masas] = centroide(x,mu)
    centro_masas=sum(x.*mu)/sum(mu);
end