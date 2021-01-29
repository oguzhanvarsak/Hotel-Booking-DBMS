use [master];

CREATE DATABASE OtelDB;
GO

use [OtelDB];

CREATE TABLE Otel (
	otel_id int NOT NULL PRIMARY KEY,
	otel_adi varchar(50) NOT NULL,
	otel_adres varchar(1000) NOT NULL,
	otel_telefon varchar(11) NOT NULL,
	otel_yildiz int NOT NULL,
	otel_gunluk_ucret int NOT NULL
);

CREATE TABLE Yoneticiler (
	yonetici_id int NOT NULL PRIMARY KEY,
	yonetici_adi varchar(50) NOT NULL,
	yonetici_soyadi varchar(50) NOT NULL,
	otel_id int FOREIGN KEY REFERENCES Otel(otel_id)
);

CREATE TABLE Konuk (
	konuk_id int NOT NULL PRIMARY KEY,
	kimlik_no varchar(11) NOT NULL,
	isim varchar(50) NOT NULL,
	soyisim varchar(50) NOT NULL,
	adres varchar(1000) NOT NULL,
	eposta varchar(1000) NOT NULL,
	telefon varchar(11) NOT NULL	
);

CREATE TABLE Oda (
    oda_id int NOT NULL PRIMARY KEY,
    otel_id int FOREIGN KEY REFERENCES Otel(otel_id),
    oda_durumu bit NOT NULL,
    oda_tipi varchar(20) NOT NULL,
    oda_ucreti int NOT NULL
);

CREATE TABLE Calisanlar (
	calisan_id int NOT NULL PRIMARY KEY,
	calisan_adi varchar(50) NOT NULL,
	calisan_soyadi varchar(50) NOT NULL,
	otel_id int FOREIGN KEY REFERENCES Otel(otel_id),
	yonetici_id int FOREIGN KEY REFERENCES Yoneticiler(yonetici_id),
	oda_id int FOREIGN KEY REFERENCES Oda(oda_id)
);

CREATE TABLE Rezervasyon (
	rezervasyon_id int NOT NULL PRIMARY KEY,
	otel_id int FOREIGN KEY REFERENCES Otel(otel_id),
	rezervasyon_gunu date NOT NULL,
	konuk_id int FOREIGN KEY REFERENCES Konuk(konuk_id),
	oda_id int FOREIGN KEY REFERENCES Oda(oda_id),
	gun int NOT NULL
);

INSERT INTO Otel (otel_id, otel_adi, otel_adres, otel_telefon, otel_yildiz, otel_gunluk_ucret) VALUES
(1, 'Asteria Bodrum Resort', 'Gümbet', '02123210999', 3, 120),
(2, 'Selectum Luxury Resort', 'Belek', '02121235968', 4, 200),
(3, 'Rixos Premium Belek', 'İleribaşı Mevkii', '02128589902', 2, 100),
(4, 'Maxx Royal Belek Golf Resort', 'İskele Mevkii, Belek', '02129184757', 5, 300),
(5, 'Hotel Baia Lara', 'Lara', '02121237192', 1, 50),
(6, 'The Land of Legends Theme Park', 'Belek', '02129827183', 3, 150),
(7, 'Hotel Baia Bodrum', 'Gündoğan', '02129876423', 4, 175);

INSERT INTO Yoneticiler (yonetici_id, yonetici_adi, yonetici_soyadi, otel_id) VALUES
(1, 'Alease', 'Buemi', 7),
(2, 'Louisa', 'Cronauer', 6),
(3, 'Angella', 'Cetta', 1),
(4, 'Cyndy', 'Goldammer', 3),
(5, 'Rosio', 'Cork', 4),
(6, 'Celeste', 'Korando', 4),
(7, 'Twana', 'Felger', 7),
(8, 'Estrella', 'Samu', 6),
(9, 'Donte', 'Kines', 1),
(10, 'Tiffiny', 'Steffensmeier', 3),
(11, 'Edna', 'Miceli', 4),
(12, 'Sue', 'Kownacki', 4),
(13, 'Jesusa', 'Shin', 7),
(14, 'Rolland', 'Francescon', 6),
(15, 'Pamella', 'Schmierer', 1),
(16, 'Glory', 'Kulzer', 3),
(17, 'Shawna', 'Palaspas', 4),
(18, 'Brandon', 'Callaro', 2),
(19, 'Scarlet', 'Cartan', 7),
(20, 'Oretha', 'Menter', 6);

INSERT INTO Konuk (konuk_id, kimlik_no, isim, soyisim, adres, eposta, telefon) VALUES
(1, '57240965849','James', 'Butt', '6649 N Blue Gum St, New Orleans, Orleans', 'jbutt@gmail.com', '05046218927'),
(2, '74234672321','Josephine', 'Darakjy', '4 B Blue Ridge Blvd, Brighton, Livingston', 'josephine_darakjy@darakjy.org', '08102929388'),
(3, '87599093249','Art', 'Venere', '8 W Cerritos Ave #54, Bridgeport, Gloucester', 'art@venere.org', '08566368749'),
(4, '86414607832','Lenna', 'Paprocki', '639 Main St, Anchorage, Anchorage', 'lpaprocki@hotmail.com', '09073854412'),
(5, '89068389066','Donette', 'Foller', '34 Center St, Hamilton, Butler', 'donette.foller@cox.net', '05135701893'),
(6, '87796074859','Simona', 'Morasca', '3 Mcauley Dr, Ashland, Ashland', 'simona@morasca.com', '04195032484'),
(7, '82088623450','Mitsue', 'Tollner', '7 Eads St, Chicago, Cook', 'mitsue_tollner@yahoo.com', '07735736914'),
(8, '18794512019','Leota', 'Dilliard', '7 W Jackson Blvd, San Jose, Santa Clara', 'leota@hotmail.com', '04087523500'),
(9, '12531414972','Sage', 'Wieser', '5 Boston Ave #88, Sioux Falls, Minnehaha', 'sage_wieser@cox.net', '06054142147'),
(10, '28070023098','Kris', 'Marrier', '228 Runamuck Pl #2808, Baltimore, Baltimore City', 'kris@gmail.com', '04106558723'),
(11, '70874957700','Minna', 'Amigon', '2371 Jerrold Ave, Kulpsville, Montgomery', 'minna_amigon@yahoo.com', '02158741229'),
(12, '57590579611','Abel', 'Maclead', '37275 St  Rt 17m M, Middle Island, Suffolk', 'amaclead@gmail.com', '06313353414'),
(13, '65671482254','Kiley', 'Caldarera', '25 E 75th St #69, Los Angeles, Los Angeles', 'kiley.caldarera@aol.com', '03104985651'),
(14, '92180281450','Graciela', 'Ruta', '98 Connecticut Ave Nw, Chagrin Falls, Geauga', 'gruta@cox.net', '04407808425'),
(15, '44688409114','Cammy', 'Albares', '56 E Morehead St, Laredo, Webb', 'calbares@gmail.com', '09565376195'),
(16, '59967404573','Mattie', 'Poquette', '73 State Road 434 E, Phoenix, Maricopa', 'mattie@aol.com', '06022774385'),
(17, '62474818908','Meaghan', 'Garufi', '69734 E Carrillo St, Mc Minnville, Warren', 'meaghan@hotmail.com', '09313139635'),
(18, '31518951285','Gladys', 'Rim', '322 New Horizon Blvd, Milwaukee, Milwaukee', 'gladys.rim@rim.org', '04146619598'),
(19, '66636306647','Yuki', 'Whobrey', '1 State Route 27, Taylor, Wayne', 'yuki_whobrey@aol.com', '03132887937');

INSERT INTO Oda (oda_id, otel_id, oda_durumu, oda_tipi, oda_ucreti) VALUES
(1, 4, 1, 'Normal', 300),
(2, 4, 0, 'Kral Suit', 900),
(3, 7, 0, 'Normal', 175),
(4, 6, 1, 'Kral Suit', 500),
(5, 1, 1, 'Aile', 200),
(6, 3, 1, 'Normal', 100),
(7, 4, 0, 'Aile', 500),
(8, 4, 0, 'Aile', 500),
(9, 7, 0, 'Aile', 300),
(10, 6, 1, 'Normal', 150);

INSERT INTO Calisanlar (calisan_id, calisan_adi, calisan_soyadi, otel_id, yonetici_id, oda_id) VALUES
(1, 'Ty', 'Smith', 1, 3, 5),
(2, 'Xuan', 'Rochin', 3, 4, 6),
(3, 'Lindsey', 'Dilello', 4, 5, 1),
(4, 'Devora', 'Perez', 4, 18, 2),
(5, 'Herman', 'Demesa', 7, 19, 9),
(6, 'Rory', 'Papasergi', 6, 14, 4),
(7, 'Talia', 'Riopelle', 1, 9, 5),
(8, 'Van', 'Shire', 3, 10, 6),
(9, 'Lucina', 'Lary', 4, 17, 8),
(10, 'Bok', 'Isaacs', 4, 17, 7),
(11, 'Rolande', 'Spickerman', 7, 13, 9),
(12, 'Howard', 'Paulas', 6, 14, 4),
(13, 'Kimbery', 'Madarang', 1, 3, 5),
(14, 'Thurman', 'Manno', 3, 4, 6),
(15, 'Becky', 'Mirafuentes', 4, 5, 1),
(16, 'Beatriz', 'Corrington', 4, 6, 2),
(17, 'Marti', 'Maybury', 7, 7, 9),
(18, 'Nieves', 'Gotter', 6, 8, 4),
(19, 'Leatha', 'Hagele', 1, 3, 5),
(20, 'Valentin', 'Klimek', 3, 4, 6);


INSERT INTO Rezervasyon (rezervasyon_id, otel_id, rezervasyon_gunu, konuk_id, oda_id, gun) VALUES
(1, 3, '2021-02-12', 14, 8, 2),
(2, 4, '2020-12-01', 17, 7, 4),
(3, 4, '2020-12-12', 18, 4, 1),
(4, 7, '2020-11-12', 19, 2, 4),
(5, 6, '2021-01-03', 2, 10, 3),
(6, 3, '2021-02-12', 1, 5, 2),
(7, 4, '2020-12-01', 5, 3, 1),
(8, 4, '2020-12-12', 15, 6, 1),
(9, 7, '2020-11-12', 10, 1, 7),
(10, 6, '2021-01-03', 11, 9, 15);