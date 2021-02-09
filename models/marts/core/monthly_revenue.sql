with monthlyrevenue as(
  select month(oh.order_date) as Month, sum(od.revenue) as Revenue
    from {{ ref('stg_orderheader')}} oh
    full join {{ ref('stg_orderdetail')}} od using (order_number)
    where year(oh.order_date) = 2004
    group by month(oh.order_date)
)

SELECT Month, sum(Revenue) over(order by Month) as "Revenue (Running Total)", Revenue as "Monthly Revenue"
from monthlyrevenue