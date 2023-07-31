function Book(name = "Unknown", author = "Unknown", pages = 0, status = false, id = index) {
    this.name = name;
    this.author = author;
    this.pages = pages;
    this.id = id;
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


let library = new Library
let lib = document.querySelector('.library');
const bookTitle = document.querySelector('#title');
const bookAuthor = document.querySelector('#author');
const bookPages = document.querySelector('#pages');
const bookStatus = document.querySelector('#status');
const myModal = new bootstrap.Modal('#exampleModal');
let index = 0;
function listBooks() {
    for (const book of library.books) {
        lib.innerHTML += card(book.name, book.author, book.pages, book.status, book.id);
        index++;
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
    lib = document.querySelector('.library');
    while (lib.firstChild) {
        lib.removeChild(lib.firstChild);
    }
    listBooks();
}

function deleteBook(title) {
    library.removeBook(title);
    renderLib();
}

function card(title, author, pages, status, id) {
    return `<div class="card p-0 m-3" style="width: 18rem;" id="book-${id}">
    <div class="card-header text-center">
      ${title}
    </div>
    <ul class="list-group list-group-flush">
      <li class="list-group-item ">Author: ${author}</li>
      <li class="list-group-item">Number of pages: ${pages} </li>
      <li class="list-group-item">${status} </li>
      <li class="list-group-item btn btn-outline-danger rounded-0" onclick="deleteBook('${title}')">Delete from library</li>
    </ul>
  </div>`;
}