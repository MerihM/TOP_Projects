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


hobbit = new Book('The Hobbit', "J.R.R. Tolkien", 295, false)
hobbit1 = new Book('The Hobbit1', "J.R.R. Tolkien", 295, false)
hobbit2 = new Book('The Hobbit2', "J.R.R. Tolkien", 295, false)
hobbit3 = new Book('The Hobbit3', "J.R.R. Tolkien", 295, false)
let library = new Library
library.addBook(hobbit);
library.addBook(hobbit1);
library.addBook(hobbit2);
library.addBook(hobbit3);
console.log(library.books)
const lib = document.querySelector('.library');
const listOfBooks = library.books;
function listBooks() {
    for (const book of listOfBooks) {
        console.log(book)
        lib.innerHTML += card(book.name, book.author, book.pages, book.status);
    }
}

function card(title, author, pages, status) {
    return `<div class="card p-0 m-3" style="width: 18rem;">
    <div class="card-header text-center">
      ${title}
    </div>
    <ul class="list-group list-group-flush">
      <li class="list-group-item ">Author: ${author}</li>
      <li class="list-group-item">Number of pages: ${pages} </li>
      <li class="list-group-item">Read? ${status} </li>
    </ul>
  </div>`;
}