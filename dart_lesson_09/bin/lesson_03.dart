import 'dart:io';

void main() {
  print('Start of program');

  for (int i = 1; i <= 5; i = i + 1) {
    print('Step: $i');
  }

  print('----------------');
  int number = 7;
  for (int i = 1; i <= 10; i++) {
    // i++ => i = i + 1 increment
    print('$number x $i = ${number * i}');
  }

  print('----------------');
  number = 5;
  for (int i = 10; i >= 1; i--) {
    // i-- => i = i - 1 decrement
    print('$number x $i = ${number * i}');
  }

  number = 9;
  print('----------------');
  for (int i = 10; i >= 2; i -= 2) {
    // i -= 2 => i = i - 2
    print('$number x $i = ${number * i}');
  }
  print('----------------');
  int count = 0;
  while (count <= 3) {
    print('Count is $count');
    count++;
    print('Square is ${count * count}');
  }

  String myStr = '#';
  while (myStr.length <= 7) {
    print(myStr);
    myStr += '#';
  }

  int doCount = 0;
  do {
    print('Do-While count is: $doCount');
    doCount++;
  } while (doCount > 5);

  doCount = 0;
  while (doCount > 5) {
    print('While count is: $doCount');
    doCount++;
  }

  // Коллекции List - список
  // упорядоченная коллекция элементов, доступ по индексу, может содержать дубликаты, изменяемый размер

  List<String> fruits = ['Apple', 'Banana', 'Mango'];
  print('My favorite fruits are ${fruits[0]} and ${fruits[2]}');
  print(fruits);
  fruits[1] = 'Grapes';
  print(fruits);
  // fruits[10] = 'Kiwi'; // Ошибка: индекс вне диапазона
  print(fruits);
  fruits.add('Pineapple');  
  print(fruits);
  fruits.insert(1, 'Watermelon');
  print(fruits);
  fruits.removeAt(0);
  print(fruits);
  fruits.add('Watermelon');
  print(fruits);
  fruits.remove('Watermelon');
  print(fruits);
  fruits.removeLast();
  print(fruits);

  // Коллекции Map - словарь
  // неупорядоченная коллекция пар ключ-значение, ключи уникальны
  Map<String, int> ages = {'Alice': 30, 'Bob': 25, 'Kevin': 31};
  print('Alice is ${ages['Alice']} years old.');
  print(ages);
  ages['Bob'] = 26;
  print(ages);
  ages['David'] = 19;
  print(ages);
  ages.remove('Kevin');
  print(ages);
  print('Total people: ${ages.length}');

  // Итерация по парам ключ-значение
  ages.forEach((k, v) {
    print('$k is $v y.o.');
  });

  // Коллекции Set - множество
  // неупорядоченная коллекция уникальных элементов
  Set<String> colors = {'red', 'blue', 'yellow'};
  print(colors);
  colors.add('green');  
  print(colors);
  colors.add('red');
  print(colors);
  colors.remove('red');
  print(colors);
  print('Colors count: ${colors.length}');

  for (String c in colors) {
    print('Color: $c');
  }

  for (var fruit in fruits) {
    print('Fruit: $fruit');
  }           

  for (var key in ages.keys) {
    print('Name: $key, age: ${ages[key]}');
  }

  print('---------------');
  // break - экстренно прерывает работу цикла
  List<int> numbers = [33, -19, 3, -6, 0, 67];
  // for(int i = 0; i < numbers.length; i++){}
  for (int num in numbers) {
    if (num < 0) {
      break;
    }
    print(num);
  }
  print('---------------');
  // continue - прерывает работу текущего круга
  for (int num in numbers) {
    if (num < 0) {
      continue;
    }
    print(num);
  }

  // String? value;
  // while (true) {
  //   print('Enter a number or "q" to exit: ');
  //   value = stdin.readLineSync();
  //   if (value == 'q') {
  //     break;
  //   }
  //   print('Your entered number x5 = ${int.parse(value!) * 5}');
  // }

  for (int i = 1; i <= 3; i++) {
    print('Outer loop: $i');
    for (int j = 1; j <= 5; j++) {
      print('Inner loop: $j');
    }
  }
  print('End of program - 8:10');
}
