% Name: Efe
% Surname: Atasoy
% Group: Ekfu-25/1
% Date: 11.09.2026

x = 1:32;
y = x.^2;

plot(x, y, 'o-r', x, y/3, 'xb')
title('Dvi funkcijos')
xlabel('X-ai')
ylabel('F_1 [-o-]    |    F_2 [-x-]')


N = 1;

v = N+1:0.5:N+4;

A = reshape(N:N+8,3,3).';

part_a = A(3,2);
part_b = A(2:3,1:2);
part_c = A([1 3],[1 3]);

v_for_concat = v(1:3);
combined = [A; v_for_concat];