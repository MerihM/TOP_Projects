function Book(name = "Unknown", author = "Unknown", pages = 0, status = false) {
    this.name = name;
    this.author = author;
    this.pages = pages;
    if (status)
        this.status = 'Read';
    else
        this.status = 'Not read';
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
const lib = document.querySelector('.library');
const bookTitle = document.querySelector('#title');
const bookAuthor = document.querySelector('#author');
const bookPages = document.querySelector('#pages');
const bookStatus = document.querySelector('#status');
const listOfBooks = library.books;
const myModal = new bootstrap.Modal('#exampleModal')
function listBooks() {
    for (const book of listOfBooks) {
        console.log(book)
        lib.innerHTML += card(book.name, book.author, book.pages, book.status);
    }
}


function addToLibrary() {
    newBook = new Book(bookTitle.value, bookAuthor.value, bookPages.value, bookStatus.checked);
    library.addBook(newBook);
    renderLib();
    myModal.hide();
    bookAuthor.value = bookPages.value = bookTitle.value = "";
    bookStatus.checked = false;
}

function renderLib() {
    while (lib.firstChild) {
        lib.removeChild(lib.firstChild);
    }
    listBooks();
}

function card(title, author, pages, status) {
    return `<div class="card p-0 m-3" style="width: 18rem;">
    <div class="card-header text-center">
      ${title}
    </div>
    <ul class="list-group list-group-flush">
      <li class="list-group-item ">Author: ${author}</li>
      <li class="list-group-item">Number of pages: ${pages} </li>
      <li class="list-group-item">${status} </li>
    </ul>
  </div>`;
}