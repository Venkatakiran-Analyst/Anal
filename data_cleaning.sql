
-- Remove duplicates
DELETE FROM product_data
WHERE Product_ID IN (
    SELECT Product_ID FROM (
        SELECT Product_ID, ROW_NUMBER() OVER (PARTITION BY Product_ID, Platform ORDER BY Product_ID) AS row_num
        FROM product_data
    ) t WHERE row_num > 1
);

-- Handle missing values by setting null prices to 0
UPDATE product_data
SET Price = COALESCE(Price, 0)
WHERE Price IS NULL;

-- Standardize product names (trim spaces & convert to lowercase)
UPDATE product_data
SET Product_Name = TRIM(LOWER(Product_Name));
