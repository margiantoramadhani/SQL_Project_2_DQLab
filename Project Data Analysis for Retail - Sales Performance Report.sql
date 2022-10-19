# Overall Performance by Year

SELECT 
  year(order_date) as years, 
  sum(sales) as sales, 
  count(order_quantity) as number_of_order 
FROM 
  dqlab_sales_store
WHERE 
  order_status="order finished"
GROUP BY 
  year(order_date)
ORDER BY years ; 

# Overall Performance by Product Sub Category

SELECT 
  year(order_date) as years, 
  product_sub_category, 
  sum(sales) as sales
FROM 
  dqlab_sales_store
WHERE 
  order_status="order finished"
  and year(order_date) > 2010
GROUP BY 
  years, product_sub_category
ORDER BY
  years, sales 
 DESC;
 
 # Promotion Effectiveness and Efficiency by Years
 
SELECT 
  year(order_date) as years, 
  sum(sales) as sales, 
  sum(discount_value) as promotion_value, 
  ROUND(sum(discount_value)/sum(sales)*100,2) as burn_rate_percentage
FROM 
  dqlab_sales_store
WHERE 
  order_status = "order finished"
GROUP BY 
  years 
ORDER BY 
  years;
  
  # Promotion Effectiveness and Efficiency by Product Sub Category
  
SELECT
  year(order_date) as years,
  product_sub_category,
  product_category,
  sum(sales) as sales,
  sum(discount_value) as promotion_value,
  ROUND(SUM(discount_value)/SUM(sales)*100,2) as burn_rate_percentage
FROM
  dqlab_sales_store
WHERE
  order_status="order finished" and year(order_date)=2012
GROUP BY
  years, product_category, product_sub_category
ORDER BY sales DESC;

# Customers Transactions per Year

SELECT
  year(order_date) as years,
  COUNT(DISTINCT customer) as number_of_customer
FROM
  dqlab_sales_store
WHERE
  order_status="order finished"
GROUP BY 
  year(order_date)
ORDER BY
  year(order_date) 
  ASC;