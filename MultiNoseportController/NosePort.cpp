
#include "NosePort.h"
#include <Arduino.h>

extern void DEBUG(String message);

int NosePort::nosePortListSize = 0;
NosePort* NosePort::nosePortList[MAX_PORT_LIST_SIZE];

NosePort::NosePort(int beambreakPin, int solenoidPin) {
  _beambreakPin = beambreakPin;
  _solenoidPin = solenoidPin;
  _ledPin = 0;
  _rewardActivated = false;
  _rewardDuration = 0;
  _singleReward = false;

  _duringReward = 0;
  _rewardEndTime = 0;

  pinMode(_beambreakPin, INPUT);
  _noseIn = (digitalRead(_beambreakPin) == HIGH);

  pinMode(_solenoidPin, OUTPUT);
  digitalWrite(_solenoidPin, LOW);

  if (nosePortListSize < MAX_PORT_LIST_SIZE-1) {
    nosePortList[nosePortListSize] = this;
    nosePortListSize += 1;
    _nosePortNumber = nosePortListSize; //nosePort number is ones-based
  } else {
    _nosePortNumber = 0;
  }

  logToUSB('N');

  DEBUG(String("New NosePort: ")+_nosePortNumber);
  DEBUG(String("- beam pin: ")+_beambreakPin);
  DEBUG(String("- sol pin: ")+_solenoidPin);

}

void NosePort::setRewardDuration(long duration) {
  DEBUG("Updated Duration");
  _rewardDuration = duration;
}

void NosePort::setActivated(bool activated) {
  DEBUG("Updated Activation State");
  _rewardActivated = activated;
}

void NosePort::setSingleReward(bool singleReward) {
  _singleReward = singleReward;
}

void NosePort::noseIn() {
  //DEBUG(String("Nose In — nosePort ")+_nosePortNumber);
  DEBUG(String("Nose In - nosePort ")+_nosePortNumber);
  _noseIn = true;
  // log noseIn
  logToUSB('I');
  if (_rewardActivated) {
    deliverReward();
  }
  if (_singleReward) {
    setActivated(false);
  }
}

void NosePort::noseOut() {
  DEBUG(String("Nose Out - nosePort ")+_nosePortNumber);
  _noseIn = false;
  // log noseOut
  logToUSB('O');
}

void NosePort::update() {
  bool currentNosePortState = (digitalRead(_beambreakPin) == HIGH);
  if (_noseIn != currentNosePortState) { // if there's been a change in state
    if (currentNosePortState) {
      noseIn();
    } else {
      noseOut();
    }
  }
  if (_duringReward) {
    if (millis() > _rewardEndTime) { // TODO correct for overflow..........
      digitalWrite(_solenoidPin, LOW);
      _duringReward = false;
    }
  }
}

void NosePort::deliverReward() {
  DEBUG(String("Reward - nosePort ")+_nosePortNumber);
  DEBUG(String("       - duration ")+_rewardDuration);

  if (_rewardDuration > 0) {
    // set timer; set pin high; log
    _duringReward = true;
    _rewardEndTime = millis() + _rewardDuration;
    digitalWrite(_solenoidPin, HIGH);
    logToUSB('R');

    // TODO Prevent rewards from overlapping; stop reward on nose out
  }
}

void NosePort::setLEDPin(int pin) {
  _ledPin = pin;
  pinMode(_ledPin, OUTPUT);
  digitalWrite(_ledPin, LOW);
}

void NosePort::ledOn() {
  if (_ledPin > 0) {
    digitalWrite(_ledPin, HIGH);
  }
}

void NosePort::ledOff() {
  if (_ledPin > 0) {
    digitalWrite(_ledPin, LOW);
  }
}


void NosePort::identify() {
  DEBUG(String("NosePort Num: ")+_nosePortNumber);
  DEBUG(String("- beam pin: ")+_beambreakPin);
  DEBUG(String("- sol pin: ")+_solenoidPin);
  DEBUG(String("- LED pin: ")+_ledPin);
}

void NosePort::logToUSB(char message) {
  String logMessgage = String(message);
  logMessgage += ' ';
  logMessgage += _nosePortNumber;
  Serial.println(logMessgage.c_str());
}


//===============

void NosePort::interpretCommand(String message) {
  message.trim(); // remove leading and trailing white space
  int len = message.length();
  if (len==0) {
    Serial.print("#"); // "#" means error
    return;
  }
  char command = message[0]; // the command is the first char of a message
  String parameters = message.substring(1);
  parameters.trim();

  String intString = "";
  while ((parameters.length() > 0) && (isDigit(parameters[0]))) {
    intString += parameters[0];
    parameters.remove(0,1);
  }
  long arg1 = intString.toInt();

  parameters.trim();
  intString = "";
  while ((parameters.length() > 0) && (isDigit(parameters[0]))) {
    intString += parameters[0];
    parameters.remove(0,1);
  }
  long arg2 = intString.toInt();


  DEBUG(String("Command: ")+command);
  DEBUG(String("Argument 1: ")+arg1);
  DEBUG(String("Argument 2: ")+arg2);

  if (command == 'N') { // N: new nosePort
    // arg1 is beambreak pin
    // arg2 is solenoid pin
    new NosePort(arg1, arg2);
  } else {

    long nosePortNum = arg1;
    if ((nosePortNum <= 0) || (nosePortNum > nosePortListSize)) {
      // Bad NosePort Number
      Serial.print("#"); // "#" means error
      return;
    }

    if (command == 'D') { // D: set reward duration
      nosePortList[nosePortNum-1]->setRewardDuration(arg2);
    } else if (command == 'A') { // A: set reward activation state
      nosePortList[nosePortNum-1]->setActivated(arg2);
    } else if (command == 'S') { // S: set single-reward state
      nosePortList[nosePortNum-1]->setSingleReward(arg2);
    } else if (command == 'R') { // R: deliver reward
      nosePortList[nosePortNum-1]->deliverRewarwd();
    } else if (command == 'L') { // L: set LED pin
      nosePortList[nosePortNum-1]->setLEDPin(arg2);
    } else if (command == 'O') { // L: turn LED on
      nosePortList[nosePortNum-1]->ledOn();
    } else if (command == 'F') { // L: turn LED off
      nosePortList[nosePortNum-1]->ledOff();
    } else { // unknown command
      Serial.print("#"); // "#" means error
    }
  }
}

