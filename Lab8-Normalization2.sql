--Author: Alexander Stigliano--
--Date Created: November 9th, 2017--


DROP TABLE IF EXISTS MovieSalesData;
DROP TABLE IF EXISTS ActorMiscData;
DROP TABLE IF EXISTS DirectorPersonalData;
DROP TABLE IF EXISTS MovieData;
DROP TABLE IF EXISTS ActorData;
DROP TABLE IF EXISTS DirectorData;


CREATE TABLE MovieData  (
	MovieName	text,
	MPAANumber      numeric(12),
	Director	text,
	Bond		text,
	primary key(MovieName)
);

CREATE TABLE MovieSalesData (
	YearReleased          integer,
	DomesticBoxSales      numeric(9,2),
	ForeignBoxOfficeSales numeric(9,2),
	MovieName             text not null references MovieData(MovieName),
	primary key(YearReleased)
);

CREATE TABLE ActorData  (
	ActorName       text,
	SAGAD           DATE,
	PlayedMovie	text,
	primary key(ActorName)
);

CREATE TABLE ActorMiscData (
	DateofBirth       DATE,
	ActorSpouseName   text,
	Address           text,
	HairColor         text,
	EyeColor          text,
	HeightInches      INT,
	Weight            decimal(3,2),
	FavoriteColor     text,
	ActorName         text not null references ActorData(ActorName),
	primary key (DateOfBirth)
);

CREATE TABLE DirectorData (
	DirectorName          text,
	FilmSchoolAttended    text,
	DirectedMovie	      text,
	DGAD                  DATE,
	primary key (DirectorName)
);

CREATE TABLE DirectorPersonalData (
	Address              text,
	SpouseName	     text,
	FavoriteLensMaker    text,
	DirectorName         text not null references DirectorData(DirectorName),
	primary key (Address)
);