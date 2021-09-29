UPDATE
  districts,
  departments,
  (
    SELECT
      t1.ds_code,
      t1.ds_name,
      t1.sales_code
    FROM
      m_ht_department_temporary AS t1
    WHERE
      t1.business_catg = :col2
    AND
      t1.announce_date = :col1
    GROUP BY t1.ds_code, t1.ds_name, t1.sales_code
  ) AS hanyo
SET
  districts.ds_code = hanyo.ds_code,
  districts.district_name = hanyo.ds_name,
  districts.department_id = departments.department_id,
  districts.business_category_id = :col3,
  districts.updated_at = NOW()
WHERE
  districts.ds_code = hanyo.ds_code
AND
  departments.sales_code = hanyo.sales_code
AND
  districts.business_category_id = :col3
AND
  departments.business_category_id = :col3
AND
    districts.ds_code <> ''
AND
  ( 
    districts.district_name <> hanyo.ds_name OR
    districts.ds_code <> hanyo.ds_code OR
    districts.department_id <> departments.department_id
  )