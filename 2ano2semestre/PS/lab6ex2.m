n = 0:1600; % Intervalo maior para análise
x_n = cos((2*pi/25)*n) + sin((2*pi/35)*n) + cos((2*pi/45)*n);

% Encontrar o período do sinal
N = lcm(lcm(25,35),45);

% Plot do sinal
figure;
subplot(3,1,1);
stem(n, x_n, 'filled');
title('Sinal x[n]');
xlabel('n'); ylabel('Amplitude');

% Cálculo dos coeficientes de Fourier
a_k = fft(x_n(1:N))/N;
k = 0:N-1;

% Plot do módulo dos coeficientes de Fourier
subplot(3,1,2);
stem(k, abs(a_k), 'filled');
title('Módulo dos coeficientes de Fourier');
xlabel('k'); ylabel('|a_k|');

% Cálculo da potência pelo teorema de Parseval
P_time = sum(x_n(1:N).^2) / N;
P_freq = sum(abs(a_k).^2);

% Definição do filtro ideal passa-baixo
wc = 2*pi/40;
w = (2*pi/N) * (0:N-1);
H = (w<wc | w>2*pi-wc) * 1;

% Aplicação do filtro
b_k = a_k .* H;
x_filtered = ifft(b_k * N); % Reconstrução do sinal filtrado

% Plot do módulo dos coeficientes da saída
subplot(3,1,3);
stem(k, abs(b_k), 'filled');
title('Módulo dos coeficientes da saída');
xlabel('k'); ylabel('|b_k|');
