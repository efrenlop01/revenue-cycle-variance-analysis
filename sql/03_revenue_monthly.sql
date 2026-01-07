CREATE TABLE revenue_monthly AS
SELECT
    DATE_FORMAT(c.claim_submit_date, '%Y-%m') AS month,
    c.payor,
    e.service_line,

    COUNT(DISTINCT c.claim_id) AS total_claims,

    SUM(c.billed_amount) AS total_billed,
    SUM(p.paid_amount) AS total_paid,

    SUM(CASE 
        WHEN c.claim_status = 'Denied' THEN 1 
        ELSE 0 
    END) AS denied_claims

FROM claims c
JOIN encounters e 
    ON c.encounter_id = e.encounter_id
LEFT JOIN payments p 
    ON c.claim_id = p.claim_id

GROUP BY
    month,
    c.payor,
    e.service_line;
