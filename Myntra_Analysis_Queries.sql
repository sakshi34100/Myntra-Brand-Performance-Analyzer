
-- Project: Myntra Brand Performance Analysis
-- Scale: 1 Million+ Records
-- Purpose: Data Cleaning, Logic Validation & EDA

-- 1. Handling Data Quality Issues (Discount Correction)
-- Logic: Fixing rows where discount was incorrectly entered 
SELECT 
    product_name, 
    brand, 
    original_price,
    CASE 
        WHEN discount_percent > 100 THEN (discount_percent / 100)
        ELSE discount_percent 
    END AS corrected_discount
FROM myntra_data;

-- 2. Business Logic Testing: Satisfaction Status
-- Logic: Rating < 3 is Unsatisfied, Rating >= 3 is Satisfied
SELECT 
    brand,
    rating,
    CASE 
        WHEN rating = 0 THEN 'No Rating'
        WHEN rating < 3 THEN 'Unsatisfied'
        ELSE 'Satisfied'
    END AS satisfaction_status
FROM myntra_data;

-- 3. Risk Identification (High Risk Brands)
-- Logic: Identifying products with High Price but Low Rating
SELECT 
    brand, 
    product_name, 
    price, 
    rating
FROM myntra_data
WHERE price > 1500 AND rating < 3
ORDER BY price DESC;

-- 4. Brand Volume Analysis (Min 5 Products filter validation)
-- Logic: Identifying active brands for fair comparison
SELECT 
    brand, 
    COUNT(*) as total_products
FROM myntra_data
GROUP BY brand
HAVING COUNT(*) >= 5
ORDER BY total_products DESC;