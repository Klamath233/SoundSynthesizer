function ret=play(freq, delay, hold, totalTime)
    Fs = 44100;
    Ts = 1/Fs;
    F0 = freq;
    D = ceil(hold+1); % duration = holding time + fading time
    
    ret = zeros(1, ceil(Fs * totalTime)); % unify the length of the signal
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

    % Apply resonator
    y = lsim(sys, acc, t);
    
    z = zeros(1, length(t));

    % First, concatenate the holding part and the fading part
    % to generate a non-delayed signal.
    for i = 1:ceil(hold * Fs)
       z(i) = y(i);
    end
    
    % Apply envelop
    for i = 1+ceil(hold * Fs):(ceil(hold *Fs) + Fs);
       z(i) = exp(-5 * t(i - ceil(hold * Fs))) * y(i);
    end
    
    % Apply LP filter
    Fc = 5000;
    [b, a] = butter(9, Fc/Fs);
    z = filter(b, a, z);
    
    % Then delay the signal
    for i = (ceil(delay * Fs)+1):(ceil(delay * Fs) + 1 + D * Fs)
        ret(i) = z(i - ceil(delay * Fs));
    end
    
    % Now the signal ret is the proper note.
end