
-- Identify products missing key information
SELECT Product_ID, Product_Name, Platform
FROM product_data
WHERE Price IS NULL OR Product_Name IS NULL;

-- Check for products with pricing errors
SELECT Product_ID, Product_Name, Price
FROM product_data
WHERE Price < 1000 OR Price > 100000;

-- Count valid vs invalid products
SELECT Validation_Status, COUNT(*) AS Total
FROM product_data
GROUP BY Validation_Status;
