%% LABORATORY WORK 4 - Preparation of 3D graphics
% Name: Efe
% Surname: Muzbeg
% Group: Ekfu-25/1
% Date: 02.10.2026
clear;
clc;
close all;


%% 1a) Plot given function
% f(x,y) = 1 - 2x^2 - 3y^2
% x = r*cos(theta)
% y = r*sin(theta)
% theta: 0 -> 2*pi
% r: 0 -> 1

theta = 0:0.05:2*pi;
r = 0:0.02:1;

[THETA,R] = meshgrid(theta,r);

X = R .* cos(THETA);
Y = R .* sin(THETA);

Z = 1 - 2.*X.^2 - 3.*Y.^2;

figure;

surf(X,Y,Z);

% Manually selected blue shades
colormap([
    0.15 0.35 0.80
    0.30 0.60 0.95
    0.70 0.85 1.00
]);

shading interp;

view(38,38);

xlabel('x');
ylabel('y');
zlabel('f(x,y)');

title('f(x,y) = 1 - 2x^2 - 3y^2');

grid on;
axis tight;


%% 1b) Plot a surface
% f(x,y) = sin(|x+y|/20) * e^(-|x+y|)
% x,y: -2 -> 2

x = -2:0.05:2;
y = -2:0.05:2;

[X,Y] = meshgrid(x,y);

Z = sin(abs(X + Y)./20) .* exp(-abs(X + Y));

figure;

surf(X,Y,Z);

% Manually selected red/orange shades
colormap([
    0.50 0.05 0.05
    0.90 0.25 0.05
    1.00 0.70 0.20
]);

shading interp;

view(60,60);

xlabel('x');
ylabel('y');
zlabel('f(x,y)');

title('f(x,y) = sin(|x+y|/20)e^{-|x+y|}');

grid on;
axis tight;


%% COMPLEMENTARY TASK P
% Features of shading function
% z(x,y) = 1 - (x^2 + y^2)
% Three graphics with different shading arguments

x = -1:0.05:1;
y = -1:0.05:1;

[X,Y] = meshgrid(x,y);

Z = 1 - (X.^2 + Y.^2);

figure;


% 1) Faceted shading
subplot(1,3,1);

surf(X,Y,Z);
shading faceted;

xlabel('x');
ylabel('y');
zlabel('z');

title('shading faceted');

grid on;
view(45,30);


% 2) Flat shading
subplot(1,3,2);

surf(X,Y,Z);
shading flat;

xlabel('x');
ylabel('y');
zlabel('z');

title('shading flat');

grid on;
view(45,30);


% 3) Interpolated shading
subplot(1,3,3);

surf(X,Y,Z);
shading interp;

xlabel('x');
ylabel('y');
zlabel('z');

title('shading interp');

grid on;
view(45,30);
