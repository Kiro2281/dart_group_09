class Person {
  String fullName;
  int age;
  bool isMarried;

  Person(this.fullName, this.age, this.isMarried);

  void introduce() {
    print(
      'Hi! My name is $fullName. I am $age years old. '
      'Married: ${isMarried ? 'Yes' : 'No'}.',
    );
  }
}

enum Subject { math, physics, english }

class Student extends Person {
  Map<Subject, double> marks;

  Student(String fullName, int age, bool isMarried, this.marks) : super(fullName, age, isMarried);

  void showMarks() {
    print('Student: $fullName');
    for (var entry in marks.entries) {
      print('${entry.key.name}: ${entry.value}');
    }
  }

  double calculateAverage() {
    if (marks.isEmpty) {
      return 0;
    }

    double sum = 0;
    for (var mark in marks.values) {
      sum += mark;
    }
    return sum / marks.length;
  }

  @override
  void introduce() {
    super.introduce();
    print('Average mark: ${calculateAverage()}');
  }
}

class Teacher extends Person {
  int experience;
  static double _baseSalary = 50000;

  Teacher(String fullName, int age, bool isMarried, this.experience)
    : super(fullName, age, isMarried);

  double calculateSalary() {
    double salary = _baseSalary;
    for (int year = 4; year <= experience; year++) {
      salary *= 1.05;
    }
    if (isMarried) {
      salary += 5000;
    }
    return salary;
  }

  @override
  void introduce() {
    super.introduce();
    print('Experience: $experience years.');
    print('Salary: ${calculateSalary()}');
  }
}

void main() {
  Person person = Person('Alice Johnson', 30, true);
  person.introduce();
  print('');

  Student student = Student('Adam White', 17, false, {
    Subject.math: 90.0,
    Subject.physics: 85.0,
    Subject.english: 92.0,
  });

  Student student2 = Student('Alice Johnson', 18, false, {
    Subject.math: 88.0,
    Subject.physics: 91.0,
    Subject.english: 95.0,
  });

  student.introduce();
  student.showMarks();

  student2.introduce();
  student2.showMarks();

  Teacher teacher = Teacher('John Brown', 40, false, 10);
  teacher.introduce();
}
