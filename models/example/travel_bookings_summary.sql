-- models/travel_bookings_summary.sql

WITH bookings AS (
    SELECT
        customer_id,
        COUNT(*) AS total_bookings,
        SUM(booking_amount) AS total_booking_amount
    FROM
        HBX.public.bookingdata
    GROUP BY
        customer_id
)

SELECT
    c.customer_id,
    c.company_name,
    c.Industry,
    c.Contact_email,
    c.Contact_person,
    c.Location,
    b.total_bookings,
    b.total_booking_amount
FROM
    HBX.public.customer_data c
LEFT JOIN
    bookings b
ON
    c.customer_id = b.customer_id
