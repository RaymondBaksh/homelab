ESP8266 with BME280 Sensor

![image](https://github.com/user-attachments/assets/f3b481ef-81eb-4a0f-9eb7-b4713749d30f)


This project demonstrates how to use an ESP8266 board with a BME280 sensor. 

Project Overview

The goal of this project is to create a simple, low-cost device using the ESP8266 that can monitor environmental conditions (temperature, humidity, pressure). The data can be processed by Home Assistant.

Components

You will need the following components:

    ESP8266 board

    BME280 Sensor

Connect the BME280 sensor to the ESP8266 using the I2C interface as follows. Pin names might vary slightly depending on your specific ESP8266 board 

    BME280 Sensor (I2C):

        VCC -> 3.3V on ESP8266

        GND -> GND on ESP8266

        SDA -> SDA GPIO4 (or D2 on D1 Mini) on ESP8266

        SCL -> SCL GPIO5 (or D1 on D1 Mini) on ESP8266

        Note: The I2C pins on ESP8266 are often GPIO4 and GPIO5, but can sometimes be remapped in software. Check your board's documentation.

        