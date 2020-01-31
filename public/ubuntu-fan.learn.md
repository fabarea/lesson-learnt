# How to reduce the fan noise?

# Fan less computer

https://primecomputer.ch/

# My list of devices

hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp3_input
hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp4_input
hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp1_input
hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp5_input
hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp2_input



# Current state of the fan
⋊> ~ cat /proc/acpi/ibm/fan                                                            18:14:35
status:		enabled
speed:		2863
level:		auto


⋊> ~ cat /proc/acpi/ibm/fan                                                            18:27:33
status:		enabled
speed:		2677
level:		1
commands:	level <level> (<level> is 0-7, auto, disengaged, full-speed)
commands:	enable, disable
commands:	watchdog <timeout> (<timeout> is 0 (off), 1-120 (seconds))


systemctl status thinkfan.service

sudo systemctl status thinkfan
sudo thinkfan -n


# Find the device except the virtual

```
find /sys/devices -type f -name "temp*_input" |grep -vi virtual
```

# Display every second the temperature

while true; do sleep 1; sensors; done

# Configuration file

sudo nano /etc/thinkfan.conf


# Help

## Official documentation

https://thinkwiki.de/Thinkfan


## How to control fan speed?

https://askubuntu.com/questions/22108/how-to-control-fan-speed#comment210139_46135

## Setting up ThinkFan for Thinkpad T420

https://medium.com/@mirul/setting-up-thinkfan-for-thinkpad-t420-aaec5108f75f