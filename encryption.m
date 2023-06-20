function ciphertext = encryption(key,A)

i=16; %so that the 'rounds' function below returns the final Left and Right sides after 16 rounds. 

[LH, RH] = rounds(A,key,i);

% final switch
tempH = RH;
RH = LH;
LH = tempH;

% The final permutation block is given by:
FinalP=[40,8,48,16,56,24,64,32,39,7,47,15,55,23,63,31,38,6,46,14,54,22,62,30,37,5,45,13,53,21,61,29,36,4,44,12,52,20,60,28,35,3,43,11,51,19,59,27,34,2,42,10,50,18,58,26,33,1,41,9,49,17,57,25];

T = [LH,RH]; %combining the two 32 bit sides into 1. 
ciphertext = T(FinalP);

end