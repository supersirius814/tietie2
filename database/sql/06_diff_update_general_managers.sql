UPDATE
  general_managers t1,
  (
    SELECT mainte1.general_manager_id, mainte2.department_id, mainte3.user_id
    FROM general_managers mainte1, departments mainte2, users mainte3, m_ht_department_temporary hanyo
    WHERE mainte3.staff_id = right(hanyo.gm_code, 6)
    AND mainte2.sales_code = hanyo.sales_code
    AND mainte2.department_id = mainte1.department_id
    AND mainte2.business_category_id = :col2
    AND mainte3.business_category_id = :col2
    AND hanyo.announce_date = :col1
  ) t2
SET
  t1.department_id = t2.department_id,
  t1.user_id = t2.user_id,
  t1.updated_at = NOW()
WHERE
  t1.general_manager_id = t2.general_manager_id
AND
  (
    t1.department_id <> t2.department_id OR
    t1.user_id <> t2.user_id
  )