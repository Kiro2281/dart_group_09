import 'book.dart';

void main() {
  
  Book book1 = Book.withRating('Harry Potter', 'J.K. Rowling', 9.5);
  Book book2 = Book('Sherlock Holmes', 'Arthur Conan Doyle');
  Book book3 = Book('The Hobbit', 'J.R.R. Tolkien');

  Library cityLib = Library('City Library');
  cityLib.addBook(book1);
  cityLib.addBook(book2);
  cityLib.addBook(book3);

  cityLib.showBooks();

  print('Total books in library: ${cityLib.totalBooks}');
}