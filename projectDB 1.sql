CREATE SCHEMA if not exists MoonlitMarvela;
use MoonlitMarvela;




CREATE TABLE IF NOT EXISTS Customer  (
    CustomerID INT PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    Phone_number VARCHAR(15) NOT NULL,
    Email VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE IF NOT EXISTS Room (
    RoomID INT PRIMARY KEY CHECK (RoomID BETWEEN 1 AND 500),
    RoomType ENUM('Single', 'Double', 'Suite') NOT NULL,
    RoomStatus ENUM('Available', 'Reserved', 'Under Maintenance') DEFAULT 'Available',
    Price DECIMAL(6, 2) NOT NULL
);


CREATE TABLE IF NOT EXISTS Reservation (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    CheckinDate DATE NOT NULL,
    CheckoutDate DATE NOT NULL,
    CustomerID INT NOT NULL,
    RoomID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);


CREATE TABLE IF NOT EXISTS Bill (
    BillID INT AUTO_INCREMENT PRIMARY KEY,
    ReservationID INT NOT NULL,
    RoomCharges DECIMAL(6, 2) NOT NULL,
    ServiceCharges DECIMAL(6, 2) DEFAULT 0.00,
    PaymentDetails VARCHAR(11) NOT NULL CHECK (PaymentDetails IN ('Cash', 'Credit Card')),
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID)
);


CREATE TABLE IF NOT EXISTS Staff (
    StaffID INT PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    Phone_number VARCHAR(15) NOT NULL,
    Email VARCHAR(50) UNIQUE NOT NULL,
    WorkingHours INT NOT NULL,
    Salary DECIMAL(7, 2) NOT NULL
); 


CREATE TABLE IF NOT EXISTS Service (
    ServiceID INT AUTO_INCREMENT PRIMARY KEY,
    Description VARCHAR(50) NOT NULL,
    Price DECIMAL(6, 2) NOT NULL
);


CREATE TABLE IF NOT EXISTS Review (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    ReservationID INT NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID)
);

-- Insertion command 



INSERT INTO Customer (CustomerID, fname, lname, Phone_number, Email)
VALUES
(1000000001, 'Rana', 'Alnefaie', '0501234567', 'rana.Alnefaie@gmail.com'),
(1000000002, 'Sarah', 'Almatrafi', '0512345678', 'sarah.Almatrafi@gmail.com'),
(1000000003, 'Tahani', 'Albarqi', '0523456789', 'tahani.Albarqi@gmail.com'),
(1000000004, 'Rawan', 'Almitiri', '0534567890', 'rawan.Almitiri@gmail.com'),
(1000000005, 'Doha', 'Alnabati', '0545678901', 'doha.Alnabati@gmail.com'),
(1000000006, 'Mihad', 'Alahdal', '0556789012', 'mihad.Alahdal@gmail.com'),
(1000000007, 'Shouq', 'Alharby', '0556789013', 'Shouq.Alharby@gmail.com');

INSERT INTO Room (RoomID, RoomType, RoomStatus, Price)
VALUES
(101, 'Single', 'Available', 350.00),
(102, 'Double', 'Reserved', 500.00),
(103, 'Suite', 'Available', 750.00),
(104, 'Single', 'Under Maintenance', 350.00),
(105, 'Double', 'Available', 500.00),
(106, 'Suite', 'Available', 750.00),
(204, 'Single', 'Under Maintenance', 350.00),
(205, 'Double', 'Under Maintenance', 500.00),
(206, 'Suite', 'Under Maintenance', 750.00),
(207, 'Single', 'Under Maintenance', 350.00),
(208, 'Double', 'Reserved', 500.00),
(209, 'Suite', 'Available', 750.00);


INSERT INTO Reservation (CheckinDate, CheckoutDate, CustomerID, RoomID)
VALUES
('2025-02-01', '2025-02-05', 1000000001, 101),
('2025-02-10', '2025-02-15', 1000000002, 102),
('2025-03-01', '2025-03-05', 1000000003, 103),
('2025-03-10', '2025-03-12', 1000000004, 104),
('2025-04-01', '2025-04-03', 1000000005, 105),
('2025-04-05', '2025-04-08', 1000000006, 106);


INSERT INTO Bill (ReservationID, RoomCharges, ServiceCharges, PaymentDetails)
VALUES
(1, 1400.00, 200.00, 'Credit Card'),
(2, 2500.00, 150.00, 'Cash'),
(3, 3000.00, 0.00, 'Credit Card'),
(4, 700.00, 300.00, 'Cash'),
(5, 1000.00, 100.00, 'Credit Card'),
(6, 2250.00, 50.00, 'Cash');


INSERT INTO Staff (StaffID, fname, lname, Position, Phone_number, Email, WorkingHours, Salary)
VALUES
(2000000001, 'Lama', 'Alghamdi', 'Receptionist', '0591234567', 'lama.alghamdi@gmail.com', 40, 4000.00),
(2000000002, 'Noura', 'Alotaibi', 'Housekeeping', '0592345678', 'noura.alotaibi@hotmail.com', 38, 1500.00),
(2000000003, 'Reem', 'Alzahrani', 'Manager', '0593456789', 'reem.alzahrani@yahoo.com', 45, 10000.00),
(2000000004, 'Aseel', 'Alqahtani', 'Chef', '0594567890', 'aseel.alqahtani@outlook.com', 40, 8000.00),
(2000000005, 'Raghad', 'Alshahrani', 'Driver', '0595678901', 'raghad.alshahrani@gmail.com', 35, 2500.00),
(2000000006, 'Sarah', 'Alshehri', 'Spa Specialist', '0596789012', 'sarah.alshehri@hotmail.com', 30, 3000.00);


INSERT INTO Service (Description, Price)
VALUES
('Spa treatment', 200.00),
('Buffet', 150.00),
('Room Cleaning', 0.00),
('Laundry', 50.00),
('Gym', 75.00),
('Food Delivery', 70.00);


INSERT INTO Review (ReservationID, Rating)
VALUES
(1, 5),
(2, 4),
(3, 5),
(4, 3),
(5, 4),
(6, 2);


SELECT * FROM Customer;
SELECT * FROM Room;
SELECT * FROM Reservation;
SELECT * FROM Bill;
SELECT * FROM Staff;
SELECT * FROM Service;
SELECT * FROM Review;

UPDATE Room -- Update
SET RoomStatus = 'Under maintenance'
WHERE RoomID = 102;


UPDATE staff -- Update
SET Salary = Salary * 1.10
WHERE StaffID = 2000000005;


DELETE FROM Review -- Delete
WHERE ReviewID = 6;


SELECT * FROM Room -- where
WHERE RoomStatus = 'Available'
OR RoomStatus = 'Under Maintenance';

SELECT -- GROUP UP
 RoomStatus, COUNT(RoomID) AS TotalRooms 
	FROM Room
GROUP BY RoomStatus;

SELECT -- having
    StaffID,
    fname AS FirstName,
    lname AS LastName,
    WorkingHours
FROM 
    Staff
HAVING 
    WorkingHours >= 35
    ORDER BY WorkingHours DESC;
    
    
SELECT -- Select (Order BY)
    StaffID,
    fname,
    lname,
  	Salary,
	Position
FROM Staff
ORDER BY Salary DESC; 


SELECT -- Subquerie
    fname AS FirstName,
    lname AS LastName,
    Phone_number AS PhoneNumber
FROM 
    Customer
WHERE 
    CustomerID IN (
        SELECT 
            CustomerID
        FROM 
            Reservation
        WHERE 
            RoomID = 102
    );


SELECT -- join
    fname AS FirstName,
    lname AS LastName,
    Phone_number AS PhoneNumber,
    DATEDIFF(r.CheckoutDate, r.CheckinDate) AS DurationInDays,
    (DATEDIFF(r.CheckoutDate, r.CheckinDate) * (SELECT Price FROM Room WHERE RoomID = r.RoomID)) AS FinalAmount
FROM 
    Customer AS c
JOIN 
    Reservation AS r ON c.CustomerID = r.CustomerID;

SELECT 
    BillID,
    RoomCharges,
    ServiceCharges,
    
    (RoomCharges + ServiceCharges) AS TotalCharges,
    (RoomCharges + ServiceCharges) * 0.15 AS Taxes,
    (RoomCharges + ServiceCharges) + ((RoomCharges + ServiceCharges ) * 0.15 ) AS Price
FROM Bill;