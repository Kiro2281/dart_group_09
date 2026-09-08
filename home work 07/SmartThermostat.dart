import 'Device.dart';

class SmartThermostat extends Device {
  int temperature = 22;

  SmartThermostat(super.name);

  @override
  void turnOn() {
    print('Thermostat $name is ON');
  }

  @override
  void turnOff() {
    print('Thermostat $name is OFF');
  }

  @override
  void showInfo() {
    print('Device: $name, Temperature: $temperature°C');
  }
}