-- DDL

-- DROP TABLE
DROP TABLE bookings;

DROP TABLE hotels;

DROP TABLE destinations;



-- CREATE TABLE
CREATE TABLE IF NOT EXISTS destinations(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	country VARCHAR(50) NOT NULL,
	description VARCHAR(255) DEFAULT ("no description"),
	rating INT DEFAULT 0 CHECK (0<=rating<=10)
);

CREATE TABLE IF NOT EXISTS hotels(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	destination INT NOT NULL,
	FOREIGN KEY(destination)
		REFERENCES destinations(id),		
	rating INT DEFAULT 0 CHECK (0<=rating<=10),
	address VARCHAR(255) DEFAULT ("no address")
);


CREATE TABLE IF NOT EXISTS bookings(
	id INT AUTO_INCREMENT PRIMARY KEY,
	guest_details VARCHAR(50) NOT NULL,
	hotel_reference INT NOT NULL,
	FOREIGN KEY(hotel_reference)
		REFERENCES hotels(id),
	check_in DATE,
	check_out DATE
);


-- DML 1
-- tabel destinations
INSERT INTO destinations (id,name,country,description,rating)
	VALUES 
		(1,"Wisata A","idn","Asik brad",9),
		(2,"Wisata B","us","Asik cuy",8),
		(3,"Wisata C","jpn","Asik aja",9),
		(4,"Wisata D","uk","Asik ceunah",4);

-- tabel hotels
INSERT INTO hotels (id,name,destination,rating,address)
	VALUES
		(1,"Hotel A1",1,9,"aa"),
		(2,"Hotel A2",1,7,"ab"),
		(3,"Hotel A3",1,10,"ac"),
		(4,"Hotel B1",2,8,"ba"),
		(5,"Hotel B2",2,7,"bb"),
		(6,"Hotel C1",3,10,"ca"),
		(7,"Hotel C2",3,7,"cb"),
		(8,"Hotel D1",4,10,"ba"),
		(9,"Hotel D2",4,9,"bb"),
		(10,"Hotel D3",4,5,"ba"),
		(11,"Hotel D4",4,8,"bb");
		
-- tabel bookings
INSERT INTO bookings(id,guest_details,hotel_reference,check_in,check_out)
	VALUES
		(1,"Ucup",1,DATE("2020-01-01"),DATE("2020-01-02")),
		(2,"Udin",2,DATE("2020-01-01"),DATE("2020-01-02")),
		(3,"si kamu",4,DATE("2020-01-01"),DATE("2020-01-02")),
		(4,"si aku",5,DATE("2020-01-01"),DATE("2020-01-02")),
		(5,"si dia",7,DATE("2020-01-01"),DATE("2020-01-02")),
		(6,"si anu",9,DATE("2020-01-01"),DATE("2020-01-02")),
		(7,"si saha cik",11,DATE("2020-01-01"),DATE("2020-01-02"));
		


-- DQL (SOAL QUERY)

-- A
SELECT *
FROM destinations;

-- B
SELECT *
FROM hotels;

-- C
SELECT *
FROM bookings;

-- D
SELECT bookings.guest_details,hotels.`name`
FROM bookings
JOIN hotels ON bookings.hotel_reference = hotels.id;

-- E
SELECT destinations.`name`,hotels.destination, AVG(hotels.rating) AS rata_rata
FROM hotels
JOIN destinations ON hotels.destination = destinations.id
GROUP BY destinations.`name`;



-- DML 2 (SOAL UPDATE & DELETE)
-- UPDATE RATING DESTINATION
UPDATE destinations 
SET rating = 5
WHERE name = 'Wisata A';


-- UPDATE 2
UPDATE hotels 
SET address = "aaZZ"
WHERE name = 'Hotel A1';

-- DELETE
DELETE
FROM bookings
WHERE id = 2;


