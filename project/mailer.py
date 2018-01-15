#!/usr/bin/python
import os
import re
import pprint
import subprocess

INBOX_DIR = os.environ['FULL_INBOX']
INBOX_INDEX_DIR = os.environ['FULL_INBOX_INDEX']
allMail = []
notDeleted = []

def RepresentsInt(s):
    try: 
        int(s)
        return True
    except ValueError:
        return False

def changeStatus(index, status):
    command = ["./set_status.sh", str(index), status]
    p = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    output, error = p.communicate()
    if p.returncode != 0: 
	print error
    bindData()

def parseMailFiles(inboxIndexDir, inboxDir):
    inbox = []
    with open(inboxIndexDir) as inboxIndexFile:
        i = 1
        j = 1
        for line in inboxIndexFile:
            line = line.rstrip()
            if i % 3 == 1:
                mail = {}
                mail['from'] = line
            if i % 3 == 2:
                mail['date'] = line
            if i % 3 == 0:
                mail['status'] = line
                mail['message'] = ""
                mail['index'] = j
                j = j + 1
                inbox.append(mail)
            i = i+1

    with open(inboxDir) as inboxDirFile:
        i = 0
        for line in inboxDirFile:
            if re.match("END_OF_MSG\n?", line) is not None:
                i = i+1
            else:
                inbox[i]['message'] = inbox[i]['message'] + line
    return inbox

def filterArray(array, filterK, filterV):
    return [item for item in array if item[filterK] != filterV]

def bindData():
    del allMail[:]
    del notDeleted[:]
    allMail.extend(parseMailFiles(INBOX_INDEX_DIR, INBOX_DIR))
    notDeleted.extend(filterArray(allMail, "status", "Deleted"))

bindData()

keep = True
while keep:
    print "You have", len(notDeleted), " messages"
    print "Coose message by number or press e to exit"
    ans = raw_input("Message Number: ") 
    if ans == "e":
      keep = False
    else:
        while (not RepresentsInt(ans)) or (int(ans) <= 0) or (int(ans) > len(notDeleted)):
            print "You must insert number in range of 1 to ", len(notDeleted)
            ans = raw_input("Message Number: ") 
        index = int(ans)
        mail = notDeleted[index - 1]
        print "From: " , mail['from']
        print "Sended at: ", mail['date']
        print "Message: ", mail['message']
        ans=raw_input("Delete this message y/n? ")
        if ans == "y":
            changeStatus(notDeleted[index - 1]['index'], "Deleted")
        elif notDeleted[index - 1]['status'] == "Unread":
            changeStatus(notDeleted[index - 1]['index'], "Read")
            
            
