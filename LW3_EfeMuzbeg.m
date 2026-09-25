clear;
clc;
close all;


%% =========================================================
%  VILNIUS TECH
%  Script Programming - Laboratory Work 3
%  Preparation of 2D Graphics
%  Student: Efe Muzbeg
%% =========================================================


%% TASK 1 - Creating 2-D graphs

% Create vector x with 50 linearly spaced values from -pi to pi
x = linspace(-pi, pi, 50);

% Functions
f1 = sin(x);
f2 = x.^2 + 9;
f3 = x.^3 - 2*x.^2 - 9;


%% Task 1a
% Plot f1 versus x in the first figure

figure(1);

plot(x, f1, 'b-', 'LineWidth', 1.5);

xlabel('x');
ylabel('f_1(x)');
title('f_1(x) = sin(x)');

grid on;

xlim([-pi pi]);
ylim([-1.2 1.2]);


%% Task 1b
% Plot f1, f2 and f3 on the same axes
% Each function has different line type, marker and color

figure(2);

plot(x, f1, 'b-o', ...
    'LineWidth', 1.2, ...
    'MarkerSize', 4);

hold on;

plot(x, f2, 'r--s', ...
    'LineWidth', 1.2, ...
    'MarkerSize', 4);

plot(x, f3, 'k-.^', ...
    'LineWidth', 1.2, ...
    'MarkerSize', 4);

hold off;

xlabel('x');
ylabel('Function value');

title('Functions f_1, f_2 and f_3');

legend('f_1(x) = sin(x)', ...
       'f_2(x) = x^2 + 9', ...
       'f_3(x) = x^3 - 2x^2 - 9', ...
       'Location', 'best');

grid on;

xlim([-pi pi]);

% Automatically choose suitable y-axis limits
allValues = [f1 f2 f3];

ymin = min(allValues);
ymax = max(allValues);

ylim([ymin - 2, ymax + 2]);


%% =========================================================
%% TASK 2 - Preparation of specialized plots
%% =========================================================

% 6 students and 4 laboratory assignments
% Marks are from 1 to 10

marks = [
    8   7   9   10;
    6   8   7    9;
    9   9  10    8;
    5   6   7    8;
   10   8   9    9;
    7   5   8    6
];

% Student names for the legend
studentNames = {
    'Efe Muzbeg'
    'Student 2'
    'Student 3'
    'Student 4'
    'Student 5'
    'Student 6'
};


%% Task 2a and Task 2b
% Both graphs are displayed in the same figure

figure(3);


%% Task 2a
% Bar graph showing the marks of all students
% for every laboratory session

subplot(2,1,1);

bar(marks');

xlabel('Laboratory session');
ylabel('Mark');

title('Laboratory work results');

legend(studentNames, ...
       'Location', 'eastoutside');

xticks(1:4);
xticklabels({'Lab 1','Lab 2','Lab 3','Lab 4'});

xlim([0.5 4.5]);
ylim([0 10]);

grid on;


%% Task 2b
% Calculate average mark for every student

averageMarks = mean(marks, 2);

subplot(2,1,2);

stem(1:6, averageMarks, ...
    'filled', ...
    'LineWidth', 1.2);

xlabel('Students');
ylabel('Average mark');

title('Average mark of each student');

xticks(1:6);
xticklabels({'1','2','3','4','5','6'});

xlim([0.5 6.5]);
ylim([0 10]);

grid on;


%% =========================================================
%% COMPLEMENTARY TASK P - Graphical representation of signals
%% =========================================================

% Signals from Laboratory Work 2 - Task 3

t = 0:0.001:1;

A_signal = 5;
f = 5;
sigma = 1.5;

U1 = 3;
U2 = 2;


%% Create original signal

s = A_signal * sin(2*pi*f*t);

% Noise
n = sigma * randn(size(t));

% Original/noisy signal
signal = s + n;


%% Create filtered signal

filtered = signal;

filtered(abs(filtered) < U2) = 0;


%% Create figure with two horizontal plots

figure(4);


%% Complementary Task P - Graph 1
% Original and filtered signals

subplot(1,2,1);

plot(t, signal, ...
    'b-', ...
    'LineWidth', 1.25);

hold on;

plot(t, filtered, ...
    'k--', ...
    'LineWidth', 1.25);


% Threshold U1 - red line
yline(U1, ...
    'r-', ...
    'U_1', ...
    'LineWidth', 1.25);


% Threshold U2
yline(U2, ...
    'm--', ...
    'U_2', ...
    'LineWidth', 1.25);


hold off;


xlabel('Time, s');
ylabel('Voltage, V');

title('Original and Filtered Signals', ...
    'Color', 'b', ...
    'FontSize', 14);


legend('Original signal', ...
       'Filtered signal', ...
       'U_1', ...
       'U_2', ...
       'Location', 'best');

grid on;


% Suitable axis limits
minimumVoltage = min([signal filtered]);
maximumVoltage = max([signal filtered]);

xlim([min(t) max(t)]);

ylim([
    min(minimumVoltage, U2) - 1, ...
    max(maximumVoltage, U1) + 1
]);


%% Complementary Task P - Graph 2
% Display original signal values exceeding U1
% using discrete signal representation

subplot(1,2,2);


% Find values above threshold U1
aboveU1 = signal > U1;


% Discrete representation
stem(t(aboveU1), ...
     signal(aboveU1), ...
     'b', ...
     'LineWidth', 1.25);

hold on;


%% Find maximum and minimum voltage values

maxVoltage = max(signal);
minVoltage = min(signal);


% Find every position where maximum occurs
maxIndices = find(signal == maxVoltage);

% Find every position where minimum occurs
minIndices = find(signal == minVoltage);


%% Mark maximum voltage with green circles

plot(t(maxIndices), ...
     signal(maxIndices), ...
     'go', ...
     'MarkerSize', 8, ...
     'LineWidth', 1.5);


%% Mark minimum voltage

plot(t(minIndices), ...
     signal(minIndices), ...
     'kx', ...
     'MarkerSize', 8, ...
     'LineWidth', 1.5);


%% Draw threshold U1 in red

yline(U1, ...
    'r-', ...
    'U_1', ...
    'LineWidth', 1.25);


hold off;


xlabel('Time, s');
ylabel('Voltage, V');

title('Original Signal Values Above U_1', ...
    'Color', 'b', ...
    'FontSize', 14);


legend('Values above U_1', ...
       'Maximum voltage', ...
       'Minimum voltage', ...
       'U_1', ...
       'Location', 'best');

grid on;


% Axis limits
xlim([min(t) max(t)]);

ylim([
    min(minVoltage, U1) - 1, ...
    max(maxVoltage, U1) + 1
]);


%% =========================================================
% Display calculated information in Command Window
%% =========================================================

disp('------------------------------------------');
disp('LABORATORY WORK 3 COMPLETED');
disp('Student: Efe Muzbeg');
disp('------------------------------------------');

disp('Average marks of students:');
disp(averageMarks);

disp(['Maximum signal voltage: ', num2str(maxVoltage), ' V']);
disp(['Minimum signal voltage: ', num2str(minVoltage), ' V']);

numberAboveU1 = sum(aboveU1);

disp(['Number of samples above U1: ', ...
      num2str(numberAboveU1)]);
