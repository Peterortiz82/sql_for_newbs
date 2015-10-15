#Basic SQL layout
-- SELECT,
-- FROM,
-- WHERE

# Find the titles of all rental that are .99 cents
SELECT title, rental_rate FROM film WHERE rental_rate = .99;