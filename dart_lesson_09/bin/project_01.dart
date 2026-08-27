


void main(){
  print("Hello World");
  print(45);
  // Comment

  /*
    Multi-line comment
  */
  
  String myFirstName = "Alice"; //String - строчный тип данных
  print(myFirstName);

  int myAge = 16; //int - целочисленный тип данных
  print(myAge);

  double myHeight = 1.75; //double - дробный тип данных 
  print(myHeight);

  bool isStudent = false; //bool - логический тип данных
  print(isStudent);

  int mySalary = 50000;
  print(mySalary);

  String myJob; //Создание переменой(объявление) - значение по умолчанию null

  myJob = "Engineer"; //Присвоение значения переменной(инициализация)
  print(myJob);
  myJob = "Manager"; //Присвоение нового значения переменной
  print(myJob);

  mySalary = mySalary + 10000; //Присвоение нового значения переменной
  print(mySalary);

  //Конкатенация - соединение строк
  print("My profession is " + myJob);

  //Интерполяция - вставка переменной в строку
  print("My height is $myHeight meters. I was born in ${2026 - myAge} ");

  //Экранирование строки - вставка спец. символов в строку
  print("Today I'm learning Dart programming");
  print("Today I'm learning \"Dart\" programming");

  String sampleString = "      Hello Dart!      ";
  print(sampleString.length);
  print(sampleString.toUpperCase()); //Метод toUpperCase() - перевод строки в верхний регистр
  print(sampleString.toLowerCase()); //Метод toLowerCase() - перевод строки в нижний регистр
  print(sampleString.trim()); //Метод trim() - удаление пробелов из начала и конца строки
  print(sampleString.contains("T")); //Метод contains() - проверка наличия подстроки в строке
  print(sampleString.replaceAll("Dart", "Flutter")); //Метод replaceAll() -замена подстроки в строке

  //Arifmetic operations
  print(10 + 5); //Addition
  print(10 - 5); //Subtraction
  print(10 * 5); //Multiplication
  print(10 / 5); //Division
  print(11 ~/ 5 ); //Division without a remainder
  print(11 % 5); //Remainder of division

  var myVariable = 10; //var - переменная, тип данных определяется автоматически
  print(myVariable);
  
  final myFinalVariable = 20; //final - переменная, значение которой нельзя изменить
  print(myFinalVariable);

  String? myNullableVariable; //String? - переменная, которая может быть null
  print(myNullableVariable);

}