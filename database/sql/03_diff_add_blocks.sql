INSERT INTO
  blocks
    (
      bl_code,
      block_name,
      district_id,
      business_category_id,
      created_at,
      updated_at
    )
SELECT DISTINCT
  hanyo.bl_code,
  hanyo.bl_name,
  districts.district_id,
  :col3,
  NOW(),
  NOW()
FROM
  districts,
  (
    SELECT DISTINCT
      t1.bl_code,
      t1.bl_name,
      t1.ds_code
    FROM
      m_ht_department_temporary AS t1
    WHERE
      t1.business_catg = :col2
    AND
      t1.announce_date = :col1
  ) AS hanyo
WHERE NOT EXISTS(
  SELECT 1
  FROM blocks
  WHERE blocks.bl_code = hanyo.bl_code
  AND blocks.business_category_id = :col3
)
AND
  hanyo.ds_code = districts.ds_code
AND
  districts.business_category_id = :col3
AND
  hanyo.bl_code <> ''