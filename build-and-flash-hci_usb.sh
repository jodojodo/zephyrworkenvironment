#!/bin/sh

# Build the hci_usb sample for the nrf dongle
cd zephyrproject
west build -b nrf52840dongle/nrf52840 zephyr/samples/bluetooth/hci_usb

nrfutil pkg generate --hw-version 52 --sd-req=0x00 \
        --application build/zephyr/zephyr.hex \
        --application-version 1 hci_usb.zip


echo "Ensure nrf dongle in bootloader by pressing the reset button towards usb interface!"
echo "The red LED has to fade."
cat | echo "Then press a key to continue..."

# Try to flash the packed hex file
nrfutil dfu usb-serial -pkg hci_usb.zip -p /dev/ttyACM0
