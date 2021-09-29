UPDATE
  users, shops
SET
  users.name = CONCAT(shops.shop_name, 'ユーザー'),
  users.updated_at = NOW()
WHERE
  users.shop_id = shops.shop_id
AND
  users.business_category_id = :col1
AND
  (
    users.name <> CONCAT(shops.shop_name, 'ユーザー')
  )