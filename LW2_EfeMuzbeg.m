% Name: Efe
% Surname: Muzbeg
% Group: Ekfu-25/1
% Date: 18.09.2026

%% 1 Vectors

a = 1:2:34;
b = exp(a);
c = a ./ b;
disp(c(:))


%% 2 Matrices

A = [pi/2 3i; log(2) 2*pi];

B = [exp(A(1,1)) exp(A(1,2))];

C = [A; B];

columnSums = sum(C);
disp(columnSums)


%% 3 Practical applications

t = 0:0.001:1;

A_signal = 5;
f = 5;
sigma = 1.5;
U1 = 3;
U2 = 2;

s = A_signal * sin(2*pi*f*t);
n = sigma * randn(size(t));

signal = s + n;

selected = signal(signal > U1);

filtered = signal;
filtered(abs(filtered) < U2) = 0;

numberUnfiltered = numel(signal);
numberSelected = numel(selected);

minimumValue = min(filtered);
maximumValue = max(filtered);

disp(numberUnfiltered)
disp(numberSelected)
disp(minimumValue)
disp(maximumValue)


%% P1 Indexing of vector elements

Ainput = input('Input vector A with 12 elements: ');

mask = true(size(Ainput));
mask(10:end) = false;

B = [Ainput(10:end) Ainput(mask)];

disp('vector B is:')
disp(B)
