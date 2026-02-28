-- =================================================================
-- Project: Kimia Farma Performance Analytics (2020-2023)
-- File: create_analysis_table.sql
-- Description: Creates the unified analysis table with tiered profit logic.
-- Author: Dwi Budi Setyonugroho
-- =================================================================

CREATE OR REPLACE TABLE `rakamin-kf-analytics-20.kimia_farma.analysis_table` AS
WITH source_data AS (
    SELECT
        t.transaction_id,
        t.date,
        b.branch_id,
        b.branch_name,
        b.kota,
        b.provinsi,
        b.rating AS rating_cabang,
        t.customer_name,
        p.product_id,
        p.product_name,
        p.price AS actual_price,
        t.discount_percentage,
        t.rating AS rating_transaksi,
        CASE
            WHEN p.price <= 50000 THEN 0.10
            WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
            WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
            WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
            WHEN p.price > 500000 THEN 0.30
            ELSE 0.0
        END AS persentase_gross_laba
    FROM `rakamin-kf-analytics-20.kimia_farma.kf_final_transaction` t
    JOIN `rakamin-kf-analytics-20.kimia_farma.kf_product` p 
        ON t.product_id = p.product_id
    JOIN `rakamin-kf-analytics-20.kimia_farma.kf_kantor_cabang` b 
        ON t.branch_id = b.branch_id
)

SELECT
    transaction_id,
    date,
    branch_id,
    branch_name,
    kota,
    provinsi,
    rating_cabang,
    customer_name,
    product_id,
    product_name,
    actual_price,
    discount_percentage,
    persentase_gross_laba,
    
    -- Calculate Nett Sales
    actual_price * (1 - (discount_percentage / 100)) AS nett_sales,
    
    -- Calculate Nett Profit using the pre-calculated margin
    (actual_price * (1 - (discount_percentage / 100))) * persentase_gross_laba AS nett_profit,
    
    rating_transaksi
FROM source_data;
