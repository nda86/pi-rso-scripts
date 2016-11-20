#!/bin/bash
/etc/init.d/ntp stop
ntpdate -b ntp.ubuntu.com
/etc/init.d/ntp start
date > /home/pi/logs/ntp.log
echo "Время обновилось!!!"
