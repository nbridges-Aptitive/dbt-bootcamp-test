{% macro order_revenue() %}
sum(od.quantity_ordered * od.price_each)
{%- endmacro %}