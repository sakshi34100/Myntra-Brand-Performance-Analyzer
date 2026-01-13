# Myntra Brand Performance & Risk Analyzer 📊✨

## 📌 Project Overview
This project provides an end-to-end data analysis solution for **1 Million+ product records** from Myntra. The goal was to transform raw retail data into strategic insights, specifically focusing on **Brand Risk Assessment** and **Customer Satisfaction (CSAT)** metrics. By leveraging SQL for backend validation and Power BI for frontend visualization, the project identifies high-performing "Winning Brands" and flags "High-Risk" vendors.

---

## 🚀 Business Value Proposition
The **Brand Performance Analyzer** serves as a strategic asset for quality control and vendor management:

* **Strategic Quality Assurance:** By correlating high price points with low ratings, the dashboard identifies **"High-Risk"** vendors who may be damaging the platform's reputation.
* **Performance Benchmarking:** Facilitates a fair comparison between high-volume brands and niche sellers using normalized metrics like **Unsatisfied Rate %**.
* **Enhanced Customer Satisfaction (CSAT):** Enables the Quality Control team to pinpoint specific price segments where dissatisfaction peaks, allowing for targeted category improvements.
* **Operational Efficiency:** Provides an automated **"Top 10 Unsatisfied Brands"** list to prioritize sellers for quality inspections and audits.

---

## 🛠️ Technical Stack & Workflow
The project follows a rigorous data lifecycle:
1.  **SQL (Exploratory Data Analysis & Validation):** Used to sanitize raw data, handle outliers, and test business logic before dashboard implementation.
2.  **Power BI (Interactive Visualization):** Developed a dynamic dashboard featuring custom DAX measures and interactive slicers.
3.  **DAX (Advanced Analytics):** Created specialized measures to ensure "Volume-Fair" scoring across 1,000,000 rows.

---

## 🔍 SQL Implementation (Data Engineering)
The backend logic was validated using SQL to ensure data integrity. Key operations included:
* **Data Sanitization:** Correcting outlier values (e.g., Fixing discount percentages incorrectly recorded as 19,000%+).
* **Logic Pre-Testing:** Validating the `Satisfaction Status` logic (**Rating < 3 = Unsatisfied**) at scale.
* **Aggregation:** Performing brand-level grouping to verify total product counts against Power BI results.

> **Note:** Detailed SQL scripts are available in the `Myntra_Analysis_Queries.sql` file in this repository.

---

## 🧠 Key DAX Measures
To ensure the analysis was accurate and fair, the following DAX logic was implemented:

### 1. Unsatisfied Rate % (Fair Scoring)
This measure focuses on the ratio of failure rather than absolute count, ensuring large brands like 'Roadster' are compared fairly against smaller sellers.

```dax
Unsatisfied % = 
DIVIDE(
    CALCULATE(COUNT(ProductID), Status="Unsatisfied"), 
    COUNT(ProductID), 
    0
) * 100
