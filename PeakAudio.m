clear all; close all;

file = fopen('DadosProjeto3Matlab.csv','w');

Fs = 44100; %Em Hz

saveFiles = 1;
closeCanvas = 1;

%Leitura dos arquivos de audio
audio1 = audioread('Lançamento1.wav');
audio2 = audioread('Lançamento2.wav');
audio3 = audioread('Lançamento3.wav');
%Array dos audios
a_audio = {audio1,audio2,audio3};

%Geração de vetores de tempo
t1 = transpose(0:(1/Fs):(length(audio1)/Fs)-(1/Fs));
t2 = transpose(0:(1/Fs):(length(audio2)/Fs)-(1/Fs));
t3 = transpose(0:(1/Fs):(length(audio3)/Fs)-(1/Fs));
%Array dos vetores de tempo
a_t = {t1,t2,t3};

%Loop para acessar cada objeto do array
for i=1:3
    audio = a_audio{1,i};
    t = a_t{1,i};
    
    %Plot de imagem do audio
    titulo =strcat('Lançamento ',int2str(i),' (audio)');
    fig1 = figure('Name',titulo,'NumberTitle','off','Position',[300 100 800 400]);
    plot(t,audio);
    set(gca,'YTickLabel',[]);
    set(gca,'YTick',[]);
    xlabel('t(s)','FontName','Times','FontSize',14) ;
    if saveFiles 
        saveas(gcf,strcat('./Imagens/',titulo,'.png'));
    end
    if closeCanvas
        close all;
    end
    
    %Plot de picos
    titulo =strcat('Lançamento ',int2str(i),' (picos)');
    figure('Name',titulo,'NumberTitle','off','Position',[300 100 800 400]);
    [peaks,loc] = findpeaks(audio, 'NPeaks', 11,'Threshold',.3,'MinPeakDistance',.2e4);
    x_peaks = t(loc);
    plot(t,audio,x_peaks,peaks,'v','MarkerEdgeColor','r','MarkerFaceColor','r');
    if saveFiles 
        saveas(gcf,strcat('./Imagens/',titulo,'.png'));
    end
    if closeCanvas
        close all;
    end
    
    %Plot de picos com zoom
    titulo =strcat('Lançamento ',int2str(i),' (picos zoom)');
    figure('Name',titulo,'NumberTitle','off','Position',[300 100 800 400]);
    [peaks,loc] = findpeaks(audio, 'NPeaks', 11,'Threshold',.3,'MinPeakDistance',.2e4);
    x_peaks = t(loc);
    plot(t,audio,x_peaks,peaks,'v','MarkerEdgeColor','r','MarkerFaceColor','r');
    xlim([0 (loc(11)/Fs)*1.05]);
    if saveFiles 
        saveas(gcf,strcat('./Imagens/',titulo,'.png'));
    end
    if closeCanvas
        close all;
    end
    
    %Analise de dados
    fprintf(file,strcat('Lancamento',int2str(i),','));
    
    for j=2:11
        if j<11
            fprintf(file,'%f,',(loc(j)-loc(j-1))/Fs);
        elseif j==11
            fprintf(file,'%f\n',(loc(j)-loc(j-1))/Fs);
        end
    end
end
fclose(file);
