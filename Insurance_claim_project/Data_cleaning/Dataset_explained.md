# Dataset Description

The dataset consists of **1,000 insurance claim records** and **35 features** related to policyholder details, vehicle information, claim amounts, and fraud indicators.  
It covers three states in the U.S. (**Illinois, Indiana, Ohio**) and includes both fraudulent and non-fraudulent claims.

- **Total Records:** 1,000  
- **Total Features (Columns):** 35  
- **Target Variable:** `fraud_reported` (Y/N)  
- **Data Source:** Synthetic dataset (insurance claims fraud detection use case).  
- **Purpose:** To analyze claim patterns, detect fraud-prone segments, and provide actionable insights for fraud prevention.

---

# Feature Explanation

## **Policy and Customer Information**
- **months_as_customer:** Number of months the customer has been with the company; can be used to analyze the effect of customer loyalty on fraud.  
- **age:** Age of the claimant.  
- **policy_number:** Unique identifier for the insurance policy.  
- **policy_bind_date:** Date when the insurance policy was issued.  
- **policy_state:** State where the policy is issued (dataset includes Illinois, Indiana, Ohio).  
- **policy_csl:** Coverage limit of the policy in the form of Combined Single Limits (CSL).
  - CSL means there is one total dollar limit for both bodily injury (BI) and property damage (PD) per accident.
  - Example: **250/500** means:
    - **$250,000** = Maximum payout per person for injuries.
    - **$500,000** = Maximum payout per accident for all claims combined (BI + PD).
- **policy_deductable:** Amount the insured must pay out-of-pocket before the insurance policy covers a claim.  
- **policy_annual_premium:** The annual fee paid by the policyholder for the insurance policy.  
- **umbrella_limit:** Maximum coverage amount provided by an umbrella insurance policy (extra liability coverage).  
- **insured_zip:** ZIP code of the insured person.  
- **insured_sex:** Gender of the insured person.  
- **insured_education_level:** Education level of the insured person.  
- **insured_occupation:** Occupation of the insured person.  
- **insured_hobbies:** Hobbies of the insured person.  
- **insured_relationship:** Relationship of the insured person with the policyholder.

---

## **Financial Information**
- **capital-gains:** Capital gains associated with the incident.  
- **capital-loss:** Capital losses associated with the incident.  

---

## **Incident Information**
- **incident_date:** Date when the incident occurred.  
- **incident_type:** Type of incident (e.g., single vehicle collision, multi-vehicle collision).  
- **collision_type:** Type of collision in the incident.  
- **incident_severity:** Severity of the incident.  
- **authorities_contacted:** Authorities contacted after the incident.  
- **incident_state:** State in which the incident occurred.  
- **incident_city:** City in which the incident occurred.  
- **incident_location:** Specific location of the incident.  
- **incident_hour_of_the_day:** Hour of the day when the incident occurred.  
- **number_of_vehicles_involved:** Total number of vehicles involved in the incident.  
- **property_damage:** Indicates whether property damage occurred.  
- **bodily_injuries:** Number of bodily injuries in the incident.  
- **witnesses:** Number of witnesses present during the incident.  
- **police_report_available:** Indicates whether a police report is available.  

---

## **Claims Information**
- **total_claim_amount:** Total claim amount associated with the incident.  
- **injury_claim:** Claim amount for injuries.  
- **property_claim:** Claim amount for property damage.  
- **vehicle_claim:** Claim amount for vehicle damage.  

---

## **Vehicle Information**
- **auto_make:** Make (brand) of the vehicle involved.  
- **auto_model:** Model of the vehicle involved.  
- **auto_year:** Manufacturing year of the vehicle.

---

## **Fraud Label**
- **fraud_reported:** Indicates whether the claim is reported as fraudulent (`Y`) or not (`N`).  
