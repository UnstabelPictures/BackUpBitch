#!/bin/bash
# BACK UP BITCH is a script designed to upload shit to google drive for kevin

# welcome
flashred="\033[5;31;40m"
red="\033[0;31;40m"
none="\033[0m"

echo -e $red"I'm "$flashred"B U B"$red" which is short for BACK UP BITCH"
echo
echo

#make log first

cd /Users/mccurdys/bublog
echo "We need to write one log a day so others know whats going on"
echo "before you upload plz write a log"
echo
read -r -p "would you like to write a log? [y/N] " lresponse
case "$lresponse" in
    [yY][eE][sS]|[yY]) 
    echo "GREAT SHOW!!!"
    echo
    echo "-----------------------------"
	echo "lets make a log for that show"
	echo "-----------------------------"
	echo
	echo "who was in the booth?"
	read avtech
	echo
	echo "who was the MAIN ACT?"
	read headliner
	echo
	echo "who was the FEATURE?"
	read feature
	echo
	echo "was there any guests? if so who?"
	read guest
	echo
	echo "who was the HOST?"
	read host
	echo
	echo "how many shows tonight?"
	read numberofshows
	echo
	echo "did anything funny happen? if so what happened?"
	read funny
	echo
	echo "any misc NOTES about the show? something break? let it all out."
	read notes
	echo
	pod=false
	otc=false
	dqb=false
	bdb=false

	echo "did any of these happen? select all that apply, quit when down."
	select events in "podcast" "off_the_clock" "drag_queen_bingo" "burlesque" "thats_all"
	do
		case $events in
			podcast) echo "cool any thing else" 
pod=true ;;
			off_the_clock) echo "cool any thing else" 
otc=true ;;
			drag_queen_bingo) echo "cool any thing else" 
dqb=true ;;
			burlesque) echo "cool any thing else" 
bdb=true ;;
			thats_all) echo "ok thanks" 
break ;;
			*) echo "awkward, i don't know what that is" ;;
		esac
	done
	echo
	logdate=$(date +"%m-%d-%Y") 
	logtime=$(date +"%H:%M")
	logfile="$logdate"_report_"$logtime".log
echo "uploading log file now!!!"
echo
if [[ $numberofshows == 1 ]]; then
	showss="show"
	else
		showss="shows"
fi
	#statements
podline=""
otcline=""
dqbline=""
bdbline=""

	if $pod
		then podline="WE RECORDED A PODCAST TONIGHT"
	else echo

	fi

	if $otc
		then otcline="WE RECORDED A LIVE INTERVIEW TONIGHT to YouTube"
	else echo

	fi

	if $dqb
		then dqbline="WE HAD DRAQ QUEEN BINGO SHOW TONIGHT"
	else echo

	fi

	if $bdb
		then bdbline="WE HAD A BURLESQUE SHOW TONIGHT"
	else echo

	fi
echo
cat <<- endoflogstuff > $logfile
	++++++++++++++++++++
	SOUND BOOTH LOG FILE
	    $logdate
	++++++++++++++++++++
	$dqbline
	$bdbline
	$podline
	$otcline
	++++++++++++++++++++
	
	Headliner: $headliner
	
	Feature: $feature
	Guest: $guest
	Host: $host

	AVtech: $avtech

	$numberofshows $showss

	Funny moments: $funny

	any other notes: $notes
	endoflogstuff





#upload log file to drive
echo "here some info on the upload"
gdrive upload $logfile -p 1iYVWV1IJKqnMWs-DHf2aM6RhQdCTwjK_



clear
    ;;
    *)
        echo "ok, ok, no log"
        echo "i trust you have your reasons DONT make this an everyday thing"
        echo
        echo

        ;;
esac


#set the folder here 

cd  /Users/mccurdys/Movies



# vars go here


a=$(ping -c 1 KevinKrasko.com | grep 'bytes from' | cut -d = -f 4)
pc=$(echo $MACHTYPE | cut -d - -f 2)

#file="test002.txt"

#iterate through count of folder

fif=()
fif+=($(ls -a))
declare -i nof=$(ls -a | wc -l)

declare -i countdown=$nof
((countdown--))
((countdown--))

declare -i arrycount=$nof
((arrycount--))

folderhash=""
#newfoldername=""
#newfoldername=$(date +"%d-%m-%Y")"s shows uploaded at "$(date +"%H:%M")

#check to makesure no spaces in filenames
if [[ $nof == ${#fif[@]} ]]
then

# confirm upload and make log

echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo
echo "you are about to UPLOAD then DELETE the videos in the movies folder!!!"
echo
read -r -p "Are you sure? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
    echo 



# start of bitch script

clear
echo
echo
# old
#echo -e $flashred"hello $USER"$red
#echo "ok so youre working on an/a $pc ." 
echo
echo

echo
echo
echo -e "So let's get that shit on the cloud!!!"$none
echo
echo
echo "look at these files!!!"
ls -A
echo 
echo
echo -e $red"your ping speed is $a"$none

#make directory in drive and add hash to folderhash var 


folderhash=$(gdrive mkdir $(date +"%m-%d-%Y")"s shows uploaded at "$(date +"%H:%M") -p 1Cd9hwC_NwxYZBQYjImbnV30cUrAEp8xS | grep Directory | awk {'print $2'})
echo
echo
echo
echo "ive created a folder called:" 
echo
echo $(date +"%d-%m-%Y")"s shows uploaded at "$(date +"%H:%M")
echo 
echo "the hash is $folderhash"
echo

echo
echo
echo "------------------------"
echo "Starting UPLOAD daddy"
echo "------------------------"

while [[ $nof -gt 2 ]]; do
 	echo -e $countdown" FILES LEFT TO UPLOAD"
 	echo "uploading "${fif[$arrycount]}
 	echo "++++++++++++++++++++++++++++++++++"
 	echo
 	successfullupload=$(gdrive upload "./${fif[$arrycount]}" -p $folderhash | grep Uploaded | awk {'print $1'} )
 	echo
 	echo $successfullupload" to drive"
 	echo

 	echo
 	if [[ $successfullupload == "Uploaded" ]]
 		then
 			rm ${fif[$arrycount]}
 			echo "------------------------"
 			echo "ive deleted that file off your hardrive big boi"
 			echo "------------------------"
 			echo
 			echo
 			((arrycount--))
 			((countdown--))
 			((nof--))
 		else
 			echo "shit done fucked up on the upload"
 			echo "program gave up, check internet try again"
 			return

 	fi
 done 

 echo
 echo
 echo "everything appears to have uploaded... until next time"
echo

echo
echo "I will now attempt to shut down the computer"


cd /Users/mccurdys/backupbitch



echo "KTHAXBYEE!!!"

        ;;
    *)
        echo "peace"
        echo "goodbye"
        exit 0

        ;;
esac
exit 1 & osascript shutdownmac.scpt
else

	clear
	echo
	echo -e $flashred"E R R O R ! ! !"$none
	echo
	echo "it would appear that you have included a space in a file name"
	echo "plz remove that and try again"

	echo
	exit 0
fi
