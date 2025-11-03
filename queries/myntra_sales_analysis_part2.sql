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
