int totalCalls = 0;

void greet() {
  print(' Hello! Welcome to Dart programming!');
}

void main() {
  for (int i = 1; i <= 3; i++) {
    greet();
    totalCalls++; // First exercise
  }

  introduce("Alex", 25);
  introduce("Steve", 30);
  introduce("Nina", 10); // Second exercise 

  addNumbers(2, 3); // Third exercise

    print("Final price: ${calculateDiscount(price: 100, city: 'bishkek')}");
    print("Final price: ${calculateDiscount(price: 100, city: 'BISHKEK')}");
    print("Final price: ${calculateDiscount(price: 100, city: 'Bishkek')}"); // Forth exercise

  print("Total function calls: $totalCalls");
}

void introduce(String name, int age) {
  print("My name is $name and I am $age years old.");
  totalCalls++;
}

void addNumbers(int a, int b) {
  int sum = a + b;
  print('Sum of $a and $b is $sum');
  totalCalls++;
}

double calculateDiscount({required double price, double discount = 6, double tax = 10, required String city}) {
  totalCalls++;
  double finalPrice1 = price;
  double finalPrice2 = price - (price * discount / 100);
  double finalPrice3 = price - (price * discount / 100) + (price * tax / 100);

  if (city == "bishkek"){
    return finalPrice1;
  }
  else if (city == "BISHKEK"){
    return finalPrice2;
  }
  else {
    return finalPrice3;
  }
}
