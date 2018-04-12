%Abre arquivos para salvar dados
file1 = fopen('./distanciaPixelsLancamento1.csv','w');
file2 = fopen('./distanciaPixelsLancamento2.csv','w');
file3 = fopen('./distanciaPixelsLancamento3.csv','w');
FILE = fopen('./distanciaPixels.csv','w');

%Guarda em um array o valor dos dados obtidos por meio do imtool()
values = [d11,d12,d13,d14,d15,d16,d17,d18,d19,d110,d111];

%Salva dados do lancamento 1
fprintf(FILE,'Lancamento1,');
for i=1:11
    if i<11
        fprintf(FILE,'%f,',values(i));
        fprintf(file1,'%f,',values(i));
    elseif i==11
        fprintf(FILE,'%f\n',values(i));
        fprintf(file1,'%f\n',values(i));
    end
end

%Salva dados do lancamento 2
values = [d21,d22,d23,d24,d25,d26,d27,d28,d29,d210,d211];
fprintf(FILE,'Lancamento2,');
for i=1:11
    if i<11
        fprintf(FILE,'%f,',values(i));
        fprintf(file2,'%f,',values(i));
    elseif i==11
        fprintf(FILE,'%f\n',values(i));
        fprintf(file2,'%f\n',values(i));
    end
end

%Salva dados do lancamento 3
values = [d31,d32,d33,d34,d35,d36,d37,d38,d39,d310,d311];
fprintf(FILE,'Lancamento3,');
for i=1:11
    if i<11
        fprintf(FILE,'%f,',values(i));
        fprintf(file3,'%f,',values(i));
    elseif i==11
        fprintf(FILE,'%f\n',values(i));
        fprintf(file3,'%f\n',values(i));
    end
end

%Fecha os arquivos
fclose(file1)
fclose(file2)
fclose(file3)
fclose(FILE)