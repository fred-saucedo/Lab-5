
function plot_time_data(signal1, signal2, signal3, signal4,names, figure_num)
  % function plot_time_data(signal1, signal2, signal3, signal4)
  % Input arguments (parameters) are:
  % signal1: first time domain signal
  % signal2: second time domain signal
  % signa3: third time domain signal
  % signal4: fourth time domain signal
  % figure_num: specifies the figure number to use with
  % plotting .
  % Output returned values are: N/A
  % Developed by Fred Saucedo
  % Revised 2/07/2016

  figure(figure_num); % create a figure.
  % craete a time vector.
  time_vector = [0:1/(50e+3): (5e-3)-(1/(50e+3))]; % 0 to 5milli seconds.
  % create cell array to hold signal data
  signals = {signal1, signal2, signal3, signal4};
  for n=1:numel(signals)
    subplot(2,2,n);
    plot_helper(time_vector, signals{n}, names{n});
  end
end

function plot_helper(time_vector, signal,title_name, size)
  %function plot_helper(time_vector, signal)
  if nargin < 4
    size = 250; % plot 250 points
  end
  plot(time_vector, signal(1:size));
  xlabel('Time (seconds)');
  ylabel('Amplitude (Volts)');
  title(title_name);
end
