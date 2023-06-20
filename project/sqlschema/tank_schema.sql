

CREATE TABLE "Tank" (
	wheels TEXT NOT NULL, 
	chains TEXT NOT NULL, 
	PRIMARY KEY (wheels, chains)
);

CREATE TABLE "Vehicle" (
	wheels TEXT NOT NULL, 
	PRIMARY KEY (wheels)
);
