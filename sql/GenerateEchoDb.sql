--drop table echoUsers;

-- Create the user table. Plain text for username and password for the alpha version
create TABLE users(
	userId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	userName VARCHAR(100),
	userPassword VARCHAR(100)
);

-- Create computers table, which is a collection of computer systems, which
-- belong to the user. userId is the field which is the foreign key to the echousers table.
create TABLE computers(
	computerId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userId int,		
    networkId int,	
	computerIP VARCHAR(20),
	computerPort INT,
	computerMAC VARCHAR(100)
);

-- Create network table, this contains the gps, which can be used for sending sleep
-- and wake commands, based on entering and exiting permitters. A user can have multiple
-- personal networks. E.g. If they own a business, they might have a network at home and a
-- network at the office. Thus our program can be used for wake/sleep for both.
create TABLE networks(
	networkId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userId int,		
	networkGPS VARCHAR(100)
);

INSERT INTO users (`userName`, `userPassword`)
VALUES ('root', 'password');
commit;

--select count(*) from echousers;

