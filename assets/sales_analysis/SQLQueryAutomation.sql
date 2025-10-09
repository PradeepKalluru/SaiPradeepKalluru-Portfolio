USE [SalesAnalytics];
GO

-- Drop and recreate the procedure
IF OBJECT_ID('Process_Live_Sales_Data', 'P') IS NOT NULL
    DROP PROCEDURE Process_Live_Sales_Data;
GO

CREATE PROCEDURE Process_Live_Sales_Data
AS
BEGIN
    SET NOCOUNT ON;

    MERGE [SalesAnalytics].[dbo].[Sales_Dataset] AS T  -- Target (Final Table)
    USING [SalesAnalytics].[dbo].[Live_Data_Staging] AS S    -- Source (Staging Table)
    ON (T.[OrderID] = S.[OrderID])
    
    WHEN MATCHED THEN
        UPDATE SET 
            -- --- START FULL UPDATE LIST ---
            T.[OrderDate]           = S.[OrderDate],
            T.[CustomerID]          = S.[CustomerID],
            T.[CustomerSegment]     = S.[CustomerSegment],
            T.[Region]              = S.[Region],
            T.[Country]             = S.[Country],
            T.[ProductCategory]     = S.[ProductCategory],
            T.[ProductSubCategory]  = S.[ProductSubCategory],
            T.[ProductName]         = S.[ProductName],
            T.[SalesAmount]         = S.[SalesAmount],
            T.[Quantity]            = S.[Quantity],
            T.[Discount]            = S.[Discount],
            T.[Profit]              = S.[Profit],
            T.[PaymentMode]         = S.[PaymentMode],
            T.[ShippingDays]        = S.[ShippingDays],
            T.[DeliveryStatus]      = S.[DeliveryStatus]
            -- --- END FULL UPDATE LIST ---

    WHEN NOT MATCHED BY TARGET THEN
        INSERT (
            [OrderID], [OrderDate], [CustomerID], [CustomerSegment], [Region], [Country], 
            [ProductCategory], [ProductSubCategory], [ProductName], [SalesAmount], [Quantity], 
            [Discount], [Profit], [PaymentMode], [ShippingDays], [DeliveryStatus]
        )
        VALUES (
            S.[OrderID], S.[OrderDate], S.[CustomerID], S.[CustomerSegment], S.[Region], S.[Country], 
            S.[ProductCategory], S.[ProductSubCategory], S.[ProductName], S.[SalesAmount], S.[Quantity], 
            S.[Discount], S.[Profit], S.[PaymentMode], S.[ShippingDays], S.[DeliveryStatus]
        );
END
GO