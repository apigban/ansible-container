#!/bin/sh

echo "Environment Variables" >> /dev/stdout
env >> /dev/stdout

echo "rsyslog will output to stdout"  >> /dev/stdout
syslogd -O - && tail -f /dev/stdout