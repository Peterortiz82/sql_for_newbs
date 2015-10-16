#Fake data example 
SELECT
    ac.customer_id,
    ac.fav_color,
    rc.num_purchases
FROM
    active_customer ac,
    reward_customer rc
WHERE
    ac.customer_id = rc.customer_id
;

-- JOIN example
SELECT
    ac.customer_id,
    ac.fav_color,
    rc.num_purchases
FROM
    active_customers ac 
        JOIN reward_customer rc ON ac.customer_id = rc.customer_id
;

-- LEFT JOIN
SELECT
    ac.customer_id,
    ac.fav_color,
    rc.num_purchases
FROM
    active_customer ac
        LEFT JOIN reward_customer rc ON ac.customer_id = rc.customer_id
;

-- Join lecture temporary tables
#all columns from active customers (active = 1)
#customer_id, active, phone number 
drop temporary table if exists activeUsers;
create temporary table activeUsers
SELECT
    c.*, -- returns all columns in a customer table
    a.phone
FROM 
    customer c
        INNER JOIN address a ON c.address_id = a.address_id -- INNER JOIN is basically the same as JOIN
WHERE
    c.active = 1
GROUP BY 
    1
;

/*
at least 30 rentals
customer_id, number of rentals and last rental date
just using the rental table
*/

drop temporary table if exists rewardUsers;
create temporary table rewardUsers
SELECT
    r.customer_id, count(r.rental_id) as num_rentals,
    max(rental_date)
FROM
    rental r
GROUP BY
    1
HAVING 
    num_rentals >= 30
;

#BrainBuster_1
#Reward users who are also Active - Customer_id, email, first_name
SELECT
    a.customer_id,
    a.email,
    a.first_name
FROM
    activeUsers a
        JOIN rewardUsers r ON a.customer_id = r.customer_id
GROUP BY 
    1
;

#BrainBuster_2
#All reward users - Customer_id, email, phone
SELECT
    c.customer_id,
    c.email,
    a.phone
FROM
    rewardUsers r 
        JOIN customer c ON r.customer_id = c.customer_id
        LEFT JOIN activeUsers a ON a.customer_id = r.customer_id
GROUP BY
    1
;
