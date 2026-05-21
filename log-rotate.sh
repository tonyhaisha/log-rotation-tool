#!/bin/bash

ARGFILE=$1
#REMOTE_USER=server
#REMOTE_HOST=UbuntuBackups
REMOTE_USER_OR_DIR=$2
REMOTE_HOST=$3

if [ $1 ]; then
	if [ $2 ]; then
		echo "Archiving files..."
		tar -czf $ARGFILE-$(date "+%F").tar.gz $1
		echo "Archived successfully!"
	else
	echo "Invalid arguments"
	exit 1
	fi
fi

if [ $2 ]; then
	if [ $3 ]; then
		echo "Sending files to" $REMOTE_HOST as $REMOTE_USER_OR_DIR
		scp $ARGFILE-$(date "+%F").tar.gz $REMOTE_USER_OR_DIR@$REMOTE_HOST:/logs_rotate/
	else
		echo "Saving files in" $REMOTE_USER_OR_DIR
		if [ -d "$REMOTE_USER_OR_DIR" ]; then
			cp -rv $ARGFILE-$(date "+%F").tar.gz $REMOTE_USER_OR_DIR
		else
			echo "Cannot save files in" $REMOTE_USER_OR_DIR "- directory doesn't exist"
			exit 1
		fi
	fi
else
	echo "Invalid arguments"
	exit 1
fi
echo "Done!"

echo "Do you want to delete source file? (y/any symbol)"
read SYMBOL

if [ "$SYMBOL" == "y" ]; then
	echo "Removing source file..."
	rm -rv $ARGFILE
else
	echo "Source file won't be deleted"
fi

echo "Done!"

