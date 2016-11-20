#!/bin/bash
find /home/pi/scripts -name "r*.sh" -o -name "kr*.sh" | xargs sed -i "s/-g [0-9]*/-g $1/g"

