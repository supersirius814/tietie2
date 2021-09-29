UPDATE
  blocks,
  districts,
  (
    SELECT
      t1.bl_code,
      t1.bl_name,
      t1.ds_code
    FROM
      m_ht_department_temporary AS t1
    WHERE
      t1.business_catg = :col2
    AND
      t1.announce_date = :col1
    GROUP BY t1.bl_code, t1.bl_name, t1.ds_code
  ) AS hanyo
SET
  blocks.bl_code = hanyo.bl_code,
  blocks.block_name = hanyo.bl_name,
  blocks.district_id = districts.district_id,
  blocks.business_category_id = :col3,
  blocks.updated_at = NOW()
WHERE
  blocks.bl_code = hanyo.bl_code
AND
  districts.ds_code = hanyo.ds_code
AND
  blocks.business_category_id = :col3
AND
  districts.business_category_id = :col3
AND
    blocks.bl_code <> ''
AND
  (
    blocks.block_name <> hanyo.bl_name OR
    blocks.bl_code <> hanyo.bl_code OR
    blocks.district_id <> districts.district_id
  )