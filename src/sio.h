#define F_CPU 16000000UL
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include <stdio.h>
#include <stdlib.h>
#include "WString.h"

class sio{
    private:
        void uart_init();
        void arduino_clock_fix();
    public:
        sio(){
            uart_init();
        }
        void GetMsg(const char * message, unsigned int buf_size);
        void Println(const char * message);
        void Print(const char *message);
};