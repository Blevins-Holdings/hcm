-- PostgreSQL database schema for Human Capital Management (HCM) System

-- Table for Users
CREATE TABLE Users (
    UserID SERIAL PRIMARY KEY,
    UserName VARCHAR(255) NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    CreatedAt TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Table for Employees
CREATE TABLE Employees (
    EmployeeID SERIAL PRIMARY KEY,
    UserID INT REFERENCES Users(UserID) ON DELETE CASCADE,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    DateOfHire DATE NOT NULL,
    Position VARCHAR(100) NOT NULL,
    Salary NUMERIC(10, 2) NOT NULL,
    IsActive BOOLEAN DEFAULT TRUE,
    CreatedAt TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Table for Departments
CREATE TABLE Departments (
    DepartmentID SERIAL PRIMARY KEY,
    DepartmentName VARCHAR(255) UNIQUE NOT NULL,
    CreatedAt TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Table for Employee_Departments (Many-to-Many relationship)
CREATE TABLE Employee_Departments (
    EmployeeID INT REFERENCES Employees(EmployeeID) ON DELETE CASCADE,
    DepartmentID INT REFERENCES Departments(DepartmentID) ON DELETE CASCADE,
    PRIMARY KEY (EmployeeID, DepartmentID)
);

-- Table for Roles
CREATE TABLE Roles (
    RoleID SERIAL PRIMARY KEY,
    RoleName VARCHAR(100) UNIQUE NOT NULL,
    CreatedAt TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Table for Permissions
CREATE TABLE Permissions (
    PermissionID SERIAL PRIMARY KEY,
    PermissionName VARCHAR(100) UNIQUE NOT NULL,
    CreatedAt TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Table for Role_Permissions (Many-to-Many relationship)
CREATE TABLE Role_Permissions (
    RoleID INT REFERENCES Roles(RoleID) ON DELETE CASCADE,
    PermissionID INT REFERENCES Permissions(PermissionID) ON DELETE CASCADE,
    PRIMARY KEY (RoleID, PermissionID)
);

-- Table for LeaveRequests
CREATE TABLE LeaveRequests (
    LeaveRequestID SERIAL PRIMARY KEY,
    EmployeeID INT REFERENCES Employees(EmployeeID) ON DELETE CASCADE,
    LeaveType VARCHAR(100) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Status VARCHAR(50) DEFAULT 'Pending',
    CreatedAt TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Table for SalaryHistory
CREATE TABLE SalaryHistory (
    SalaryHistoryID SERIAL PRIMARY KEY,
    EmployeeID INT REFERENCES Employees(EmployeeID) ON DELETE CASCADE,
    Salary NUMERIC(10, 2) NOT NULL,
    EffectiveDate DATE NOT NULL,
    CreatedAt TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);