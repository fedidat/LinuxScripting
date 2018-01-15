BEGIN  { parens=0 }
/}/ {
        parens--;
}
 {
	#awk function, replaces regex in line
	gsub(/\t/, "");
	#prints tabs according to indent level
        for(i=0; i<parens; i++){
                printf("\t")
        };
	#prints rest of line
        print $0;
}
/{/ {
	parens++;
}
parens<0 {
	print "Too many closures!";
}
END {
	if(parens>0) {
		print "Missing closing parens!";
	};
}
