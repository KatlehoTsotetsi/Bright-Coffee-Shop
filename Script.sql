SELECT
  *
FROM
  "CASESTUDY"."PUBLIC"."BRIGHTCOFFEE";

Select count(TRANSACTION_ID) as Total_number_of_Transactions
from casestudy.public.brightcoffee;

select count(distinct transaction_id) as Unique_Customers
from casestudy.public.brightcoffee;

Select min(transaction_time) AS Opening_Hour
from casestudy.public.brightcoffee;

select max(transaction_time) AS Closing_Hour
from casestudy.public.brightcoffee;

select distinct product_category,
    from casestudy.public.brightcoffee
    union
    select STORE_LOCATION
    from casestudy.public.brightcoffee;

 --cHECK WHICH PRODUCT SELLS THE MOST AND WHEN   
SELECT STORE_LOCATION,
 TO_CHAR(TO_DATE(TRANSACTION_DATE),'YYYYMM') AS Month_ID,
 SUM(TRANSACTION_QTY*UNIT_PRICE) AS TOTAL_AMOUNT,
transaction_id ,
PRODUCT_ID ,
PRODUCT_CATEGORY,PRODUCT_TYPE,PRODUCT_DETAIL,
CASE
WHEN TRANSACTION_TIME BETWEEN '06:00:00' AND '11:59:00' THEN 'Morning'
WHEN TRANSACTION_TIME BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
WHEN TRANSACTION_TIME BETWEEN '17:00:00' AND '19:59:59' THEN 'Evening'
ELSE 'Night'
END AS Time_Buckets
from casestudy.public.brightcoffee
group by all;

--Top 5 selling products
Select count(transaction_id) as number_of_customers,
       product_type
from casestudy.public.brightcoffee
group by product_type
order by number_of_customers desc;


SELECT count(transaction_id) AS Customers,
      sum(transaction_qty) AS Total_Products_sold,
      case
      when transaction_time between '06:00:00' and '11:59:59' then 'Morning'
      when transaction_time between '12:00:00' and '16:59:59' then 'Afternoon'
      when transaction_time between '17:00:00' and '19:59:59' then 'Evening'
      ELSE 'Night'
      end as Time_of_day
      from casestudy.public.brightcoffee
      group by all
      order by customers desc;


SELECT store_location,
      sum(transaction_qty*unit_price) AS Total_Revenue,
      from casestudy.public.brightcoffee
      group by store_location;

Select product_category,
      count(transaction_id) AS Number_of_Customers,
      from casestudy.public.brightcoffee
      group by product_category
      order by number_of_customers desc;
