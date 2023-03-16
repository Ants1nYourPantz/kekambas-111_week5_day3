--Question 1
SELECT c.first_name, c.last_name, a.district
FROM customer c
JOIN address a
ON c.address_id = a.address_id
WHERE district = 'Texas'

--first_name|last_name|district|
------------+---------+--------+
--Jennifer  |Davis    |Texas   |
--Kim       |Cruz     |Texas   |
--Richard   |Mccrary  |Texas   |
--Bryan     |Hardison |Texas   |
--Ian       |Still    |Texas   |


-- Question 2
SELECT p.amount, c.first_name, c.last_name
FROM payment p
JOIN customer c
ON c.customer_id = p.customer_id
GROUP BY p.amount, c.first_name, c.last_name
HAVING amount >= 7.00;

--first_name|last_name   |amount|
------------+------------+------+
--Peter     |Menard      |  7.99|
--Peter     |Menard      |  7.99|
--Peter     |Menard      |  7.99|
--Douglas   |Graf        |  8.99|
--Ryan      |Salisbury   |  8.99|
--Ryan      |Salisbury   |  8.99|
--Ryan      |Salisbury   |  7.99|
--Roger     |Quintanilla |  8.99|
--Joe       |Gilliland   |  8.99|
-- ...


-- Question 3
SELECT *
FROM customer
JOIN payment 
ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id, payment.payment_id
HAVING customer.customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING sum(amount) > 175
);



--customer_id|store_id|first_name|last_name|email                            |address_id|activebool|create_date|last_update            |active|
-------------+--------+----------+---------+---------------------------------+----------+----------+-----------+-----------------------+------+
--        137|       2|Rhonda    |Kennedy  |rhonda.kennedy@sakilacustomer.org|       141|true      | 2006-02-14|2013-05-26 14:49:45.738|     1|
--        144|       1|Clara     |Shaw     |clara.shaw@sakilacustomer.org    |       148|true      | 2006-02-14|2013-05-26 14:49:45.738|     1|
--        148|       1|Eleanor   |Hunt     |eleanor.hunt@sakilacustomer.org  |       152|true      | 2006-02-14|2013-05-26 14:49:45.738|     1|
--        178|       2|Marion    |Snyder   |marion.snyder@sakilacustomer.org |       182|true      | 2006-02-14|2013-05-26 14:49:45.738|     1|
--        459|       1|Tommy     |Collazo  |tommy.collazo@sakilacustomer.org |       464|true      | 2006-02-14|2013-05-26 14:49:45.738|     1|
--        526|       2|Karl      |Seal     |karl.seal@sakilacustomer.org     |       532|true      | 2006-02-14|2013-05-26 14:49:45.738|     1|


-- Question 4
SELECT *
FROM country
GROUP BY country.country_id
HAVING country = 'Argentina'

SELECT *
FROM address
GROUP BY address.address_id
HAVING country = 'Argentina';

--first_name|last_name|district    |city                |country  |
------------+---------+------------+--------------------+---------+
--Willie    |Markham  |Buenos Aires|Almirante Brown     |Argentina|
--Jordan    |Archuleta|Buenos Aires|Avellaneda          |Argentina|
--Jason     |Morrissey|Buenos Aires|Baha Blanca         |Argentina|
--Kimberly  |Lee      |Crdoba      |Crdoba              |Argentina|
--Micheal   |Forman   |Buenos Aires|Escobar             |Argentina|
--Darryl    |Ashcraft |Buenos Aires|Ezeiza              |Argentina|
--Julia     |Flores   |Buenos Aires|La Plata            |Argentina|
--Florence  |Woods    |Buenos Aires|Merlo               |Argentina|
--Perry     |Swafford |Buenos Aires|Quilmes             |Argentina|
--Lydia     |Burke    |Tucumn      |San Miguel de Tucumn|Argentina|
--Eric      |Robert   |Santa F     |Santa F             |Argentina|
--Leonard   |Schofield|Buenos Aires|Tandil              |Argentina|
--Willie    |Howell   |Buenos Aires|Vicente Lpez        |Argentina|


-- Question 5
SELECT "name", count(*)
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
GROUP BY "name"
ORDER BY COUNT(*) DESC;

--category_id|name       |num_movies_in_cat|
-------------+-----------+-----------------+
--         15|Sports     |               74|
--          9|Foreign    |               73|
--          8|Family     |               69|
--          6|Documentary|               68|
--          2|Animation  |               66|
--          1|Action     |               64|
--         13|New        |               63|
--          7|Drama      |               62|
--         14|Sci-Fi     |               61|
--         10|Games      |               61|
--          3|Children   |               60|
--          5|Comedy     |               58|
--          4|Classics   |               57|
--         16|Travel     |               57|
--         11|Horror     |               56|
--         12|Music      |               51|



-- Question 6
SELECT actor_id, film_id
FROM film_actor
GROUP BY actor_id, film_id
ORDER BY film_id;

--film_id|title           |num_actors|
---------+----------------+----------+
--    508|Lambs Cincinatti|        15|


-- Question 7 
SELECT actor_id, sum(film_id)
FROM film_actor
GROUP BY actor_id
ORDER BY actor_id;

--actor_id|first_name|last_name|num_films|
----------+----------+---------+---------+
--     148|Emily     |Dee      |       14|


-- Question 8
SELECT country, city
FROM country c
JOIN city cc 
ON c.country_id = cc.country_id
ORDER BY country;

--country_id|country                              |num_cities|
------------+-------------------------------------+----------+
--        44|India                                |        60|
--        23|China                                |        53|
--       103|United States                        |        35|


-- Question 9
?

--actor_id|first_name |last_name  |count|
----------+-----------+-----------+-----+
--     114|Morgan     |Mcdormand  |   25|
--     153|Minnie     |Kilmer     |   20|
--      32|Tim        |Hackman    |   23|
--     132|Adam       |Hopper     |   22|
--      46|Parker     |Goldberg   |   24|
--     163|Christopher|West       |   21|
--...