INSERT INTO
  departments
    (
      sales_code,
      department_name,
      business_category_id,
      created_at,
      updated_at
    )
SELECT DISTINCT
  hanyo.sales_code, 
  hanyo.sales_name,
  :col3,
  NOW(),
  NOW()
FROM
  m_ht_department_temporary hanyo
WHERE NOT EXISTS(
  SELECT 1
  FROM departments mainte
  WHERE mainte.sales_code = hanyo.sales_code
  AND hanyo.business_catg = :col2
  AND mainte.business_category_id = :col3
)
AND
  hanyo.business_catg = :col2
AND
  hanyo.announce_date = :col1