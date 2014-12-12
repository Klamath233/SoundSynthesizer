Fs = 22050;
Ts = 1/Fs;
Fs=22050;
F0=440;
D=1;

t=linspace(1/Fs,D,Fs*D);
N=floor((Fs/2)/F0);
acc = sin(2*pi*F0*t);
for i = 2:N
    acc = acc + sin(2*pi*i*F0*t);
end
acc = [0 acc];
t=[0:Ts:D];

num = [5e3 1e8];
den = [1 2e3 1e6];
sys = tf(num, den);

h = impulse(sys, t);
g = step(sys, t);

y = lsim(sys, acc, t);
soundsc(y, Fs);

figure;
plot_spectrum(h, Fs, 'impulse response');
plot_spectrum(g, Fs, 'step response');
plot_spectrum(y, Fs, 'rosonated signal', [Ts, 1]);