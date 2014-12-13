Fs = 22050; % sampling rate
Ts = 1/Fs; % sampling period
F0 = 440; % A4
F1=880; % A5
D = 1; % duration

t = linspace(1/Fs,D,Fs*D);
N = floor((Fs/2)/F0); % max overtone number

x0=sin(2*pi*F0*t);
x1=sin(2*pi*F1*t);
plot_spectrum(x0,Fs,'single tone @ 440 Hz', [0.15, 0.17]);
plot_spectrum(x1,Fs,'single tone @ 880 Hz', [0.15, 0.17]);

% Add all sinusoids together
acc = sin(2*pi*F0*t);
for i = 2:N
    acc = acc + sin(2*pi*i*F0*t);
end
plot_spectrum(acc,Fs,'harmonically rich tone', [0.15, 0.17]);

t=0:Ts:D; % lsim needs the signal to start from 0
acc = [0 acc];
num = [5e3 1e8];
den = [1 2e3 1e6];
sys = tf(num, den);

h = impulse(sys, t);
g = step(sys, t);

y = lsim(sys, acc, t);
plot_spectrum(h, Fs, 'impulse response', [0.0, 0.01]);
plot_spectrum(g, Fs, 'step response', [0.0, 0.01]);
plot_spectrum(y(2:length(y)), Fs, 'rosonated signal (several periods)', [0.15, 0.17]);
plot_spectrum(y(2:length(y)), Fs, 'resonated signal (overall)', [0.0, 1.0]);

% Apply the envelop
z = zeros(1, length(t));
for i = 1:length(t)
   z(i) = exp(-5 * t(i)) * y(i);
end

plot_spectrum(z(2:length(z)), Fs, 'enveloped signal (overall)', [0.0, 1.0]);

% Apply the filter
Fc = 5000;
[b, a] = butter(9, Fc/Fs);
z = filter(b, a, z);
plot_spectrum(z, Fs, 'low-pass signal (several periods)', [0.15, 0.17]);