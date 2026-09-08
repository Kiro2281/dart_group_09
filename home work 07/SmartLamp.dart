import 'Device.dart';
import 'Adjustable.dart';
import 'BatteryPowered.dart';

class SmartLamp extends Device with BatteryPowered implements Adjustable {
  int brightness = 0;

  SmartLamp(super.name);
  @override
  void turnOn(){
    print('Lamp $name is ON');
  }
  @override 
  void turnOff(){
    print('Lamp $name is OFF');
  }
  @override
  void increase() {
    brightness = brightness + 10; 
    if (brightness > 100) {       
      brightness = 100;            
    }
  }

  @override
  void decrease() {
    brightness = brightness - 10; 
    if (brightness < 0) {         
      brightness = 0;             
    }
  }

  @override
  void showInfo() {
    print('Device: $name, Brightness: $brightness%');
  }

}