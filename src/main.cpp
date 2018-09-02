/*
Pullup counter till Arnfinn

Maybe to be in 2.0: 

Settings:
      Distance to be a pullup, like a motivational up arrow, or something
      Brightness 0-15
      Time - need more ledarrays to display properly

todo:
Firmware 1.0 done.


*/

#include <Arduino.h>
#include <SPI.h>
#include <bitBangedSPI.h>
#include <MAX7219_Dot_Matrix.h>
#include <ClickEncoder.h>
#include <TimerOne.h>
#include <Wire.h>
#include "RTClib.h"
#include <EEPROM.h>
#include <UltraDistSensor.h>

//**************************

#define DEBUG

//**************************
void setBrightness();
void timerIsr();
void btnstate();
void setCompileTime();
void updateDisplay();
void showTime();
void pulsingHearts();
void Scollingtext();
int16_t oldEncPos, encPos;
uint8_t buttonState;
uint8_t daylightAddr = 0;
bool newNumer = 0;
bool done = 0;
int numPullups = 0;
int oldNumPullups = 0;
char message[] = {};
int lastDay = 0;
int temp = 0;
bool LEDOff = 0;
unsigned long pullUpTime = 0;
unsigned long pullUpHELDTime = 0;
unsigned long hasGoneDownTime = 0;
bool hasGoneDown = 0;
uint16_t rangeUpdateTimer = 0;
uint16_t clockUpdateTimer = 0;
int daylight = 8;
#define pinA A1
#define pinB A2
#define pinSw A0 //switch on enc
#define STEPS 4
char daysOfTheWeek[7][12] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
unsigned long lastMoved = 0;
uint8_t MOVE_INTERVAL = 40; // mS
int messageOffset;
int scollingMessageOffset;
const byte chips = 2;
float distanceReading = 0.00;
bool doneWithScolling = 0;

UltraDistSensor mysensor;
RTC_DS1307 rtc;
ClickEncoder encoder(pinA, pinB, pinSw, STEPS);
DateTime now;
// 2 chips (display modules), hardware SPI with load on D10
MAX7219_Dot_Matrix display(chips, 10); // Chips / LOAD

void setup()
{
      Serial.begin(9600);
      display.begin();
      Timer1.initialize(1000);
      Timer1.attachInterrupt(timerIsr);

      encoder.setAccelerationEnabled(false);
      if (!rtc.begin())
      {
            Serial.println("Couldn't find RTC");
      }
      mysensor.attach(6, 7); //Trigger pin , Echo pin
      oldEncPos = 0;
      daylight = EEPROM.get(daylightAddr, daylight);
      Serial.print("Brightness : ");
      Serial.println(daylight);
      if (daylight > 15 || daylight < 0)
      {
            daylight = 8;
      }

      display.setIntensity(daylight);

      setCompileTime();
      //showTime();

      pulsingHearts();
}

void loop()
{
      //update things:

      encPos += encoder.getValue(); //check if the encoder has changed

      if (millis() - clockUpdateTimer >= 30000) //read clock every 30 seconds
      {
            now = rtc.now();
            // Serial.print(now.second(), DEC);					
      }

      if (millis() - rangeUpdateTimer >= 100)
      {
            distanceReading = mysensor.distanceInCm();
            rangeUpdateTimer = millis();
      }

      //***********

   /*    
      Serial.print("Sensor Reading :");
      Serial.print(distanceReading);
      Serial.println(" CM");  */
      

      if (distanceReading > 10.00)
      {
            pullUpTime = millis();
      }
      //else
      // Serial.println(millis() - pullUpTime);

      if (millis() - pullUpTime > 500 && hasGoneDown == 1)
      {
            // pullUpTime = millis();
            Serial.print("Sensor Reading :");
            Serial.print(distanceReading);
            Serial.println(" CM");
            numPullups++;
            hasGoneDown = 0;
      }

      if (distanceReading > 30.00)
      {
            hasGoneDown = 1;
      }

      //has the encoder value changed?
      if (encPos != oldEncPos)
      {
            // Serial.print("Encoder Value: ");
            // Serial.println(encPos);
            int diff = encPos - oldEncPos;
            numPullups = numPullups + diff;
            oldEncPos = encPos;

            //need this here because of some bug... Yuck!
            Serial.print("now.dayOfTheWeek() : ");
            Serial.println(now.dayOfTheWeek());
            Serial.print("lastDay: ");
            Serial.println(lastDay);
      }

      //never under 0 pullups!
      if (numPullups < 0)
      {
            numPullups = 0;
            oldNumPullups = 0;
      }

      //Is there a new number to display?
      if (numPullups != oldNumPullups)
      {
            newNumer = 1;
            oldNumPullups = numPullups;
            done = 0;
            Serial.println(numPullups);
      }
      else
            newNumer = 0;

      // update display if time is time to
      if (millis() - lastMoved >= MOVE_INTERVAL)
      {
            updateDisplay();
            lastMoved = millis();
      }

      //Check the encoder button state (with state machine)
      // btnstate();

      if (lastDay != now.dayOfTheWeek())
      {
            lastDay = now.dayOfTheWeek();
            numPullups = 0;
            oldNumPullups = 0;
            temp = lastDay;
            Serial.println("Resetting due to New day!");
            Serial.print("now.dayOfTheWeek() : ");
            Serial.println(now.dayOfTheWeek());
            Serial.print("lastDay: ");
            Serial.println(lastDay);
      }

      //Turn off the LED's at 'out of office hours'
      if (!LEDOff)
      {
            if (now.hour() < 6 || now.hour() > 18)
            {

#ifndef DEBUG

                  display.end();
                  LEDOff = 1;
#else
                  display.setIntensity(0);
                  LEDOff = 1;

#endif // DEBUG
            }
            else
            {
                  display.setIntensity(daylight);
                  LEDOff = 0;
            }
      }

      btnstate(); //have we pressed the encoder button?

} // end of loop

void updateDisplay()
{
      itoa(numPullups, message, 10); //int to string

      if (done)
      {
            display.sendString(message);
      }
      else
      {
           /*  Serial.print("messageOffset: ");

            Serial.println(messageOffset); */
            display.sendSmooth(message, messageOffset);
            // next time show one pixel onwards
            if (messageOffset++ >= (int)(strlen(message) * 8))
            { //if we have run though the display
                  done = 1;
                  messageOffset = -chips * 8;
            }
      }
}

void timerIsr()
{
      encoder.service();
}

void btnstate()
{

      buttonState = encoder.getButton();

      if (buttonState != 0)
      {
            Serial.print("Button: ");
            Serial.println(buttonState);
            switch (buttonState)
            {
            case ClickEncoder::Open: //0
                  break;

            case ClickEncoder::Closed: //1
                  break;

            case ClickEncoder::Pressed: //2

                  break;

            case ClickEncoder::Held: //3
                  setBrightness();

                  break;

            case ClickEncoder::Released: //4
                  break;

            case ClickEncoder::Clicked: //5
                  numPullups = 0;
                  break;

            case ClickEncoder::DoubleClicked: //6

                  break;
            }
      }
      // do other stuff here
}

void setCompileTime()
{
      if (!rtc.isrunning())
      {
            Serial.println("RTC is NOT running!");
      rtc.adjust(DateTime(F(__DATE__), F(__TIME__)));
      Serial.print(" Setting RTC to compile time: ");
      }
if(Serial)       rtc.adjust(DateTime(F(__DATE__), F(__TIME__)));

      // following line sets the RTC to the date & time this sketch was compiled
      // This line sets the RTC with an explicit date & time, for example to set
      // January 21, 2014 at 3am you would call:
      // rtc.adjust(DateTime(2014, 1, 21, 3, 0, 0));

      now = rtc.now();
      lastDay = now.day();
      showTime();
}

void showTime()
{
      Serial.print("Compile time: ");
      Serial.print(F(__DATE__));
      Serial.print(" : ");
      Serial.print(F(__TIME__));
      Serial.println();
      Serial.println();
      Serial.println("Current Time: ");

      now = rtc.now();
      Serial.print(now.year(), DEC);
      Serial.print('/');
      Serial.print(now.month(), DEC);
      Serial.print('/');
      Serial.print(now.day(), DEC);
      Serial.print(" (");
      Serial.print(daysOfTheWeek[now.dayOfTheWeek()]);
      Serial.print(") ");
      Serial.print(now.hour(), DEC);
      Serial.print(':');
      Serial.print(now.minute(), DEC);
      Serial.print(':');
      Serial.print(now.second(), DEC);
      Serial.println();

      Serial.println();
      if (!rtc.isrunning())
      {
            Serial.println("RTC is NOT running!");
      }
      else
            Serial.println("RTC is running!");
      Serial.println();
}

void pulsingHearts()
{
      display.sendChar(0, 03); //sends a heart (see the font png. for code)  (Witch display, witch char)
      display.sendChar(1, 03);
      int bootup = millis();
      int i = 0;
      bool countDown = 0;
      while (millis() - bootup < 4000)
      {
            display.setIntensity(i);
            delay(35);

            if (countDown)
            {
                  i--;
            }
            else
                  i++;

            if (i == 15)
                  countDown = 1;
            if (i == 0)
                  countDown = 0;
      }
}

void setBrightness()
{
      unsigned long lastMovedScolling = 0;

      while (buttonState != 5)
      {
            daylight += encoder.getValue();
            if (daylight < 0)
                  daylight = 0;
            else if (daylight > 15)
                  daylight = 15;

            buttonState = encoder.getButton();
            display.setIntensity(daylight);
            if (millis() - lastMovedScolling >= MOVE_INTERVAL)
            {
                  Scollingtext();
                  lastMovedScolling = millis();
            }
      }
      EEPROM.put(daylightAddr, daylight);
}
void Scollingtext()
{
      char printtodisp[] = {"Set brightness"};
      if (doneWithScolling)
      {
            doneWithScolling = 0;
      }
      else
      {

            display.sendSmooth(printtodisp, scollingMessageOffset);
            // next time show one pixel onwards
            if (scollingMessageOffset++ >= (int)(strlen(printtodisp) * 8))
            { //if we have run though the display
                  doneWithScolling = 1;
                  scollingMessageOffset = -chips * 8;
            }
      }
}