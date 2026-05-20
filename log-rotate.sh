#!/bin/bash

ARGFILE=$1
REMOTE_USER=server
REMOTE_HOST=UbuntuBackups


tar -czf $ARGFILE-$(date "+%F").tar.gz $1

scp $ARGFILE-$(date "+%F").tar.gz $REMOTE_USER@$REMOTE_HOST:/logs_rotate/
