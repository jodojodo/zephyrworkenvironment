#!/bin/sh

# Build the hci_usb sample for the nrf dongle
#
cd zephyrproject
west build -b nrf52840dongle/nrf52840 zephyr/samples/bluetooth/hci_usb
cd ..
