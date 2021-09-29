UPDATE
  departments,
  (
    SELECT DISTINCT
      t1.sales_code,
      t1.sales_name
    FROM
      m_ht_department_temporary AS t1
    WHERE
      t1.business_catg = :col2
    AND
      t1.announce_date = :col1
  ) AS hanyo
SET
  departments.department_name = hanyo.sales_name,
  departments.sales_code = hanyo.sales_code,
  departments.updated_at = NOW()
WHERE
  departments.sales_code = hanyo.sales_code
AND
  departments.business_category_id = :col3
AND
    departments.sales_code <> ''
AND
  ( 
    departments.department_name <> hanyo.sales_name OR
    departments.sales_code <> hanyo.sales_code
  )