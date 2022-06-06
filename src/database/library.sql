CREATE DATABASE DBLIBRARY;

CREATE TABLE roles
(
    id SERIAL NOT NULL,
    role_name VARCHAR(50),
    CONSTRAINT roles_pkey PRIMARY KEY (id)
);

CREATE TABLE users
(
    id SERIAL NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    password VARCHAR(50),
    role_id INT REFERENCES roles (id),
    CONSTRAINT users_pkey PRIMARY KEY (id)
);

CREATE TABLE books
(
    id SERIAL NOT NULL,
    title VARCHAR(250),
    author VARCHAR(250),
    published_year INT NOT NULL,
    genre VARCHAR(250),
    copies INT NOT NULL,
    stock INT NOT NULL,
    CONSTRAINT books_pkey PRIMARY KEY (id)
);

CREATE TABLE requests
(
    id SERIAL NOT NULL,
    user_id INT REFERENCES users (id),
    book_id INT REFERENCES books (id),
    request_date TIMESTAMP,
    CONSTRAINT requests_pkey PRIMARY KEY (id)
);

-- CREATING DATA
INSERT INTO roles(role_name) VALUES('student');
INSERT INTO roles(role_name) VALUES('librarian');
-- SELECT * FROM roles;

INSERT INTO users(first_name, last_name, email, password, role_id) VALUES
('Lex', 'Ortiz', 'lortiz@gmail.com', 'focus123', '1'), -- Student
('Tatiana', 'Deras', 'focus@gmail.com', 'focus123', '2'); -- Librarian
-- SELECT * FROM users;

INSERT INTO books(title, author, published_year, genre, copies, stock) VALUES
('Pride and Prejudice', 'Jane Austen', 1813, 'Drama', 20, 19),
('To Kill a Mockingbird', 'Harper Lee', 1960, 'Thriller', 20, 20),
('The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Adventure', 20, 20),
('One Hundred Years of Solitude', 'Gabriel García Márquez', 1967, 'Drama', 20, 20),
('In Cold Blood', 'Truman Capote', 1965, 'Thriller', 20, 20),
('Wide Sargasso Sea', 'Jean Rhys', 1966, 'Adventure ', 15, 14),
('Brave New World', 'Aldous Huxley', 1932, 'Adventure ', 15, 15),
('I Capture The Castle', 'Dodie Smith', 1948, 'Fantasy ', 15, 15),
('Jane Eyre', 'Charlotte Bronte', 1847, 'Drama', 15, 15),
('Crime and Punishment', 'Fyodor Dostoevsky', 1866, 'Thriller', 15, 15),
('The Secret History', 'Donna Tartt', 1992, 'Fantasy ', 10, 9),
('The Call of the Wild', 'Jack London', 1903, 'Fantasy ', 10, 10),
('The Chrysalids', 'John Wyndham', 1955, 'Drama', 10, 10),
('Persuasion', 'Jane Austen', 1818, 'Drama', 10, 10),
('Moby-Dick', 'Herman Melville', 1851, 'Adventure ', 10, 10),
('The Lion, the Witch and the Wardrobe', 'C.S. Lewis', 195, 'Fantasy', 5, 4),
('To the Lighthouse', 'Virginia Woolf', 1927, 'Drama ', 5, 5),
('The Death of the Heart', 'Elizabeth Bowen', 1938, 'Thriller', 5, 5),
('Tess of the d Urbervilles', 'Thomas Hardy', 1891, 'Adventure ', 5, 5),
('Frankenstein', 'Mary Shelley', 1823, 'Thriller', 5, 5);
-- SELECT * FROM books;

INSERT INTO requests(user_id, book_id, request_date) VALUES
(1, 1, current_timestamp),
(1, 6, current_timestamp),
(1, 11, current_timestamp),
(1, 16, current_timestamp);
-- SELECT * FROM requests;