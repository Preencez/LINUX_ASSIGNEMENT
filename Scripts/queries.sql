# Solutions

### 1. List of Order IDs
```sql
SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;

2. Orders with Zero Standard Quantity
SELECT *
FROM orders
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);

3. Company Names Starting with C or W and Contact Filtering
SELECT company_name
FROM companies
WHERE (company_name LIKE 'C%' OR company_name LIKE 'W%')
  AND primary_contact LIKE '%ana%'
  AND primary_contact NOT LIKE '%eana%';

4. Region for Each Sales Rep and Associated Accounts
SELECT r.region_name, sr.sales_rep_name, a.account_name
FROM sales_reps sr
JOIN accounts a ON sr.sales_rep_id = a.sales_rep_id
JOIN region r ON sr.region_id = r.region_id
ORDER BY a.account_name ASC;
