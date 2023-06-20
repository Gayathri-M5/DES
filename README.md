Code for Encryption and Decryption using DES as well as analysing the performance as you can see in the Report

Encryption: 

>>i=16
>>A = 0b64bits or A = 0x16Hexnumbers
>>key is done the same way as A

if the key is 64 bits run the function key = subkey(key)
if the key is already 56 bits, do not implement this function. 
>>ciphertext = encryption(key,A) 

For example:

i=16;
A = 0xDE3428900987345E;
key = 0x067EFA234DDD3456;
key = subkey(key);
 ciphertext = encryption(key,A)

This will give you a 64-bit binary number 


Decryption:

A = 0bnumber_obtained_from_encryption
key is done the same way as for encryption
>>plaintext = decryption(key,A) 

For example:

 A = 0b1010111101001111111100000101001110000001100101100010010100010011;
key = 0x067EFA234DDD3456;
key = subkey(key);
plaintext = decryption(key,A)

This will give you the original A. 