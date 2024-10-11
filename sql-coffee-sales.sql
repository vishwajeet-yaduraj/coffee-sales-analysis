

-- 1. Coffee Consumers Count
-- How many people in each city are estimated to consume coffee, given that 25% of the population does?
select city_name, round((population*0.25)/1000000,2) as coffee_consumers_in_Millions, city_rank
from city
order by 2 desc;

-- 2. Total Revenue from Coffee Sales
-- What is the total revenue generated from coffee sales across all cities in the last quarter of 2023?
select ci.city_name, sum(total) as sales_per_city
from sales s
join customers cu
on s.customer_id = cu.customer_id
join city ci
on ci.city_id = cu.city_id
where s.sale_date <= '2023-12-31' and
s.sale_date >='2023-10-01'
group by ci.city_name
order by sales_per_city desc;


-- 3. Sales Count for Each Product
-- How many units of each coffee product have been sold?
select p.product_name, count(*) as total_units
from products p
join sales s 
on s.product_id = p.product_id
group by p.product_name
order by total_units desc;

-- 4. Average Sales Amount per City
-- What is the average sales amount per customer in each city?
select ci.city_name, 
sum(total) as total_revenue,
count(distinct cu.customer_id ) as total_customers,
round(sum(total)::numeric/count(distinct cu.customer_id )::numeric,2) as avg_sales
from sales s
join customers cu
on cu.customer_id = s.customer_id
join city ci
on ci.city_id = cu.city_id
group by ci.city_name
order by avg_sales desc;

-- 5. City Population and Coffee Consumers
-- Provide a list of cities along with their populations and estimated coffee consumers.

with city_consumers as (
select ci.city_name, ci.population , ci.population * 0.25 as coffee_consumers
from city ci
),
unique_consumers as (
select ci.city_name, count(distinct cu.customer_name) as total_unique_customers
from customers cu
join sales s
on cu.customer_id = s.customer_id
join city ci 
on ci.city_id = cu.city_id
group by ci.city_name
)
select c.city_name, c.coffee_consumers, u.total_unique_customers
from city_consumers c
join unique_consumers u
on c.city_name = u.city_name
order by 3 desc;


-- 6 Top Selling Products by City
-- What are the top 3 selling products in each city based on sales volume?

with sales_table as (
select ci.city_name, p.product_name, 
count(s.sale_id) as total_sales,
Dense_rank() over(partition by ci.city_name order by count(s.sale_id) desc) as rank
from sales s
join customers cu
on cu.customer_id = s.customer_id
join products p
on p.product_id = s.product_id
join city ci
on cu.city_id = ci.city_id
group by 1,2
)
select * from sales_table
where rank<=3
;

-- 7. Customer Segmentation by City
-- How many unique customers are there in each city who have purchased coffee products?

select ci.city_name, count(distinct s.customer_id) as unique_customers
from customers cu
join city ci
on ci.city_id = cu.city_id
join sales s
on s.customer_id = cu.customer_id
group by ci.city_name;

-- 8 Average Sale vs Rent
-- Find each city and their average sale per customer and avg rent per customer.

with avg_sale as (
select ci.city_name, count(distinct s.customer_id) as total_customers, sum(s.total) as total_sales, 
round(sum(s.total):: numeric / count(distinct s.customer_id)::numeric,2) as avg_sale_per_customer
from city ci
join customers cu
on cu.city_id = ci.city_id
join sales s 
on s.customer_id = cu.customer_id
group by ci.city_name
order by 4 desc)

select a.city_name, a.total_customers, a.avg_sale_per_customer,
round(c.estimated_rent::numeric/a.total_customers::numeric,2) as avg_rent_per_customers
from city c
join avg_sale a
on a.city_name = c.city_name
order by 4 desc;

-- 9. Monthly Sales Growth
-- Sales growth rate: Calculate the percentage growth (or decline) in sales over different time periods (monthly).
-- by each city

with monthly_sale as (
	
select ci.city_name,
extract(month from sale_date) as month,
extract(year from sale_date) as year,
sum(s.total) as total_sales
from city ci
join customers cu 
on ci.city_id = cu.city_id
join sales s
on s.customer_id = cu.customer_id
group by 1,2,3),

growth_ratio as
(
select *, 
lag(total_sales, 1) over(partition by m.city_name order by m.year,m.month) as prev_month_sale
from monthly_sale m
order by 1,3,2)

select *,round(((total_sales-prev_month_sale)/prev_month_sale)::numeric*100,2) as change_in_growth
from growth_ratio
where prev_month_sale is not null;

-- 10. Market Potential Analysis
-- Identify top 3 city based on highest sales, return city name, total sale, 
-- total rent, total customers, estimated coffee consumer

with avg_sale as (
select ci.city_name ,count(distinct s.customer_id) as total_customers, sum(s.total) as total_sales, 
round(sum(s.total):: numeric / count(distinct s.customer_id)::numeric,2) as avg_sale_per_customer
from city ci
join customers cu
on cu.city_id = ci.city_id
join sales s 
on s.customer_id = cu.customer_id
group by ci.city_name
order by 4 desc)

select a.city_name,round(c.population*0.25/1000000,3) as coffee_consumers_in_millions,c.estimated_rent,
a.total_sales ,a.total_customers, a.avg_sale_per_customer,
round(c.estimated_rent::numeric/a.total_customers::numeric,2) as avg_rent_per_customers
from city c
join avg_sale a
on a.city_name = c.city_name
order by 4 desc;
