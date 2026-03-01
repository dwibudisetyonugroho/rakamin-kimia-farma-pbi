# 💊 Kimia Farma Performance Analytics (2020–2023)
### Big Data Analytics Internship Project | Rakamin Academy x Kimia Farma

[![Status](https://img.shields.io/badge/Status-Completed-success)](https://github.com)
[![Tools](https://img.shields.io/badge/Tools-BigQuery%20%7C%20Looker%20Studio-blue)](https://cloud.google.com/bigquery)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

> **Executive Summary:** This project evaluates the business performance of Indonesia's largest state-owned pharmaceutical company, **PT Kimia Farma Tbk**, over a 4-year period. By transforming raw transactional data into actionable intelligence, we identified key revenue drivers, geographic profit concentrations, and critical operational gaps in customer satisfaction.

---

## 🧭 Table of Contents
- [🏢 Business Context](#-business-context)
- [🎯 Objectives](#-objectives)
- [🛠️ Technology Stack](#️-technology-stack)
- [💡 Key Insights & Recommendations](#-key-insights--recommendations)
- [📊 Dashboard Preview](#-dashboard-preview)
- [📂 Project Structure](#-project-structure)
- [🔗 Live Links](#-live-links)

---

## 🏢 Business Context
**Kimia Farma** operates an extensive network of branches across Indonesia. Managing performance across diverse regions requires more than just looking at total sales; it demands a deep dive into profitability margins, regional efficiency, and customer experience consistency.

As a **Big Data Analytics Intern**, the primary challenge was to unify four disparate datasets (*Transactions, Inventory, Branch Profiles, Product Catalog*) to answer critical business questions:
- Which regions are the true profit engines vs. high-volume but low-margin areas?
- Are there branches where customers love the store but hate the checkout experience?
- How has revenue trended post-pandemic (2020–2023)?

## 🎯 Objectives
1.  **Data Engineering:** Build a robust ETL pipeline in **Google BigQuery** to create a unified "Single Source of Truth" analysis table.
2.  **Advanced Modeling:** Implement complex business logic, specifically **tiered gross profit margins** (ranging from 10% to 30% based on product price brackets).
3.  **Visualization:** Develop an interactive **Looker Studio** dashboard for real-time monitoring of KPIs.
4.  **Strategic Analysis:** Provide data-driven recommendations to optimize branch operations and regional strategy.

## 🛠️ Technology Stack
| Category | Tools Used |
| :--- | :--- |
| **Data Warehouse** | Google BigQuery (Standard SQL) |
| **Visualization** | Google Looker Studio |
| **Version Control** | GitHub |
| **Data Sources** | CSV Imports (Transactions, Inventory, Branches, Products) |

## 💡 Key Insights & Recommendations
Based on the analysis of **672K+ transactions** and **346B IDR** in revenue:

### 1. 🗺️ Geographic Concentration Risk
- **Finding:** **Jawa Barat** is the undisputed engine, contributing ~30% of Total Revenue and ~30% of Total Profit. Meanwhile, Eastern Indonesia shows presence but negligible profitability.
- **Recommendation:** Defend the Jawa Barat supply chain aggressively. Conduct a "Profitability Audit" for Eastern branches to decide between optimization or restructuring.

### 2. ⚠️ The "Operational Gap"
- **Finding:** Scatter plot analysis revealed critical outliers (e.g., **Tarakan, Bekasi**) where **Branch Ratings are high (>4.4)** but **Transaction Ratings are critically low (<3.99)**.
- **Recommendation:** Immediate operational audit of checkout processes in these specific cities. Customers like the store but dislike the buying experience (queues, POS speed, staff interaction).

### 3. 📉 Revenue Stagnation
- **Finding:** Revenue peaked in 2022 but dipped back to 2021 levels in 2023.
- **Recommendation:** Investigate Q3-Q4 2023 drivers. Shift focus to promoting higher-tier products (>300k IDR) which carry 25-30% margins, rather than relying solely on volume growth of low-margin items.

## 📊 Dashboard Preview
*An interactive view of the performance metrics.*

![Dashboard Snapshot](./assets/dashboard_snapshot.png)
*(Note: If the image does not load, please visit the Live Dashboard link below.)*

**Key Visualizations Included:**
- Year-over-Year Nett Sales Trend.
- Top 10 Provinces by Transaction Volume vs. Nett Sales.
- Branch Rating vs. Transaction Rating Gap Analysis (Scatter Plot).
- Indonesia Geo Map for Total Profit Distribution.

## 📂 Project Structure
*(This section details the repository organization.)*

> 🚧 **Updating Soon:** The detailed folder structure and file descriptions will be added in the final commit to ensure accuracy with the latest deliverables.

## 🔗 Live Links
Access the full artifacts of this project:

| Artifact | Link |
| :--- | :--- |
| **📊 Live Dashboard** | [View on Looker Studio](#) *(Update with your link)* |
| **💻 SQL Repository** | [View Code in `/sql`](./sql) |
| **🎥 Video Presentation** | [Watch on YouTube](#) *(Update with your link)* |
| **📄 Final PPT Deck** | [Download PDF](#) *(Update with your link)* |

---

### 👤 Author
**Dwi Budi Setyonugroho**
*Rakamin Academy x Kimia Farma Program*

---
