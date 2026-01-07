CREATE TABLE denial_summary AS
SELECT
  c.payor,
  e.service_line,
  COUNT(*) AS total_claims,
  SUM(CASE WHEN c.claim_status = 'Denied' THEN 1 ELSE 0 END) AS denied_claims,
  ROUND(
    SUM(CASE WHEN c.claim_status = 'Denied' THEN 1 ELSE 0 END) / COUNT(*),
    3
  ) AS denial_rate
FROM claims c
JOIN encounters e ON c.encounter_id = e.encounter_id
GROUP BY c.payor, e.service_line;

