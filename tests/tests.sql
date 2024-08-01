-- tests/tests.sql

-- Prueba para verificar que no hay valores nulos en order_id
SELECT *
FROM {{ ref('sales_view') }}
WHERE order_id IS NULL

-- Prueba para verificar que las fechas están correctamente formateadas
SELECT *
FROM {{ ref('sales_view') }}
WHERE NOT REGEXP_LIKE(formatted_order_date, '^\d{4}-\d{2}-\d{2}$')
