#! /bin/bash


python /home/pi/esp/esp-idf/components/esptool_py/esptool/esptool.py --chip esp32 --port /dev/ttyACM0 --baud 115200 --before default_reset --after hard_reset write_flash -z --flash_mode dio --flash_freq 40m --flash_size detect 0x0 NINA_W102.bin 