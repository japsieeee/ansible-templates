#!/bin/bash

rsync -e "ssh -p 22" main.sql root@192.168.68.108:/home/
rsync -e "ssh -p 22" log.sql root@192.168.68.108:/home/