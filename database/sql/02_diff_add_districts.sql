INSERT INTO
  districts
    (
      ds_code,
      district_name,
      department_id,
      business_category_id,
      created_at,
      updated_at
    )
SELECT DISTINCT
  hanyo.ds_code,
  hanyo.ds_name,
  departments.department_id,
  :col3,
  NOW(),
  NOW()
FROM
  departments,
  (
    SELECT DISTINCT
      t1.ds_code,
      t1.ds_name,
      t1.sales_code
    FROM
      m_ht_department_temporary AS t1
    WHERE
      t1.business_catg = :col2
    AND
      t1.announce_date = :col1
  ) AS hanyo
WHERE NOT EXISTS(
  SELECT 1
  FROM districts
  WHERE districts.ds_code = hanyo.ds_code
  AND districts.business_category_id = :col3
)
AND
  hanyo.sales_code = departments.sales_code
AND
  departments.business_category_id = :col3
AND
  hanyo.ds_code <> ''