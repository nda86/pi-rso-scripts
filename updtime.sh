#!/bin/bash
ntpdate -b ntp.ubuntu.com
date > /home/pi/logs/ntp.log
echo "Время обновилось!!!"
