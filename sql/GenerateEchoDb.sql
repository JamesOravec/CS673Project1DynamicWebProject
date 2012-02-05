--drop table echoUsers;

-- Create the user table. Plain text for username and password for the alpha version
create TABLE echousers(
	userId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	userName VARCHAR(100),
	userPassword VARCHAR(100)
);

-- Create systems table, which is a collection of computer systems, which
-- belong to the user. userId is the field which is the foreign key to the echousers table.
create TABLE echosystems(
	systemId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userId int, 
	systemIP VARCHAR(20),
	systemDNS VARCHAR(100),
	systemPort INT,
	systemMAC VARCHAR(100)
);

INSERT INTO echousers (`userName`, `userPassword`)
VALUES ('root', 'password');
commit;

--select count(*) from echousers;

