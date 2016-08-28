#!/bin/sh

gsettings set com.canonical.indicator.datetime time-format "custom"
gsettings set com.canonical.indicator.datetime custom-time-format "%A, %d %B %Y, %I:%M"
