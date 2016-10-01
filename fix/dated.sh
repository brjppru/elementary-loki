#!/bin/sh

gsettings set com.canonical.indicator.datetime time-format '24-hour'
gsettings set com.canonical.indicator.datetime time-format "custom"
gsettings set com.canonical.indicator.datetime custom-time-format "33%A, %d %B %Y, %I:%M"

killall -HUP wingpanel
