Linux Scripting course
----------------------

This is a group of exercises that were done during a course on Basic Linux Scripting, along with the slides for the course (in Hebrew).

The course focused on three scripting languages and tools: Bash, AWK and Python. Each subject was accompanied by various exercises. Finally, at the end of the course, a final project with parts of each scripting language was assembled. I hope to eventually get around to scanning the project exercise.

For this course I received a 99/100. 

Below are notes on the exercises that you may find in the subdirectories.

Bash: (slides 193-195)
Ex 6 double.sh [number]
    Trivial. No input checks
Ex 7 home.sh [user]
    Cuts /etc/passwd to home folders, greps argument, uniques
    No input checks
Ex 8 clock.sh
    Parses date using tr/cut/sed and a function
Ex 9 just_3.sh [arg1] [arg2] [arg3]
    Checks the presence of three arguments
Ex 11* 
    histogram.sh [filename]
        Prints the histogram without array,
        contains utility function to print n times.
    histogram_array.sh [filename]
        Prints the histogram with array,
        contains utility function to print n times.
Ex 12* histogram12.sh [filename] [from] [to]
    Same as previous but combined with/out array, and with range. Include input check
Ex 13 where.sh [program path]
    For each folder in path, checks if command exists there and if +x.
    Non-recursive, as we were instructed.
Ex 14 count.sh
    Displays args starting with ¨-¨ and not starting with ¨-¨

Awk:
1. teams_script.awk, written after slide 230
   Here we implement the bonus of computing the global average,
   by using the by-player sum of grades
   Can be run using teams_script.sh
2. brackets.awk, does indentation of curly brackets (one per line)
   and indicates if brackets missing, as it happens regarding missing opening.
   Can be run using brackets.sh [file to indent], no input check

Python:
1. kafot.py, fully simulates the game, uses input for number of people,
   very simple implementation
   kafotalg.py includes the mathematical solution as well as the reasoning.
   Can be run using kafot.py
2. mastermind.py:
   1. creates the array of string from 0001 to 9999,
   2. starts the loop that:
       2.1 prints a number and asks for bullseyes/hits,
       2.2 calls a function that iterates over the array and 
           2.2.1. checks if the number is at all possible by computing the 
                  bullseyes/hits and comparing to the user-provided values), 
           2.2.2. removes the numbers that do not match.
   Can be run using mastermind.py

Project:
config.sh
   environment file, according to the instrutor, should be run before mailer.py
create_user.sh [username]
    Trivial
list_users.sh
    See comment there
send_message
    Trivial
transport_agent.sh (runs transport_agent.awk)
    Using a state machine as instructed. 
    States: 0=user, 1=date, 2=line number, 3=message
    We added inbox and inbox_index, as allowed, to the AWK file,
    which allows us to not rely on hardcoded paths
set_status [num] [status]
    Trivial
mailer.py
    Relies on config.sh
    Input-based menu
    * We are reading the entire file to an array of Dictionaries
    * Each time we change the file we update the array in te memory by calling bindData()
