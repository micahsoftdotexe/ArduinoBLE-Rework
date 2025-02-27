#!/bin/bash
CC=/home/logan/.arduino15/packages/arduino/tools/avr-gcc/7.3.0-atmel3.6.1-arduino5/bin/avr-g++
LD=/home/logan/.arduino15/packages/arduino/tools/avr-gcc/7.3.0-atmel3.6.1-arduino5/bin/avr-ld
AVRDUDE=~/.arduino15/packages/arduino/tools/avrdude/6.3.0-arduino17/bin/avrdude
AVRDUDE_CONFIG=/home/logan/.arduino15/packages/arduino/tools/avrdude/6.3.0-arduino17/etc/avrdude.conf
OBJ_DIR=obj
CFLAGS="-g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega4809 -DF_CPU=16000000L -DARDUINO=10813 -DARDUINO_AVR_UNO_WIFI_REV2 -DARDUINO_ARCH_MEGAAVR -DMILLIS_USE_TIMERB3 -B /home/logan/Downloads/ATMEGA_pack/gcc/dev/atmega4809"
INCLUDES="-I/home/logan/Downloads/ATMEGA_pack/include -Isrc"
mkdir -p obj obj/local obj/remote obj/utility
#-I/home/logan/.arduino15/packages/arduino/hardware/megaavr/1.8.6/cores/arduino/api/deprecated -I/home/logan/.arduino15/packages/arduino/hardware/megaavr/1.8.6/cores/arduino -I/home/logan/.arduino15/packages/arduino/hardware/megaavr/1.8.6/variants/uno2018
$CC -c $CFLAGS $INCLUDES src/UART2.cpp -o $OBJ_DIR/UART2.cpp.o
$CC -c $CFLAGS $INCLUDES src/new.cpp -o $OBJ_DIR/new.cpp.o
$CC -c $CFLAGS $INCLUDES src/Common.cpp -o $OBJ_DIR/Common.cpp.o
$CC -c $CFLAGS $INCLUDES src/Print.cpp -o $OBJ_DIR/Print.cpp.o
$CC -c $CFLAGS $INCLUDES src/sio.cpp -o $OBJ_DIR/sio.cpp.o
$CC -c $CFLAGS $INCLUDES src/Stream.cpp -o $OBJ_DIR/Stream.cpp.o
$CC -c $CFLAGS $INCLUDES src/UART.cpp -o $OBJ_DIR/UART.cpp.o
$CC -c $CFLAGS $INCLUDES src/WString.cpp -o $OBJ_DIR/WString.cpp.o
$CC -c $CFLAGS $INCLUDES src/BLECharacteristic.cpp -o $OBJ_DIR/BLECharacteristic.cpp.o
$CC -c $CFLAGS $INCLUDES src/BLEService.cpp -o $OBJ_DIR/BLEService.cpp.o
$CC -c $CFLAGS $INCLUDES src/BLEDevice.cpp -o $OBJ_DIR/BLEDevice.cpp.o
$CC -c $CFLAGS $INCLUDES src/BLEDescriptor.cpp -o $OBJ_DIR/BLEDescriptor.cpp.o
$CC -c $CFLAGS $INCLUDES src/BLEStringCharacteristic.cpp -o $OBJ_DIR/BLEStringCharacteristic.cpp.o
$CC -c $CFLAGS $INCLUDES src/BLETypedCharacteristics.cpp -o $OBJ_DIR/BLETypedCharacteristics.cpp.o
$CC -c $CFLAGS $INCLUDES src/local/BLELocalCharacteristic.cpp -o $OBJ_DIR/local/BLELocalCharacteristic.cpp.o
$CC -c $CFLAGS $INCLUDES src/local/BLELocalService.cpp -o $OBJ_DIR/local/BLELocalService.cpp.o
$CC -c $CFLAGS $INCLUDES src/local/BLELocalAttribute.cpp -o $OBJ_DIR/local/BLELocalAttribute.cpp.o
$CC -c $CFLAGS $INCLUDES src/local/BLELocalDescriptor.cpp -o $OBJ_DIR/local/BLELocalDescriptor.cpp.o
$CC -c $CFLAGS $INCLUDES src/local/BLELocalDevice.cpp -o $OBJ_DIR/local/BLELocalDevice.cpp.o
$CC -c $CFLAGS $INCLUDES src/remote/BLERemoteAttribute.cpp -o $OBJ_DIR/remote/BLERemoteAttribute.cpp.o
$CC -c $CFLAGS $INCLUDES src/remote/BLERemoteDescriptor.cpp -o $OBJ_DIR/remote/BLERemoteDescriptor.cpp.o
$CC -c $CFLAGS $INCLUDES src/remote/BLERemoteDevice.cpp -o $OBJ_DIR/remote/BLERemoteDevice.cpp.o
$CC -c $CFLAGS $INCLUDES src/remote/BLERemoteService.cpp -o $OBJ_DIR/remote/BLERemoteService.cpp.o
$CC -c $CFLAGS $INCLUDES src/remote/BLERemoteCharacteristic.cpp -o $OBJ_DIR/remote/BLERemoteCharacteristic.cpp.o
$CC -c $CFLAGS $INCLUDES src/utility/ATT.cpp -o $OBJ_DIR/utility/ATT.cpp.o
$CC -c $CFLAGS $INCLUDES src/utility/GAP.cpp -o $OBJ_DIR/utility/GAP.cpp.o
$CC -c $CFLAGS $INCLUDES src/utility/HCI.cpp -o $OBJ_DIR/utility/HCI.cpp.o
$CC -c $CFLAGS $INCLUDES src/utility/BLEUuid.cpp -o $OBJ_DIR/utility/BLEUuid.cpp.o
$CC -c $CFLAGS $INCLUDES src/utility/HCICordioTransport.cpp -o $OBJ_DIR/utility/HCICordioTransport.cpp.o
$CC -c $CFLAGS $INCLUDES src/utility/HCIUartTransport.cpp -o $OBJ_DIR/utility/HCIUartTransport.cpp.o
$CC -c $CFLAGS $INCLUDES src/utility/GATT.cpp -o $OBJ_DIR/utility/GATT.cpp.o
$CC -c $CFLAGS $INCLUDES src/utility/L2CAPSignaling.cpp -o $OBJ_DIR/utility/L2CAPSignaling.cpp.o
# $CC -w -Os -g -flto -fuse-linker-plugin -Wl,--gc-sections -Wl,--section-start=.text=0x200 -mmcu=atmega4809 -o /tmp/arduino_build_195902/Scan.ino.elf /tmp/arduino_build_195902/sketch/Scan.ino.cpp.o $OBJ_DIR/BLECharacteristic.cpp.o $OBJ_DIR/BLEDescriptor.cpp.o $OBJ_DIR/BLEDevice.cpp.o $OBJ_DIR/BLEService.cpp.o $OBJ_DIR/BLEStringCharacteristic.cpp.o $OBJ_DIR/BLETypedCharacteristics.cpp.o $OBJ_DIR/local/BLELocalAttribute.cpp.o $OBJ_DIR/local/BLELocalCharacteristic.cpp.o $OBJ_DIR/local/BLELocalDescriptor.cpp.o $OBJ_DIR/local/BLELocalDevice.cpp.o $OBJ_DIR/local/BLELocalService.cpp.o $OBJ_DIR/remote/BLERemoteAttribute.cpp.o $OBJ_DIR/remote/BLERemoteCharacteristic.cpp.o $OBJ_DIR/remote/BLERemoteDescriptor.cpp.o $OBJ_DIR/remote/BLERemoteDevice.cpp.o $OBJ_DIR/remote/BLERemoteService.cpp.o $OBJ_DIR/utility/ATT.cpp.o $OBJ_DIR/utility/BLEUuid.cpp.o $OBJ_DIR/utility/GAP.cpp.o $OBJ_DIR/utility/GATT.cpp.o $OBJ_DIR/utility/HCI.cpp.o $OBJ_DIR/utility/HCICordioTransport.cpp.o $OBJ_DIR/utility/HCIUartTransport.cpp.o $OBJ_DIR/utility/L2CAPSignaling.cpp.o -lm
$CC -c -O3 -Wall -B /home/logan/Downloads/ATMEGA_pack/gcc/dev/atmega4809 -I/home/logan/Downloads/ATMEGA_pack/include -I/home/logan/Documents/ArduinoBLE-Rework/src -mmcu=atmega4809  ./examples/Central/Scan/Scan.cpp -o ./examples/Central/Scan/Scan.o
# $LD $OBJ_DIR/Common.cpp.o $OBJ_DIR/Print.cpp.o $OBJ_DIR/sio.cpp.o $OBJ_DIR/Stream.cpp.o $OBJ_DIR/UART.cpp.o $OBJ_DIR/WString.cpp.o $OBJ_DIR/BLECharacteristic.cpp.o $OBJ_DIR/BLEService.cpp.o $OBJ_DIR/BLEDevice.cpp.o $OBJ_DIR/BLEDescriptor.cpp.o $OBJ_DIR/BLEStringCharacteristic.cpp.o $OBJ_DIR/BLETypedCharacteristics.cpp.o $OBJ_DIR/local/BLELocalCharacteristic.cpp.o $OBJ_DIR/local/BLELocalService.cpp.o $OBJ_DIR/local/BLELocalAttribute.cpp.o $OBJ_DIR/local/BLELocalDescriptor.cpp.o $OBJ_DIR/local/BLELocalDevice.cpp.o $OBJ_DIR/remote/BLERemoteAttribute.cpp.o $OBJ_DIR/remote/BLERemoteDescriptor.cpp.o $OBJ_DIR/remote/BLERemoteDevice.cpp.o $OBJ_DIR/remote/BLERemoteService.cpp.o $OBJ_DIR/remote/BLERemoteCharacteristic.cpp.o $OBJ_DIR/utility/ATT.cpp.o $OBJ_DIR/utility/GAP.cpp.o $OBJ_DIR/utility/HCI.cpp.o $OBJ_DIR/utility/BLEUuid.cpp.o $OBJ_DIR/utility/HCICordioTransport.cpp.o $OBJ_DIR/utility/HCIUartTransport.cpp.o $OBJ_DIR/utility/GATT.cpp.o $OBJ_DIR/utility/L2CAPSignaling.cpp.o ./examples/Central/Scan/Scan.o -o ./examples/Central/Scan/Scan.elf
$CC -w -Os -g -flto -fuse-linker-plugin -Wl,--gc-sections -Wl,--section-start=.text=0x200 -mmcu=atmega4809 -lm $INCLUDES -o ./examples/Central/Scan/Scan.elf $OBJ_DIR/new.cpp.o $OBJ_DIR/Common.cpp.o $OBJ_DIR/Print.cpp.o $OBJ_DIR/sio.cpp.o $OBJ_DIR/Stream.cpp.o $OBJ_DIR/UART.cpp.o $OBJ_DIR/UART2.cpp.o $OBJ_DIR/WString.cpp.o $OBJ_DIR/BLECharacteristic.cpp.o $OBJ_DIR/BLEService.cpp.o $OBJ_DIR/BLEDevice.cpp.o $OBJ_DIR/BLEDescriptor.cpp.o $OBJ_DIR/BLEStringCharacteristic.cpp.o $OBJ_DIR/BLETypedCharacteristics.cpp.o $OBJ_DIR/local/BLELocalCharacteristic.cpp.o $OBJ_DIR/local/BLELocalService.cpp.o $OBJ_DIR/local/BLELocalAttribute.cpp.o $OBJ_DIR/local/BLELocalDescriptor.cpp.o $OBJ_DIR/local/BLELocalDevice.cpp.o $OBJ_DIR/remote/BLERemoteAttribute.cpp.o $OBJ_DIR/remote/BLERemoteDescriptor.cpp.o $OBJ_DIR/remote/BLERemoteDevice.cpp.o $OBJ_DIR/remote/BLERemoteService.cpp.o $OBJ_DIR/remote/BLERemoteCharacteristic.cpp.o $OBJ_DIR/utility/ATT.cpp.o $OBJ_DIR/utility/GAP.cpp.o $OBJ_DIR/utility/HCI.cpp.o $OBJ_DIR/utility/BLEUuid.cpp.o $OBJ_DIR/utility/HCICordioTransport.cpp.o $OBJ_DIR/utility/HCIUartTransport.cpp.o $OBJ_DIR/utility/GATT.cpp.o $OBJ_DIR/utility/L2CAPSignaling.cpp.o ./examples/Central/Scan/Scan.o

# $AVRDUDE -C$AVRDUDE_CONFIG -v -patmega4809 -cxplainedmini_updi -Pusb -b115200 -e -D -U ./examples/Central/Scan/Scan.elf
