#0=user, 1=date, 2=line number, 3=message
BEGIN {	state = 0; 

}
{ n_state=state }
/./ && state==0 {
		msg_sent=1
		dst_inbox=mail_dir "/" $0 "/" inbox;
		dst_inboxindex=mail_dir "/" $0 "/" inbox_index;
		n_state=1;
		print me >> dst_inboxindex;
	};
/./ && state==1 {
		n_state=2;
		print $0 >> dst_inboxindex;
		print "Unread" >> dst_inboxindex;
	};
/./ && state==2 {
		lines=$0;
		n_state=3;
	};
state==3 {
		curline++;
		print $0 >> dst_inbox;
		if(curline==lines){
			print "END_OF_MSG" >> dst_inbox;
			n_state=0;
			curline=0
		};
	};
{ state=n_state }
