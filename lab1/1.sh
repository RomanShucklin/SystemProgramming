#!/bin/bash

echo "Prod by Shucklin Roman group 747"
echo "This bash script allows you to block or unblock selected user"
exit1="n"
exiting ()
	{
	echo "Exit? y\n"
	read exit2
	if [ -z $exit2 ]
	then
		echo "Select y/n"
		exiting
	fi
	if [ "y" = $exit2 ] || [ "n" = $exit2 ]
	then
		exit1=$exit2
	else
		echo "Select y/n"
		exiting
	fi
	}
select_action ()
	{
	echo  "Block(b)\Unblock(u)?"
        read action
	if [ -z $action ]
        then
                echo "Select b/u"
                select_action
		return
        fi

        if [ "b" = $action ] || [ "u" = $action ]
        then
                if [ "b" = $action ]
                        then
                        passwd -l $username
                        else
                        passwd -u $username
                fi
        else
        echo "Please select b\u"
	select_action
        fi

	}

while [ "n" = $exit1 ]
do
	echo  "write username: "
	read username
	echo "What do you want to do with" $username?
	select_action
	exiting
done