#!/bin/bash

#creating directories

cd ~
echo CREATING homeworkOne IN: ${PWD}
mkdir homeworkOne
cd ~/homeworkOne
echo INSIDE ${PWD##*/}
echo CREATING DIRECTORY alphaWillBeCopiedHere
mkdir alphaWillBeCopiedHere
echo CREATING DIRECTORY betaWillBeMovedHere
mkdir betaWillBeMovedHere

#performing whatever the homework request was

echo CREATING alpha DIRECTORIES

#c like for loop for creating 5 directories named alpha

for ((i = 0 ; i < 5;i++)); do
	echo CREATING alpha$i
	mkdir alpha$i
	dirnumber="$i"
	#creating 3 text files in each alpha file

	if [[ -e alpha$i && -n ${dirnumber} ]]; then
		filenumber=${dirnumber}
		dirname=alpha${dirnumber}
		for ((k = 0; k < 3 ; k++)); do
			cd ~/homeworkOne/${dirname}
			echo CREATING ${dirname}_$k.txt
			touch ${dirname}_$k.txt
			cd ~/homeworkOne
		done
	fi

done

echo CREATING beta DIRECTORIES

#c like for loop for creating 5 directories named beta

for ((i = 0; i < 5; i++)); do
	echo CREATING beta$i
	mkdir beta$i
	dirnumber="$i"

	#creating 1 text file for each beta file
	
	if [[ -e beta$i && -n ${dirnumber} ]]; then
		filenumber=${dirnumber}
		dirname=beta${dirnumber}
		cd ~/homeworkOne/${dirname}
		echo CREATING ${dirname}.txt
		touch ${dirname}.txt
		cd ~/homeworkOne
	fi 
done

echo COPYING alpha DIRECTORIES

#c like for loop for duplicating 5 alpha directories

for ((i = 0; i < 5; i++)); do
	echo COPYING alpha$i

	#i am expecting all the files and directories in any alpha directory to be duplicated
	#but I am not sure so I will test it out

	cp -r alpha$i ~/homeworkOne/alphaWillBeCopiedHere

done

echo MOVING beta DIRECTORIES

#c like for loop for moving 5 beta directories

for ((i = 0; i < 5; i++)); do
	echo MOVING beta$i

	#moving only if beta is newer than the beta in betaWillBeMovedHere
	
	mv -u -t ~/homeworkOne/betaWillBeMovedHere beta$i

done



