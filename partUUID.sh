#!/bin/bash
# Copyright (c) 2016-2021 Jetsonhacks 
# MIT License
# print out the PARTUUID of the given disk partition
# PARTUUID is a partition table level UUID for the partition, a feature of GPT partitioned disks
# UUID is a file system UUID which is retrieved from the filesystem metadata inside a partion

PARTITION_TARGET="/dev/nvme0n1p1"
PARTITION_TARGET1="/dev/nvme0n0p0"
function usage
{
    echo "usage: ./partUUID.sh [partition [-p partition ]  | [-h]]"
    echo "-p | --partition ; default /dev/nvme0n1p1"
    echo "-h | --help  This message"
}

# Iterate through command line inputs
while [ "$1" != "" ]; do
    case $1 in
        -p | --partition )      shift
				PARTITION_TARGET=$1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                    
                               ;;
    esac
    shift
done

while [ "$1" != "" ]; do
    case $1 in
        -p | --partition )      shift
				PARTITION_TARGET1=$1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                    
                               ;;
    esac
    shift
done


PARTUUID_STRING=$(sudo blkid -o value -s PARTUUID $PARTITION_TARGET)
echo PARTUUID of Partition: $PARTITION_TARGET
echo $PARTUUID_STRING
echo  
echo PRIMERA OPCION   :
echo 'root=PARTUUID='$PARTUUID_STRING 
echo
echo "SEGUNDA OPCION :"
echo 'root=PARTUUID='$PARTUUID_STRING1
