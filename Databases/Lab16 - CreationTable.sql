
create database DbAgency
go
use DbAgency

create table agency (
	AgencyCode char(5) CONSTRAINT PK_AgencyCode PRIMARY KEY NOT NULL,
	AgencyName varchar(25) NOT NULL,
	AgencyAddress varchar(30) NOT NULL,
	AgencyTel1 varchar(13) NULL,
	AgencyTel2 varchar(13) NULL,
	CONSTRAINT chk_agency check (AgencyCode like 'A[0-9][0-9][0-9][0-9]'),
	)
create table client (
	Client_ID char(10) CONSTRAINT PK_Client_ID PRIMARY KEY NOT NULL,
	AgencyCode char(5) NOT NULL,
	CliLastName varchar(25) NOT NULL,
	CliFirstName varchar(25) NOT NULL,
	CliAddress varchar(30) NOT NULL,
	ClientTel varchar(14) NULL,
	CONSTRAINT chk_client check (Client_ID like 'C[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	CONSTRAINT FK_AgencyCode FOREIGN KEY (AgencyCode) REFERENCES agency(AgencyCode),
	)

create table account (
	Client_ID char(10),
	AccType char(1) NOT NULL,
	OpenDate datetime NOT NULL,
	Balance money NULL,
	PRIMARY KEY (Client_Id, AccType),
	CONSTRAINT chk_account check (AccType = 'C' or AccType = 'S' or AccType = 'V'),
	)

create table transact (
	Client_ID char(10),
	AccType char(1)NOT NULL,
	TransDate datetime NOT NULL,
	TransType char(1) NOT NULL,
	Amount money NULL,
	PRIMARY KEY(TransDate, AccType),
	CONSTRAINT chk_transact check (TransType = 'R' or TransType = 'D'),
	CONSTRAINT FK_Client_ID FOREIGN KEY (Client_Id) REFERENCES client(Client_Id)
	)


INSERT INTO AGENCY VALUES  ('A0001', 'Agency Centre-Ville', '1 Place Ville-Marie', '(514)999-9999', '(514)999-9998')
INSERT INTO AGENCY VALUES  ('A0002', 'Agency Rive-Sud', '25 Bd Tachereau', '(450)444-4443', '(450)434-4444')
INSERT INTO AGENCY VALUES  ('A0003', 'Agency Laval', '3000 Rue Saguenay', '(450)333-3333', '(450)333-3331')
INSERT INTO AGENCY VALUES  ('A0004', 'Agency NDG', '145 Rue Pivot', '(514)744-6767', '(222)222-2222')

INSERT INTO CLIENT VALUES ('C100111001', 'A0001', 'Tremblay', 'Sophie', '12 Rue St-Denis #7', '(514)765-9899')
INSERT INTO CLIENT VALUES ('C100111002', 'A0001', 'Choquette', 'Alain', '145 Av Papineau #15', '(514)235-1314')
INSERT INTO CLIENT VALUES ('C100111003', 'A0001', 'Nassim', 'Ali', '2345 place Ardenne', '(450)445-5676')
INSERT INTO CLIENT VALUES ('C100112001', 'A0002', 'Maggs', 'Steve', '101 Rue Marlo #12', '(450)345-6767')
INSERT INTO CLIENT VALUES ('C100113002', 'A0003', 'Bonvi', 'Betty', '10 Rue Bolero', '(450)332-2222')
INSERT INTO CLIENT VALUES ('C100113003', 'A0003', 'Thran Ti', 'Quan', '104 Rue Saguenay', '(450)340-8907')

INSERT INTO ACCOUNT VALUES ('C100111001', 'C', '1996-10-10', 5000)
INSERT INTO ACCOUNT VALUES ('C100111001', 'S', '1996-11-20', 3000)
INSERT INTO ACCOUNT VALUES ('C100111002', 'C', '1997-03-13', 12300)
INSERT INTO ACCOUNT VALUES ('C100111003', 'C', '1998-12-23', 1200)
INSERT INTO ACCOUNT VALUES ('C100111003', 'V', '1998-10-09', 5000)
INSERT INTO ACCOUNT VALUES ('C100112001', 'C', '1998-09-15', 7600)
INSERT INTO ACCOUNT VALUES ('C100113002', 'C', '1998-03-24', 1300)
INSERT INTO ACCOUNT VALUES ('C100113003', 'C', '1995-12-04', 4500)

INSERT INTO transact VALUES ('C100111001', 'C', '1997-12-13', 'R', 60)
INSERT INTO transact VALUES ('C100111001', 'C', '1997-12-20', 'D', 800)
INSERT INTO transact VALUES ('C100111001', 'S', '1997-12-15', 'D', 300)
INSERT INTO transact VALUES ('C100111001', 'S', '1997-12-23', 'R', 100)
INSERT INTO transact VALUES ('C100111002', 'C', '1997-03-20', 'D', 1000)
INSERT INTO transact VALUES ('C100111002', 'C', '1997-03-25', 'R', 40)
INSERT INTO transact VALUES ('C100111002', 'C', '1997-05-20', 'D', 500)
INSERT INTO transact VALUES ('C100111002', 'C', '1997-08-20', 'R', 80)
INSERT INTO transact VALUES ('C100111003', 'C', '1998-12-25', 'D', 1000)
INSERT INTO transact VALUES ('C100111003', 'C', '1999-10-01', 'R', 100)
INSERT INTO transact VALUES ('C100111003', 'C', '1999-12-01', 'D', 100)
INSERT INTO transact VALUES ('C100111003', 'V', '1998-09-11', 'R', 100)
INSERT INTO transact VALUES ('C100111003', 'V', '1998-10-12', 'D', 70)
INSERT INTO transact VALUES ('C100111003', 'V', '1998-11-13', 'D', 30)
INSERT INTO transact VALUES ('C100113002', 'C', '1999-02-04', 'D', 1000)



select * from client
select * from transact
select * from account
select * from agency

drop table client
drop table agency
drop table transact
drop table account