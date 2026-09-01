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
