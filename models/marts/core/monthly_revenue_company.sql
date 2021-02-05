with monthlyrevenue as(
  select month(oh.orderdate) as Month, sum(od.quantityordered * od.priceeach) AS Revenue
    from {{ ref('stg_orderheader')}} oh
    full join {{ ref('stg_orderdetail')}} od using (ordernumber)
    where year(oh.orderdate) = 2004
    group by month(oh.orderdate)
)

SELECT Month, sum(Revenue) over(order by Month) as "Revenue (Running Total)", Revenue as "Monthly Revenue"
from monthlyrevenue