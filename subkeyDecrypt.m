function K = subkeyDecrypt(key,index)
 key = dec2bin(key,56); %for 56bit key

[n m] = size(key);

L = [key(1:28)];  %split 56bit input in half
R = [key(29:56)];
K = [L,R];

for i=1:index
if (i==1)
    L =L;
    R=R;

elseif ((i==2)|(i==9)|(i==16))    
         L = [L(28),L(1:27)]; 
    R = [R(28),R(1:27)];%shift right 1
    
%      if ((i==3)|(i==4)|(i==5)|(i==6)|(i==7)|(i==8)|(i==10)|(i==11)|(i==12)|(i==13)|(i==14)|(i==15))
 else  %shift right 2
          L = [L(27:28),L(1:26)]; 
    R = [R(27:28),R(1:26)];
    end
end

K = [L,R];
%now need to compress and permutate
PermuteCompress =[14,17,11,24,1,5,3,28,15,6,21,10,23,19,12,4,26,8,16,7,27,20,13,2,41,52,31,37,47,55,30,40,51,45,33,48,44,49,39,56,34,53,46,42,50,36,29,32];

K=K(PermuteCompress);

end