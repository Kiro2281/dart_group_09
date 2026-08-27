import 'dart:io';


void  main(){
  // print('Enter your name:');
  // String? name = stdin.readLineSync();
  
  // print('------------');
  
  // print('What year were you born?');
  // int yourY = int.parse(stdin.readLineSync()!);
  // const year = '2026';
  // print('Your age: ${int.parse(year) - yourY}');

    // print('----------');

    // int number = int.parse(stdin.readLineSync()!);
    // if (number % 2 == 0){
    //   print('Число четное');
    // }
    // else {
    //   print('Число нечетное');
    // }

  print('----------------');

  List<String> spisok = ['Milk' ,'Bread','Oil', ];

  for (var i in spisok){
    print(i);
  }

  print('---------');

  var i = 1;
  while(i <= 50){
    print(i);
    i++;
    print('Sum: ${i + i}');
  }

  print('-----------');

  List<int> numbers = [1, 2, 2, 3, 4, 4, 4, 5];
  Set<int> mySet = numbers.toSet();
  print(numbers);
  print(mySet);

  // print('-------------');

  // print('Enter key');
  // String? key = stdin.readLineSync();
  // Map<String, String> tel = {'Alice' : '+999' ,  'Bob' : '996'};
  // if (key == "Alcie"){
  //   print(tel);
  // }
  // else {
  //   print("Telephone not located");
  // }

  print('-------------');

  for (int i = 1; i <= 20; i++){
    if (i % 5 == 0){
      continue;
    }
    else if (i == 17){
      break;
    }
    print(i);
  } 
}


