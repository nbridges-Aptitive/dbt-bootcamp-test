with monthlyrevenue as(
  select month(oh.orderdate) as Month, cust.customernumber, cust.customername as Customer, sum(od.quantityordered * od.priceeach) AS Revenue
    from {{ ref('stg_orderheader')}} oh
    full join {{ ref('stg_orderdetail')}} od using (ordernumber)
    left join {{ ref('stg_customer')}} cust using (customernumber)
    where year(oh.orderdate) = 2004
    group by month(oh.orderdate), cust.customernumber, cust.customername
)

SELECT Customer, Month, sum(Revenue) over(partition by Customer order by Month) as "Revenue (Running Total)", Revenue as "Monthly Revenue"
from monthlyrevenue