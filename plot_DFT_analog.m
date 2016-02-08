function [DFT,Fd] = plot_DFT_analog(w,x,y,z,fsample,figure_num)
%Plot the DFT frequency spectrum (magnitude only in analog frequency axis)

N = 250;
Fd = 0:1/N:(N-1)/N;
%normalized value (n-1)/n
figure(figure_num);

DFT = {w,x,y,z};
names = {'LosAngelesSub', 'AkulaSub', 'Typhoon', 'TxPulse'};
for n=1:numel(DFT)
    subplot(2,2,n);
    plot_helper(DFT{n},Fd,names{n},fsample);
end

function plot_helper(DFT,Fd,name,fsample)
  DFT = DFT(1:250);
  if nargin < 4
    DFT = abs(fft(DFT))/length(DFT);
    stem(Fd*fsample,DFT,'.');
    xlabel('Analog Frequency');
    ylabel('Magnitude dB');
    title(name);
    grid on;
  end

end


% subplot(2,1,1)
% figure(figure_num);
% stem(Fd.*fsample,DFT./N,'.');
% xlabel('Analog Frequency')
% ylabel('Magnitude dB')
% title('Magnitude vs. Analog Frequency')
% grid on
%
% subplot(2,1,2)
% figure(figure_num+1);
% stem(Fd.*fsample,DFT./N,'.');
% xlabel('Analog Frequency')
% ylabel('Magnitude dB')
% title('Magnitude vs. Analog Frequency')
% grid on
%
% subplot(2,1,3)
% figure(figure_num+2);
% stem(Fd.*fsample,DFT./N,'.');
% xlabel('Analog Frequency')
% ylabel('Magnitude dB')
% title('Magnitude vs. Analog Frequency')
% grid on
%
% subplot(2,1,4)
% figure(figure_num+3);
% stem(Fd.*fsample,DFT./N,'.');
% xlabel('Analog Frequency')
% ylabel('Magnitude dB')
% title('Magnitude vs. Analog Frequency')
% grid on

end
