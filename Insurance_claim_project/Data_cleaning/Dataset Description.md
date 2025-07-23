**# Dataset Description**



The dataset consists of \*\*1,000 insurance claim records\*\* and \*\*35 features\*\* related to policyholder details, vehicle information, claim amounts, and fraud indicators.  

It covers three states in the U.S. (\*\*Illinois, Indiana, Ohio\*\*) and includes both fraudulent and non-fraudulent claims.



\- \*\*Total Records:\*\* 1,000  

\- \*\*Total Features (Columns):\*\* 35  

\- \*\*Target Variable:\*\* `fraud\_reported` (Y/N)  

\- \*\*Data Source:\*\* Synthetic dataset (insurance claims fraud detection use case).  

\- \*\*Purpose:\*\* To analyze claim patterns, detect fraud-prone segments, and provide actionable insights for fraud prevention.



---



\# Feature Explanation



\## \*\*Policy and Customer Information\*\*

\- \*\*months\_as\_customer:\*\* Number of months the customer has been with the company; can be used to analyze the effect of customer loyalty on fraud.  

\- \*\*age:\*\* Age of the claimant.  

\- \*\*policy\_number:\*\* Unique identifier for the insurance policy.  

\- \*\*policy\_bind\_date:\*\* Date when the insurance policy was issued.  

\- \*\*policy\_state:\*\* State where the policy is issued (dataset includes Illinois, Indiana, Ohio).  

\- \*\*policy\_csl:\*\* Coverage limit of the policy in the form of Combined Single Limits (CSL).

&nbsp; - CSL means there is one total dollar limit for both bodily injury (BI) and property damage (PD) per accident.

&nbsp; - Example: \*\*250/500\*\* means:

&nbsp;   - \*\*$250,000\*\* = Maximum payout per person for injuries.

&nbsp;   - \*\*$500,000\*\* = Maximum payout per accident for all claims combined (BI + PD).

\- \*\*policy\_deductable:\*\* Amount the insured must pay out-of-pocket before the insurance policy covers a claim.  

\- \*\*policy\_annual\_premium:\*\* The annual fee paid by the policyholder for the insurance policy.  

\- \*\*umbrella\_limit:\*\* Maximum coverage amount provided by an umbrella insurance policy (extra liability coverage).  

\- \*\*insured\_zip:\*\* ZIP code of the insured person.  

\- \*\*insured\_sex:\*\* Gender of the insured person.  

\- \*\*insured\_education\_level:\*\* Education level of the insured person.  

\- \*\*insured\_occupation:\*\* Occupation of the insured person.  

\- \*\*insured\_hobbies:\*\* Hobbies of the insured person.  

\- \*\*insured\_relationship:\*\* Relationship of the insured person with the policyholder.



---



\## \*\*Financial Information\*\*

\- \*\*capital-gains:\*\* Capital gains associated with the incident.  

\- \*\*capital-loss:\*\* Capital losses associated with the incident.  



---



\## \*\*Incident Information\*\*

\- \*\*incident\_date:\*\* Date when the incident occurred.  

\- \*\*incident\_type:\*\* Type of incident (e.g., single vehicle collision, multi-vehicle collision).  

\- \*\*collision\_type:\*\* Type of collision in the incident.  

\- \*\*incident\_severity:\*\* Severity of the incident.  

\- \*\*authorities\_contacted:\*\* Authorities contacted after the incident.  

\- \*\*incident\_state:\*\* State in which the incident occurred.  

\- \*\*incident\_city:\*\* City in which the incident occurred.  

\- \*\*incident\_location:\*\* Specific location of the incident.  

\- \*\*incident\_hour\_of\_the\_day:\*\* Hour of the day when the incident occurred.  

\- \*\*number\_of\_vehicles\_involved:\*\* Total number of vehicles involved in the incident.  

\- \*\*property\_damage:\*\* Indicates whether property damage occurred. The property is not mentioned as to what kind of property. It can be building as well because I saw some inconsistencies in dataset where there was major damage but property damage was no.

\- \*\*bodily\_injuries:\*\* Number of bodily injuries in the incident.  

\- \*\*witnesses:\*\* Number of witnesses present during the incident.  

\- \*\*police\_report\_available:\*\* Indicates whether a police report is available.  



---



\## \*\*Claims Information\*\*

\- \*\*total\_claim\_amount:\*\* Total claim amount associated with the incident.  

\- \*\*injury\_claim:\*\* Claim amount for injuries.  

\- \*\*property\_claim:\*\* Claim amount for property damage.  

\- \*\*vehicle\_claim:\*\* Claim amount for vehicle damage.  



---



\## \*\*Vehicle Information\*\*

\- \*\*auto\_make:\*\* Make (brand) of the vehicle involved.  

\- \*\*auto\_model:\*\* Model of the vehicle involved.  

\- \*\*auto\_year:\*\* Manufacturing year of the vehicle.



---



\## \*\*Fraud Label\*\*

\- \*\*fraud\_reported:\*\* Indicates whether the claim is reported as fraudulent (`Y`) or not (`N`).  



