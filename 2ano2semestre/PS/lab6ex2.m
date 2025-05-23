clc; clear; close all;
syms x;

f = @(x) exp(2*x/3) - 2*x;

% Intervalo e tolerância
a = 0;
b = 4;
tol = 1e-4; 
kmax = 20;

% Função do Método da Bisseção
function c = bisection(f, a, b, tol, kmax)
    if nargin < 5 || isempty(kmax), kmax = 20; end
    if nargin < 4 || isempty(tol), tol = 1e-4; end

    if f(a) * f(b) > 0
        error("Não há solução no intervalo [a, b]");
    end

    for k = 1:kmax
        c = (a + b) / 2; % Ponto médio

        if abs(f(c)) < tol % Verificação com tolerância
            return;
        end

        if (b - a) / 2 < tol % Verificação do intervalo
            return;
        end

        if f(b) * f(c) > 0 % Atualiza intervalo
            b = c;
        else
            a = c;
        end
    end
end
