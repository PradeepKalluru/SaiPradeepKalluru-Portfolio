USE [SalesAnalytics];
GO

-- 1. Create the Staging Table with the correct columns
IF OBJECT_ID('Live_Data_Staging', 'U') IS NOT NULL
    DROP TABLE Live_Data_Staging;
GO

CREATE TABLE Live_Data_Staging (
    [OrderID] VARCHAR(50) NOT NULL, 
    [OrderDate] DATE NULL,
    [CustomerID] VARCHAR(50) NULL,
    [CustomerSegment] VARCHAR(100) NULL,
    [Region] VARCHAR(50) NULL,
    [Country] VARCHAR(100) NULL,
    [ProductCategory] VARCHAR(100) NULL,
    [ProductSubCategory] VARCHAR(100) NULL,
    [ProductName] VARCHAR(255) NULL,
    [SalesAmount] DECIMAL(18, 2) NULL,
    [Quantity] INT NULL,
    [Discount] DECIMAL(5, 2) NULL,
    [Profit] DECIMAL(18, 2) NULL,
    [PaymentMode] VARCHAR(50) NULL,
    [ShippingDays] INT NULL,
    [DeliveryStatus] VARCHAR(50) NULL
);
GO

SELECT 'Live_Data_Staging created successfully.' AS Status;