INSERT INTO
  district_managers
    (
      district_id,
      user_id,
      created_at,
      updated_at
    )
SELECT
  mainte.district_id,
  mainte.user_id,
  NOW(),
  NOW()
FROM (
  SELECT t1.district_id, t2.user_id
  FROM districts t1, users t2, m_ht_department_temporary hanyo
  WHERE t2.staff_id = right(hanyo.dm_code, 6)
  AND hanyo.business_catg = :col2
  AND t1.ds_code = hanyo.ds_code
  AND t1.business_category_id = :col3
  AND t2.business_category_id = :col3
  AND hanyo.announce_date = :col1
  GROUP BY t1.district_id, t2.user_id
) mainte
WHERE NOT EXISTS (
  SELECT 1
  FROM district_managers
  WHERE mainte.district_id = district_managers.district_id
)