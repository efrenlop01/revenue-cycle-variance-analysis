# Revenue Cycle Analytics (Healthcare)

## Overview
This project simulates the analytical responsibilities of a Revenue Cycle Analyst in a healthcare system. Using a relational MySQL database, I modeled patient encounters, claims, and payments to analyze denial trends, collection efficiency, and monthly revenue performance by payor and service line.

## Data Model
- patients
- encounters
- claims
- payments

Primary and foreign keys enforce referential integrity across the revenue cycle.

## Key Analyses
- Monthly revenue aggregation by payor and service line
- Claim volume and denial counts
- Total billed vs. total paid amounts
- Denial trends across clinical service lines

## Core SQL Output
The `revenue_monthly` table aggregates operational and financial metrics commonly reviewed by revenue cycle leadership and finance teams.

Metrics include:
- Total claims submitted
- Total billed amount
- Total paid amount
- Denied claim counts

## Tools Used
- MySQL 8.0
- MySQL Workbench
- SQL (JOINs, aggregations, CASE logic, date functions)

## Business Insight Examples
- Identified payors with lower collection efficiency
- Highlighted service lines with elevated denial volume
- Created a reusable monthly revenue summary table suitable for dashboarding

## Next Steps
- Visualization in Tableau or Power BI
- AR aging analysis
- Payor policy impact review

