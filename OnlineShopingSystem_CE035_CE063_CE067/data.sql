CREATE DATABASE MobileStore;
USE MobileStore;

CREATE TABLE Mobiles(
    MObileID varchar(50),
    ModelName varchar(20),
    Company varchar(128),
    Storage varchar(10),
    Price int,
    Type varchar(128),
    Image varchar(128),
    PRIMARY KEY (MObileID)
);

CREATE TABLE Users(
    UserID int not null AUTO_INCREMENT,
    UserName varchar(128),
    Password varchar(16),
    PRIMARY KEY (UserID)
);

CREATE TABLE Customer (
	CustomerID int not null AUTO_INCREMENT,
    CustomerName varchar(128),
    CustomerPhone varchar(12),
    PinCode varchar(14),
    CustomerEmail varchar(200),
    CustomerAddress varchar(200),
    CustomerGender varchar(10),
    UserID int,
    PRIMARY KEY (CustomerID),
    CONSTRAINT FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE SET NULL ON UPDATE CASCADE
);


CREATE TABLE `Order`(
	OrderID int not null AUTO_INCREMENT,
    CustomerID int,
    MobileID varchar(50),
    DatePurchase datetime,
    Quantity int,
    TotalPrice int,
    Status varchar(1),
    PRIMARY KEY (OrderID),
    CONSTRAINT FOREIGN KEY (MobileID) REFERENCES Mobiles(MobileID) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Cart(
	CartID int not null AUTO_INCREMENT,
    CustomerID int,
    MobileID varchar(50),
    Price int,
    Quantity int,
    TotalPrice int,
    PRIMARY KEY (CartID),
    CONSTRAINT FOREIGN KEY (MobileID) REFERENCES Mobiles(MobileID) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE SET NULL ON UPDATE CASCADE
);


INSERT INTO `Mobiles`(`MobileID`, `ModelName`, `Company`, `Storage`, `Price`,`Image`) VALUES ('M-001','Samsung note 22 ultra','Samsung',128,'100000','images/mobileproject1.jpg');
INSERT INTO `Mobiles`(`MobileID`, `ModelName`, `Company`, `Storage`, `Price`,`Image`) VALUES ('M-002','Nokia','Nokia',128,'10000','images/mobileproject2.jpg');
INSERT INTO `Mobiles`(`MobileID`, `ModelName`, `Company`, `Storage`, `Price`,`Image`) VALUES ('M-003','Rog phone 5 pro','Asus',128,'49999','images/mobileproject3.jpg');
INSERT INTO `Mobiles`(`MobileID`, `ModelName`, `Company`, `Storage`, `Price`,`Image`) VALUES ('M-004','iphome 12','Apple',128,'69999','images/mobileproject4.jpg');