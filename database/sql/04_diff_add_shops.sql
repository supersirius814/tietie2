INSERT INTO
  shops
    (
      shop_code,
      shop_name,
      business_category_id,
      block_id,
      shop_address,
      shop_phone_number,
      shop_fax_number,
      shop_open_date,
      created_at,
      updated_at
    )
SELECT DISTINCT
  cast(hanyo.store_code as UNSIGNED),
      CASE WHEN hanyo.store_name LIKE 'ＨＳ%' THEN REPLACE(REPLACE(hanyo.store_name,'ＨＳ',''),'HS','')
           ELSE hanyo.store_name
           END,
      :col3,
      blocks.block_id,
      null,
      null,
      null,
      DATE_FORMAT(hanyo.open_date, '%Y/%m/%d' ),
      NOW(),
      NOW()
FROM
  blocks,
  (
    SELECT
      t1.store_code,
      t1.store_name,
      t1.bl_code,
      t1.open_date
    FROM
      m_ht_department_temporary AS t1
    WHERE
      t1.business_catg = :col2
    AND
      t1.announce_date = :col1
  ) AS hanyo
WHERE NOT EXISTS(
  SELECT 1
  FROM shops
  WHERE shops.shop_code = cast(hanyo.store_code as UNSIGNED)
  AND shops.business_category_id = :col3
)
AND
  blocks.business_category_id = :col3
AND
  hanyo.bl_code = blocks.bl_code
AND
  hanyo.store_code <> ''
AND
  hanyo.bl_code <> ''