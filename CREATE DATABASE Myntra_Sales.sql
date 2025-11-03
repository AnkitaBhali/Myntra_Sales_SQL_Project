CREATE DATABASE Myntra_Sales_db;

USE Myntra_Sales_db;

CREATE TABLE myntra_sales (
  url TEXT,
  product_id BIGINT PRIMARY KEY,
  brand_name VARCHAR(100),
  category VARCHAR(50),
  individual_category VARCHAR(50),
  category_by_gender VARCHAR(10),
  description TEXT,
  discount_price INT,
  original_price INT,
  discount_offer VARCHAR(20),
  size_option TEXT,
  ratings FLOAT,
  reviews INT
);

SELECT * FROM myntra_sales;

--- Q1.Total number of products
select count(product_id) from myntra_sales;


--- Q2. Count of products by category 
select count(product_id) as p_id,category
from myntra_sales
group by category;


--- Q3. Count of products by gender 
select count(product_id) as p_id, category_by_gender 
from myntra_sales
group by category_by_gender;


--- Q4. Count of products by brand
select count(product_id)as p_id, brand_name
from myntra_sales
group by brand_name;
 
 
--- Q5. Top 10 brands by product count
select count(product_id) as p_id,brand_name 
from myntra_sales
group by brand_name
order by count(product_id) desc limit 10;


--- Q6. Average discount price
select avg(discount_price) as disc_p from myntra_sales;

--- Q7. Average original price 
select avg(original_price) as ori_p from myntra_sales;


--- Q8. Average original discount percentage
select avg(discount_offer) as disc_off from myntra_sales;


--- Q9. Total reviews per category 
select sum(reviews) as revi,category
from myntra_sales
group by category;


--- Q10. Average rating per category
SELECT AVG(ratings) as rati,category
from myntra_sales
group by category;

--- Q11. Products with highest discount
select * , original_price - discount_price as high_disc
from myntra_sales
order by high_disc desc limit 10;


--- Q12. Products with lowest discount
SELECT * , original_price - discount_price as low_disc
from myntra_sales
order by low_disc asc limit 10; 


--- Q13. Products with discount > 50%
select *, ROUND(((original_price - discount_price) * 100.0)/original_price,1) AS disc_amt
from myntra_sales
having disc_amt > 50 
order by disc_amt desc;


--- Q14. Products with discount < 10%
SELECT *, ROUND(((original_price - discount_price) * 100.0)/original_price,1) AS disc_amt
from myntra_sales
having disc_amt < 10
order by  disc_amt asc; 

--- Q15. Products where discount price < ₹1000
select product_id, discount_price
from myntra_sales
where discount_price < 1000;


--- Q16. Products where discount price > ₹3000
select product_id,discount_price
from myntra_sales 
where discount_price > 3000;


--- Q17. Products with “Rs.” in discount offer
select product_id,discount_offer
from myntra_sales
where discount_offer like "Rs.%";  


--- Q18. Products with exact 50% OFF 
select product_id,discount_offer
from myntra_sales
where discount_offer like "50%";


--- Q19. Products with price difference > ₹2000
select product_id,(original_price-discount_price) as price_diff
from myntra_sales
having price_diff > 2000;


--- Q20. Products with price difference < ₹500
select product_id,(original_price-discount_price) as price_diff
from myntra_sales
having price_diff < 500;


--- Q21. Most reviewed product per gender
select max(reviews) as reviewd ,category_by_gender,Product_id
from myntra_sales
group by category_by_gender,product_id;


--- Q22. Average rating by gender
select avg(ratings) as avg_rat,category_by_gender
from myntra_sales
group by category_by_gender;  


--- Q23. Count of products by individual category
select category,count(*) as product_count
from myntra_sales
group by category
order by product_count desc;


--- Q24. Count of products by category_by_gender
select category_by_gender,count(*) as product_count
from myntra_sales
group by category_by_gender
order by product_count desc;


--- Q25. Top 5 categories by review count
select count(reviews) as re_count,category 
from myntra_sales
group by category
order by re_count desc limit 5;  


--- Q26. Top 5 categories by average rating
select avg(ratings) as avg_rat,category
from myntra_sales
group by category
order by avg_rat desc limit 5;


--- Q27. Products with “kurta” in description
select product_id,description
from myntra_sales
where description like "%kurta%";


--- Q28. Products with “saree” in description
select product_id,description
from myntra_sales
where description like "%saree%"; 


--- Q29. Products with “shirt” in description
select product_id,brand_name,description
from myntra_sales
where description like "%shirt%"; 


--- Q30. Brand with lowest average rating
select avg(ratings) as low_rating,brand_name
from myntra_sales
group by brand_name
order by low_rating asc limit 1;


--- Q31. Brand with most reviews
select brand_name,sum(reviews) as m_rev
from myntra_sales
group by brand_name
order by m_rev desc limit 5;


--- Q32. Brand with least reviews
select brand_name,sum(reviews) as m_rev
from myntra_sales
group by brand_name
order by m_rev ASC limit 5;


--- Q33.  Brand with most products
select brand_name,count(*) as most_prod
from myntra_sales
group by brand_name
order by most_prod desc limit 5; 


--- Q34.  Brand with least products
select brand_name,count(*) as leat_prod
from myntra_sales
group by brand_name
order by leat_prod asc limit 5;


--- Q35. Average discount per brand
select avg(discount_price) as avg_disc, brand_name
from myntra_sales
group by brand_name
order by avg_disc desc;


--- Q36. Brand with most size options
select brand_name,count(distinct size_option) as size_option 
from myntra_sales
group by brand_name
order by size_option desc limit 5;


--- Q37. Brand with least size options
select brand_name,count(distinct size_option) as size_option
from myntra_sales
group by brand_name
order by size_option asc limit 5;


--- Q38. Products with more than 5 size options
select brand_name,count(distinct size_option) as size_option
from myntra_sales
group by product_id,brand_name
having size_option > 5
order by size_option desc;


--- Q39. Products with “3XL” size
SELECT DISTINCT product_id, size_option
from myntra_sales
where size_option like "%3XL%";


--- Q40. Products with numeric sizes (e.g., 38, 40)
select product_id,brand_name,size_option
from myntra_sales
where size_option like "%38%" or size_option like "%40%";


--- Q41. Products with “embroidered” in description
SELECT product_id, brand_name, description
FROM myntra_sales
WHERE description LIKE '%embroidered%';


--- Q42. Products with “floral” in description
SELECT product_id, brand_name, description
FROM myntra_sales
WHERE description LIKE '%floral%';


--- Q43. Products with “cotton” in description
SELECT product_id, brand_name, description
FROM myntra_sales
WHERE description LIKE '%cotton%';


--- Q44. Products with “georgette” in description
SELECT product_id, brand_name, description
FROM myntra_sales
WHERE description LIKE '%georgette%';


--- Q45. Products with “chikankari” in description
SELECT product_id, brand_name, description
FROM myntra_sales
WHERE description LIKE '%chikankari%';


--- Q46. Products with “BMW” in description
SELECT product_id, brand_name, description
FROM myntra_sales
WHERE description LIKE '%BMW%';


--- Q47. Products with “maxi” in description
SELECT product_id, brand_name, description
FROM myntra_sales
WHERE description LIKE '%maxi%';


--- Q48. Products with “tailored” in description
SELECT product_id, brand_name, description
FROM myntra_sales
WHERE description LIKE '%tailored%';


--- Q49. Products with “XS” and “XXL”
SELECT DISTINCT product_id, size_option
from myntra_sales
where size_option like "%XS%" AND "%XXL%";


--- Q50. Products with “5XL”
SELECT DISTINCT product_id, size_option
from myntra_sales
where size_option like "%5XL%";


--- Q51. Products with “34C” to “40G”
SELECT DISTINCT product_id, size_option
from myntra_sales
where size_option IN ('34C', '36C', '38C', '40C', '34D', '36D', '38D', '40D', '34E', '36E', '38E', '40E', '34F', '36F', '38F', '40F', '34G', '36G', '38G', '40G');

--- Q52. Products with only one size
SELECT DISTINCT product_id, size_option
from myntra_sales
where size_option like "onesize";


--- Q53. Products with rating > 4.5 and reviews > 500
SELECT product_id, brand_name,description,ratings,reviews
FROM myntra_sales
WHERE ratings > 4.5 and reviews > 500;


--- Q54.  Products with discount > 60% and price < ₹1500
SELECT product_id, discount_offer,original_price
FROM myntra_sales
WHERE discount_offer > 60 and original_price < 1500;

--- Q55. Products with “kurta” and “dupatta”
SELECT product_id, brand_name,description
FROM myntra_sales
WHERE description LIKE '%kurta%' 
  and description like '%dupatta%';


--- Q56. Products with “shirt” and “slim fit”
SELECT product_id, brand_name,description
FROM myntra_sales
WHERE description LIKE '%shirt%' 
  and description like '%slim fit%';
  
  
--- Q57. Products with “saree” and “net”
SELECT product_id, brand_name,description
FROM myntra_sales
WHERE description LIKE '%saree%' 
  and description like '%net%'; 
  
  
--- Q58. Products with “joggers” and “BMW”
SELECT product_id, brand_name,description
FROM myntra_sales
WHERE description LIKE '%joggers%' 
  and description like '%BMW%';
  
  
--- Q59. Products with “bra” and “support”
SELECT product_id, brand_name,description
FROM myntra_sales
WHERE description LIKE '%bra%' 
  and description like '%support%'; 
  
  
--- Q60. Products with “tights” and “printed”
SELECT product_id, brand_name,description
FROM myntra_sales
WHERE description LIKE '%tights%' 
  and description like '%printed%'; 
  
  
--- Q61. Products with “dress” and “maxi”
SELECT product_id, brand_name,description
FROM myntra_sales
WHERE description LIKE '%dress%' 
  and description like '%maxi%';
  
  
--- Q62. Products with “jeans” and “stretchable”
SELECT product_id, brand_name,description
FROM myntra_sales
WHERE description LIKE '%jeans%' 
  and description like '%stretchable%'; 
  
--- Q63. Top 5 products by rating × reviews
select *, round(ratings*reviews) AS rat_rev
from myntra_sales
order by rat_rev desc limit 5;


--- Q64. Top 5 products by discount amount
select *, ROUND(((original_price - discount_price) * 100.0)/original_price,2) AS disc_amt
from myntra_sales
order by disc_amt desc limit 5;


--- Q65. Average price per category
SELECT round(AVG(discount_price),2) as price,category
from myntra_sales
group by category
order by price asc;


--- Q66. Average discount per category
SELECT round(AVG(discount_offer),2) as discount,category
from myntra_sales
group by category
order by discount asc;


--- Q67. Total reviews per brand per category
select sum(reviews) as tot_rev,brand_name,category
from myntra_sales
group by brand_name,category
order by tot_rev desc;


--- Q68. Rating distribution per category
select category,round(avg(ratings),2) as avg_rating,min(ratings) as min_rating,max(ratings) as max_rating,count(*) as product_count
from myntra_sales
group by category
order by avg_rating desc;


--- Q69. Discount range grouping (10–20%, 20–30%, etc.)
select 
  product_id,
  discount_offer,
case
  when discount_offer between 10 and 20 then '10%-20%'
  when discount_offer between 20 and 30 then '20%-30%'   
  when discount_offer between 10 and 20 then '30%-40%'
  when discount_offer between 10 and 20 then '40%-50%'
  when discount_offer between 10 and 20 then '50%-60%'
  when discount_offer between 10 and 20 then '60%-70%'
  when discount_offer between 10 and 20 then '70%-80%'
  else 'NA'
  end as discount_sale
  from myntra_sales;


--- Q70. Products grouped by number of size options
SELECT size_count, COUNT(*) AS product_count
FROM (
    SELECT product_id, COUNT(DISTINCT size_option) AS size_count
    FROM myntra_sales
    GROUP BY product_id
) AS size_summary
GROUP BY size_count
ORDER BY size_count;


--- Q71. Products grouped by discount price range
select
  case
    when discount_percentage <= 20 then '0-20%'
	when discount_percentage <= 40 then '21-40%'
	when discount_percentage <= 60 then '41-60%'
    else '61%+'
  end as discount_range,
  count(*) as product_count
from myntra_sales
group by discount_range
order by discount_range;


--- Q72. Products grouped by original price range
select
  case
    when original_price <= 500 then 'Low'
	when original_price <= 1500 then 'Mid'
	when original_price <= 3000 then 'High'
    else 'Premium'
  end as original_range,
  count(*) as product_count
from myntra_sales
group by original_range
order by original_range;


--- Q81. Add column: discount amount = original - discount
alter table myntra_sales 
add column discount_amount decimal(10,2);
UPDATE myntra_sales
SET discount_amount = original_price - discount_price;


--- Q82. Add column: discount percentage (if missing)
alter table myntra_sales
add column discount_percentage decimal(5,2); 


--- Q83. Add column: price per review
alter table myntra_sales
add column price_per_review decimal(10,2);  
ALTER TABLE myntra_sales
MODIFY COLUMN PRICE_PER_REVIEW DECIMAL(15,4);

UPDATE myntra_sales
SET price_per_review = original_price / reviews
WHERE product_id IS NOT NULL
  AND original_price IS NOT NULL
  AND reviews IS NOT NULL
  AND reviews > 0;
SET SQL_SAFE_UPDATES = 1;

--- Q84. Add column: rating × reviews
alter table myntra_sales
add column rating_reviews decimal(10,2);


--- Q85. Add column: number of sizes
alter table myntra_sales
add column number_of_sizes int;



--- Q86. Add column: category + gender
alter table myntra_sales
add column category_gender varchar(100);


--- Q87. Add column: brand + category
alter table myntra_sales
add column brand_category varchar(100);


--- Q88. Add column: description length
alter table myntra_sales
add column description_length int;

--- Q89. Add column: is_high_discount (boolean)
alter table myntra_sales
add column is_high_discount boolean;


--- Q90. Add column: is_popular (reviews > 500)
alter table myntra_sales
add column is_popular boolean;

 
--- Q91. Products with missing fields
select count(*)  as missing_count
from myntra_sales
where ratings is null
   or reviews is null
   or discount_offer is null;
      

--- Q92. Products with duplicate product_id
select distinct(product_id)
from myntra_sales;


--- Q93. Products with inconsistent discount format
select product_id, discount_offer
from myntra_sales
where discount_offer like '%percent%'
   or discount_offer like '%₹%'
   or discount_offer like '%off%'
   or discount_offer is null;


--- Q94. Products with non-numeric prices
select product_id,original_price,discount_price
from myntra_sales
where original_price REGEXP '[^0-9]'
   OR discount_price REGEXP '[^0-9]';


--- Q95. Products with rating > 5
select count(*) as invalid_rating_count
from myntra_sales
where ratings > 5;


--- Q96. Products with reviews < 0
select count(*) as invalid_reviews_count
from myntra_sales
where reviews < 0;

--- Q97. Products with empty size options
select product_id,brand_name,size_option
from myntra_sales
where size_option is null
   or size_option = ''
   or size_option in ('N/A', 'None', 'NA');


--- Q98. Products with duplicate URLs
select URL, count(*) as product_count
from myntra_sales
group by URL
having count(*) > 1
order by product_count desc;


--- Q99. Products with same description
select description, count(*) as product_count
from myntra_sales
group by description
having count(*) > 1
order by product_count desc;


--- Q100. Products with same brand and category but different prices
select brand_name,category,count(distinct original_price) as diff_price 
from myntra_sales
group by brand_name,category
having count(distinct original_price) > 1
order by diff_price desc;
