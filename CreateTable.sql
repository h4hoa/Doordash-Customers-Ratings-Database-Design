CREATE TABLE "Promotion" (
	"PromoID"	INTEGER NOT NULL UNIQUE,
	"Details"	TEXT,
	"Type"	TEXT,
	PRIMARY KEY("PromoID")
);

CREATE TABLE "Category" (
	"CatID"	INTEGER NOT NULL UNIQUE,
	"Name"	TEXT NOT NULL UNIQUE,
	"Type"	TEXT,
	PRIMARY KEY("CatID")
);


CREATE TABLE "Shippers" (
	"ShipID"	INTEGER NOT NULL UNIQUE,
	"Name"	TEXT,
	"PhoneNo"	TEXT,
	"Vehicle" TEXT,
	"Ship_Rate" REAL,
	PRIMARY KEY("ShipID")
);

CREATE TABLE "Orders" (
	"OrderID"	INTEGER NOT NULL UNIQUE,
	"ResID"	TEXT,
	"ShipID"	INTEGER,
	"ZipID"	TEXT,
	"Date"	TEXT,
	"PayID"	INTEGER,
	"PromoID"	INTEGER,
	PRIMARY KEY("OrderID"),
	FOREIGN KEY("ResID") REFERENCES "Restaurants" ("ResID"),
	FOREIGN KEY("PromoID") REFERENCES "Promotion" ("PromoID"),
	FOREIGN KEY("ShipID") REFERENCES "Shippers" ("ShipID"),
	FOREIGN KEY("ZipID") REFERENCES "ZipCode" ("ZipID"),
	FOREIGN KEY("PayID") REFERENCES "Payment" ("PayID")
);

CREATE TABLE "Payment" (
	"PayID"	TEXT NOT NULL UNIQUE,
	"Method"	TEXT,
	"Notes"	TEXT,
	PRIMARY KEY("PayID")
);

CREATE TABLE "Ratings" (
	"RateID"	TEXT NOT NULL UNIQUE,
	"OrderID"	INTEGER NOT NULL,
	"ResID"	TEXT NOT NULL,
	"ShipID"	INTEGER NOT NULL,
	"OrderRating"	REAL,
	"ResRating"	INTEGER,
	"ShipRating"	INTEGER,
	PRIMARY KEY("RateID"),
	FOREIGN KEY("OrderID") REFERENCES "Orders" ("OrderID"),
	FOREIGN KEY("ResID") REFERENCES "Restaurants" ("ResID"),
	FOREIGN KEY("ShipID") REFERENCES "Shippers" ("ShipID")
);

CREATE TABLE "Restaurants" (
	"ResID"	TEXT NOT NULL UNIQUE,
	"Name"	TEXT,
	"PhoneNo"	TEXT,
	"Address"	TEXT,
	"Category"	TEXT,
	"Res_Rate"	REAL,
	"Status"	TEXT,
	PRIMARY KEY("ResID")
);

CREATE TABLE "ZipCode" (
	"ZipID"	TEXT NOT NULL UNIQUE,
	"ZipCode"	TEXT NOT NULL,
	PRIMARY KEY("ZipID")
);