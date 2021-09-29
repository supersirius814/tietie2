INSERT INTO
  users
    (
      staff_id,
      name, email,
      email_verified_at,
      remember_token,
      created_at,
      updated_at,
      shop_id,
      business_category_id,
      role_id
    )
SELECT DISTINCT
  right(hanyo.employee_cd, 6),
  hanyo.employee_name,
  hanyo.mail_address,
  null,
  null,
  NOW(),
  NOW(),
  null,
  :col1,
  (CASE
    WHEN hanyo.main_position_cd = '352020' THEN 10
    WHEN hanyo.main_position_cd = '352030' THEN 20
    WHEN hanyo.main_position_cd = '352040' THEN 30
    ELSE 90
  END)
FROM
  m_employee_temporary hanyo
WHERE NOT EXISTS(
  SELECT 1
  FROM users t1
  WHERE t1.staff_id = right(hanyo.employee_cd, 6)
  AND t1.role_id IN (10, 20, 30, 90)
  AND t1.business_category_id = :col1
)
AND
  hanyo.mail_address <> ''
AND
  hanyo.employee_cd <> ''