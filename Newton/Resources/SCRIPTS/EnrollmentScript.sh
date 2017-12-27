#!/bin/sh

echo "Time: $(date). ****************************************************" > /usr/local/EYM/logs.txt
echo "Time: $(date). **********ENROLLMENT SCRIPT STARTED RUNNING*********" >> /usr/local/EYM/logs.txt
echo "Time: $(date). ****************************************************" >> /usr/local/EYM/logs.txt

osascript -e 'display notification "Lorem ipsum dolor sit amet" with title "Title"'
exit 0;

