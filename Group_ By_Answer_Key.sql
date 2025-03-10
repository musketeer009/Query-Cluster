
use practice;

# 1. Finding the names of unique brands
select distinct brand_name from myntra;

# 2. Finding the number of unique brands
select count(distinct brand_name) from myntra;

# 3. Finding the number of products in each brands
select brand_name, count(  product_tag) as no_of_products 
from myntra group by brand_name;

# 4. Finding the top 5 brand who has the most number of products 
select brand_name, count(product_tag) as no_of_products 
from myntra group by brand_name 
order by no_of_products desc limit 5;

# 5. Finding the top 5 brand who sold the most number of products
select brand_name, sum(rating_count) as 'product_sold' 
from myntra group by brand_name 
order by product_sold desc limit 5;

# 6. Finding the top 5 most expensive brands based on their discounted price
select brand_name, round( avg(discounted_price),0) as expensive 
from myntra group by brand_name 
order by expensive desc limit 5;


# 7. Finding the top 5 least expensive brands based on their discounted price
select brand_name, round( avg(discounted_price),0) as expensive 
from myntra group by brand_name 
order by expensive limit 5;

# 8. Finding the top 10 best-selling product categories 
select product_tag , sum(rating_count) as 'product_sold' 
from  myntra group by product_tag 
order by product_sold desc limit 10;

# 9. Finding the top 10 brands who gives maximum discount
select brand_name ,avg(discount_percent) as 'max_dis' 
from myntra group by brand_name 
order by max_dis desc limit 10;  
select * from myntra;

# 10. Finding the top 5 most expensive product categories
select product_tag , sum(discounted_price) as 'price' 
from  myntra group by product_tag 
order by price desc limit 5;


#  Brand Report Card

# 1 top 10 brands with max revenue generated
select brand_name, round(sum(discounted_price*rating_count)) as revenue_generated 
from myntra group by brand_name  
order by revenue_generated desc limit 10;


# 2. Which product_category of any brand is sold the most?
select    brand_name,product_tag,  sum(rating_count) as 'sold' 
from myntra group by   brand_name, product_tag 
order by sold desc ;


# 3. List top 5 brands which has sold most number of tshirts
select brand_name , product_tag, sum(rating_count) as 'tshirt_sold'  
from myntra where product_tag ='tshirts' 
group  by brand_name 
order by tshirt_sold desc  limit 5;

# 4. List top 5 brands which has sold most number of shirts
select brand_name , product_tag, sum(rating_count) as 'shirts_sold'  
from myntra where product_tag ='shirts' 
group  by brand_name 
order by shirts_sold desc  limit 5;

# 5. List top 5 brands which has sold most number of jeans
select brand_name, product_tag, sum(rating_count) as 'jeans_sold'  
from myntra where product_tag = 'jeans' 
group by brand_name 
order by jeans_sold desc;

# 6. List top 5 brands which has sold most number of dresses
select brand_name, product_tag, sum(rating_count) as 'dresses_sold' 
from myntra where product_tag = 'dresses' 
group by brand_name 
order by dresses_sold desc;

# 7. Most popular product name listed in Myntra
select product_tag, sum(rating_count) as 'user_buy' 
from myntra group by product_tag 
order by  user_buy desc limit 5;

# 8. Number of products sold for every rating (0 - 5)
select rating, count(rating) as "product_sold" 
from myntra where rating_count !=0
group by  rating 
order by rating;

# 9. Number of products sold for every rating by nike
select brand_name, rating, count(rating) as 'product_sold' 
from myntra  where brand_name = 'nike' and rating_count!=0
group by rating 
order by rating asc;

# 10. Number of products sold for every rating in tshirt category
select rating, product_tag, count(product_tag) as 'product_sold' 
from myntra where product_tag = 'tshirts' and rating_count !=0
group by rating 
order by rating;

# 11. Relation between price of the tshirt and its rating wrt to people rated
select product_tag, avg(discounted_price) as 'avg_price',rating, sum(rating_count) as 'user_rated'
from  myntra 
where product_tag ='tshirts' 
group by rating 
order by rating ;


# 12 Number of products sold for every rating
select rating, count(product_tag) as 'product_sold' 
from myntra where rating_count!=0
group by rating 
order by rating;


# 13 find the average rating for each product category along with the no of products and total rating count
select product_tag, round(avg(rating)) as 'avg_rating', 
count(*) as 'total_product',
sum(rating_count) as 'user_rated'  
from myntra 
group by product_tag 
order by avg_rating asc ;
  
# 14 find the brand with the highest average rating among products with a discounted price greater than 5000
 select brand_name ,round(avg(rating),2) as 'avg_rating', sum(rating_count) 
 from myntra 
 where discounted_price >5000 
 group by brand_name 
 order by avg_rating desc;


# 15 top 10 brands with most no of product sold
 select brand_name, sum(rating_count) as "product_sold"
 from myntra 
 group by brand_name 
 order by product_sold  desc limit 10;





