CREATE TABLE days_to_payment AS
SELECT
  DATE_FORMAT(c.claim_submit_date, '%Y-%m') AS month,
  c.payor,
  e.service_line,
  COUNT(DISTINCT c.claim_id) AS total_claims,
  AVG(DATEDIFF(p.payment_date, c.claim_submit_date)) AS avg_days_to_payment
FROM claims c
JOIN encounters e 
  ON c.encounter_id = e.encounter_id
JOIN payments p 
  ON c.claim_id = p.claim_id
WHERE p.payment_date IS NOT NULL
GROUP BY month, payor, service_line;
