
CREATE TABLE Customer (
    CustomerID VARCHAR(50),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    PRIMARY KEY(CustomerID)
);

CREATE TABLE Room (
    RoomID INT,
    Type VARCHAR(50),
    Price NUMERIC(10,2),
    Status VARCHAR(10), 
    PRIMARY KEY(RoomID)
);

CREATE TABLE Booking (
    BookingID INT,
    CustomerID VARCHAR(50),
    RoomID INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    NumberOfGuests INT,
    PRIMARY KEY (BookingID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON delete cascade,
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID) ON delete cascade
);

CREATE TABLE Payment (
    BookingID INT,
    RoomID INT,
    PaymentDate DATE,
    PaymentMethod VARCHAR(50),
    PRIMARY KEY (BookingID, PaymentDate),
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID) ON delete cascade,
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID) ON delete cascade
);

CREATE INDEX idx_customer_email ON Customer(Email);
CREATE INDEX idx_customer_phone ON Customer(PhoneNumber);

CREATE INDEX idx_room_status ON Room(Status);

CREATE INDEX idx_booking_checkindate ON Booking(CheckInDate);
CREATE INDEX idx_booking_checkoutdate ON Booking(CheckOutDate);

CREATE INDEX idx_payment_date ON Payment(PaymentDate);
CREATE INDEX idx_payment_method ON Payment(PaymentMethod);





   
