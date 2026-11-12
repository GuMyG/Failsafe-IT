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