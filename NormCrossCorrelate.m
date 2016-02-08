
function Cxy = NormCrossCorrelate(xn,yn, enable_plot, name)
  % function NormCrossCorrelate(xn, yn, enable_plot, name)
  % Input arguments(parameters) are:
  % xn: first input sequence.
  % yn: second input sequence.
  % enable_plot: boolean value to enable plotting
  % name: the name to use for the title when plotting.
  % Output returned values are:
  % Cxy: the normalized Cross-Correlation of
  % the two input signals.

  % obtain the energy of both signals.
  energy_x =  compute_energy(xn);
  energy_y = compute_energy(yn);

  % compute cross_correlation and normalize by enegery.
  % ensures that cxy goes from [-1,1]
  Cxy = cross_correlation(xn,yn)/sqrt(energy_y*energy_x);

  % check if enable_plot is passed in .
  if nargin < 3
    enable_plot = false;
    name = 'Cross-Correlation Plot';
  end;
  % plot if enable_plot value is true.
  if(enable_plot)
    figure(1); % open a figure.
    % create a n lagg vector
    n_laggs = [0:length(Cxy)-1];
    plot(n_laggs, Cxy);
    title(name);
    xlabel('n lag-position');
    ylabel('Normalized Amplitude');
  end

end

function rxy = cross_correlation(signal1, signal2)
  % function auto_correlation(signal)
  % Input arguments (parameters)
  % signal1: an array of sampled values
  % signal2: an array of sampled values
  % Output values returned are:
  % rxy: the cross correlation of the two signals
  % Developed by: Fred Saucedo
  % Revised: 2/07/2016

  % two ways to perform cross Cross-Correlation
  % 1. time-reverse yn
  % 2. take the complex conjugate of yn

  % find the original values.
  x_length = length(signal1);
  y_length = length(signal2);
  padded_length = x_length + y_length-1;
  % zero padd for linear convolution
  signal1(end:padded_length) = 0;
  signal2(end:padded_length) = 0;

  % zero padd to ensure size is power of 2.
  fft_length = 2.^nextpow2(padded_length);
  signal1(end:fft_length)=0;
  signal2(end:fft_length)=0;

  CXY = fft(signal1).*conj(fft(signal2));
  rxy = ifft(CXY);
  rxy = rxy(1:x_length);
end

function energy = compute_energy(xn)
  % function energy = compute_energy(xn)
  % Input arguments (parameters) are:
  % xn: an array of sampled values.
  % Output values returned are:
  % energy: the energy in the signal.
  % Developled by: Fred Saucedo
  % Revised: 02/07/2016

  % compute auto correlation
  auto_corr = cross_correlation(xn,xn);
  %energy of signal is in the first bin of the
  % auto_correlation
  energy = auto_corr(1);
end
