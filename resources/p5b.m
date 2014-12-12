Fs = 22050;
Ts = 1/Fs;
Fs=22050;
F0=C4;
D=1;

t=linspace(1/Fs,D,Fs*D);
N=floor((Fs/2)/F0);
acc = sin(2*pi*F0*t);
for i = 2:N
    acc = acc + sin(2*pi*i*F0*t);
end
t=[0:Ts:D];
acc = [0 acc];
num = [5e3 1e8];
den = [1 2e3 1e6];
sys = tf(num, den);

h = impulse(sys, t);
g = step(sys, t);

y = lsim(sys, acc, t);


z = zeros(1, length(t));
for i = 1:length(t)
   z(i) = exp(-5 * t(i)) * y(i);
end

plot_spectrum(z, Fs, 'enveloped signal', [0.15, 0.17]);

Fc = 5000;
[b, a] = butter(9, Fc/Fs);
z = filter(b, a, z);
soundsc(z, Fs);
plot_spectrum(z, Fs, 'low-pass signal', [0.15, 0.17]);