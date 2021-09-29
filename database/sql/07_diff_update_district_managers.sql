UPDATE
  district_managers t1,
  (
    SELECT mainte1.district_manager_id, mainte2.district_id, mainte3.user_id
    FROM district_managers mainte1, districts mainte2, users mainte3, m_ht_department_temporary hanyo
    WHERE mainte3.staff_id = right(hanyo.dm_code, 6)
    AND mainte2.ds_code = hanyo.ds_code
    AND mainte2.district_id = mainte1.district_id
    AND mainte2.business_category_id = :col2
    AND mainte3.business_category_id = :col2
    AND hanyo.announce_date = :col1
  ) t2
SET
  t1.district_id = t2.district_id,
  t1.user_id = t2.user_id,
  t1.updated_at = NOW()
WHERE
  t1.district_manager_id = t2.district_manager_id
AND
  (
    t1.district_id <> t2.district_id OR
    t1.user_id <> t2.user_id
  )