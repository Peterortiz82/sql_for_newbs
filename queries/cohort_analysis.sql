-- Customer's First Rental
DROP TEMPORARY TABLE IF EXISTS first_rental;
CREATE TEMPORARY TABLE first_rental
SELECT
    customer_id, min(rental_date) as first_time
FROM
    rental 
GROUP BY 
    1
;

-- Cohort Size
DROP TEMPORARY TABLE IF EXISTS cohort_size;
CREATE TEMPORARY TABLE cohort_size
SELECT
    left(first_time, 7) as month,
    count(customer_id) as num
FROM
    first_rental 
GROUP BY 
    1
;

-- Revenue Per User for Each Cohort and Month
DROP TEMPORARY TABLE IF EXISTS cohort;
CREATE TEMPORARY TABLE cohort
SELECT
    date_format(f.first_time, '%Y%m') as cohort_formatted,
    date_format(r.rental_date, '%Y%m') as rental_date_formatted,
    cs.num as cohort_size,
    sum(p.amount) as month_rev,
    sum(p.amount)/cs.num as RPU
FROM
    rental r
        JOIN first_rental f ON r.customer_id = f.customer_id
        JOIN cohort_size cs On cs.month = left(f.first_time, 7)
        JOIN payment p ON p.rental_id = r.rental_id
GROUP BY 
    1,2
;

-- Prettify
SELECT
    left(STR_TO_DATE(cohort_formatted, '%Y%m'), 7) as 'First Rental Month',
    period_diff(rental_date_formatted, cohort_formatted) as 'Months After Join',
    cohort_size,
    RPU
FROM
    cohort
GROUP BY
    1, 2
;