function K = subkey56(key,index)
%subkey for 56 bit input to get 48 bit output

key = dec2bin(key,56);

[n m] = size(key);

L = [key(1:28)];  %split 56bit input in half
R = [key(29:56)];
K = [L,R];

for i=1:index
    if (i==1)|(i==2)|(i==9)|(i==16)  %shift left 1
       
    L = [L(2:28),L(1)]; 
    R = [R(2:28),R(1)];
    else                             %shift left 2
        L = [L(3:28),L(1:2)];
        R = [R(3:28),R(1:2)];
    end
end

K = [L,R];
%now need to compress and permutate
PermuteCompress =[14,17,11,24,1,5,3,28,15,6,21,10,23,19,12,4,26,8,16,7,27,20,13,2,41,52,31,37,47,55,30,40,51,45,33,48,44,49,39,56,34,53,46,42,50,36,29,32];

K=K(PermuteCompress);

end