
#ifndef NosePort_h
#define NosePort_h

#include <WString.h>

const int MAX_PORT_LIST_SIZE = 32;

class NosePort {

private:
  int _nosePortNumber;
  int _beambreakPin;
  int _solenoidPin;
  int _ledPin;
  bool _rewardActivated;
  long _rewardDuration;
  bool _singleReward;
  // long _noseInTime;
  // long _noseOutTime;

  bool _noseIn;
  bool _duringReward;
  long _rewardEndTime;

public:

  // class methods
  static void interpretCommand(String message);

  // class data
  static NosePort* nosePortList[MAX_PORT_LIST_SIZE];
  static int nosePortListSize;

  // consrtuctors / destructors
  NosePort(int beambreakPin, int solenoidPin);
  //~NosePort();

  // public methods
  void setRewardDuration(long duration);
  void setActivated(bool activated);
  void setSingleReward(bool singleReward);
  void noseIn();
  void noseOut();
  void setLEDPin(int pin);
  void ledOn();
  void ledOff();
  void update();
  void deliverReward();
  void logToUSB(char message);

  void identify(); // for debugging

};



#endif
