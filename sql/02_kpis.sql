SELECT
  payor,
  COUNT(*) AS total_claims,
  SUM(CASE WHEN claim_status = 'Denied' THEN 1 ELSE 0 END) AS denied_claims,
  ROUND(
    100.0 * SUM(CASE WHEN claim_status = 'Denied' THEN 1 ELSE 0 END) / COUNT(*),
    2
  ) AS denial_rate_pct
FROM claims
GROUP BY payor
ORDER BY denial_rate_pct DESC;

#Cash Collected vs Billed (Financial Performance)
SELECT
  c.payor,
  SUM(c.billed_amount) AS total_billed,
  SUM(p.paid_amount) AS total_paid,
  ROUND(100.0 * SUM(p.paid_amount) / SUM(c.billed_amount), 2) AS collection_rate_pct
FROM claims c
JOIN payments p ON c.claim_id = p.claim_id
GROUP BY c.payor
ORDER BY collection_rate_pct DESC;

#Days to Payment (A/R Proxy)
SELECT
  c.payor,
  ROUND(AVG(DATEDIFF(p.payment_date, c.claim_submit_date)), 1) AS avg_days_to_payment
FROM claims c
JOIN payments p ON c.claim_id = p.claim_id
GROUP BY c.payor
ORDER BY avg_days_to_payment;
