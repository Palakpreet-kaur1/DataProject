# Insurance Fraud Analysis (SQL, Power BI, Python)

## **Overview**
This project focuses on detecting insurance fraud by analyzing 1,000 claims using **SQL**, **Power BI**, and **Python**. The objective is to uncover fraud patterns, quantify financial exposure, and provide actionable business recommendations to reduce fraud leakage. Fraudulent claims can significantly affect profitability, inflate loss ratios, and increase costs for honest customers, making fraud detection a critical part of insurance analytics.

---

## **Key Highlights**
- **Overall Fraud Rate:** 25.7% of claims flagged as fraudulent.
- **Total Fraud Exposure:** $14.89M, representing **28.23% of total claim value ($52.76M)**.
- **High-Risk Segments Identified:**
  - **Ohio ($500 deductible):** 62.5% fraud rate (Lift = 2.53).
  - **Collision claims (single and multi-vehicle):** ~27–29% fraud rate with **average claim > $60K**.
  - **Incomplete documentation (UNKNOWN property damage or police reports):** Fraud ~29–32%.
- Estimated **$1.49M savings (10% reduction in fraud exposure)** achievable through targeted fraud mitigation.

---

## **Project Workflow**
### **1. Data Cleaning (Python)**
Performed in **Python (pandas, NumPy)** to ensure high-quality analysis:
- Replaced placeholder values (`?`, `UNKNOWN`) with `NULL` or standardized categories.
- Checked and corrected inconsistent entries (e.g., inconsistent state codes, missing incident data).
- Exported a cleaned dataset for SQL and Power BI.

### **2. SQL Analysis**
Conducted SQL queries to explore fraud patterns across multiple dimensions:
- **Fraud Overview:**
  - Overall fraud rate and total exposure.
- **Geographic Analysis:**
  - Fraud count and rate by **state** and **city**.
  - High-lift **State × Deductible** combinations.
- **Incident Type:**
  - Fraud rate and severity (e.g., collisions vs. theft).
- **Demographic Risk:**
  - Occupation, education level, and relationship categories linked to fraud.
- **Operational Gaps:**
  - Missing property damage or police reports correlated with increased fraud.
- **Fraud Lift:**
  - Identified segments with 2x–3x fraud risk compared to baseline.

### **3. Power BI Dashboard**
Created an interactive dashboard to visualize key findings:
- **KPI Cards:** Overall fraud rate, fraud exposure, total claims, % fraud by dollar amount.
- **Charts:**
  - **Bar Charts:** Fraud rate by incident type and deductible.
  - **Maps:** Geographic fraud distribution (by state).
  - **Matrix Table:** Fraud lift by State × Deductible.
- Dashboard highlights actionable segments for investigation and underwriting.

---

## **Key Insights**
- Fraudulent claims are **not only frequent (25.7%) but also high-severity**, accounting for **28.23% of payout dollars**.
- **Ohio $500 deductible** policies have the highest fraud lift (2.53), making them a top priority for investigation.
- **Collision claims (single & multi-vehicle)** are responsible for a large portion of fraud exposure.
- Missing or incomplete documentation correlates strongly with higher fraud rates.
- Targeting just **10% of fraudulent dollars** in top-risk segments could yield **$1.49M in savings**.

---

## **Business Impact**
- **Underwriting & Pricing:** Adjust pricing/deductible rules for high-fraud geographies.
- **Fraud Detection:** Use identified patterns to train predictive models.
- **Operational Efficiency:** Flag incomplete documentation for further review.
- **Cost Savings:** Reduce fraud leakage through SIU focus on high-lift segments.

---

## **Tools & Technologies**
- **SQL:** MySQL (analysis and reporting).
- **Power BI:** Visualization and dashboard building.
- **Python:** Data cleaning (pandas, NumPy).
- **Git & GitHub:** Version control and portfolio sharing.

---




