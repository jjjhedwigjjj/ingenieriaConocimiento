 %Ander Pacheco  24/11/21
function prototipos = creaPrototipos(A, Y)
    ims_per_label_local = unique(Y);
    prototipos = zeros(size(A, 1), length(ims_per_label_local));
    for i = 1:length(ims_per_label_local)
        clas_index = (Y == ims_per_label_local(i));
        prototipos(:,i) = mean(A(:, clas_index), 2);
    end
end
