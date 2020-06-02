w0(1) = 2;      %Iniciar w1 y w2 con cualquier valor aleatorio
w1(1) = 21;
w2(1) = 12;
dw = 0.00001;   %Definir la diferencial que se va a usar
p = 0.1;        %Definir el parámetro de aprendizaje
i = 999;        %Número de iteraciones a realizar
% Función que computa lo que hay dentro de la sumatoria
sum = @(W0, W1, W2, n) (f(n)-W0-W1*t(n)-W2*(t(n)^2))^2;
%Ciclo que asigna a cada w un nuevo valor cada iteración
for x = 1:i
    suma = 0;       % Variables que guardan los valores de las sumatorias
    sumdw0 = 0;     % por cada iteración se tienne que reiniciar en 0
    sumdw1 = 0;
    sumdw2 = 0;
    for y = 1:401   % Ciclo que computa y guarda los valores de las sumatorias
        suma = suma + sum(w0(x), w1(x), w2(x), y);
        sumdw0 = sumdw0 + sum(w0(x)+dw, w1(x), w2(x), y);
        sumdw1 = sumdw1 + sum(w0(x), w1(x)+dw, w2(x), y);
        sumdw2 = sumdw2 + sum(w0(x), w1(x), w2(x)+dw, y);
    end
    j0 = ((sumdw0/802)-(suma/802))/dw;  %J correspondiente a la aproximación de w0
    w0(x+1) = w0(x)- p*j0;              %Se guarda en la matriz w0 el nuevo valor
    
    j1 = ((sumdw1/802)-(suma/802))/dw;  %J correspondiente a la aproximación de w1
    w1(x+1) = w1(x)- p*j1;              %Se guarda en la matriz w1 el nuevo valor
    
    j2 = ((sumdw2/802)-(suma/802))/dw;  %J correspondiente a la aproximación de w2
    w2(x+1) = w2(x)- p*j2;              %Se guarda en la matriz w2 el nuevo valor
end
w0(i+1)     %Imprimir los resultados de la última iteración
w1(i+1)
w2(i+1)
