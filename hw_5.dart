class Book {
  String _title;
  String _author;
  double _rating;

  Book(this._title, this._author) : _rating = 0.0;

  Book.withRating(this._title, this._author, double rating) : _rating = 0 {
    this.rating = rating;
  }

  String get title => _title;
  String get author => _author;
  double get rating => _rating;

  set rating(double value) {
    if (value >= 0 && value <= 10) {
      _rating = value;
    } else {
      print('Rating must be between 0 and 10');
    }
  }

  void displayInfo() {
    print('Title: $_title');
    print('Author: $_author');
    print('Rating: $_rating');
  }

  String toString() => _title;
}

class Library {
  String name;
  List<Book> _books;

  int get totalBooks => _books.length;

  Library(this.name) : _books = [];

  void addBook(Book book) {
    _books.add(book);
  }

  void showBooks() {
    print('Library: $name');
    print('Books list:');

    for (int i = 0; i < _books.length; i++) {
      print('${i + 1}. ${_books[i]}');
    }
  }
}

void main() {

  Book book1 = Book.withRating('Harry Potter', 'J.K. Rowling', 9.5);
  Book book2 = Book('Sherlock Holmes', 'Arthur Conan Doyle');
  Book book3 = Book('The Hobbit', 'J.R.R. Tolkien');
  
  book1.displayInfo();


  print('----------------');
  Library library = Library('City Library');
  library.addBook(book1);
  library.addBook(book2);

  library.showBooks();

  print('----------------');

  Library cityLib = Library('City Library');
  cityLib.addBook(book1);
  cityLib.addBook(book2);
  cityLib.addBook(book3);

  cityLib.showBooks();

  print('Total books in library: ${cityLib.totalBooks}');
  
}


