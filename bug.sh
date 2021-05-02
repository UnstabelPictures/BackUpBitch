#!/bin/bash
# BACK UP GRACE is a script designed to upload shit to google drive for kevin

# welcome
flashred="\033[5;31;40m"
red="\033[0;31;40m"
cyan="\033[0;31;36m"
flashcyan="\033[5;31;36m"
none="\033[0m"
define -i messagenumber=1
echo -e $cyan"I'm "$flashcyan"B U G"$cyan" which is short for BACK UP GRACE"
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
	echo "who was did the Message"
	read pastor
	echo
	echo "whats the number of the video file with the message?"
	read messagenumber
	echo
	echo "any misc NOTES about the show? something break? let it all out."
	read notes
	echo
	echo
	logdate=$(date +"%m-%d-%Y") 
	logtime=$(date +"%H:%M:%S")
	logfile="$logdate"_church_report_"$logtime".log
echo "uploading log file now!!!"
echo
echo
cat <<- endoflogstuff > $logfile
	++++++++++++++++++++
	BOOTH CHURCH LOGFILE
	    $logdate
	++++++++++++++++++++
	
	Pastor: $pastor

	any other notes: $notes

	endoflogstuff





#upload log file to drive
echo "here some info on the upload"
gdrive upload $logfile -p 1m72q734fsIaQ7SPzAaDj90xeyk50DlCr


clear
    ;;
    *)
        echo "ok, ok, no log but the message is set to $messagenumber"
        echo "i trust you have your reasons and know what you are doing"
        echo
        echo

        ;;
esac


#set the folder here 

cd  /Users/mccurdys/grace_record



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
messfolderhash=""
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
echo -e "So let's get your message on the cloud!!!"$none
echo
echo
echo "look at these files!!!"
ls -A
echo 
echo
echo -e $red"your ping speed is $a"$none

#make directory in drive and add hash to folderhash var 

folderhash=$(gdrive mkdir $(date +"%m-%d-%Y")"s message uploaded at "$(date +"%H:%M") -p 1A41CbIv2St46BnNpXBoWnY1KgcIOozVq | grep Directory | awk {'print $2'})
echo
echo
echo
echo "ive created a folder for your message called:" 
echo
echo $(date +"%d-%m-%Y")"s message uploaded at "$(date +"%H:%M")
echo 
echo "the hash is $folderhash"
echo
musicfolderhash=$(gdrive mkdir $(date +"%m-%d-%Y")"s music uploaded at "$(date +"%H:%M") -p 1L3zqTm_IRQcoqwEZXlntulleddMyezDo | grep Directory | awk {'print $2'})
echo
echo
echo
echo "ive created a folder for your MUSIC called:" 
echo
echo $(date +"%d-%m-%Y")"s music uploaded at "$(date +"%H:%M")
echo 
echo "the hash is $musicfolderhash"

echo
echo
echo "------------------------"
echo "Starting UPLOAD daddy"
echo "------------------------"

while [[ $nof -gt 2 ]]; do
 	if [[ ${fif[$arrycount]} == "gracelife_"$messagenumber".mp4" ]]; then
 	 		echo -e $countdown" FILES LEFT TO UPLOAD"
 		echo "uploading your Message"${fif[$arrycount]}
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
 				echo "---------------------------------------"
 				echo "ive deleted that file off your hardrive"
 				echo "---------------------------------------"
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
 	else
 		echo -e $countdown" FILES LEFT TO UPLOAD"
 		echo "uploading Music "${fif[$arrycount]}
 		echo "++++++++++++++++++++++++++++++++++"
 		echo
 		successfullupload=$(gdrive upload "./${fif[$arrycount]}" -p $musicfolderhash | grep Uploaded | awk {'print $1'} )
 		echo
 		echo $successfullupload" to drive"
 		echo

 		echo
 		if [[ $successfullupload == "Uploaded" ]]
 			then
 				rm ${fif[$arrycount]}
 				echo "---------------------------------------"
 				echo "ive deleted that file off your hardrive"
 				echo "---------------------------------------"
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
 		 
	fi
done
 echo
 echo
 echo "everything appears to have uploaded... until next time"
echo

echo
echo "I will now attempt to shut down the computer"
sleep 2s

cd /Users/mccurdys/backupbitch



echo "KTHAXBYEE!!!"
return
        ;;
    *)
        echo "peace"
        echo "goodbye"
        return

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
	exit
fi
