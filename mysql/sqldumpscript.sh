#!/bin/bash

mysqldump -u root --routines -p main > main.sql
mysqldump -u root --routines -p log > log.sql