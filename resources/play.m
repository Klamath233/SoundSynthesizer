function ret=play(freq, delay, hold, totalTime)
    Fs = 22050;
    Ts = 1/Fs;
    Fs=22050;
    F0=freq;
    D=ceil(hold+1);
    
    ret = zeros(1, ceil(Fs * totalTime));
    t=linspace(1/Fs,D,Fs*D);
    N=floor((Fs/2)/F0);
    acc = sin(2*pi*F0*t);
    for i = 2:N
        acc = acc + sin(2*pi*i*F0*t);
    end
    t=0:Ts:D;
    acc = [0 acc];
    num = [5e3 1e8];
    den = [1 2e3 1e6];
    sys = tf(num, den);

    y = lsim(sys, acc, t);
    
    z = zeros(1, length(t));

    for i = 1:ceil(hold * Fs)
       z(i) = y(i);
    end
    
    for i = 1+ceil(hold * Fs):(ceil(hold *Fs) + Fs);
       z(i) = exp(-5 * t(i - ceil(hold * Fs))) * y(i);
    end
    
    Fc = 5000;
    [b, a] = butter(9, Fc/Fs);
    z = filter(b, a, z);
    
    
    for i = (ceil(delay * Fs)+1):(ceil(delay * Fs) + 1 + D * Fs)
        ret(i) = z(i - ceil(delay * Fs));
    end
    
end