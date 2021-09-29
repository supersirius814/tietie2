INSERT INTO
  block_managers
    (
      block_id,
      user_id,
      created_at,
      updated_at
    )
SELECT DISTINCT
  (mainte.block_id),
  mainte.user_id,
  NOW(),
  NOW()
FROM (
  SELECT t1.block_id, t2.user_id
  FROM blocks t1, users t2, m_ht_department_temporary hanyo
  WHERE t2.staff_id = right(hanyo.bm_code, 6)
  AND hanyo.business_catg = :col2
  AND t1.bl_code = hanyo.bl_code
  AND t1.business_category_id = :col3
  AND t2.business_category_id = :col3
  AND hanyo.announce_date = :col1
  GROUP BY t1.block_id, t2.user_id
) mainte
WHERE NOT EXISTS (
  SELECT 1
  FROM block_managers
  WHERE mainte.block_id = block_managers.block_id
)