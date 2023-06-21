

CREATE TABLE "Tank" (
	chains TEXT NOT NULL, 
	wheels TEXT NOT NULL, 
	PRIMARY KEY (chains, wheels)
);

CREATE TABLE "TankCollection" (
	tanks TEXT, 
	PRIMARY KEY (tanks)
);

CREATE TABLE "Vehicle" (
	wheels TEXT NOT NULL, 
	PRIMARY KEY (wheels)
);
