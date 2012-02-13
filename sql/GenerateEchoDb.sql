--drop table echoUsers;

-- Create the user table. Plain text for username and password for the alpha version
create TABLE users(
	userId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	userName VARCHAR(100),
	userPassword VARCHAR(100),
	userEmail VARCHAR(100)
);
commit;

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
commit;

-- Create network table, this contains the gps, which can be used for sending sleep
-- and wake commands, based on entering and exiting permitters. A user can have multiple
-- personal networks. E.g. If they own a business, they might have a network at home and a
-- network at the office. Thus our program can be used for wake/sleep for both.
create TABLE networks(
	networkId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userId int,		
	networkGPS VARCHAR(100),
	networkPerimeter int
);
commit;

/*
-- Sample Input for testing.
INSERT INTO users (`userName`, `userPassword`, `userEmail`) VALUES ('root', 'password', 'james.oravec@gmail.com');
commit;

INSERT INTO computers (userId, networkId, computerIP, computerPort, computerMAC) Values (1, 1, '192.168.1.111','1111','00:24:1D:1C:D1:1B');
INSERT INTO computers (userId, networkId, computerIP, computerPort, computerMAC) Values (1, 1, '192.168.1.112','2222','00:24:1D:1C:D1:1B');
INSERT INTO computers (userId, networkId, computerIP, computerPort, computerMAC) Values (1, 1, '192.168.1.113','3333','00:24:1D:1C:D1:1B');
INSERT INTO computers (userId, networkId, computerIP, computerPort, computerMAC) Values (1, 1, '192.168.1.114','4444','00:24:1D:1C:D1:1B');

INSERT INTO computers (userId, networkId, computerIP, computerPort, computerMAC) Values (2, 1, '192.168.1.111','1111','00:24:1D:1C:D1:1B');
INSERT INTO computers (userId, networkId, computerIP, computerPort, computerMAC) Values (2, 1, '192.168.1.112','2222','00:24:1D:1C:D1:1B');
INSERT INTO computers (userId, networkId, computerIP, computerPort, computerMAC) Values (2, 1, '192.168.1.113','3333','00:24:1D:1C:D1:1B');
INSERT INTO computers (userId, networkId, computerIP, computerPort, computerMAC) Values (2, 1, '192.168.1.114','4444','00:24:1D:1C:D1:1B');
commit;

insert into networks (userId, networkGPS, networkPerimeter) Values (1, '123.123,345.345', 1);
commit;

select * from users;
select * from computers;
select * from networks;
*/

