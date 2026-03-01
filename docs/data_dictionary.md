# 📖 Data Dictionary: Kimia Farma Analysis Table

**Project:** Kimia Farma Performance Analytics (2020–2023)  
**Source Table:** `Rakamin_KF_Analytics.kimia_farma.analysis_table`  
**Description:** This document defines the schema, business logic, and data types for the unified analysis table used in the Looker Studio dashboard. This table serves as the **Single Source of Truth** for all reporting.

---

## 🏗️ Table Overview
The `analysis_table` is created by joining four source datasets:
1.  `kf_final_transaction` (Transaction logs)
2.  `kf_product` (Product catalog & pricing)
3.  `kf_kantor_cabang` (Branch profiles & locations)
4.  *(Inventory data was available but not required for this specific performance view)*

**Granularity:** One row per unique transaction line item.

---

## 📋 Column Definitions

| Column Name | Data Type | Source Table | Business Definition & Logic |
| :--- | :--- | :--- | :--- |
| **`transaction_id`** | STRING | `kf_final_transaction` | Unique identifier for each transaction record. Primary Key for granularity. |
| **`date`** | DATE | `kf_final_transaction` | The date the transaction occurred. Used for Time-Series analysis (YoY, MoM). |
| **`branch_id`** | STRING | `kf_kantor_cabang` | Unique identifier for the Kimia Farma branch where the transaction took place. |
| **`branch_name`** | STRING | `kf_kantor_cabang` | Human-readable name of the branch (e.g., "Kimia Farma Bandung Branch"). |
| **`kota`** | STRING | `kf_kantor_cabang` | City location of the branch. Used for city-level operational analysis. |
| **`provinsi`** | STRING | `kf_kantor_cabang` | Province location of the branch. Used for regional aggregation and Geo Maps. |
| **`rating_cabang`** | FLOAT | `kf_kantor_cabang` | **Branch Rating.** Consumer satisfaction score (0-5) regarding the physical store, staff, and facility. |
| **`customer_name`** | STRING | `kf_final_transaction` | Name of the customer. *Note: In production, this should be hashed for PII compliance.* |
| **`product_id`** | STRING | `kf_product` | Unique SKU identifier for the pharmaceutical product sold. |
| **`product_name`** | STRING | `kf_product` | Human-readable name of the medication/product. |
| **`actual_price`** | FLOAT | `kf_product` | The base list price of the product before any discounts are applied. |
| **`discount_percentage`** | FLOAT | `kf_final_transaction` | The discount % applied to this specific transaction (e.g., 10.0 for 10%). |
| **`persentase_gross_laba`** | FLOAT | **Calculated** | **Tiered Gross Profit Margin %.** <br>Calculated based on `actual_price` tiers:<br>• ≤ 50k → **10%**<br>• 50k - 100k → **15%**<br>• 100k - 300k → **20%**<br>• 300k - 500k → **25%**<br>• > 500k → **30%** |
| **`nett_sales`** | FLOAT | **Calculated** | **Nett Revenue.** <br>Formula: `actual_price` * (1 - (`discount_percentage` / 100)). <br>Represents the actual revenue collected after discounts. |
| **`nett_profit`** | FLOAT | **Calculated** | **Nett Profit.** <br>Formula: `nett_sales` * `persentase_gross_laba`. <br>Represents the gross profit earned on this specific line item. |
| **`rating_transaksi`** | FLOAT | `kf_final_transaction` | **Transaction Rating.** Consumer satisfaction score (0-5) regarding the checkout process, speed, and payment experience. |

---

## 💡 Key Business Logic Notes

### 1. Tiered Profit Margins (`persentase_gross_laba`)
Unlike a flat margin rate, Kimia Farma applies a progressive margin strategy based on product price points. Higher-priced items yield higher margin percentages. This logic is strictly enforced in the SQL transformation layer.

### 2. Nett Sales vs. Actual Price
All revenue analysis in the dashboard uses **`nett_sales`**, not `actual_price`. This ensures that promotional discounts are accounted for, providing a realistic view of cash flow.

### 3. Rating Gap Analysis
The table preserves both `rating_cabang` (Store) and `rating_transaksi` (Process) as separate columns. This allows for **Gap Analysis** (e.g., High Store Rating + Low Transaction Rating) to identify operational bottlenecks at specific branches.

---

## 🔗 Related Files
- **SQL Logic:** See `/sql/create_analysis_table.sql` for the transformation code.
- **Dashboard:** View the live visualization connected to this schema on [Looker Studio](https://lookerstudio.google.com/reporting/7879589b-92ed-4125-87cf-d4139a5968bb).
