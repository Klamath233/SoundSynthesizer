Fs=22050;
F0=440;
D=1;

t=linspace(1/Fs,D,Fs*D);
N=floor((Fs/2)/F0);
acc = sin(2*pi*F0*t);
for i = 2:N
    acc = acc + sin(2*pi*i*F0*t);
end

soundsc(acc,Fs);
plot_spectrum(acc,Fs,'harmonically rich tone', [0.15, 0.17]);