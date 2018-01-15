#!/usr/bin/python

playerNum=input("Input number of players: ")

#This is how the game works:
#First we discard even numbers, then if the last is even we discard 1
#So at 1st stage we'll discard numbers like 2+(4*n)+1
#At 2nd stage we discard 4+(8*n)+1
#At stage i: i+2*i*n+1

#Conversely, after stage 1 we're left with 2*n+1 for all n<num
#After stage 2 we get 4*n+1
#After stage i, 2^i*n+1 remain for all n<num (except for when last kicks first)
#There are log2(n) stages
#At each stage n there will be: shift+2^n*i+1 for all i, where shift is
#when the first is thrown
#Then at log2(num) stage there will be noMSB(i)*2+1, which is the winner

#Calculate the number of players without its largest power of 2
#The largest power of 2 is 2**(length in bits of number - 1)
playerNumWithoutMSB=playerNum-2**((playerNum-1).bit_length()-1)
winner=playerNumWithoutMSB*2+1
print "Last player is", winner

