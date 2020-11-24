GCC=~/.arduino15/packages/arduino/tools/avr-gcc/7.3.0-atmel3.6.1-arduino5/bin/avr-gcc
CFLAGS=-O3 -Wall -B /home/logan/Downloads/ATMEGA_pack/gcc/dev/atmega4809 -I/home/logan/Downloads/ATMEGA_pack/include -I/home/logan/Documents/ArduinoBLE-Rework/src -mmcu=atmega4809
OUTPUT_FOLDER=output

all: ArduinoBLE
	mkdir -p $OUTPUT_FOLDER

ArduinoBLE:

src/BLECharacteristic
src/BLEDescriptor
src/BLEDevice
src/BLEProperty
src/BLEService
src/BLEStringCharacteristic
src/BLETypedCharacteristic
src/BLETypedCharacteristics
src/Print
src/Printable
src/sio
src/Stream
src/WString