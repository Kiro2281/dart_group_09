import 'Device.dart';
import 'Adjustable.dart';
import 'BatteryPowered.dart';

class SmartSpeaker extends Device with BatteryPowered implements Adjustable {
  int volume = 30;

  SmartSpeaker(super.name);

  @override
  void turnOn() {
    print('Speaker $name is ON');
  }

  @override
  void turnOff() {
    print('Speaker $name is OFF');
  }

   @override
  void increase() {
    volume = volume + 5; 
    if (volume > 100) {
      volume = 100;       
    }
  }

  @override
  void decrease() {
    volume = volume - 5; 
    if (volume < 0) {   
      volume = 0;        
    }
  }

  @override
  void showInfo() {
    print('Device: $name, Volume: $volume%');
  }
}