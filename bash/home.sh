#!/bin/bash
cut -f6 -d: /etc/passwd | grep $1 | uniq
