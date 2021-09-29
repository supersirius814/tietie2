UPDATE
  users, m_employee_temporary hanyo
SET
  users.staff_id = right(hanyo.employee_cd, 6),
  users.name = hanyo.employee_name,
  users.email = hanyo.mail_address,
  users.updated_at = NOW(),
  users.business_category_id = :col1,
  users.role_id = CASE WHEN hanyo.main_position_cd = '352020' THEN 10
                        WHEN hanyo.main_position_cd = '352030' THEN 20
                        WHEN hanyo.main_position_cd = '352040' THEN 30
                        ELSE 90
                   END
WHERE
  users.staff_id = right(hanyo.employee_cd, 6)
AND
  users.business_category_id = :col1
AND
  hanyo.mail_address <> ''
AND
  hanyo.employee_cd <> ''
AND
  users.role_id IN (10, 20, 30, 90)
AND
  (
    users.name <> hanyo.employee_name OR
    users.email <> hanyo.mail_address OR
    users.role_id <> CASE WHEN hanyo.main_position_cd = '352020' THEN 10
                          WHEN hanyo.main_position_cd = '352030' THEN 20
                          WHEN hanyo.main_position_cd = '352040' THEN 30
                          ELSE 90
                     END
  )