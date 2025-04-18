ESP32 D1 Mini with LD2420 and BME280

![image](https://github.com/user-attachments/assets/2a38d163-fad5-4234-9cee-a4aa1945e17a)

This project demonstrates how to connect an ESP32 D1 Mini with an LD2420 presence detection sensor and a BME280 sensor. 

Project Overview

The goal of this project is to create a simple, low-cost device that can monitor environmental conditions (temperature, humidity, pressure) and detect human presence in a room. The data can then be processed by Home Assistant.

Components

You will need the following components:

    ESP32 D1 Mini

    LD2420 Presence Detection Sensor

    BME280 Temperature, Humidity, and Pressure Sensor

    Jumper wires

    Breadboard (optional, for prototyping)


Connect the components as follows:

    LD2420 Sensor (UART):

        VCC -> 3.3V on ESP32 D1 Mini

        GND -> GND on ESP32 D1 Mini

        TX -> (RX)GPIO1 on ESP32 D1 Mini

        RX -> (TX)GPIO3 on ESP32 D1 Mini

    BME280 Sensor (I2C):

        VCC -> 3.3V on ESP32 D1 Mini

        GND -> GND on ESP32 D1 Mini

        SDA -> GPIO4 on ESP32 D1 Mini

        SCL -> GPIO5 on ESP32 D1 Mini

Note: It's always a good idea to double-check the pinout of your specific board.