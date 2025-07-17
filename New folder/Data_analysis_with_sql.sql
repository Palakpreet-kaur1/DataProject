USE insurance_db;
SHOW TABLES LIKE 'insurance_claims';

-- Exploratory Data Analysis
--- Overall fraud rate
SELECT 
    ROUND(100.0 * SUM(CASE WHEN fraud_reported = 'Y' THEN 1 ELSE 0 END) / COUNT(*), 2) AS overall_fraud_rate_pct
FROM insurance_claims;

--- Total Financial Exposure of fraud
SELECT 
    ROUND(SUM(total_claim_amount), 2) AS fraud_exposure
FROM insurance_claims
WHERE fraud_reported = 'Y';

--- Total claim amount explosure
SELECT 
    ROUND(SUM(CASE WHEN fraud_reported = 'Y' THEN total_claim_amount ELSE 0 END), 2) AS fraud_amount,
    ROUND(SUM(total_claim_amount), 2) AS total_amount,
    ROUND(100.0 * SUM(CASE WHEN fraud_reported = 'Y' THEN total_claim_amount ELSE 0 END) / SUM(total_claim_amount), 2) AS fraud_amount_pct
FROM insurance_claims;


--- Fraud Risk Analysis

----- 1. State and cities with the highest number of fraud cases
		-- Top 10 states with most fraud cases
        DROP VIEW IF EXISTS fraud_cases_by_state;
        CREATE VIEW fraud_cases_by_state AS
        SELECT incident_state, count(*) as fraud_cases
        FROM insurance_claims
        WHERE fraud_reported = 'Y'
        GROUP BY incident_state
        ORDER BY fraud_cases DESC
        LIMIT 10;

        -- Group by city then state with most fraud cases
        DROP VIEW IF EXISTS vw_fraud_cases_by_city_state;
        CREATE VIEW vw_fraud_cases_by_city_state AS
        SELECT 
			incident_state, 
            incident_city, 
			COUNT(*) AS fraud_cases
		FROM insurance_claims
		WHERE fraud_reported = 'Y'
		GROUP BY incident_city, incident_state
		ORDER BY fraud_cases DESC;

----- 2. Vehicle Types or Models More Involved in Fraud
        -- full vehicle column in most fraud reports
		DROP VIEW IF EXISTS vw_fraud_rate_by_vehicle;
		CREATE VIEW vw_fraud_rate_by_vehicle AS
		SELECT 
			auto_make,
			auto_model,
			COUNT(*) AS total_claims,
			SUM(CASE WHEN fraud_reported = 'Y' THEN 1 ELSE 0 END) AS fraud_cases,
			ROUND(100.0 * SUM(CASE WHEN fraud_reported = 'Y' THEN 1 ELSE 0 END) / COUNT(*), 2) AS fraud_rate_percentage
		FROM insurance_claims
		GROUP BY auto_make, auto_model
		HAVING COUNT(*) >= 10 
		ORDER BY fraud_rate_percentage DESC;

        
----- 3. Average claim amount for fraudulent vs. Non-fraudulent
		SELECT 
			fraud_reported,
		AVG(total_claim_amount) AS avg_claim_amount
		FROM insurance_claims
		GROUP BY fraud_reported;
        
----- 3. Minimum claim amount for fraudulent vs. Non-fraudulent
		SELECT 
			fraud_reported,
		MIN(total_claim_amount) AS min_claim_amount
		FROM insurance_claims
		GROUP BY fraud_reported;
        
----- 3. Maximum claim amount for fraudulent vs. Non-fraudulent
		SELECT 
			fraud_reported,
		MAX(total_claim_amount) AS max_claim_amount
		FROM insurance_claims
		GROUP BY fraud_reported;


--- Customer Segmentation Analysis
     ----- 1. Segment Customers by Age Group + education_level + occupation
		        DROP VIEW IF EXISTS fraud_cases_cust_segmentation;
			    CREATE VIEW fraud_cases_cust_segmentation AS
				SELECT 
				  CASE 
					WHEN age < 25 THEN 'Under 25'
					WHEN age BETWEEN 25 AND 34 THEN '25-34'
					WHEN age BETWEEN 35 AND 44 THEN '35-44'
					WHEN age BETWEEN 45 AND 54 THEN '45-54'
					WHEN age BETWEEN 55 AND 64 THEN '55-64'
					ELSE '65+' 
				  END AS age_group,
				  insured_education_level,
				  insured_occupation,
                  insured_hobbies,
                  insured_relationship,
				  COUNT(*) AS total_claims,
				  SUM(CASE WHEN fraud_reported = 'Y' THEN 1 ELSE 0 END) AS fraud_cases
				FROM insurance_claims
				GROUP BY 
				  age_group, 
				  insured_education_level,
				  insured_occupation,
                  insured_hobbies,
                  insured_relationship
				HAVING fraud_cases > 0
				ORDER BY fraud_cases DESC;

		----- 2. Segment Customers by Occupation
				 DROP VIEW IF EXISTS fraud_cases_cust_segmentation_occup;
			     CREATE VIEW fraud_cases_cust_segmentation_occup AS
				 SELECT 
					insured_occupation,
					COUNT(*) AS total_claims,
					AVG(total_claim_amount) AS avg_claim_amount,
					SUM(CASE WHEN fraud_reported = 'Y' THEN 1 ELSE 0 END) AS fraud_cases,
                    ROUND(100.0 * SUM(CASE WHEN fraud_reported = 'Y' THEN 1 ELSE 0 END) / COUNT(*), 2) AS fraud_rate_pct
				 FROM insurance_claims
				 GROUP BY insured_occupation
				 ORDER BY fraud_cases DESC;
                 
		----- 3. Segment Customers by hobbies
				 DROP VIEW IF EXISTS fraud_cases_cust_segmentation_hobbies;
			     CREATE VIEW fraud_cases_cust_segmentation_hobbies AS
				 SELECT insured_hobbies, 
					   COUNT(*) AS total_claims,
					   SUM(CASE WHEN fraud_reported = 'Y' THEN 1 ELSE 0 END) AS fraud_cases,
					   ROUND(100.0 * SUM(CASE WHEN fraud_reported = 'Y' THEN 1 ELSE 0 END) / COUNT(*), 2) AS fraud_rate_pct
				 FROM insurance_claims
				 GROUP BY insured_hobbies
				 ORDER BY fraud_rate_pct DESC;
 
		----- 4. Segment Customers by relationship
				 DROP VIEW IF EXISTS fraud_cases_cust_segmentation_relation;
			     CREATE VIEW fraud_cases_cust_segmentation_relation AS
				 SELECT insured_relationship, 
					   COUNT(*) AS total_claims,
					   SUM(CASE WHEN fraud_reported = 'Y' THEN 1 ELSE 0 END) AS fraud_cases,
					   ROUND(100.0 * SUM(CASE WHEN fraud_reported = 'Y' THEN 1 ELSE 0 END) / COUNT(*), 2) AS fraud_rate_pct
				 FROM insurance_claims
				 GROUP BY insured_relationship
				 ORDER BY fraud_rate_pct DESC;
                 
		----- 5. Segment Customers by occupation and hobbies
				 DROP VIEW IF EXISTS fraud_cases_cust_segmentation_occ_hobbies;
			     CREATE VIEW fraud_cases_cust_segmentation_occ_hobbies AS
				 SELECT insured_occupation, insured_hobbies, 
					   COUNT(*) AS total_claims,
					   SUM(CASE WHEN fraud_reported = 'Y' THEN 1 ELSE 0 END) AS fraud_cases,
					   ROUND(100.0 * SUM(CASE WHEN fraud_reported = 'Y' THEN 1 ELSE 0 END) / COUNT(*), 2) AS fraud_rate_pct
				 FROM insurance_claims
				 GROUP BY insured_occupation, insured_hobbies
                 HAVING fraud_cases > 3
				 ORDER BY fraud_rate_pct DESC;
                 
		----- 6. Segment Customers by Age Group + occupation
		        DROP VIEW IF EXISTS fraud_cases_cust_segmentation_oa;
			    CREATE VIEW fraud_cases_cust_segmentation_oa AS
				SELECT 
					CASE 
						WHEN age < 25 THEN 'Under 25'
						WHEN age BETWEEN 25 AND 34 THEN '25-34'
						WHEN age BETWEEN 35 AND 44 THEN '35-44'
						WHEN age BETWEEN 45 AND 54 THEN '45-54'
						WHEN age BETWEEN 55 AND 64 THEN '55-64'
					    ELSE '65+' 
					END AS age_group,
					insured_occupation,
					COUNT(*) AS total_claims,
					SUM(CASE WHEN fraud_reported = 'Y' THEN 1 ELSE 0 END) AS fraud_cases,
					ROUND(100.0 * SUM(CASE WHEN fraud_reported = 'Y' THEN 1 ELSE 0 END) / COUNT(*), 2) AS fraud_rate_pct
				FROM insurance_claims
				WHERE insured_occupation IS NOT NULL 
				GROUP BY age_group, insured_occupation
				HAVING COUNT(*) >= 5
				ORDER BY fraud_rate_pct DESC;
			

--- Policy Evaluation
     ----- 1. Policy CSLs or deductible associated with larger claims
				SELECT 
				  incident_state AS state,
				  policy_deductable,
				  COUNT(*) AS total_claims,
				  ROUND(AVG(total_claim_amount), 2) AS avg_claim,
				  SUM(CASE WHEN fraud_reported = 'Y' THEN 1 ELSE 0 END) AS fraud_cases,
				  ROUND(100.0 * SUM(CASE WHEN fraud_reported = 'Y' THEN 1 ELSE 0 END) / COUNT(*), 2) AS fraud_rate_pct
				FROM insurance_claims
				GROUP BY incident_state, policy_deductable
				HAVING COUNT(*) >= 5
				ORDER BY fraud_rate_pct DESC;


     ----- 2. Delving deeper in states - 'Ohio' and 'North Carolina"
				SELECT 
				  CASE 
					WHEN age < 25 THEN 'Under 25'
					WHEN age BETWEEN 25 AND 34 THEN '25-34'
					WHEN age BETWEEN 35 AND 44 THEN '35-44'
					WHEN age BETWEEN 45 AND 54 THEN '45-54'
					WHEN age BETWEEN 55 AND 64 THEN '55-64'
					ELSE '65+' 
		          END AS age_group,
				insured_education_level, 
				insured_occupation, 
				insured_relationship, 
				COUNT(*) AS claims, SUM(CASE WHEN fraud_reported='Y' THEN 1 ELSE 0 END) AS fraud_cases 
				FROM insurance_claims
				WHERE incident_state IN ('OH', 'NC', 'PA') 
				GROUP BY age_group, insured_education_level, insured_occupation, insured_relationship
				ORDER BY fraud_cases DESC;


--- Incident Patterns
     ----- 1. incident_type to highest total_claims
			  SELECT 
				  incident_type,
				  COUNT(*) AS total_claims,
				  AVG(total_claim_amount) AS avg_claim,
				  SUM(total_claim_amount) AS total_payout,
				  SUM(CASE WHEN fraud_reported = 'Y' THEN 1 ELSE 0 END) AS fraud_cases,
				  ROUND(100.0 * SUM(CASE WHEN fraud_reported = 'Y' THEN 1 ELSE 0 END) / COUNT(*), 2) AS fraud_rate
			  FROM insurance_claims
			  GROUP BY incident_type
			  ORDER BY total_payout DESC;

--- Operational Gaps
     ----- 1. How 'unknown values' impact the fraud
			  SELECT 
				  police_report_available,
				  property_damage,
				  COUNT(*) AS total_claims,
				  SUM(CASE WHEN fraud_reported = 'Y' THEN 1 ELSE 0 END) AS fraud_cases,
				  ROUND(100.0 * SUM(CASE WHEN fraud_reported = 'Y' THEN 1 ELSE 0 END) / COUNT(*), 2) AS fraud_rate
			  FROM insurance_claims
			  GROUP BY police_report_available, property_damage
			  ORDER BY fraud_rate DESC;
              
              
--- Fraud Lift
WITH base AS (
  SELECT 
    incident_state AS state,
    policy_deductable,
    COUNT(*) AS total_claims,
    SUM(fraud_reported = 'Y') AS fraud_cases
  FROM insurance_claims
  GROUP BY state, policy_deductable
),
overall AS (
  SELECT 
    COUNT(*) AS all_claims,
    SUM(fraud_reported = 'Y') AS all_fraud
  FROM insurance_claims
)
SELECT 
  b.state,
  b.policy_deductable,
  b.total_claims,
  b.fraud_cases,
  ROUND(100.0 * b.fraud_cases / b.total_claims, 2) AS fraud_rate_pct,
  ROUND(
    (b.fraud_cases / b.total_claims) /
    (o.all_fraud / o.all_claims), 
    2
  ) AS fraud_lift
FROM base b
CROSS JOIN overall o
HAVING b.total_claims >= 5
ORDER BY fraud_lift DESC, fraud_rate_pct DESC;









