UPDATE
  shops,
  blocks,
  (
    SELECT DISTINCT
      t1.store_code,
      t1.store_name,
      t1.bl_code
    FROM
      m_ht_department_temporary AS t1
    WHERE
      t1.business_catg = :col2
    AND
      t1.announce_date = :col1
  ) AS hanyo
SET
  shops.shop_name = CASE WHEN hanyo.store_name LIKE 'ＨＳ%' THEN REPLACE(REPLACE(hanyo.store_name,'ＨＳ',''),'HS','')
                           ELSE hanyo.store_name
                           END,
  shops.business_category_id = :col3,
  shops.block_id = blocks.block_id,
  shops.updated_at = NOW()
WHERE
  CAST(LPAD(shops.shop_code,6,'0') AS CHAR) = LPAD(hanyo.store_code,6,'0')
AND
  blocks.bl_code = hanyo.bl_code
AND
  shops.business_category_id = :col3
AND
  blocks.business_category_id = :col3
AND
  (
    shops.shop_name <> CASE WHEN hanyo.store_name LIKE 'ＨＳ%' THEN REPLACE(REPLACE(hanyo.store_name,'ＨＳ',''),'HS','')
                            ELSE hanyo.store_name
                            END OR
    shops.block_id <> blocks.block_id
  )