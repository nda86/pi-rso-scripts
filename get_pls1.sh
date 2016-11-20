#!/bin/bash
HOST='172.16.1.254'
PORT='21'
USER='mrx'
PASS='yf100zobq'
PATH1='pi-distr'
PATH2='pls1'
FILES='\*.mp3'

HOMEDIR='/home/pi/pls1';

###############################################################################
RESULT='';

executeftp(){
    echo "open" $HOST $PORT > script.ftp
    echo "user" $USER $PASS >> script.ftp
    echo "cd" $PATH1 >> script.ftp
    echo "cd" $PATH2 >> script.ftp
    echo $1 >> script.ftp
    echo "bye" >> script.ftp

    RESULT=`/usr/bin/ftp -in < script.ftp && /bin/rm script.ftp`;
}
cd $HOMEDIR
executeftp "nlist "$FILES
F=$RESULT
for i in $F
do
    /usr/bin/wget -c -t8 -w5 ftp://$USER:$PASS@$HOST/$PATH1/$PATH2/$i -o /home/pi/logs/downloads_$i.log
done
