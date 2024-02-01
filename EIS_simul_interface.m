

% Variable: frequency
f_min = -3;
f_max =3;
N = 1000;

   f_vec = logspace(f_min, f_max, N);
   w_vec = 2 * pi * f_vec;


% parameter
R= 1;
C= 10^-3;
A = 1;

    para0 = [R,C,A];

% calulation (simulation)
Z= Z_model_RCW(w_vec,para0);


%plot
figure;
plot(real(Z), -imag(Z));
xlim([0, 3]);
xlabel('Re(Z)/Ohm');
ylabel('-Im(Z)/Ohm');
title('Impedacne');
grid on




