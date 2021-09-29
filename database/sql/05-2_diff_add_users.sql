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
  LPAD(shops.shop_code, 6, 0),
  CONCAT(RTRIM(shops.shop_name), 'ユーザー'),
  null,
  null,
  null,
  NOW(),
  NOW(),
  shops.shop_id,
  :col1,
  50
FROM
  shops
WHERE NOT EXISTS(
  SELECT 1
  FROM users t1
  WHERE t1.role_id = '50'
  AND shops.shop_id = t1.shop_id
  AND t1.business_category_id = :col1
)
AND
  shops.business_category_id = :col1