{{ config(
    materialized = 'view'
) }}

SELECT
    order_id,
    customer_id,
    {{ convert_date('order_date') }} AS formatted_order_date,
    total_amount
FROM
    {{ source('public', 'sales_orders') }}
WHERE
    order_date >= '2023-01-01'
