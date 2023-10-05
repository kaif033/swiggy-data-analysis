
select  * from items;
--  how many distinct items were ordered --
select count(distinct(name)) from items;
-- lets ee how many veg and non veg items are there --
select distinct(is_veg) from items;
select  count(distinct(name)) as total_items ,is_veg from items group by is_veg;

-- chicken --
select * from items where name like "%chicken%";
-- average ordr per item -
select count(name)/count(distinct(order_id)) as avg_order from items; 
-- lets see how many times each item was ordered --
select name,count(*) from items group by name order by count(*) desc limit 5 ;
-- lets see take a look on the order data and perfrom some analysis
select * from orders;
-- lets see how many distinct resturants we have ordered from --
select count(distinct(restaurant_name)) as total_restuarant from orders;
-- lets see how many times we have ordered from a resturant --
select restaurant_name,count(*) as total_orders from orders group by restaurant_name order by count(*) desc;
-- lets see which month and year has highest orders --
select year(order_time) as year,month(order_time) as month,count(distinct(order_id)) number_of_orders from orders
group by year(order_time),month(order_time)
order by count(distinct(order_id)) desc;

-- lets see how much revenue we made in which year sort highest to lowest --
select year(order_time) as YEAR , sum(order_total) as Total_Revenue from orders
group by YEAR 
order by sum(order_total) desc ;

-- lets seee the average order value --
select sum(order_total) / count(order_id) as average_order_value from orders;


create view final as (
select year(order_time) as YEAR , sum(order_total) as Total_Revenue from orders
group by YEAR );
-- select YEAR,Total_Revenue, lag(Total_Revenue) over(order by YEAR) as Previous_Revenue from final;--
-- select YEAR,Total_Revenue, Rank() over(order by YEAR) as Previous_Revenue from final;--
-- lets see the revenue made by the resturants --
select restaurant_name,sum(order_total) as Total_Revenue from orders
group by restaurant_name
order by Total_Revenue desc limit 10;
-- lets see the revenue distribution via rain mode --
select rain_mode,sum(order_total) as Total_Revenue from orders
group by rain_mode
order by Total_Revenue desc ;
-- lets say we want too see in each order what items were ordered --
select orders.order_id,items.name ,orders.restaurant_name  from orders join items on orders.order_id=items.order_id;
select * from orders


