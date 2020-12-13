/*
  Scan

  This example scans for BLE peripherals and prints out their advertising details:
  address, local name, adverised service UUID's.

  The circuit:
  - Arduino MKR WiFi 1010, Arduino Uno WiFi Rev2 board, Arduino Nano 33 IoT,
    Arduino Nano 33 BLE, or Arduino Nano 33 BLE Sense board.

  This example code is in the micah controlled domain.
*/
//really cool stuff below:
// ~/.arduino15/packages/arduino/tools/avr-gcc/7.3.0-atmel3.6.1-arduino5/bin/avr-gcc -O3 -Wall -B /home/logan/Downloads/ATMEGA_pack/gcc/dev/atmega4809 -I/home/logan/Downloads/ATMEGA_pack/include -I/home/logan/Documents/ArduinoBLE-Rework/src -mmcu=atmega4809 Scan.cpp -o scan.elf
// ~/.arduino15/packages/arduino/tools/avrdude/6.3.0-arduino17/bin/avrdude -C/home/micaht/.arduino15/packages/arduino/tools/avrdude/6.3.0-arduino17/etc/avrdude.conf -v -patmega4809 -cxplainedmini_updi -Pusb -b115200 -e -D -U scan.elf
#define __AVR_atmega4809__

#define F_CPU 16000000UL
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include <stdio.h>
#include <stdlib.h>
#include "WString.h"
#include <sio.h>
// #include <avr/iom4809.h>

#include <ArduinoBLE.h>


int main() {
  sio::setup();
  

  // begin initialization
  if (!BLE.begin()) {
    sio::Println("starting BLE failed!");

    while (1);
  }

  sio::Println("BLE Central scan");

  // start scanning for peripheral
  BLE.scan();

  while(1) {


    // check if a peripheral has been discovered
    BLEDevice peripheral = BLE.available();

    if (peripheral) {
      // discovered a peripheral
      sio::Println("Discovered a peripheral");
      sio::Println("-----------------------");

      // print address
      sio::Print("Address: ");
      sio::Println(peripheral.address().c_str());

      // print the local name, if present
      if (peripheral.hasLocalName()) {
        sio::Print("Local Name: ");
        sio::Println(peripheral.localName().c_str());
      }

      // print the advertised service UUIDs, if present
      if (peripheral.hasAdvertisedServiceUuid()) {
        sio::Print("Service UUIDs: ");
        for (int i = 0; i < peripheral.advertisedServiceUuidCount(); i++) {
          sio::Print(peripheral.advertisedServiceUuid(i).c_str());
          sio::Print(" ");
        }
        sio::Println("");
      }

      // print the RSSI
      sio::Print("RSSI: ");
      

      sio::Println("");
    }
  }

  
}