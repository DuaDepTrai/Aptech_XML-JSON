// Lấy dữ liệu sách từ LocalStorage hoặc khởi tạo mảng rỗng nếu không có dữ liệu
let booksData = JSON.parse(localStorage.getItem('booksInfo')) || [];

// Cập nhật danh sách sách trên giao diện
function displayBooks() {
    const booksList = document.getElementById("booksList");
    booksList.innerHTML = ""; // Xóa nội dung cũ

    // Lấy dữ liệu từ localStorage
    const booksData = JSON.parse(localStorage.getItem("books")) || [];

    booksData.forEach((book, index) => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${book.id}</td> <!-- Đảm bảo thuộc tính bookId được truy cập chính xác -->
            <td>${book.name}</td> <!-- Đảm bảo thuộc tính bookName được truy cập chính xác -->
            <td>${book.author}</td>
            <td>${book.genre}</td>
            <td>${book.price}</td>
            <td>${book.publicationDate}</td>
            <td><button onclick="deleteBook(${index})">Delete</button></td>
        `;
        booksList.appendChild(row);
    });
}

// Lưu sách vào LocalStorage
function saveBooks(event) {

    // Lấy giá trị từ các trường input
    const bookId = document.getElementById("bookId").value;
    const bookName = document.getElementById("bookName").value;
    const author = document.getElementById("author").value;
    const genre = document.getElementById("genre").value;
    const price = document.getElementById("price").value;
    const publicationDate = document.getElementById("publicationDate").value;

    // Tạo đối tượng sách
    const book = {
        id: bookId,
        name: bookName,
        author: author,
        genre: genre,
        price: parseFloat(price),
        publicationDate: publicationDate
    };

    // Lấy danh sách sách hiện có từ localStorage
    let books = JSON.parse(localStorage.getItem("books")) || [];

    // Thêm sách mới vào danh sách
    books.push(book);

    // Lưu danh sách sách trở lại localStorage
    localStorage.setItem("books", JSON.stringify(books));

    // Xóa form sau khi lưu
    document.getElementById("bookForm").reset();
    alert("Book added successfully!");
    displayBooks();
}


// Xóa sách khỏi danh sách
function deleteBook(index) {
    booksData.splice(index, 1); // Xóa sách theo index

    // Lưu lại vào LocalStorage
    localStorage.setItem('booksInfo', JSON.stringify(booksData));

    displayBooks(); // Cập nhật lại giao diện
}

// Hiển thị danh sách sách khi tải trang
displayBooks();
