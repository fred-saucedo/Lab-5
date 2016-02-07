
 function Cxy = NormCrossCorrelate(xn, yn)

 seqLength = 2.^nextpow2(length(xn)+length(yn)-1);
 DFTx = fft(xn,seqLength);
 DFTy = fft(yn,seqLength);
 Rxy = DFTx.*conj(DFTy);
 rxy = ifft(Rxy);
 norm = sqrt(sum(xn.*xn).*sum(yn.*yn));

 Cxy = rxy./norm;
 figure(1)
 subplot(2,1,1)
 plot(0:1/(length(Cxy)-1):1,Cxy);
 xlabel('Digital Frequency')
 ylabel('Magnitude')
 title('Cross-Correlation Plot')
 grid on

 subplot(2,1,2)
 plot(0:1/(length(Cxy)-1):1,abs(hilbert(Cxy)));
 xlabel('Digital Frequency')
 ylabel('Magnitude')
 title('Hilbert Plot')
 grid on
