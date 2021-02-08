select
  price_each
from {{ ref('stg_orderdetail')}}
where not(price_each >= 0)