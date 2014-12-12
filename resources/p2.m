Fs=22050;
F0=440;
F1=880;
D=1;

t=linspace(1/Fs,D,Fs*D);
x0=sin(2*pi*F0*t);
x1=sin(2*pi*F1*t);
soundsc(x0,Fs);
soundsc(x1,Fs)
plot_spectrum(x0,Fs,'single tone @ 440 Hz', [0.15, 0.17]);
plot_spectrum(x1,Fs,'single tone @ 880 Hz', [0.15, 0.17]);
