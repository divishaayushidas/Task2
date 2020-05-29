clc;
clear all;
close all;
% Record your voice for 10 seconds.
d = audiorecorder;
disp('Start speaking.')
recordblocking(d, 10);
disp('End of Recording.');

% Store data in double-precision array.
b = getaudiodata(d);
wavwrite(b,'voice')
get(d)
y=wavread('voice.wav');

% Plot the waveform.
k=menu('choose type of modulation','amplitude','frequency')
switch k
    case 1
        %Amplitude Modulation
        subplot(4,1,1)
        plot(y);
        xlabel('time');
        ylabel('amplitude');
        title('input signal');
        grid on;
        get(d)
        fs=8000;
        t=[0:10*fs]'/fs;
        fc=2000;
        Ac=10;
        wc=2*pi*fc*t;
        c=Ac*sin(wc);
        subplot(4,1,2)
        plot(t,c)
        xlabel('time');
        ylabel('amplitude');
        title('carrier signal');
        grid on;
        v=ammod(y,fc,fs);
        subplot(4,1,3)
        plot(v)
        xlabel('time');
        ylabel('amplitude');
        title('modulated signal');
        grid on;
        m=amdemod(v,fc,fs);
        subplot(4,1,4)
        plot(m)
        xlabel('time');
        ylabel('amplitude');
        title('demodulated signal');
        grid on;
        pause(5);
        sound(m,fs);

case 2
    %Frequency Modulation
    subplot(4,1,1)
    plot(y);
    xlabel('time');
    ylabel('amplitude');
    title('input signal');
    grid on;
    get(d)
    fs=8000;
    dev=50;
    t=[0:10*fs]'/fs;
    fc=2000;
    Ac=10;
    wc=2*pi*fc*t;
    c=Ac*sin(wc);
    subplot(4,1,2)
    plot(t,c)
    xlabel('time');
    ylabel('amplitude');
    title('carrier signal');
    grid on;
    v = fmmod(y,fc,fs,dev);
    subplot(4,1,3)
    plot(v)
    xlabel('time');
    ylabel('amplitude');
    title('modulated signal');
    grid on;
    m = fmdemod(v,fc,fs,dev);
    subplot(4,1,4)
    plot(m)
    xlabel('time');
    ylabel('amplitude');
    title('demodulated signal');
    grid on;
    pause(5);
    sound(m,fs);
end
    



