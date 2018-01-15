#!/usr/bin/python

import random

def mastermindNumbers(origin, combo):
	bullseyes=hits=0
	for origChar, comboChar in zip(origin,combo):
		if origChar == comboChar:
			bullseyes+=1
		if origChar in combo:
			hits+=1
	return bullseyes, hits

def filterCombos(arr, num, bullseyes, hits):
	newCombos=arr[:]
	for val in arr:
		resBullseyes, resHits = mastermindNumbers(num, val)
		if bullseyes != resBullseyes or hits+bullseyes != resHits:
			newCombos.remove(val)
	return newCombos

combos = map('{:04}'.format, xrange(1,10000))
print "First num is", combos[0], ", last is", combos[len(combos)-1]

#remove numbers with repeating digits, which yields unique elements
for combo in list(combos):
	if len(combo) != len(set(combo)):
		combos.remove(combo)
print combos[0:100]

bullseyes=0
hits=0
while True:
	print "\n", len(combos), " combinations left"
	chosenNum=combos[random.randint(0,len(combos)-1)]
	print "Chosen num is", chosenNum
	bullseyes = input("Enter bullsyeyes: ")
	hits = input("Enter hits: ")
	if(bullseyes==4):
		print "I win, game over"
		break
	if(len(combos)==0):
		print "Impossible!"
		break
	combos=filterCombos(combos, chosenNum, bullseyes, hits)
