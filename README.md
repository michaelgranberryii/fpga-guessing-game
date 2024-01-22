# Project Title

Zybo Z7-10 FPGA SoC Development Board: Two Digit Guessing Game with Keypad and SSD

## Description

This project implements a number guessing game using SystemVerilog on an FPGA board. The game involves a roll-back counter that counts from 1 to F and resets to 0 after reaching F. The user can stop the counter and record the current number as the target number by pressing push button 1. The user then needs to input a single-digit or two-digit number using the 16-button keypad, and the FPGA will display the input on the Seven Segment Display (SSD). To help the user guess the target number, the Zybo Red RGB LED will turn on if the input is greater than the target number, and the Zybo Blue RGB LED will turn on if the input is less than the target number. When the user guesses the target number correctly, the Zybo Green RGB LED will flash ten times to indicate a successful guess.

## Demo Video

[Demo on Youtube](https://youtu.be/3U9fnR_vUDI)

## Dependencies

### Hardware

* [Zybo Z7-10 FPGA SoC Development Board](https://digilent.com/shop/zybo-z7-zynq-7000-arm-fpga-soc-development-board/?gad_source=1&gclid=Cj0KCQiAkeSsBhDUARIsAK3tiedDBNo96Tg5VWCeuEqzXgPKJSFg8GQ0qwLCV-v5TlTKltLerrQGLDkaAjBgEALw_wcB)
* [SSD PMOD](https://digilent.com/shop/pmod-ssd-seven-segment-display/)
* [16-Button Keypad PMOD](https://digilent.com/shop/pmod-kypd-16-button-keypad/)

### Software

* [Xilinx Vivado](https://www.xilinx.com/products/design-tools/vivado.html)

## Author

* Michael Granberry
    * [@LinkedIn](https://www.linkedin.com/in/michaelgranberryii/)
    * [@GitHub](https://github.com/michaelgranberryii)
    * [Portfolio Website](https://www.michaelgranberryii.com/)

