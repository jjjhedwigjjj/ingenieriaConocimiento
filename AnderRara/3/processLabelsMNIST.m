 %Ander Pacheco  24/11/21
function Y = processLabelsMNIST(filename)
[fileID,errmsg] = fopen(filename,'r','b');

if fileID < 0
    error(errmsg);
end

magicNum = fread(fileID,1,'int32',0,'b');
if magicNum == 2049
    fprintf('\nRead MNIST label data...\n')
end

numItems = fread(fileID,1,'int32',0,'b');
fprintf('Number of labels in the dataset: %6d ...\n',numItems);

Y = fread(fileID,inf,'unsigned char');

Y = categorical(Y);

fclose(fileID);
end
