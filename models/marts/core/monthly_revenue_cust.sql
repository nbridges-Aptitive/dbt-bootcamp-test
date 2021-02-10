with monthly_revenue as(
  select month(oh.order_date) as Month, cust.customer_number, cust.customer_name as Customer, sum(od.revenue) as Revenue, cust.region as Region
    from {{ ref('stg_orderheader')}} oh
    full join {{ ref('stg_orderdetail')}} od on oh.order_number = od.order_number
    left join {{ ref('stg_customer')}} cust on oh.customer_number = cust.customer_number
    where year(oh.order_date) = 2004
    group by month(oh.order_date), cust.customer_number, cust.customer_name, Region
)

SELECT Customer, Month, sum(Revenue) over(partition by Customer order by Month) as "Revenue (Running Total)", Revenue as "Monthly Revenue", Region
from monthly_revenue
order by customer, month