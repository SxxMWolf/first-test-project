
CREATE TABLE Customer (
    CustomerID VARCHAR(50),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    PRIMARY KEY(CustomerID)
   );

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber) VALUES 
('CUST0001', 'Jane', 'Doe', 'janedoe@example.com', '987-654-3210'),
('CUST0002', 'Bob', 'Smith', 'bobsmith@example.com', '555-555-5555'),
('CUST0003', 'Alice', 'Johnson', 'alicejohnson@example.com', '111-222-3333'),
('CUST0004', 'Sarah', 'Lee', 'sarahlee@example.com', '456-789-0123'),
('CUST0005', 'Michael', 'Chen', 'michaelchen@example.com', '987-654-3210'),
('CUST0006', 'Emily', 'Park', 'emilypark@example.com', '111-222-3333'),
('CUST0007', 'David', 'Kim', 'davidkim@example.com', '444-555-6666'),
('CUST0008','Jessica', 'Choi', 'jessicachoi@example.com', '777-888-9999'),
('CUST0009', 'Daniel', 'Kang', 'danielkang@example.com', '222-333-4444'),
('CUST0010', 'Olivia', 'Yoon', 'oliviayoon@example.com', '888-999-0000');

-- Room 테이블 생성
CREATE TABLE Room (
    RoomID INT,
    Type VARCHAR(50),
    Price NUMERIC(10,2),
    Status VARCHAR(10), -- 예: "Available", "Booked”
    PRIMARY KEY(RoomID)
);
 
-- Room 테이블에 데이터 삽입
INSERT INTO Room ( RoomID, Type, Price, Status) VALUES
(101, 'Single', 1000.50, 'Cleaned'),
(102, 'Suite', 1000.50, 'NotYet'),
(103, 'Double', 1500.75, 'Cleaned'),
(104, 'Double', 1500.25, 'Cleaned'),
(105, 'Suite', 3000.00, 'NotYet'),
(201, 'Single', 1000.50, 'NotYet'),
(202, 'Double', 1000.25, 'Cleaned'),
(203, 'Double', 1500.25, 'NotYet'),
(204, 'Double', 1500.50, 'Cleaned'),
(205, 'Suite', 3000.75, 'Cleaned');

CREATE TABLE Booking (
    BookingID INT,
    CustomerID VARCHAR(50),
    RoomID INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    NumberOfGuests INT,
    PRIMARY KEY (BookingID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);

INSERT INTO Booking (BookingID, CustomerID, RoomID, CheckInDate, CheckOutDate, NumberOfGuests) VALUES
(1, 'CUST0001', 103, '2024-06-01', '2024-06-05', 2),   
(2, 'CUST0002', 101, '2024-06-03', '2024-06-06', 1),  
(3, 'CUST0003', 104, '2024-06-04', '2024-06-08', 2), 
(4, 'CUST0004', 102, '2024-06-05', '2024-06-09', 3),  
(5, 'CUST0005', 202, '2024-06-07', '2024-06-10', 2),  
(6, 'CUST0006', 203, '2024-06-08', '2024-06-12', 2),  
(7, 'CUST0007', 201, '2024-06-09', '2024-06-13', 1),  
(8, 'CUST0008', 105, '2024-06-10', '2024-06-15', 4),  
(9, 'CUST0009', 205, '2024-06-11', '2024-06-16', 3),   
(10, 'CUST0010', 204, '2024-06-12', '2024-06-18', 2); 


CREATE TABLE Payment (
    BookingID INT,
    RoomID INT,
    PaymentDate DATE,
    PaymentMethod VARCHAR(50),
    PRIMARY KEY (BookingID, PaymentDate),
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);

INSERT INTO Payment (BookingID, RoomID, PaymentDate, PaymentMethod) VALUES
(1, 103, '2024-05-01', 'Credit Card'),
(2, 101, '2024-05-03', 'Credit Card'),
(3, 104, '2024-05-05', 'Bank Transfer'),
(4, 102, '2024-05-07', 'Credit Card'),
(5, 202, '2024-05-09', 'Bank Transfer'),
(6, 203, '2024-05-16', 'Credit Card'),
(7, 201, '2024-05-17', 'Bank Transfer'),
(8,105, '2024-05-13',  'Credit Card'), 
(9, 205, '2024-05-29', 'Card'),
(10, 204, '2024-05-19', 'Bank Transfer');

/*select * from Customer;
select * from Room;
select * from Booking;
select * from Payment;*/

