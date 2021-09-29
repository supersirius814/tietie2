UPDATE
  block_managers t1,
  (
    SELECT mainte1.block_manager_id, mainte2.block_id, mainte3.user_id
    FROM block_managers mainte1, blocks mainte2, users mainte3, m_ht_department_temporary hanyo
    WHERE mainte3.staff_id = right(hanyo.bm_code, 6)
    AND mainte2.bl_code = hanyo .bl_code
    AND mainte2.block_id = mainte1.block_id
    AND mainte2.business_category_id = :col2
    AND mainte3.business_category_id = :col2
    AND hanyo.announce_date = :col1
  ) t2
SET
  t1.block_id = t2.block_id,
  t1.user_id = t2.user_id,
  t1.updated_at = NOW()
WHERE
  t1.block_manager_id = t2.block_manager_id
AND
  (
    t1.block_id <> t2.block_id OR
    t1.user_id <> t2.user_id
  )