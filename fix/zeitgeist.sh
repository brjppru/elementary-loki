#!/bin/sh

sudo apt-get --purge autoremove activity-log-manager-common activity-log-manager-control-center zeitgeist zeitgeist-core zeitgeist-datahub
rm -fr ~/.local/share/zeitgeist

sudo apt-get --simulate purge modemmanager

sudo apt-get --simulate purge sane

sudo apt-get install sqlite3
