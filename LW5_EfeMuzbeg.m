%% LABORATORY WORK 5
% Data structures and operation flow control
% Efe Muzbeg

clc;
clear;
close all;


%% 1. DATA STRUCTURES

% x-axis values
signal.x = 0:0.01:2;

% Signal values: f(x) = sin(2*pi*x)
signal.fx = sin(2*pi*signal.x);

% Function title
signal.title = 'f(x) = sin(2*pi*x)';

% Plot the function using values from the structure
figure;
plot(signal.x, signal.fx);
grid on;

title(signal.title);
xlabel('x');
ylabel('f(x)');


%% 2. OPERATION FLOW CONTROL
% f = a*x^2 + b*x + c

while true

    a = input('Enter value of a: ');
    b = input('Enter value of b: ');
    c = input('Enter value of c: ');
    x = input('Enter value of x: ');

    % Calculate function value
    f = a*x^2 + b*x + c;

    disp('Function result:');
    disp(f);

    % Stop condition:
    % a = 0, b = 0, c = 1, x = 1
    if a == 0 && b == 0 && c == 1 && x == 1
        disp('Stop values were entered.');
        break;
    end

end


%% COMPLEMENTARY TASK 1
% Generate:
% round(rand*5)
% round(rand*7)
%
% Store values in arrays until two equal numbers are generated.

i = 1;

while true

    number1 = round(rand*5);
    number2 = round(rand*7);

    % Save generated numbers into arrays
    array1(i) = number1;
    array2(i) = number2;

    % Display generated numbers
    disp('Generated numbers:');
    disp([number1 number2]);

    % Finish cycle when numbers are equal
    if number1 == number2
        break;
    end

    i = i + 1;

end


% Plot the change of generated numbers
figure;

plot(1:length(array1), array1, '-o');
hold on;

plot(1:length(array2), array2, '-o');

grid on;

title('Change of generated random numbers');
xlabel('Iteration');
ylabel('Generated number');

legend('round(rand*5)', 'round(rand*7)');
