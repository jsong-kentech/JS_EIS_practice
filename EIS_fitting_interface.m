

% data path
path_data = 'C:\Users\jsong\Documents\MATLAB\JS_EIS_practice\example1_eis_fc_soc48_t25.txt';

% load data
    data_e = importdata(path_data);
    f_exp = data_e.data(:,1);         % [Hz]
    z_exp_real = data_e.data(:,2);    % [Ohm]
    z_exp_imag = - data_e.data(:,3);    % [Ohm]
    z_exp = z_exp_real + 1i*z_exp_imag;
%pre-plot
    figure(1)
    plot(z_exp_real,-z_exp_imag)


%% fitting

    % initial guess
    R_0 = 0.02;
    C_0 = 1;
    A_0 = 0.004;
    R2_0 = 0.027;
    
    
    para0 = [R_0,C_0,A_0,R2_0];
    
    
    % calculate initial guess
    Z0 = Z_model_RCW(f_exp,para0);
    
     % pre-plot2
     figure(1); hold on
     plot(real(Z0),-imag(Z0))



% Main Fitting

    % cost function define (function handle)
    objfunc = @(para)cost_func(z_exp,f_exp,para);

    % minimization 
    para_hat = fmincon(objfunc,para0,[],[],[],[],[0,0,0,0],10*para0);


    % plot
    Z_hat = Z_model_RCW(f_exp,para_hat);

    % pre-plot2
    figure(1); hold on
    plot(real(Z_hat),-imag(Z_hat))
   




function cost = cost_func(z_exp,f,para)

    z_mod = Z_model_RCW(f,para);

    cost = sum(real(z_exp - z_mod).^2) + sum(imag(z_exp - z_mod).^2) ;

end