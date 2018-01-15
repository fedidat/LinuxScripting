BEGIN  { FS = "," }
NR != 1 {
	#keep name of Nth player
	names[NR-1] = $1;
	#for each test of this player
	for (i=3; i<=NF; i++) {
		#ignore grades with value 1
		if($1!=1) {
			#add to player´s sum and mark as additional test
			playersum[NR-1] += $i;
			playertests[NR-1]++;
			#add to test sum and mark as additional test
			testsum[i-2] = testsum[i-2] + $i
                        tests[i-2]++;
		}
	}
}
END {
	#sum by-test grades, divide by number of valid tests and print
	for(i=1; testsum[i]!=""; i++) {
		total+=testsum[i];
		totalgrades+=tests[i];;
		printf("Average for test %d is %7.2f\n", i, testsum[i] / tests[i]);
	};
	#sum by player-grades, divide by number of valid tests and print
	for(i=1; playersum[i]!=""; i++){
		printf("Average for player %s is %7.2f\n", names[i], playersum[i] / playertests[i]);
	};
	#Bonus: overall average
	printf("Overall average is %7.2f\n", total/totalgrades);
}
