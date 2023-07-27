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
let library = new Library
library.addBook(hobbit);
console.log(library.books)
const lib = document.querySelector('.library');
const listOfBooks = library.books;
function listBooks() {
    for (const book of listOfBooks) {
        console.log(book)
        lib.innerHTML += book.name;
        lib.innerHTML += '<br>';
    }
}