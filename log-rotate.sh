#!/bin/bash

ARGFILE=$1

tar -czf $ARGFILE-$(date "+%F").tar.gz $1
