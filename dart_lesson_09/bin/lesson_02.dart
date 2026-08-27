import 'dart:io';

void main() {
  int temperature = 35;
  int numberOfStudents = 5;
  bool isRainy = false;

  if (temperature > 30) {
    // true
    String lake = 'Issyk Kul';
    print('Go to the lake $lake');
  }

  if (numberOfStudents == 22) {
    // false
    print('Play Football');
  }

  if (isRainy) {   // false
    print('Take an umbrella');
 } 
  else {
    print('Take on a hat');
  }

  if (numberOfStudents < 10) {
    // true
    print('Go to cafe');
  } else {
    print('Go to the park');
  }

  // else { // Ошибка: Нельзя использовать else без if
  //   print('Go to school');
  // }

  temperature = -3;
  if (temperature > 35) {
    print('The weather is hot');
  } else if (temperature > 20) {
    print('The weather is warm');
  } else if (temperature > 10) {
    print('The weather is cool');
  } else if (temperature > 0) {
    print('The weather is cold');
  } else {
    print('The weather is freezing');
  }

  // Оператор AND - истина, если оба условия истинны
  isRainy = true;
  if (temperature < 15 && isRainy) {
    // true
    print('Play bowling');
  }

  if (numberOfStudents > 15 && temperature != 20) {
    // false
    print('Go to GEEKS');
  }

  // Оператор OR - истина, если хотя бы одно условие истинно
  if (isRainy || numberOfStudents <= 3) {
    print('Stay at home');
  }

  if (temperature > 30 || numberOfStudents > 15) {
    print('Go shopping');
  }

  // Оператор NOT - инвертирует значение булева выражения

  isRainy = false;
  // if (isRainy) {
  // } else {
  //   print('Walking');
  // }

  if (!isRainy) {
    print('Walking');
  }

  numberOfStudents = numberOfStudents + 10;
  if (numberOfStudents > 10) {
    // условие ложно - весь блок игнорируется
    print('Go to picnic');
    if (temperature > 15) {
      // вложеная условная конструкция
      print('Eat an ice cream');
    } else {
      print('Drink a hot tea');
    }
  }

  if (temperature > 15 && temperature < 30 ||
      numberOfStudents > 15 && numberOfStudents < 25 ||
      isRainy) {
    // false && true || false && true || false => 0 * 1 + 0 * 1 + 0 = 0 + 0 + 0 = 0 (FALSE)
    print('Go to work');
  }

  if (temperature > 15 &&
      (temperature < 30 || numberOfStudents > 15) &&
      (numberOfStudents < 25 || isRainy)) {
    // false && (true || false) && (true || false) => 0 * (1 + 0) * (1 + 0) = 0 * 1 * 1 = 0 * 1 = 0 (FALSE)
    print('Go to cinema');
  }

  int number = 8;
  String myStr = 'Some text';
  print(myStr + ' ' + number.toString()); // Преобразование числа с в строку

  String digitStr = '23';
  print(int.parse(digitStr) - 5); // Преобразование строки в целое число

  String numericValue = '17.5';
  print(
    double.parse(numericValue) / 2,
  ); // Преобразование строки в дробное число

  print('Where are you from? ');
  String? city = stdin.readLineSync(); // Запуск программы необходимо сделать из консоли, чтобы можно было ввести данные -> dart run bin/lesson_2.dart
  print('$city is very beautiful place');

  print('Enter a number: ');
  int num1 = int.parse(stdin.readLineSync()!);
  print('Enter another number: ');
  int num2 = int.parse(stdin.readLineSync()!);
  // print('Sum of numbers: ${num1 + num2}');

  print('Enter an operation +, -, *, /');
  String? sign = stdin.readLineSync();

  switch (sign) {
    case '+': 
      print('Sum of numbers = ${num1 + num2}');
    case '-':
      print('Difference of numbers = ${num1 - num2}');
    case '*':
      print('Product of numbers = ${num1 * num2}');
    case '/':
      print('Division of numbers = ${num1 / num2}');
    default:
      print('Wrong sign!');
  }

  print('End of program');
}
