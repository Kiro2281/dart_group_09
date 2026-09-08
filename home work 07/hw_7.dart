import 'Device.dart';
import 'Adjustable.dart';
import 'BatteryPowered.dart';
import 'SmartLamp.dart';
import 'SmartSpeaker.dart';
import 'SmartThermostat.dart';


void main() {
  List<Device> devices = [
    SmartLamp('Living Room Lamp'),
    SmartSpeaker('Kitchen Speaker'),
    SmartThermostat('Hallway Thermostat'),
  ];

  for (var device in devices) {
    device.showInfo();
    device.turnOn();

   
    if (device is Adjustable) {
      (device as Adjustable).increase(); 
    }

    if (device is BatteryPowered) {
      (device as BatteryPowered).showBattery();
    }
    
    print('---');
  }

  print('All devices processed.');
}
