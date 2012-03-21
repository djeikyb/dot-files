#!/usr/bin/env python2

import time
import datetime
from configobj import ConfigObj

# IN: battery information from /sys
# OUT: datetime & power to log
# OUT: power info to file for tmux to scrape

# FUTURE FEATURE
# - collect screen brightness
# - collect wifi on/off
# - collect wifi signal strength
# - collect memory usage
# - note when wake from hibernate
# - graphical indicator

# BUGS
# none?

def get_config():
    uevent = '/sys/class/power_supply/BAT0/uevent'
    return ConfigObj(uevent)

def state(cfg):
    state = cfg['POWER_SUPPLY_STATUS']
    return state

def charge(cfg):
    charge_raw = float(cfg['POWER_SUPPLY_CHARGE_NOW'])
    charge_full = float(cfg['POWER_SUPPLY_CHARGE_FULL'])
    charge = (charge_raw / charge_full) * 100
    return charge

def volt(cfg):
    volt_raw = float(cfg['POWER_SUPPLY_VOLTAGE_NOW'])
    volt_min = float(cfg['POWER_SUPPLY_VOLTAGE_MIN_DESIGN'])
    volt = (volt_raw / volt_min) * 100
    return volt

def out_log(cfg):
    now = datetime.datetime.now().strftime("%F %H:%M:%S")
    status = '%d;%.2f;%s;%s;%s;%s\n' \
        % (charge(cfg), volt(cfg), now, cfg['POWER_SUPPLY_CHARGE_NOW'], \
           cfg['POWER_SUPPLY_VOLTAGE_NOW'], state(cfg))
    return status

def out_tmux(cfg):
    status = 'b%d v%d\n' % (charge(cfg), volt(cfg))
    return status

def wait():
    time.sleep(5)
    return 0

while True:
    config = get_config()
    while state(config) != 'Full':
        # write long-term log
        f = open("/home/jake/battery/charge.log", 'a')
        f.write(out_log(config))
        f.close()
        # overwrite tmux log
        f = open('/tmp/tmux_batt', 'w')
        f.write(out_tmux(config))
        f.close()
        # loop...
        wait()
        config = get_config()
    wait()
