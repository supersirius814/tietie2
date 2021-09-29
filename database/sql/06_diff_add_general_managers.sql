INSERT INTO
  general_managers
    (
      department_id,
      user_id,
      created_at,
      updated_at
    )
SELECT
  mainte.department_id,
  mainte.user_id,
  NOW(),
  NOW()
FROM (
  SELECT t1.department_id, t2.user_id
  FROM departments t1, users t2, m_ht_department_temporary hanyo
  WHERE t2.staff_id = right(hanyo.gm_code, 6)
  AND t1.sales_code = hanyo.sales_code
  AND hanyo.business_catg = :col2
  AND t1.business_category_id = :col3
  AND t2.business_category_id = :col3
  AND hanyo.announce_date = :col1
  GROUP BY t1.department_id, t2.user_id
) mainte
WHERE NOT EXISTS (
  SELECT 1
  FROM general_managers
  WHERE mainte.department_id = general_managers.department_id
)