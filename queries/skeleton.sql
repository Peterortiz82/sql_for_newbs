#Basic SQL layout
-- SELECT,
-- FROM,
-- WHERE

# Find the titles of all rentals that are .99 cents
SELECT 
    title, rental_rate 
FROM 
    film 
WHERE 
    rental_rate = .99
;

# Count 
SELECT 
    count(title)
FROM 
    film
WHERE 
    rental_rate = .99
;

# Group by 
SELECT 
    count(title), rental_rate
FROM 
    film
GROUP BY 
    rental_rate
;

#Connecting tables
#tables = [customer, address] | customer id, name (first and last) and address 
SELECT
    customer.customer_id, customer.first_name, customer.last_name, address.address
FROM
    customer, address
WHERE
    customer.address_id = address.address_id
;