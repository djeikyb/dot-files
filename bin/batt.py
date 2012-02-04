#!/usr/bin/env python2

import time
import datetime
from configobj import ConfigObj

#LOG = /var/log/battery.log
LOG = '/tmp/battery.log'

def wait():
    time.sleep(5)

def get_status():
    global status

    FILE = '/sys/class/power_supply/BAT0/uevent'
    config = ConfigObj(FILE)

    state = config['POWER_SUPPLY_STATUS']
    charge = float(config['POWER_SUPPLY_CHARGE_NOW'])
    charge_full = float(config['POWER_SUPPLY_CHARGE_FULL'])
    voltage = float(config['POWER_SUPPLY_VOLTAGE_NOW'])
    voltage_min = float(config['POWER_SUPPLY_VOLTAGE_MIN_DESIGN'])

    charge_percent = (charge / charge_full) * 100
    voltage_percent = (voltage / voltage_min) * 100

    now = datetime.datetime.now().strftime("%F %H:%M:%S")

    status = '%d %.2f %s %d %d\n' \
        % (charge_percent, voltage_percent, now, charge, voltage)

    return state

while True:
    while get_status() != 'Full':
        f = open(LOG, 'a')
        f.write(status)
        f.close()
        wait()
    wait()
