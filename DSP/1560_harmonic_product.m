
% Harmonic Product
clc;clear

fpath = 'Audio Tones Database/Tenor Sax/tenor_sax_a3_notes/tenor_sax_a3_note%0.2i.wav';
fname = sprintf(fpath, 5);

[w, fs] = audioread(fname);
harmonic_product(w, fs)

function harmonic_product(w, fs)
    
    N = length(w)/2;
    Ts = 1/fs;

    w = w / sqrt(Ts * sum(w.^2));
    
    w = fftshift(fft(w)) * Ts;
    W = abs(w);

    W = W(N : N * 2 - 1);
    f = (0 : N - 1) * fs/(2*N);
    
    figure(1)
    plot(f, W, 'b', 'LineWidth', 1)
    
    xlim([0 2300])
    xlabel('f Hz')
    ylabel('|X_1(f)|')
    title('ECE 1560: Spectrum Peaks for Tenor Sax A3')

    decimate_by_i(W, fs, 1)
    decimate_by_i(W, fs, 2)
    decimate_by_i(W, fs, 3)
    decimate_by_i(W, fs, 4)
end

function decimate_by_i(w, fs, i)
    
    W = w(1:i + 1:end);
    N = length(W);

    f = (0 : N - 1) * fs/(N*2^(i + 1));
    
    figure(i + 1)
    plot(f, W, 'b', 'LineWidth', 1)
    
    xlim([0 2300])
    xlabel('f Hz')
    ylabel(sprintf('|X_%i(f)|', i + 1))
    title('ECE 1560: Spectrum Peaks for Tenor Sax A3')
end

function cents = cents_diff(estimated, ideal)
    cents = 1200 * log2(estimated/ideal);
end
