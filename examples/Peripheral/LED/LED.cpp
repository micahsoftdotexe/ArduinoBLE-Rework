/*
  LED

  This example creates a BLE peripheral with service that contains a
  characteristic to control an LED.

  The circuit:
  - Arduino MKR WiFi 1010, Arduino Uno WiFi Rev2 board, Arduino Nano 33 IoT,
    Arduino Nano 33 BLE, or Arduino Nano 33 BLE Sense board.

  You can use a generic BLE central app, like LightBlue (iOS and Android) or
  nRF Connect (Android), to interact with the services and characteristics
  created in this sketch.

  This example code is in the public domain.
*/

#define __AVR_atmega4809__

#define F_CPU 16000000UL
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include <stdio.h>
#include <stdlib.h>
#include "WString.h"
#include <sio.h>

#include <ArduinoBLE.h>

BLEService ledService("19B10000-E8F2-537E-4F6C-D104768A1214"); // BLE LED Service

// BLE LED Switch Characteristic - custom 128-bit UUID, read and writable by central
BLEByteCharacteristic switchCharacteristic("19B10001-E8F2-537E-4F6C-D104768A1214", BLERead | BLEWrite);

// const int ledPin = LED_BUILTIN; // pin to use for the LED

int main() {
    sio::setup();
    _delay_us(10);
  //Serial.begin(9600);
  // while (!Serial);

  // set LED pin to output mode
  // pinMode(ledPin, OUTPUT);
  PORTC_DIRSET = PIN5_bm;

  // begin initialization
  if (!BLE.begin()) {
    sio::Println("starting BLE failed!");

    while (1);
  }

  // set advertised local name and service UUID:
  BLE.setLocalName("LED");
  BLE.setAdvertisedService(ledService);

  // add the characteristic to the service
  ledService.addCharacteristic(switchCharacteristic);

  // add service
  BLE.addService(ledService);

  // set the initial value for the characeristic:
  switchCharacteristic.writeValue(0);

  // start advertising
  BLE.advertise();

  sio::Println("BLE LED Peripheral");

  while(1) {

    // listen for BLE peripherals to connect:
    BLEDevice central = BLE.central();

    // if a central is connected to peripheral:
    if (central) {
        sio::Print("Connected to central: ");
        // print the central's MAC address:
        sio::Println(central.address().c_str());

        // while the central is still connected to peripheral:
        while (central.connected()) {
        // if the remote device wrote to the characteristic,
        // use the value to control the LED:
        if (switchCharacteristic.written()) {
            if (switchCharacteristic.value()) {   // any value other than 0
            sio::Println("LED on");
            // digitalWrite(ledPin, HIGH);         // will turn the LED on
            PORTC.OUTSET = PIN5_bm;
            } else {                              // a 0 value
            sio::Println("LED off");
            // digitalWrite(ledPin, LOW);          // will turn the LED off
            PORTC.OUTCLR = PIN5_bm;
            }
        }
        }

        // when the central disconnects, print it out:
        sio::Print("Disconnected from central: ");
        sio::Println(central.address().c_str());
    }
  }
  return 0;
}
