--Author: Alexander Stigliano--
--Date Created: December 1st, 2017--

DROP TABLE IF EXISTS Workers;
DROP TABLE IF EXISTS Bowlers;
DROP TABLE IF EXISTS People;
DROP TABLE IF EXISTS ProShop;
DROP TABLE IF EXISTS ProShopInventoryCheck;
DROP TABLE IF EXISTS BowlingBalls;
DROP TABLE IF EXISTS BowlingShoes;
DROP TABLE IF EXISTS BowlingTape;
DROP TABLE IF EXISTS BowlingTowels;
DROP TABLE IF EXISTS Manufacturer;



CREATE TABLE People 
(
	PID             char (4) not null,
	FirstName       text not null,
	LastName        text not null,
	PhoneNumber     char (12) not null,
	DateOfBirth     DATE,
	primary key(PID)
);


CREATE TABLE Bowlers
(
	PID 			    char (4) not null references People(PID),
	ThrowingHand                text not null,
	HighestScore                integer,
	HighestSeries               integer,
	Number_of_bowling_balls     integer not null,
	primary key(PID)
);


CREATE TABLE Manufacturer
(
	MID			char (4) not null,
	ManufacturerName 	text,
	primary key(MID)
);

CREATE TABLE BowlingBalls
(
	BBID				char (4) not null,
	MID				char (4) not null references Manufacturer(MID),
	BallName			text,
	CoreName			text,
	Finish				text,
	Coverstock			text,
	WeightRangelbs			char (5),
	PriceUSD			numeric (5,2),
	BallQTY				integer,
	CHECK				(BallQTY > 0),
	primary key(BBID)
);
CREATE TABLE BowlingShoes
(
	BSID				char (5) not null,
	MID				char (4) not null references Manufacturer(MID),
	ShoeName			text,
	MenSizes			char (7), 
	WomenSizes			char (7),
	PriceUSD			decimal (5,2),
	ShoeQTY				integer,
	CHECK				(ShoeQTY > 0),
	primary key (BSID)
);
CREATE TABLE BowlingTowels
(
	BTWID			char (6) not null,
	MID			char (4) not null references Manufacturer(MID),
	TowelName		text,
	TowelType		text,
	PriceUSD		decimal (4,2),
	TowelQTY		integer,
	CHECK			(TowelQTY > 0),
	primary key(BTWID)
);
CREATE TABLE BowlingTape
(
	BTID		char (5) not null,
	MID		char (4) not null references Manufacturer(MID),
	TapeName	text,
	PriceUSD	text,
	TapeQTY		integer,
	CHECK		(TapeQTY > 0),
	primary key(BTID)
);

CREATE TABLE ProShopInventoryCheck
(
	IVID				char (5) not null,
	BBID				char (5) not null references BowlingBalls(BBID),
	BSID				char (5) not null references BowlingShoes(BSID),
	BTID				char (5) not null references BowlingTape(BTID),
	BTWID				char (6) not null references BowlingTowels(BTWID),
	primary key(IVID)
);

CREATE TABLE ProShop
(
	ProShopName			text not null,
	IVID				char (4) not null references ProShopInventoryCheck(IVID),
	BowlingAlleyName		text not null,
	City				text not null,
	State				text not null,
	ZipCode				char (5),
	primary key(ProShopName)
);

CREATE TABLE Workers
(
	PID						char (4) not null references People(PID),
	ProShopName					text not null references ProShop(ProShopName),
	number_of_bowling_balls_drilled			integer,
	DateHired					DATE,
	Salary						numeric (10,2),
	primary key (PID)
);


--SQL statements to put in the test data--

INSERT INTO People(PID, FirstName, LastName, PhoneNumber, DateOfBirth)
	VALUES ('p001', 'Nicolas', 'Thompson', '908-123-4567', '1998-02-12');
INSERT INTO PEOPLE(PID, FirstName, LastName, PhoneNumber, DateOfBirth)
	VALUES ('p002', 'Andrew', 'Nickle', '130-123-4567', '1990-01-16');
INSERT INTO PEOPLE(PID, FirstName, LastName, PhoneNumber, DateOfBirth)
	VALUES ('p003', 'Alan', 'Labouseur', '845-575-3832', NULL);
INSERT INTO PEOPLE(PID, FirstName, LastName, PhoneNumber, DateOfBirth)
	VALUES ('p004', 'Amanda', 'Cameron', '908-340-3561', '1985-07-17');
INSERT INTO PEOPLE(PID, FirstName, LastName, PhoneNumber, DateOfBirth)
	VALUES ('p005', 'Steve', 'Guy', '550-320-8775', '1976-04-22');
INSERT INTO PEOPLE(PID, FirstName, LastName, PhoneNumber, DateOfBirth)
	VALUES ('p006',  'Jason', 'Belmonte', '512-432-9943', '1983-07-29');
INSERT INTO PEOPLE(PID, FirstName, LastName, PhoneNumber, DateOfBirth)
	VALUES ('p007', 'Ed', 'Walsh', '908-486-4877', NULL);

/*select *
from People; */

INSERT INTO Bowlers(PID, ThrowingHand, HighestScore, HighestSeries, Number_of_bowling_balls)
	VALUES ('p001', 'Right', 279, 701, '4'),
	       ('p002', 'Left', 130, 521, '2'),
	       ('p003', 'Right', 140, 530, '1'),
	       ('p004', 'Two-Handed', 200, 600, '3'),
	       ('p005', 'Right', 300, 720, '5'),
	       ('p006', 'Two-Handed', 300, 800, '6');
/*select *
from Bowlers; */

INSERT INTO Manufacturer(MID, ManufacturerName)
	VALUES ('M001', 'Motiv'),
	       ('M002', 'Hammer'),
	       ('M003', 'Storm'),
	       ('M004', 'Roto-Grip'),
               ('M005', 'Brunswick');
/*select *
from Manufacturer; */

INSERT INTO BowlingBalls(BBID, MID, BallName, CoreName, Finish, CoverStock, WeightRangelbs, PriceUSD, BallQTY)
	VALUES ('B001', 'M001', 'Trident', 'Turbulent', '3000 Grit Lss', 'Coercion HVH Reactive', '14-16', 259.99, 10);
INSERT INTO BowlingBalls(BBID, MID, BallName, CoreName, Finish, CoverStock, WeightRangelbs, PriceUSD, BallQTY)
	VALUES('B002', 'M001', 'Forza-SS', 'Sigma','3000 Grit Lss', 'Helix HFS Reactive','12-16', 199.99, 4);
INSERT INTO BowlingBalls(BBID, MID, BallName, CoreName, Finish, CoverStock, WeightRangelbs, PriceUSD, BallQTY)
	VALUES ('B003', 'M002', 'Scandal', 'Scandal', '500 / 2000 Abralon', 'Semtex Solid CFI', '12-16', 199.99, 12);
INSERT INTO BowlingBalls(BBID, MID, BallName, CoreName, Finish, CoverStock, WeightRangelbs, PriceUSD, BallQTY)
	VALUES ('B004', 'M003', '!Q Tour Supreme', 'C3 Centripetal Control Core', '1500 Grit Polished', 'Pearl Reactive', '12-16', 230.99, 10);
INSERT INTO BowlingBalls(BBID, MID, BallName, CoreName, Finish, CoverStock, WeightRangelbs, PriceUSD, BallQTY)
	VALUES ('B005', 'M004', 'Dare Devil Trick', 'Madcap Core', '2000 Grit', 'Reckless', '12-16', 150.99, 7);
INSERT INTO BowlingBalls(BBID, MID, BallName, CoreName, Finish, CoverStock, WeightRangelbs, PriceUSD, BallQTY)
	VALUES ('B006', 'M005', 'Kingpin', 'Kingpin Ultra Low RG', '500, 1500 Siaair Micro Pad', 'ECA', '12-16', 99.99, 4);

/* select *
from BowlingBalls; */

INSERT INTO BowlingShoes(BSID, MID, ShoeName, MenSizes, WomenSizes, PriceUSD, ShoeQTY)
	VALUES ('BS001', 'M003', 'SP3', '7-15', '7-14', 40.00, 40);
INSERT INTO BowlingShoes(BSID, MID, ShoeName, MenSizes, WomenSizes, PriceUSD, ShoeQTY)
	VALUES ('BS002', 'M005', 'TZone', '4.5-15', '4.5-15', 35.00, 20);

/* select *
from BowlingShoes; */

INSERT INTO BowlingTowels(BTWID, MID, TowelName, TowelType, PriceUSD, TowelQTY)
	Values ('BTW001', 'M001', 'Competition Towel','100% Cotton Plush', 16.99, 15);
INSERT INTO BowlingTowels(BTWID, MID, TowelName, TowelType, PriceUSD, TowelQTY)
	Values ('BTW002', 'M003', 'Storm Nation Shammy', 'Leather', 19.95, 3);
INSERT INTO BowlingTowels(BTWID, MID, TowelName, TowelType, PriceUSD, TowelQTY)
	Values ('BTW003', 'M004', 'Roto Grip Shammy', 'Leather', 18.99, 28);
INSERT INTO BowlingTowels(BTWID, MID, TowelName, TowelType, PriceUSD, TowelQTY)
	Values ('BTW004', 'M005', 'Micro-Suede Towel', 'Suede', 18.99, 5);
/* select *
from BowlingTowels; */

INSERT INTO BowlingTape (BTID, MID, TapeName, PriceUSD, TapeQTY)
	Values ('BT001', 'M001', 'Flex Tape - Fast Release', 11.99, 40);
INSERT INTO BowlingTape (BTID, MID, TapeName, PriceUSD, TapeQTY)
	Values ('BT002', 'M003', 'Thunder Tape Pre-Cut Strips Roll', 15.95, 39);
INSERT INTO BowlingTape (BTID, MID, TapeName, PriceUSD, TapeQTY)
	Values ('BT003', 'M005', 'Skin Amor Pre Cut Tape', 9.99, 15);

/* select *
from BowlingTape; */

INSERT INTO ProShopInventoryCheck (IVID, BBID, BSID, BTID, BTWID)
	Values( 'IV01', 'B001', 'BS002', 'BT003', 'BTW004');
INSERT INTO ProShopInventoryCheck (IVID, BBID, BSID, BTID, BTWID)
	Values( 'IV02', 'B005', 'BS001', 'BT002', 'BTW001');

/* select *
from ProShopInventoryCheck; */


INSERT INTO ProShop(ProShopName, IVID, BowlingAlleyName, City, State, ZipCode)
	Values('Ed Walsh Pro Shop', 'IV01', 'Jersey Lanes', 'Linden', 'New Jersey', '07036');

/* select *
from ProShop; */

INSERT INTO Workers (PID, ProShopName, number_of_bowling_balls_drilled, DateHired, Salary)
VALUES ('p005', 'Ed Walsh Pro Shop', 560, '1990-09-09', 40000.89),
       ('p007', 'Ed Walsh Pro Shop', 900, '1988-01-04', 40000.43);
/* select *
from Workers; */

--Stored Functions--

CREATE OR REPLACE function BallQuantity(int, REFCURSOR) returns refcursor as
$$
	declare
	Quantity  int		:=$1;
	resultset   REFCURSOR 	:=$2; 

	begin
		open resultset for
			select *
			from   BowlingBalls
			WHERE BallQTY = Quantity;
		return resultset;
	end;
	$$
	language plpgsql;

/*	select BallQuantity (4, 'results');
	Fetch all from results; */

CREATE OR REPLACE function Standings(int, REFCURSOR) returns refcursor as
$$
	declare
	Score int		:=$1;
	resultset   REFCURSOR 	:=$2; 

	begin
		open resultset for
			select People.FirstName, People.LastName, Bowlers.highestseries
			from   Bowlers
			INNER JOIN People ON Bowlers.PID=People.PID
			WHERE Highestseries >= Score;
			
		return resultset;
	end;
	$$
	language plpgsql;

/* Select Standings (500, 'results');
   Fetch all results; */

CREATE OR REPLACE function WalletSaver()
RETURNS TRIGGER AS
$$
begin
	If NEW.priceUSD >= 100.00 THEN
	DELETE from BowlingBalls where priceUSD = new.priceUSD;
	end if;
	return new;
end;
$$
language plpgsql;

--A test for WalletSaver
CREATE trigger WalletSaver
AFTER INSERT ON BowlingBalls
FOR EACH ROW
execute procedure WalletSaver();

/* select *
from BowlingBalls;

INSERT INTO BowlingBalls(BBID, MID, BallName, CoreName, Finish, CoverStock, WeightRangelbs, PriceUSD, BallQTY)
	VALUES('B007', 'M001', 'Raptor Talon', 'Predator', '3000 Grit Laser Scan Sanded', 'Fusion Solid Reactive', '12-16', 530.00, 2); 
INSERT INTO BowlingBalls(BBID, MID, BallName, CoreName, Finish, CoverStock, WeightRangelbs, PriceUSD, BallQTY)
	VALUES('B008', 'M005', 'Red/Black Swirl', 'None', 'Polished', '1000 Pearl', '12-16', 80.00, 5);*/


CREATE OR REPLACE FUNCTION removeFromTowels()
RETURNS TRIGGER AS
$$
begin
   IF NEW.TowelType = 'Leather' THEN
   DELETE from BowlingTowels where towelType = new.towelType;
   END IF;
   RETURN NEW;
END;
$$
language plpgsql;
--A test of the addToTowels--
CREATE TRIGGER removeFromTowels
AFTER INSERT ON BowlingTowels
FOR EACH ROW 
EXECUTE PROCEDURE removeFromTowels();

/*INSERT INTO BowlingTowels(BTWID, MID, TowelName, TowelType, PriceUSD, TowelQTY)
	Values ('BTW005', 'M001', 'Shammy', 'Leather', 18.99, 5); 
  INSERT INTO BowlingTowels(BTWID, MID, TowelName, TowelType, PriceUSD, TowelQTY)
	Values ('BTW006', 'M003', 'Leather Wipe', 'Micro Fiber', 20.99, 5); 
  INSERT INTO BowlingTowels(BTWID, MID, TowelName, TowelType, PriceUSD, TowelQTY)
	Values ('BTW007', 'M002', 'Deluxe Shammy', 'Leather', 24.99, 5); 	*/

/* select *
	from BowlingTowels; */


--Roles--
create role admin;
create role Workers;
create role Bowlers;
GRANT all on all tables in schema public to admin;
GRANT Select, Insert, Update, Delete on Bowlers to Workers;
GRANT Select on ProShop to Workers;
Grant Select, Insert, Update, Delete on ProShopInventoryCheck to Workers;
Grant Select, Insert, Update, Delete on BowlingBalls to Workers;
Grant Select, Insert, Update, Delete on BowlingShoes to Workers;
Grant Select, Insert, Update, Delete on BowlingTowels to Workers;
Grant Select, Insert, Update, Delete on BowlingTape to Workers;
Grant Select, Insert, Update, Delete on Manufacturer to Workers;
Grant Select on BowlingBalls to Bowlers;
Grant Select on BowlingShoes to Bowlers;
Grant Select on BowlingTowels to Bowlers;
Grant Select on BowlingTape to Bowlers; 



   
	
