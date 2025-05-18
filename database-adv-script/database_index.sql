EXPLAIN ANALYZE
SELECT 
    b.id, u.name, p.title
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
WHERE 
    b.booking_date >= '2024-01-01'
ORDER BY 
    b.booking_date DESC;
