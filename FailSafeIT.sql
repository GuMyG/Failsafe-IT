USE master;
GO

-- Drops the database if it already exists, so the script can be run again
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'FailSafeIT')
BEGIN
    ALTER DATABASE FailSafeIT SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE FailSafeIT;
END
GO

CREATE DATABASE FailSafeIT;
GO

USE FailSafeIT;
GO

CREATE TABLE Customers (
    Id                 INT IDENTITY(1,1) PRIMARY KEY,
    OrganizationNumber VARCHAR(11)   NOT NULL UNIQUE,
    CompanyName        NVARCHAR(100) NOT NULL,
    Email              NVARCHAR(256) NOT NULL,
    Phone              VARCHAR(20)   NOT NULL
);

CREATE TABLE Consultants (
    Id               INT IDENTITY(1,1) PRIMARY KEY,
    PersonalIdNumber VARCHAR(13)   NOT NULL UNIQUE,
    FullName         NVARCHAR(100) NOT NULL,
    HourlyRate       DECIMAL(10,2) NOT NULL,
    Specialty        NVARCHAR(50)  NOT NULL
);

CREATE TABLE Assignments (
    Id              INT IDENTITY(1,1) PRIMARY KEY,
    CustomerId      INT           NOT NULL,
    ConsultantId    INT           NOT NULL,
    StartDate       DATE          NOT NULL,
    EndDate         DATE          NOT NULL,
    RoleDescription NVARCHAR(200) NOT NULL,
    CONSTRAINT FK_Assignments_Customers
        FOREIGN KEY (CustomerId) REFERENCES Customers(Id),
    CONSTRAINT FK_Assignments_Consultants
        FOREIGN KEY (ConsultantId) REFERENCES Consultants(Id)
);
GO

-- N before a text value = Unicode, needed for å, ä and ö
INSERT INTO Customers (OrganizationNumber, CompanyName, Email, Phone) VALUES
('556100-0001', N'Nordic Bank AB',     N'it@nordicbank.example',      '08-111 11 11'),
('556200-0002', N'Svensk Logistik AB', N'kontakt@svlogistik.example', '031-222 22 22'),
('556300-0003', N'Hälsokollen AB',     N'info@halsokollen.example',   '040-333 33 33'),
('556400-0004', N'Gröna Energi AB',    N'hej@gronaenergi.example',    '090-444 44 44');

INSERT INTO Consultants (PersonalIdNumber, FullName, HourlyRate, Specialty) VALUES
('19850312-0001', N'Anna Lindqvist', 1450.00, N'Cybersecurity'),
('19901124-0002', N'Erik Johansson', 1250.00, N'DevOps'),
('19780605-0003', N'Maria Svensson', 1100.00, N'C# Developer'),
('19950218-0004', N'Omar Karimi',    1600.00, N'Cybersecurity');

INSERT INTO Assignments (CustomerId, ConsultantId, StartDate, EndDate, RoleDescription) VALUES
(1, 1, '2026-01-12', '2026-03-31', N'Security review of API environment'),
(1, 4, '2026-02-01', '2026-06-30', N'Penetration test of online banking'),
(2, 2, '2026-03-02', '2026-09-30', N'Setup of CI/CD pipeline'),
(2, 3, '2026-04-01', '2026-08-31', N'C# development of tracking portal'),
(3, 3, '2026-05-04', '2026-12-18', N'Further development of booking system'),
(3, 1, '2026-09-01', '2026-11-30', N'Security training for the development team');
GO

SELECT * FROM Customers;
SELECT * FROM Consultants;
SELECT * FROM Assignments;
GO