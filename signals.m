function signals

%% Bode Plots
figure(1);
num =  [33333]; % first number is largest degree
den = [1 0 0];
H = tf(num,den)
% bode(H, {1,1e5}) %range between {}
bode(H)

% %% or second option
% num =  [1 0.01]; % first number is largest degree
% den = [1 5];
% w = 0.1:0.01:100;
% [mag, phase,w] = bode(num,den,w);
% %  subplot(211), semilogx(w, 20*log10(mag));
% %  subplot(212), semilogx(w, phase);
% 
% 
% %% Ck
% n = [0 1];
% d = [1 1];
% w = 1:2:5;
% h = freqs (n, d, w);
% ckx = 4 ./ (pi*w) .* exp(-j*pi/2);
% cky = h .* ckx;
% ckymag = abs(cky);
% ckyphase = angle(cky)*180/pi;
% 
% %% Normalized Butterworth Filter
% n = 2;
% [z,p,k] = buttap(n); %returns zeros, poles, gain factor
% 
% 
% 
% %% Finding H(s) for Butterworth 
% %Determining
% %wp=10;ws=20;Gp=-2;Gs=-20; %G already in dB
% wp=0.00334;ws= 0.00207;Gp=-2;Gs=-10;
% Wsp = ws/wp;
% nc = abs(log((10^-(Gs/10) -1)/(10^-(Gp/10) -1))/(2*log(Wsp)))
% n = ceil(nc)
% %Determining wc
% wc1 = wp/(((10^(-Gp/10))-1)^(1/(2*n)))
% wc2 = ws/((10^(-Gs/10)-1)^(1/(2*n)))
% %Determining H(s)
% for k =1:n
%     A = (2*(k-1)+n+1)/(2*n);
%     Sk = cos(A*pi)+j*sin(A*pi);
%     s(1,k) = [Sk];
% end
% s = s'
% num1 = [0 1];
% den1 = poly([s']);
% HNormalised = tf(num1,den1);
% disp('H(s) Normalised = ')
% printsys(abs(num1),abs(den1))
% 
% num2 = [0 wc1^n];
% den2 = poly(wc1*[s']);
% H_s_over_wc = tf(num2,den2);
% disp('H(s) with s/wc = ')
% printsys(abs(num2),abs(den2))
% bode(H_s_over_wc, {0.1,1e3})
% 
% %or
% [n,wc] = buttord(wp,ws,-Gp,-Gs,'s')
% [num,den] = butter(n,wc1,'s');
% H_s_butter1 = tf(num,den)
% 
% %% Chebyshev
% wp=[20 60];ws=[30 38];Gp=-3;Gs= -24;
% n = 3;
% rdb = 1;
% [zcheby,p,k] = cheb1ap(n,rdb)
% 
% [n,wp] = cheb1ord(wp,ws,rdb,-Gs,'s');
% [num,den] = cheby1(n,rdb,wp,'bandpass','s');
% H_s_cheby1 = tf(num,den)
% 
% %% Butterworth Desiging HPF,BPF,BSF
% wp=20;ws=10;Gp=-1;Gs= -20;
% [n,wn] = buttord(wp,ws,-Gp,-Gs,'s')
% [num,den] = butter(n,wn,'high','s'); %for BPF - 'bandpass', for BSF - 'stop'
% H_s_butter2 = tf(num,den)
% 
% %% Chebyshev Desiging HPF,BPF,BSF
% %wp=165;ws=100;Gp=-2;Gs= -20;
% wp=[100 250];ws=[40 500];Gp=-1;Gs= -23;
% [n,wn] = cheb1ord(wp,ws,-Gp,-Gs,'s')
% [num,den] = cheby1(n,-Gp,wn,'stop','s');
% H_s_cheby2 = tf(num,den)
% 
% %%butterworth example with BSF
% wp=[100 250];ws=[40 500];Gp=-3.4;Gs= -17;
% [n,wn] = buttord(wp,ws,-Gp,-Gs,'s')
% [num,den] = butter(n,wn,'bandpass','s'); %for BPF - 'bandpass', for BSF - 'stop'
% H_s_butter3 = tf(num,den)
% 
% %%n for cheb
% %(Gs,wp,ws,r)
% % a=acosh(ws/wp);
% % b=10^(-Gs/10);
% % c=10^(r/10);
% % d=((b-1)/(c-1))^0.5;
% % e=acosh(d);
% % n=(1/a)*e;
% 
% 
% 
% %% Using H(s) as you see it
% 
% s = tf('s');
% H_s = (24*(s+5))/((s^2+0.707*s +0.25)*(s^2+5.66*s+16)*(s+5))
% bode(H_s)
% 
% %% State space 
% %transformations
% A=[ 0 1; -2 -3];
% B = [0;1];
% C = [0 1];
% P = [ 2 1; 1 1];
% Ahat = P*A*inv(P)
% Bhat = P*B
% Chat = C*inv(P)
% M = [B , (A*B), (A*A*B)];
% N = [C', (A'*C')];
% m = rank(M)
% n = rank(N)
% 
% %% Find H(s) from state space?
%  A=[2 3; -4 -5];
%  B=[2;-3];
%  C=[2 1];
%  D =0;
% [n,d]=ss2tf(A,B,C,D)
% 
%  mySys_tf=tf(n,d)

end
