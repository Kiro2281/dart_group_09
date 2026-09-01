import 'book.dart';

void main() {
  Book book1 = Book.withRating('Harry Potter', 'J.K. Rowling', 9.5);
  Book book2 = Book('Sherlock Holmes', 'Arthur Conan Doyle');

  Library library = Library('City Library');
  library.addBook(book1);
  library.addBook(book2);

  library.showBooks();
}