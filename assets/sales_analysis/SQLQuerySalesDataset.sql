USE [SalesAnalytics];
GO


-- 2. Create the staging table with columns matching your Google Sheet/Python DataFrame
CREATE TABLE Sales_Dataset (
    [OrderID] VARCHAR(50) NOT NULL, -- Assuming OrderID is a unique identifier
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
    [Discount] DECIMAL(5, 2) NULL, -- Assuming discount is a percentage or factor (e.g., 0.15)
    [Profit] DECIMAL(18, 2) NULL,
    [PaymentMode] VARCHAR(50) NULL,
    [ShippingDays] INT NULL,
    [DeliveryStatus] VARCHAR(50) NULL
);
GO

-- Optional: Verify the table was created successfully
SELECT 'Sales_Dataset table created successfully.' AS Status;
SELECT * FROM Sales_Dataset;
GO