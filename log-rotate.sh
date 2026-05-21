#!/bin/bash

ARGFILE=$1
#REMOTE_USER=server
#REMOTE_HOST=UbuntuBackups
REMOTE_USER=$2
REMOTE_HOST=$3

echo "Archiving files..."
tar -czf $ARGFILE-$(date "+%F").tar.gz $1
echo "Archived successfully!"

echo "Sending files to" $REMOTE_HOST as $REMOTE_USER
scp $ARGFILE-$(date "+%F").tar.gz $REMOTE_USER@$REMOTE_HOST:/logs_rotate/
echo "Done!"

echo "Removing source file..."
rm -r $ARGFILE
echo "Done!"
