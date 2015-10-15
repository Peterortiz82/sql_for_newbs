#first and last name, email and address for customers from store number 2
SELECT 
    first_name, last_name, email
FROM 
    customer
WHERE 
    store_id = 2
;