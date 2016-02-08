

function plot_echo_waveform(signal, name,fsample,figure_num)
  % function plot_echo_waveform(signal, fsample, figure_num)
  % Input arguments (parameters) are:
  % signal: an array representing a sampled signal
  % fsample: the sampling rate at which the signal
  % is sampled at.
  % figure_num: the number to specify plot
  % name: the name of the signal being plotted.
  % Ouput values returned are: N/A
  % Developed by: Fred Saucedo
  % Revised: 2/07/2016

  % create a time vector
  time_vector = [0: 1/fsample:(length(signal)-1)/fsample];

  % specify figure num
  figure(figure_num);
  plot(time_vector,signal);
  xlabel('Time (s)');
  ylabel('Amplitude');
  title(name)
end
