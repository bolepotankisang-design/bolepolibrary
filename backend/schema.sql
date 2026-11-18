-- ========================================================
-- LIBRARY MANAGEMENT SYSTEM - DATABASE SCHEMA & SEED DATA
-- Database Name: librarydb
-- ========================================================

CREATE DATABASE IF NOT EXISTS librarydb
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE librarydb;

-- --------------------------------------------------------
-- 1. Table structure for table `books`
-- --------------------------------------------------------
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS books;

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(150) NOT NULL,
    genre VARCHAR(100) NOT NULL,
    isbn VARCHAR(50) NOT NULL UNIQUE,
    quantity INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- --------------------------------------------------------
-- 2. Table structure for table `users`
-- --------------------------------------------------------
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    membership_id VARCHAR(50) NOT NULL UNIQUE,
    role ENUM('Admin', 'Librarian', 'Member') NOT NULL DEFAULT 'Member',
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- --------------------------------------------------------
-- 3. Table structure for table `transactions`
-- --------------------------------------------------------
CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    user_id INT NOT NULL,
    transaction_type ENUM('BORROW', 'RETURN', 'ADD_STOCK') NOT NULL,
    quantity INT NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_transactions_book FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_transactions_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- --------------------------------------------------------
-- 4. Initial Seed Data
-- Default password for seeded users is: admin1234
-- (System Admin also available with: MONYOOE666NYOKS777)
-- --------------------------------------------------------

-- Seed Users
INSERT INTO users (id, name, membership_id, role, password_hash) VALUES
(1, 'Bolepo Tankisang', 'LIB001', 'Admin', '$2b$10$T5AzMxWwCXYQzWWpjPbPfOoY/nh7z/4AX/nLHxXNGqu.o4XH.N/u2'),
(2, 'Monyooe Moalosi', 'LIB002', 'Librarian', '$2b$10$T5AzMxWwCXYQzWWpjPbPfOoY/nh7z/4AX/nLHxXNGqu.o4XH.N/u2'),
(3, 'Moeketsi Ratopa', 'MEM001', 'Member', '$2b$10$T5AzMxWwCXYQzWWpjPbPfOoY/nh7z/4AX/nLHxXNGqu.o4XH.N/u2'),
(4, 'System Admin', 'ADMIN001', 'Admin', '$2b$10$XqOk5yQubiQyQvWVBsoe8.yG9kmfiePVjOATyPqqrVXCnouEtVse6');

-- Seed Books
INSERT INTO books (id, title, author, genre, isbn, quantity) VALUES
(1, 'Introduction to Java Programming', 'John Smith', 'Computer Science', '9781234567890', 15),
(2, 'Web Design and Development Fundamentals', 'Monyooe Moalosi', 'Technology', '9780131103627', 8),
(3, 'Database System Concepts', 'Abraham Silberschatz', 'Database Systems', '9780073523323', 1),
(4, 'Clean Code: Handbook of Software Craftsmanship', 'Robert C. Martin', 'Software Engineering', '9780132350884', 5),
(5, 'Data Communications and Networking', 'Behrouz A. Forouzan', 'Networking', '9780073376226', 4);

-- Seed Transactions
INSERT INTO transactions (id, book_id, user_id, transaction_type, quantity, transaction_date) VALUES
(1, 1, 3, 'BORROW', 1, NOW() - INTERVAL 2 DAY),
(2, 2, 2, 'ADD_STOCK', 5, NOW() - INTERVAL 1 DAY),
(3, 1, 3, 'RETURN', 1, NOW());
