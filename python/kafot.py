#!/usr/bin/python

ppl = []
playerNum=input("Input number of players: ")
ppl = range(1,playerNum+1)
stage=0

while len(ppl) > 1:
	i=0
	stage=stage+1
	while i<len(ppl):
		print "Current people:", ppl, "current player is", ppl[i], "at", i
		if(i==len(ppl)-1):
			print "First player", ppl[0] ,"removed by ", ppl[i]
			del ppl[0]
		else:
                        print "Player", ppl[i+1], "removed by", ppl[i]
			del ppl[i+1]
		i=i+1
	print "NEXT STAGE", stage, ",", len(ppl), "left: ", ppl
print "Game over,", ppl[0], "has won"
