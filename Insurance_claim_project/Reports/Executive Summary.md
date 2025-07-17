# Executive Summary:

This analysis was conducted on 1,000 insurance claims to identify fraud patterns, quantify financial impact, and recommend data-driven strategies for mitigation. Using advanced SQL-based reporting, we explored claim attributes including geography, deductible levels, incident type, demographics, and documentation quality.

### **Key Highlights:**



**• Overall Fraud Rate:**

25.7% of claims were identified as fraudulent.



**• Financial Exposure:**

Fraudulent claims represent $14.89M, or 28.23% of total claim dollars ($52.76M).

This indicates that fraudulent claims are above-average severity compared to non-fraudulent claims.



**• Incident Type Risk:**

o Single Vehicle Collisions and Multi-Vehicle Collisions dominate fraud activity, with fraud rates of 29.0% and 27.2%, respectively, and average claim amounts exceeding $60K.

o Low-risk categories: Vehicle Theft (8.5%) and Parked Car (9.5%).



**• Geographic and Pricing Drivers:**

Fraud risk increases significantly in certain State × Deductible combinations:

o Ohio ($500 deductible) → 62.5% fraud rate (Lift = 2.53)

o Ohio ($2000 deductible) → 45.5% (Lift = 1.84)

o South Carolina ($500 deductible) → 34.5% fraud with 87 claims, creating major exposure.

These patterns suggest pricing and underwriting policies can be optimized.



**• Documentation Gaps as Risk Factors:**

Claims with UNKNOWN property damage or missing police reports show fraud rates of 29–32%, higher than the 24% rate for fully documented claims.

This indicates operational weaknesses that fraudsters exploit.



**• Demographic Insights:**

Certain customer segments exhibit elevated fraud rates:

o 55–64 Craft-Repair: ~60% fraud

o 25–34 Exec-Managerial: ~54% fraud

These insights can guide fraud scoring and investigation prioritization.



##### Business Impact

Fraud accounts for over one-quarter of claims and nearly one-third of payout dollars. Reducing fraud leakage by just 10% would save ~$1.49M. Concentrating resources on high-lift segments—such as collision claims, Ohio $500 deductibles, and incomplete documentation cases—can deliver immediate ROI and strengthen loss ratio performance.



##### Recommendations

• Implement targeted fraud scoring using identified high-risk attributes (state, deductible, incident type, documentation quality).

• Strengthen documentation enforcement to reduce fraud linked to incomplete records.

• Prioritize SIU investigations and adjust underwriting rules for high-lift segments.

