all:
	avr-gcc -Os -DF_CPU=6000000 -mmcu=atmega328p -c blinkLED.c
	avr-gcc -DF_CPU=6000000 -mmcu=atmega328p -o blinkLED.elf blinkLED.o
	avr-objcopy -j .text -j .data -O ihex blinkLED.elf blinkLED.hex
	avrdude -p m328p -c avrisp -P /dev/ttyACM0 -U flash:w:blinkLED.hex -b 19200
