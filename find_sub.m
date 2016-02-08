
function find_sub(echo_signal, test_signal, name, fig_num)

  rxy = NormCrossCorrelate(echo_signal, test_signal);
  % create a n-lag vector
  n_lag = [0:length(rxy)-1];
  figure(fig_num);
  subplot(2,1,1); 
  plot(n_lag, rxy);
  title(name);
  xlabel('n lags');
  ylabel('Normalized Amplitude');

  % find the hilbert transform of the signal.
  envelope = abs(hilbert(rxy));
  subplot(2,1,2);
  plot(n_lag, envelope);
  title(strcat(name, ' Hilbert Transform'));
  xlabel('n lags');
  ylabel('Normalized Amplitude');
end
