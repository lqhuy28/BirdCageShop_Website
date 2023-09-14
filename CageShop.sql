CREATE DATABASE CageShop

CREATE TABLE tblCage (
    CageID int NOT NULL PRIMARY KEY,
    CageNumber int NOT NULL,
    CagePrice money,
	Quantity int,
	CageImage nvarchar(255),
	CageDescription nvarchar(255),
	CageStatus bit,
	CageName nvarchar(255) 	
);

CREATE TABLE tblCageCategory (
    Cage nvarchar(255) NOT NULL,
    Accessory nvarchar(255) NOT NULL,
);

CREATE TABLE tblProducts (
    ProductID nvarchar(255) NOT NULL PRIMARY KEY,
    ProductName nvarchar(255) NOT NULL,
    ProductDetails nvarchar(255),
    ProductPrice money,
	ProductImage nvarchar(255),
	Quantity int,
	ProductStatus bit,
);

CREATE TABLE tblAccessory (
    AccessoryID nvarchar(255) NOT NULL PRIMARY KEY,
    AccessoryName nvarchar(255) NOT NULL,
    AccessoryMaterials nvarchar(255),
    AccessoryImage nvarchar(255),
	Quantity int,
	AccessoryStatus bit,
);

CREATE TABLE tblCustomers (
    UserID nvarchar(255) NOT NULL PRIMARY KEY,
    FullName nvarchar(255) NOT NULL,
	Password nvarchar(255) NOT NULL,
    Phone int,
    Email nvarchar(255),
	Address nvarchar(255),
);

CREATE TABLE tblFeedback (
	UserID nvarchar(255) FOREIGN KEY REFERENCES tblCustomers(UserID),
    FullName nvarchar(255) PRIMARY KEY,
	Rating nvarchar(255),
	Comment nvarchar(255),
);

CREATE TABLE tblOrders (
    OrderID nvarchar(255) NOT NULL PRIMARY KEY,
    OrderDate date NOT NULL,
    Delivery nvarchar(255),
	DeliveryDate date,
    OrderStatus bit,
	OrderBy nvarchar(255)
	FOREIGN KEY REFERENCES tblCustomers(UserID),
	Discount money,
);

CREATE TABLE tblOrderDetails (
    OrderID nvarchar(255) NOT NULL 
	FOREIGN KEY REFERENCES tblOrders(OrderID),
    ProductID nvarchar(255) NOT NULL
	FOREIGN KEY REFERENCES tblProducts(ProductID),
    ProductName nvarchar(255) ,
    Price money,
	Image nvarchar(255),
);

CREATE TABLE tblInvoice (
    InvoiceID nvarchar(255) NOT NULL PRIMARY KEY,
    InvoiceStatus nvarchar(255),
    OrderBy nvarchar(255) 
	FOREIGN KEY REFERENCES tblCustomers(UserID),
    ProductID nvarchar(255) NOT NULL
	FOREIGN KEY REFERENCES tblProducts(ProductID),
	CreatedDate date,
	Discount money,
);