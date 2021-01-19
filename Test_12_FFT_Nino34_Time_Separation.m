clear all;
% El Nino 34 data loading
load dataelnino_1.mat
load dataelnino_2.mat
load dataelnino_3.mat
% Time properties
Datapoints = 600;            % Number of "recorded" data; number of data points in the time series
Step= 1/12;                   % TIME INTERVAL BETWEEN CONSECUTIVE DATA POINTS (dt) THIS IS THE SAMPLING TIME
% Data import
y1 = table2array(dataelnino1);
y2 = table2array(dataelnino2);
y3 = table2array(dataelnino3);
% Fourier Transformation
Y1 = fft(y1,Datapoints)/Datapoints;
Z1 = (Y1.*conj(Y1));                % el power spectral density (PSD) ES EL MODULO DE Y al cuadrado
Y2 = fft(y2,Datapoints)/Datapoints;
Z2 = (Y2.*conj(Y2)); 
Y3 = fft(y3,Datapoints)/Datapoints;
Z3 = (Y3.*conj(Y3));
%Si se desea usar frecuencias:
%fs=Datapoints/Length;          % FS=1/STEP ESTA ES LA MAXIMA FRECUENCIA
%Length=Datapoints*Step;       % Length (years); recorded time (la frecuencia esta en Hz=1/mes si el tiempo esta en meses)
%DF = 1/Length                % THIS IS THE "FREQUENCY RESOLUTION"
%f = (0:Datapoints/2)*DF;      % Frequency vector
%Si se desea utilizar tiempo:
t = (0:Datapoints/2)*Step;      % Time vector
ZTotal = (Z1 + Z2 + Z3)/3;
%f = fs/2*linspace(0,1,NFFT/2+1);
% Plot single-sided amplitude spectrum.
%plot(f,2*abs(Y(1:NFFT/2+1)))
semilogy(t, ZTotal(1:Datapoints/2+1))   % el espectro se suele graficar en escala log
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Time (Years)')
ylabel('Amplitude - |Y(f)|')