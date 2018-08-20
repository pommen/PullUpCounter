/*
Pullup counter till Arnfinn

Settings:
Distance to be a pulklup
Brightness
Time?

todo:
Distance sensing
rtc
Shut off disp after office hours?


*/

#include <Arduino.h>
#include <SPI.h>
#include <bitBangedSPI.h>
#include <MAX7219_Dot_Matrix.h>
#include <ClickEncoder.h>
#include <TimerOne.h>
#include <Wire.h>
#include "RTClib.h"

#include <UltraDistSensor.h>

//**************************

#define DEBUG

//**************************
void timerIsr();
void btnstate();
void setCompileTime();
void updateDisplay();
void showTime();
void pulsingHearts();

int16_t oldEncPos, encPos;
uint8_t buttonState;
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
#define pinA A2
#define pinB A1
#define pinSw A0 //switch on enc
#define STEPS 4
char daysOfTheWeek[7][12] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
unsigned long lastMoved = 0;
unsigned long MOVE_INTERVAL = 40; // mS
int messageOffset;
const byte chips = 2;
float distanceReading = 0.00;

UltraDistSensor mysensor;
RTC_DS1307 rtc;
ClickEncoder encoder(pinA, pinB, pinSw, STEPS);
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
      setCompileTime();
      //showTime();

      //pulsingHearts();
      /* 
      while(1){
            float prints = mysensor.distanceInCm();
            Serial.println(prints);
            delay(100); 
      }
 */
}

void loop()
{
      //update things:

      encPos += encoder.getValue();
      DateTime now = rtc.now();
      if (millis() - rangeUpdateTimer >= 100)
      {
            distanceReading = mysensor.distanceInCm();
            rangeUpdateTimer = millis();
      }

      //***********

      /* 
      Serial.print("Sensor Reading :");
      Serial.print(distanceReading);
      Serial.println(" CM"); 
      */

      if (distanceReading > 10.00)
      {
            pullUpTime = millis();
      }
      else
            Serial.println(millis() - pullUpTime);

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
      if (now.hour() < 6 || now.hour() > 18)
      {

#ifndef DEBUG

            display.end();
#else
            display.setIntensity(0);

#endif // DEBUG
      }
      else
            display.setIntensity(8);

} // end of loop

void updateDisplay()
{
      /*       if (newNumer) //starting out to the side if there's a new numer in mid sweep
      {
            messageOffset = -chips * 8;
            newNumer = 0;
                              done = 0;

      }
 */
      itoa(numPullups, message, 10); //int to string
      if (done)
      {
            display.sendString(message);
      }
      else
      {

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

      switch (buttonState)
      {
      case 3:
            buttonState = 0;
            break;
      case 0:
            buttonState = 0;

      default:
            break;
      }

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

                  break;

            case ClickEncoder::Released: //4
                  break;

            case ClickEncoder::Clicked: //5
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
            // following line sets the RTC to the date & time this sketch was compiled
            rtc.adjust(DateTime(F(__DATE__), F(__TIME__)));
            // This line sets the RTC with an explicit date & time, for example to set
            // January 21, 2014 at 3am you would call:
            // rtc.adjust(DateTime(2014, 1, 21, 3, 0, 0));
      }

      Serial.print(F(__DATE__));
      Serial.print(" : ");

      Serial.print(F(__TIME__));

      Serial.println();
      Serial.println();
      DateTime now = rtc.now();

      lastDay = now.day();
}

void showTime()
{

      Serial.println();

      DateTime now = rtc.now();
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

      Serial.print(" since midnight 1/1/1970 = ");
      Serial.print(now.unixtime());
      Serial.print("s = ");
      Serial.print(now.unixtime() / 86400L);
      Serial.println("d");

      // calculate a date which is 7 days and 30 seconds into the future
      DateTime future(now + TimeSpan(7, 12, 30, 6));

      Serial.print(" now + 7d + 30s: ");
      Serial.print(future.year(), DEC);
      Serial.print('/');
      Serial.print(future.month(), DEC);
      Serial.print('/');
      Serial.print(future.day(), DEC);
      Serial.print(' ');
      Serial.print(future.hour(), DEC);
      Serial.print(':');
      Serial.print(future.minute(), DEC);
      Serial.print(':');
      Serial.print(future.second(), DEC);
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