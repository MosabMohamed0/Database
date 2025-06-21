-- Drop and create database
DROP DATABASE IF EXISTS `BOOK`;
CREATE DATABASE `BOOK`;
USE `BOOK`;

-- Create tables without constraints
CREATE TABLE User (
    User_id INT NOT NULL,
    username VARCHAR(60),
    email VARCHAR(60),
    password VARCHAR(60),
    phone VARCHAR(60),
    address VARCHAR(60)
);

CREATE TABLE Book_Order (
    Order_id INT NOT NULL,
    total_amount INT,
    shipping_address VARCHAR(60),
    tracking_number INT,
    order_status VARCHAR(30),
    payment_status VARCHAR(60),
    order_date DATE
);

CREATE TABLE Book (
    Book_id INT NOT NULL,
    Price INT,
    rating INT,
    page_count INT,
    describtion VARCHAR(500),
    Language VARCHAR(60),
    date DATE
);

CREATE TABLE Admin (
    Admin_id INT NOT NULL,
    Admin_name VARCHAR(60),
    password VARCHAR(60)
);

CREATE TABLE Category (
    Cat_id INT NOT NULL,
    Cat_name VARCHAR(60)
);

CREATE TABLE Publisher (
    Publisher_name VARCHAR(60),
    email VARCHAR(60)
);

CREATE TABLE Author (
    Author_name VARCHAR(60),
    nationality VARCHAR(60),
    Book_id INT
);

CREATE TABLE Wishlist (
    user_id INT NOT NULL,
    Book_id INT NOT NULL
);

CREATE TABLE Cart (
    user_id INT NOT NULL,
    Book_id INT NOT NULL,
    quantity INT
);

CREATE TABLE Order_items (
    Book_id INT NOT NULL,
    Order_id INT NOT NULL,
    quantity INT
);

CREATE TABLE Book_Category (
    Cat_id INT NOT NULL,
    Book_id INT NOT NULL
);

CREATE TABLE Book_Publisher (
    Publisher_name VARCHAR(60) NOT NULL,
    Book_id INT NOT NULL
);

CREATE TABLE User_Order (
    Order_id INT NOT NULL,
    user_id INT
);


-- Add PRIMARY KEY constraints
ALTER TABLE User ADD PRIMARY KEY (User_id);

ALTER TABLE Book_Order ADD PRIMARY KEY (Order_id);

ALTER TABLE Book ADD PRIMARY KEY (Book_id);

ALTER TABLE Admin ADD PRIMARY KEY (Admin_id);

ALTER TABLE Category ADD PRIMARY KEY (Cat_id);

ALTER TABLE Publisher ADD PRIMARY KEY (Publisher_name);

ALTER TABLE Wishlist ADD PRIMARY KEY (user_id,Book_id);

ALTER TABLE Cart ADD PRIMARY KEY (user_id,Book_id);

ALTER TABLE Order_items ADD PRIMARY KEY (Book_id,Order_id);

ALTER TABLE Book_Category ADD PRIMARY KEY (Cat_id, Book_id);

ALTER TABLE Book_Publisher ADD PRIMARY KEY (Publisher_name, Book_id);

ALTER TABLE User_Order ADD PRIMARY KEY (Order_id);


-- Add FOREIGN KEY constraints
ALTER TABLE Author 
ADD CONSTRAINT fk_author_book 
FOREIGN KEY (Book_id) REFERENCES Book(Book_id);

ALTER TABLE Wishlist 
ADD CONSTRAINT fk_wishlist_user 
FOREIGN KEY (user_id) REFERENCES User(User_id);

ALTER TABLE Cart 
ADD CONSTRAINT fk_cart_user 
FOREIGN KEY (user_id) REFERENCES User(User_id);

ALTER TABLE Order_items 
ADD CONSTRAINT fk_orderitems_book 
FOREIGN KEY (Book_id) REFERENCES Book(Book_id);

ALTER TABLE Book_Category 
ADD CONSTRAINT fk_bookcategory_cat 
FOREIGN KEY (Cat_id) REFERENCES Category(Cat_id),
ADD CONSTRAINT fk_bookcategory_book 
FOREIGN KEY (Book_id) REFERENCES Book(Book_id);

ALTER TABLE Book_Publisher 
ADD CONSTRAINT fk_bookpublisher_book 
FOREIGN KEY (Book_id) REFERENCES Book(Book_id),
ADD CONSTRAINT fk_bookpublisher_publisher 
FOREIGN KEY (Publisher_name) REFERENCES Publisher(Publisher_name);

ALTER TABLE User_Order 
ADD CONSTRAINT fk_userorder_user 
FOREIGN KEY (user_id) REFERENCES User(User_id),
ADD CONSTRAINT fk_userorder_order 
FOREIGN KEY (Order_id) REFERENCES Book_Order(Order_id);


-- Inserting Users
INSERT INTO User (User_id, username, email, password, phone, address) VALUES
(1, 'john_doe', 'john@example.com', 'pass123', 1234567890, '123 Elm St'),
(2, 'jane_smith', 'jane@example.com', 'secret456', 9876543210, '456 Oak St'),
(3, 'alice_wonder', 'alice@example.com', 'wonder123', 5556667777, '789 Pine St'),
(4, 'bob_builder', 'bob@example.com', 'canwefixit', 4443332222, '321 Maple St'),
(5, 'charlie_delta', 'charlie@example.com', 'delta123', 1231231234, '100 Cedar St'),
(6, 'eva_zen', 'eva@example.com', 'zenmode', 3213214321, '200 Birch St'),
(7, 'mike_hawk', 'mike@example.com', 'hawk789', 4567891234, '22 Walnut Rd'),
(8, 'lucy_heart', 'lucy@example.com', 'heart456', 7891234560, '77 Ivy Ln'),
(9, 'tony_stark', 'tony@example.com', 'ironman', 9998887776, '10880 Malibu Point'),
(10, 'bruce_wayne', 'bruce@example.com', 'batman', 8887776665, 'Wayne Manor');

-- Inserting Admins
INSERT INTO Admin (Admin_id, Admin_name, password) VALUES
(1, 'tech_admin', 'adminpass'),
(2, 'data_admin', 'secure123'),
(3, 'root_admin', 'superuser');

-- Inserting Categories
INSERT INTO Category (Cat_id, Cat_name) VALUES
(1, 'Fiction'),
(2, 'Science'),
(3, 'History'),
(4, 'Technology'),
(5, 'Biography'),
(6, 'Philosophy'),
(7, 'Self-Help'),
(8, 'Poetry'),
(9, 'Drama'),
(10, 'Comics');

-- Inserting Publishers
INSERT INTO Publisher (Publisher_name, email) VALUES
('Penguin Books', 'contact@penguin.com'),
('OReilly Media', 'info@oreilly.com'),
('HarperCollins', 'info@harpercollins.com'),
('MIT Press', 'contact@mitpress.org'),
('Random House', 'random@house.com'),
('Springer', 'info@springer.com'),
('Bloomsbury', 'books@bloomsbury.com'),
('Oxford Press', 'oxford@press.com'),
('Marvel Comics', 'info@marvel.com'),
('DC Comics', 'contact@dc.com');

-- Inserting Books
INSERT INTO Book (Book_id, Price, rating, page_count, describtion, Language, date) VALUES
(101, 150, 4, 350, 'Thrilling fiction novel.', 'English', '2023-08-01'),
(102, 200, 5, 420, 'Advanced science book.', 'English', '2022-05-15'),
(103, 180, 5, 300, 'Biography of inventor.', 'English', '2021-11-20'),
(104, 250, 4, 500, 'Tech innovations.', 'English', '2023-02-15'),
(105, 175, 3, 280, 'Intro to philosophy.', 'English', '2020-03-10'),
(106, 220, 4, 310, 'Improve your habits.', 'English', '2021-07-22'),
(107, 190, 5, 360, 'Ancient history deep dive.', 'English', '2020-12-01'),
(108, 130, 3, 150, 'Poetry collection.', 'English', '2019-06-18'),
(109, 210, 4, 400, 'Science for curious minds.', 'English', '2023-03-11'),
(110, 250, 5, 500, 'Iron Man comics collection.', 'English', '2024-01-10'),
(111, 223, 4, 464, 'Improve your daily habits.', 'German', '2022-06-21'),
(112, 292, 5, 224, 'Travel across continents.', 'Spanish', '2024-02-12'),
(113, 167, 5, 319, 'Classic literature analysis.', 'English', '2021-04-27'),
(114, 207, 3, 487, 'Famous battles reimagined.', 'Arabic', '2022-09-01'),
(115, 212, 4, 312, 'AI and machine learning.', 'English', '2023-01-15'),
(116, 126, 5, 249, 'Poetry collection.', 'French', '2021-12-30'),
(117, 278, 5, 506, 'Guide to meditation.', 'German', '2023-07-03'),
(118, 208, 3, 431, 'Medical innovations today.', 'French', '2022-11-22'),
(119, 153, 4, 207, 'Cybersecurity for beginners.', 'Arabic', '2023-10-14'),
(120, 271, 5, 571, 'Photography and creativity.', 'English', '2022-10-05'),
(121, 230, 4, 410, 'Ancient history insights.', 'Arabic', '2020-05-15'),
(122, 111, 5, 368, 'Love and loss story.', 'English', '2021-01-28'),
(123, 185, 3, 297, 'Fantasy world building.', 'German', '2020-07-07'),
(124, 291, 5, 599, 'Digital marketing 101.', 'French', '2024-04-01'),
(125, 144, 4, 195, 'Nutrition and health tips.', 'Spanish', '2023-09-11'),
(126, 239, 3, 453, 'Real estate investment guide.', 'English', '2023-06-09'),
(127, 109, 5, 179, 'Space colonization future.', 'Arabic', '2021-03-03'),
(128, 298, 4, 489, 'Success habits book.', 'German', '2020-11-19'),
(129, 198, 5, 248, 'Futuristic sci-fi saga.', 'French', '2023-02-28'),
(130, 185, 4, 333, 'Inspiring entrepreneur journey.', 'English', '2022-04-12'),
(131, 134, 3, 362, 'Climate change explained.', 'German', '2021-06-04'),
(132, 265, 5, 574, 'Biography of a great mind.', 'Arabic', '2020-10-17'),
(133, 187, 4, 387, 'Robot uprising tale.', 'English', '2022-01-29'),
(134, 110, 3, 262, 'Ethics in modern world.', 'Spanish', '2021-11-02'),
(135, 270, 5, 417, 'Children\'s fantasy story.', 'French', '2020-08-23'),
(136, 126, 4, 275, 'Psychological thriller.', 'German', '2024-01-04'),
(137, 250, 5, 560, 'Time travel adventure.', 'English', '2023-03-22'),
(138, 157, 3, 199, 'Memoir of a traveler.', 'Spanish', '2022-12-14'),
(139, 220, 4, 443, 'Modern web development.', 'French', '2021-08-25'),
(140, 141, 3, 211, 'Economic theory simplified.', 'Arabic', '2020-01-01'),
(141, 272, 4, 520, 'Quantum computing basics.', 'English', '2023-05-30'),
(142, 122, 5, 238, 'World War history.', 'German', '2020-06-10'),
(143, 234, 4, 311, 'Classic literature analysis.', 'French', '2022-07-19'),
(144, 160, 3, 369, 'Emotional drama tale.', 'Spanish', '2021-10-29'),
(145, 213, 4, 486, 'Famous battles reimagined.', 'Arabic', '2023-08-17'),
(146, 248, 5, 502, 'Entrepreneurial case studies.', 'English', '2023-11-13'),
(147, 115, 3, 176, 'Thrilling fiction novel.', 'German', '2019-05-23'),
(148, 190, 4, 329, 'Space colonization future.', 'French', '2020-09-26'),
(149, 206, 5, 418, 'Deep space exploration.', 'English', '2021-02-08'),
(150, 145, 4, 430, 'Historical fiction based on truth.', 'English', '2023-09-13');

-- Book_Category
INSERT INTO Book_Category (Cat_id, Book_id) VALUES
(1, 101), (2, 102), (5, 103), (4, 104), (6, 105), (7, 106),
(3, 107), (8, 108), (2, 109), (10, 110),(1, 111), (2, 112),
(4, 113), (6, 114), (7, 115), (5, 116),(3, 117), (8, 118), 
(2, 119), (10, 120),(1, 121), (2, 122), (4, 123), (5, 124), 
(6, 125), (7, 126),(3, 127), (8, 128), (2, 129), (10, 130),
(1, 131), (2, 132), (4, 133), (6, 134), (7, 135), (5, 136),
(3, 137), (8, 138), (2, 139), (10, 140),(1, 141), (2, 142), 
(4, 143), (6, 144), (7, 145), (5, 146),(3, 147), (8, 148), 
(2, 149), (10, 150);

-- Book_Publisher
INSERT INTO Book_Publisher (Publisher_name, Book_id) VALUES
('Penguin Books', 101),('OReilly Media', 102),
('HarperCollins', 103),('MIT Press', 104),('Random House', 105),('Springer', 106),
('Bloomsbury', 107),('Oxford Press', 108),('Springer', 109),('Marvel Comics', 110),
('Penguin Books', 111),('OReilly Media', 112),('HarperCollins', 113),('MIT Press', 114),
('Random House', 115),('Springer', 116),('Bloomsbury', 117),('Oxford Press', 118),
('Springer', 119),('Marvel Comics', 120),('Penguin Books', 121),('OReilly Media', 122),
('HarperCollins', 123),('MIT Press', 124),('Random House', 125),('Springer', 126),
('Bloomsbury', 127),('Oxford Press', 128),('Springer', 129),('Marvel Comics', 130),
('Penguin Books', 131),('OReilly Media', 132),('HarperCollins', 133),('MIT Press', 134),
('Random House', 135),('Springer', 136),('Bloomsbury', 137),('Oxford Press', 138),
('Springer', 139),('Marvel Comics', 140),('Penguin Books', 141),('OReilly Media', 142),
('HarperCollins', 143),('MIT Press', 144),('Random House', 145),('Springer', 146),
('Bloomsbury', 147),('Oxford Press', 148),('Springer', 149),('Marvel Comics', 150);


-- Authors
INSERT INTO Author (Author_name, nationality, Book_id) VALUES
('Emily Bronte', 'British', 101),
('Carl Sagan', 'American', 102),
('Walter Isaacson', 'American', 103),
('Ray Kurzweil', 'American', 104),
('Plato', 'Greek', 105),
('James Clear', 'American', 106),
('Yuval Harari', 'Israeli', 107),
('Rumi', 'Persian', 108),
('Bill Nye', 'American', 109),
('Stan Lee', 'American', 110),
('Emily Bronte', 'British', 111),
('Carl Sagan', 'American', 112),
('Walter Isaacson', 'American', 113),
('Ray Kurzweil', 'American', 114),
('Plato', 'Greek', 115),
('James Clear', 'American', 116),
('Yuval Harari', 'Israeli', 117),
('Rumi', 'Persian', 118),
('Bill Nye', 'American', 119),
('Yuval Harari', 'Israeli', 120),
('Walter Isaacson', 'American', 121),
('Ray Kurzweil', 'American', 122),
('Plato', 'Greek', 123),
('James Clear', 'American', 124),
('Yuval Harari', 'Israeli', 125),
('Rumi', 'Persian', 126),
('Bill Nye', 'American', 127),
('Stan Lee', 'American', 128),
('Emily Bronte', 'British', 129),
('Carl Sagan', 'American', 130),
('Walter Isaacson', 'American', 131),
('Ray Kurzweil', 'American', 132),
('Plato', 'Greek', 133),
('James Clear', 'American', 134),
('Yuval Harari', 'Israeli', 135),
('Rumi', 'Persian', 136),
('Bill Nye', 'American', 137),
('Yuval Harari', 'Israeli', 138),
('Emily Bronte', 'British', 139),
('Carl Sagan', 'American', 140),
('Walter Isaacson', 'American', 141),
('Ray Kurzweil', 'American', 142),
('Plato', 'Greek', 143),
('James Clear', 'American', 144),
('Yuval Harari', 'Israeli', 145),
('Rumi', 'Persian', 146),
('Bill Nye', 'American', 147),
('Stan Lee', 'American', 148),
('Emily Bronte', 'British', 149),
('Carl Sagan', 'American', 150);


-- Book Orders
INSERT INTO Book_Order (Order_id, total_amount, shipping_address, tracking_number, order_status, payment_status, order_date) VALUES
(201, 150, '123 Elm St', 1001, 'Shipped', 'Paid', '2024-01-10'),
(202, 200, '456 Oak St', 1002, 'Processing', 'Unpaid', '2024-01-12'),
(203, 180, '789 Pine St', 1003, 'Delivered', 'Paid', '2024-01-20'),
(204, 250, '321 Maple St', 1004, 'Cancelled', 'Refunded', '2024-02-01'),
(205, 175, '100 Cedar St', 1005, 'Processing', 'Unpaid', '2024-02-14'),
(206, 220, '200 Birch St', 1006, 'Delivered', 'Paid', '2024-03-01'),
(207, 210, '22 Walnut Rd', 1007, 'Shipped', 'Paid', '2024-03-11'),
(208, 130, '77 Ivy Ln', 1008, 'Delivered', 'Paid', '2024-03-20'),
(209, 250, '10880 Malibu Point', 1009, 'Delivered', 'Paid', '2024-04-01'),
(210, 250, 'Wayne Manor', 1010, 'Shipped', 'Paid', '2024-04-03'),
(211, 300, '123 Elm St', 1011, 'Shipped', 'Paid', '2025-03-20');

-- User_Order
INSERT INTO User_Order (Order_id, user_id) VALUES
(201, 1), (202, 2), (203, 3), (204, 4), (205, 5),
(206, 6), (207, 7), (208, 8), (209, 9), (210, 10),(211,1);

-- Order Items
INSERT INTO Order_items (Book_id, Order_id, quantity) VALUES
(101, 201, 1), (102, 202, 2), (103, 203, 1), (104, 204, 1),
(105, 205, 1), (106, 206, 2), (107, 207, 1), (108, 208, 3),
(109, 209, 2), (110, 210, 1), (111, 211, 1), (112, 201, 2),
(113, 202, 1), (114, 203, 1), (115, 204, 2), (116, 205, 1),
(117, 206, 1), (118, 207, 2), (119, 208, 1), (120, 209, 3),
(121, 210, 1), (122, 211, 2), (123, 201, 1), (124, 202, 1),
(125, 203, 2), (126, 204, 1), (127, 205, 3), (128, 206, 1),
(129, 207, 2), (130, 208, 1), (131, 209, 2), (132, 210, 1);

-- Each user wishes for 5 books (user 1: 101–105, user 2: 106–110, etc.)
INSERT INTO Wishlist (user_id, Book_id) VALUES
(1, 101), (1, 102), (1, 103), (1, 104), (1, 105),
(2, 106), (2, 107), (2, 108), (2, 109), (2, 110),
(3, 111), (3, 112), (3, 113), (3, 114), (3, 115),
(4, 116), (4, 117), (4, 118), (4, 119), (4, 120),
(5, 121), (5, 122), (5, 123), (5, 124), (5, 125),
(6, 126), (6, 127), (6, 128), (6, 129), (6, 130),
(7, 131), (7, 132), (7, 133), (7, 134), (7, 135),
(8, 136), (8, 137), (8, 138), (8, 139), (8, 140),
(9, 141), (9, 142), (9, 143), (9, 144), (9, 145),
(10,146), (10,147), (10,148), (10,149), (10,150);

INSERT INTO Cart (user_id, Book_id, quantity) VALUES
(1, 101, 1), (1, 102, 2), (1, 103, 3),
(2, 104, 2), (2, 105, 1), (2, 106, 2),
(3, 107, 3), (3, 108, 1), (3, 109, 2),
(4, 110, 1), (4, 111, 2), (4, 112, 3),
(5, 113, 2), (5, 114, 1), (5, 115, 3),
(6, 116, 1), (6, 117, 2), (6, 118, 2),
(7, 119, 3), (7, 120, 1), (7, 121, 2),
(8, 122, 2), (8, 123, 3), (8, 124, 1),
(9, 125, 1), (9, 126, 2), (9, 127, 3),
(10,128, 3), (10,129, 2), (10,130, 1);









