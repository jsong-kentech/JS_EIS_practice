function Z= Z_model_RCW(w,para)

    R= para(1);
    C= para(2);
    A= para(3);
    R2 = para(4);
    
  % Warburg impedance
   Z_W = A .* (1 - 1i) ./ sqrt(w);

   % Impedance components
   Z_RW = R + Z_W;
   Z_C = 1 ./ (1i * w * C);

   % Total impedance
   Z = R2 + (Z_RW .* Z_C) ./ (Z_RW + Z_C);


end
