# Write your MySQL query statement below
#u can write the condition inside the agg function without case
select round(avg(order_date=customer_pref_delivery_date)*100, 2) as immediate_percentage from Delivery where(customer_id, order_date)in(
     Select customer_id, min(order_date) 
  from Delivery
  group by customer_id
)
