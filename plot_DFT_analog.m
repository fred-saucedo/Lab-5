function [ DFTx,Fd ] = plot_DFT_mag([w,x,y,z],fsample,figure_num )
%Plot the DFT frequency spectrum (magnitude only in analog frequency axis)

N = 250;
Fd = 0:1/N: (N-1)/N;
%normalized value (n-1)/n

DFTw = abs(fft(w));

DFTx = abs(fft(x));

DFTy = abs(fft(y));

DFTz = abs(fft(z));


%{subplot(2,1,1)
figure(figure_num);
stem(Fd,DFTx./N,'.');
xlabel('Digital Frequency')
ylabel('Magnitude dB')
title('Magnitude vs. Digital Frequency')
axis([0 1 0 max(DFTx./N)]);
grid on
%}

subplot(2,1,1)
figure(figure_num);
stem(Fd.*fsample,DFTx./N,'.');
xlabel('Analog Frequency')
ylabel('Magnitude dB')
title('Magnitude vs. Analog Frequency')

subplot(2,1,2)
figure(figure_num+1);
stem(Fd.*fsample,DFTx./N,'.');
xlabel('Analog Frequency')
ylabel('Magnitude dB')
title('Magnitude vs. Analog Frequency')

subplot(2,1,3)
figure(figure_num+1);
stem(Fd.*fsample,DFTx./N,'.');
xlabel('Analog Frequency')
ylabel('Magnitude dB')
title('Magnitude vs. Analog Frequency')
end
