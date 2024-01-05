create Database COMP1350;
use COMP1350;

CREATE TABLE Reserve (
ReserveID VARCHAR(5) PRIMARY KEY,
ReserveName VARCHAR(255),
ReserveLocation VARCHAR(255),
ReserveSize INT
);

CREATE TABLE Vehicle (
VehicleID VARCHAR(5),
ReserveID VARCHAR(5),
VehicleType VARCHAR(255),
VehicleCapacity INT,
VehicleRegoNum VARCHAR(10),
PRIMARY KEY (VehicleID, ReserveID),
FOREIGN KEY (ReserveID) REFERENCES Reserve(ReserveID)
);

CREATE TABLE Tour (
TourID VARCHAR(5) PRIMARY KEY,
TourName VARCHAR(255),
TourCost INT,
TourDuration INT
);

CREATE TABLE Staff (
StaffID VARCHAR(5) PRIMARY KEY,
StaffName VARCHAR(255),
StaffPosition VARCHAR(255),
StaffSalary INT
);

CREATE TABLE VisitorGroup (
VisGroupID VARCHAR(5) PRIMARY KEY,
VisGroupName VARCHAR(255),
VisGroupCountry VARCHAR(255),
VisGroupNumPeople INT
);

CREATE TABLE Booking (
BookingID VARCHAR(5) PRIMARY KEY,
TourID VARCHAR(5),
VehicleID VARCHAR(5),
ReserveID VARCHAR(5),
VisGroupID VARCHAR(5),
StaffID VARCHAR(5),
BookingDate DATE,
BookingTime TIME,
FOREIGN KEY (TourID) REFERENCES Tour(TourID),
FOREIGN KEY (VehicleID, ReserveID) REFERENCES Vehicle(VehicleID, ReserveID),
FOREIGN KEY (VisGroupID) REFERENCES VisitorGroup(VisGroupID),
FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

CREATE TABLE Organisation (
OrganisationID VARCHAR(5) PRIMARY KEY,
OrganisationName VARCHAR(255),
OrganisationManager VARCHAR(255),
OrgContactNumber VARCHAR(20)
);

CREATE TABLE Partnership (
ReserveID VARCHAR(5),
OrganisationID VARCHAR(5),
StartDate DATE,
EndDate DATE,
Amount DECIMAL(10, 2),
PRIMARY KEY (ReserveID, OrganisationID),
FOREIGN KEY (ReserveID) REFERENCES Reserve(ReserveID),
FOREIGN KEY (OrganisationID) REFERENCES Organisation(OrganisationID)
);

CREATE TABLE TourPackage (
PackageTourID VARCHAR(5),
ComponentTourID VARCHAR(5),
FOREIGN KEY (PackageTourID) REFERENCES Tour(TourID),
FOREIGN KEY (ComponentTourID) REFERENCES Tour(TourID)
);


INSERT INTO Reserve (ReserveID, ReserveName, ReserveLocation, ReserveSize) VALUES
('R1', 'Dwesa-Cwebe Nature Reserve', 'Eastern Cape Province', 545),
('R2', 'Caledon Nature Reserve', 'Free State', 230),
('R3', 'Hluhluwe-Umfolozi Game Reserve', 'KwaZulu-Natal', 960),
('R4', 'Kruger National Park', 'Mpumalanga', 999),
('R5', 'De Hoop Nature Reserve', 'Overberg', 572),
('R6', 'Pilanesberg National Park', 'North West Province', 340),
('R7', 'Blyde River Canyon Nature Reserve', 'Mpumalanga', 290);


INSERT INTO Vehicle (VehicleID, ReserveID, VehicleType, VehicleCapacity, VehicleRegoNum) VALUES
('V1', 'R1', 'Bus', 15, 'AVH287'),
('V1', 'R2', 'Off-road 4WD', 8, 'FNG552'),
('V1', 'R3', 'Off-road 4WD', 8, 'MQR858'),
('V1', 'R4', 'Off-road 4WD', 8, 'LMV199'),
('V1', 'R5', 'Van', 10, 'KEV022'),
('V2', 'R1', 'Ute with cage', 6, 'JQB042'),
('V2', 'R3', 'Van', 10, 'BGC222'),
('V2', 'R4', 'Van', 10, 'HTO587'),
('V2', 'R5', 'Ute with cage', 6, 'HMG835'),
('V3', 'R3', 'Bus', 15, 'ZZB964'),
('V3', 'R4', 'Bus', 15, 'UFB445');


INSERT INTO Tour (TourID, TourName, TourCost, TourDuration) VALUES
('T1', 'Premium Tour Package', 500, 6),
('T2', 'Standard Tour Package', 420, 5),
('T3', 'Whale Watching', 200, 3),
('T4', 'Hiking and Biking', 150, 1),
('T5', 'Safari', 250, 2),
('T6', 'Lake Cruise', 300, 2),
('T7', 'Shark Diving', 250, 2);


INSERT INTO Staff (StaffID, StaffName, StaffPosition, StaffSalary) VALUES
('S1', 'Blake Lively', 'Reserve Manager', 120000),
('S2', 'Heath Ledger', 'Tour Guide', 70000),
('S3', 'Sheldon Cooper', 'Tour Guide', 70000),
('S4', 'Jessica Chastain', 'Senior Tour Guide', 80000),
('S5', 'Joaquin Phoenix', 'Junior Tour Guide', 90000);


INSERT INTO VisitorGroup (VisGroupID, VisGroupName, VisGroupCountry, VisGroupNumPeople) VALUES
('VG1', 'Hugh Jackman', 'Australia', 1),
('VG2', 'Zoe Bell', 'New Zealand', 7),
('VG3', 'Nicole Kidman', 'Australia', 5),
('VG4', 'Jackie Chan', 'Hong Kong', 8),
('VG5', 'Kim SooHyun', 'Korea', 14),
('VG6', 'Parkmin Young', 'Korea', 10),
('VG7', 'Maggie Cheung', 'Hong Kong', 3),
('VG8', 'JunJi Hyun', 'Korea', 6);


INSERT INTO Booking (BookingID, TourID, VehicleID, ReserveID, VisGroupID, StaffID, BookingDate, BookingTime) VALUES
('B01', 'T4', 'V1', 'R2', 'VG2', 'S3', '2024-03-29', '10:28:00'),
('B02', 'T4', 'V2', 'R1', 'VG3', 'S3', '2024-07-14', '07:23:00'),
('B03', 'T5', 'V2', 'R5', 'VG1', 'S4', '2023-11-04', '07:40:00'),
('B04', 'T1', 'V2', 'R4', 'VG4', 'S5', '2024-06-23', '06:42:00'),
('B05', 'T1', 'V3', 'R3', 'VG5', 'S2', '2024-11-25', '07:13:00'),
('B06', 'T7', 'V2', 'R5', 'VG1', 'S3', '2024-07-08', '10:55:00'),
('B07', 'T5', 'V1', 'R1', 'VG8', 'S3', '2024-09-04', '06:06:00'),
('B08', 'T3', 'V1', 'R2', 'VG7', 'S4', '2023-10-14', '06:37:00'),
('B09', 'T2', 'V3', 'R3', 'VG6', 'S5', '2024-01-01', '09:07:00'),
('B10', 'T3', 'V1', 'R1', 'VG8', 'S2', '2024-01-18', '08:35:00');


INSERT INTO Organisation (OrganisationID, OrganisationName, OrganisationManager, OrgContactNumber) VALUES
('O1', 'Roll and Rock Corp', 'Elvis Presley', '(60) 2775 8425'),
('O2', 'BlueEyes Corp', 'Frank Sinatra', '(70) 9175 8036'),
('O3', 'Queen and Co', 'Freddie Mercury', '(71) 9126 8504'),
('O4', 'Liz Voices', 'Whitney Houston', '(10) 9647 8708'),
('O5', 'Bad Guys', 'Billie Eilish', '(78) 6686 3940'),
('O6', 'Songbird Supreme', 'Mariah Carey', '(02) 9481 1111');


INSERT INTO Partnership (ReserveID, OrganisationID, StartDate, EndDate, Amount) VALUES
('R1', 'O3', '2021-08-31', '2025-05-30', 508485.00),
('R2', 'O2', '2023-07-20', '2025-08-24', 1632025.00),
('R2', 'O6', '2020-09-22', '2026-04-08', 1420420.00),
('R3', 'O1', '2021-09-01', '2026-03-27', 809930.00),
('R4', 'O4', '2022-04-30', '2023-12-23', 2339079.00),
('R5', 'O5', '2020-12-03', '2025-09-29', 1463627.00);

INSERT INTO TourPackage (PackageTourID, ComponentTourID) VALUES
('T1', 'T4'),
('T2', 'T4'),
('T1', 'T5'),
('T2', 'T6'),
('T1', 'T7');
