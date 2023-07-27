function Book(name = "Unknown", author = "Unknown", pages = 0, status = false) {
    this.name = name;
    this.author = author;
    this.pages = pages;
    this.status = status;
}

function Library() {
    this.books = [];

    this.addBook = function (book) {
        if (!this.inLibrary(book))
            this.books.push(book);
    }

    this.inLibrary = function (checkBook) {
        return this.books.some((book) => book.name === checkBook.name);
    }

    this.removeBook = function (title) {
        this.books = this.books.filter((book) => book.name !== title)
    }
}

hobbit = new Book("The Hobbit", "J.R.R. Tolkien", "295", true);
hobbit2 = new Book("Hobbit1", "J.R.R. Tolkien", "295", true);
library = new Library;
library.addBook(hobbit);
library.addBook(hobbit2);

console.log(library.books);

library.removeBook("Hobbit1");
console.log(library.books);