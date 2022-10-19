#### Project Data Analysis for Retail: Sales Performance Report
Source : https://academy.dqlab.id/main/package/project/182?pf=0

----

#### Sample of Dataset project

<details>
<summary markdown="span">dqlab_sales_store</summary>

| order_id | order_status    | customer               | order_date | order_quantity | sales     | discount | discount_value | product_category | product_sub_category           |
|----------|-----------------|------------------------|------------|----------------|-----------|----------|----------------|------------------|--------------------------------|
|        3 | Order Finished  | Muhammed MacIntyre     | 2010-10-13 |              6 |    523080 |     0.04 |          20923 | Office Supplies  | Storage & Organization         |
|      293 | Order Finished  | Barry French           | 2012-10-01 |             49 |  20246040 |     0.07 |        1417223 | Office Supplies  | Appliances                     |
|      483 | Order Finished  | Clay Rozendal          | 2011-07-10 |             30 |   9931519 |     0.08 |         794522 | Technology       | Telephones and Communication   |
|      515 | Order Finished  | Carlos Soltero         | 2010-08-28 |             19 |    788540 |     0.08 |          63083 | Office Supplies  | Appliances                     |
|      613 | Order Finished  | Carl Jackson           | 2011-06-17 |             12 |    187080 |     0.03 |           5612 | Office Supplies  | Binders and Binder Accessories |
|      643 | Order Finished  | Monica Federle         | 2011-03-24 |             21 |   5563640 |     0.07 |         389455 | Office Supplies  | Storage & Organization         |
|      678 | Order Returned  | Dorothy Badders        | 2010-02-26 |             44 |    456820 |     0.07 |          31977 | Office Supplies  | Paper                          |
|      807 | Order Finished  | Neola Schneider        | 2010-11-23 |             45 |    393700 |     0.01 |           3937 | Office Supplies  | Paper                          |
|      868 | Order Finished  | Carlos Daly            | 2012-06-08 |             32 |   1433680 |        0 |              0 | Office Supplies  | Appliances                     |
|      933 | Order Finished  | Claudia Miner          | 2012-08-04 |             15 |    161220 |     0.02 |           3224 | Office Supplies  | Binders and Binder Accessories |

</details>

----

#### Overall Performance by Year
Buatlah Query dengan menggunakan SQL untuk mendapatkan total penjualan (sales) dan jumlah order (number_of_order) dari tahun 2009 sampai 2012 (years).

```sql
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
ORDER BY
  years;
```

<details>
<summary markdown="span">OUTPUT :</summary>

| years | sales      | number_of_order |
|-------|------------|-----------------|
|  2009 | 4613872681 |            1244 |
|  2010 | 4059100607 |            1248 |
|  2011 | 4112036186 |            1178 |
|  2012 | 4482983158 |            1254 |

</details>

----

#### Overall Performance by Product Sub Category
Buatlah Query dengan menggunakan SQL untuk mendapatkan total penjualan (sales) berdasarkan sub category dari produk (product_sub_category) 
pada tahun 2011 dan 2012 saja (years) 

```sql
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
 ```
 
<details>
<summary markdown="span">OUTPUT :</summary>

| years | product_sub_category           | sales     |
|-------|--------------------------------|-----------|
|  2011 | Chairs & Chairmats             | 622962720 |
|  2011 | Office Machines                | 545856280 |
|  2011 | Tables                         | 505875008 |
|  2011 | Copiers and Fax                | 404074080 |
|  2011 | Telephones and Communication   | 392194658 |
|  2011 | Binders and Binder Accessories | 298023200 |
|  2011 | Storage & Organization         | 285991820 |
|  2011 | Appliances                     | 272630020 |
|  2011 | Computer Peripherals           | 232677960 |
|  2011 | Bookcases                      | 169304620 |
|  2011 | Office Furnishings             | 160471500 |
|  2011 | Paper                          | 111080380 |
|  2011 | Pens & Art Supplies            |  43093800 |
|  2011 | Envelopes                      |  36463900 |
|  2011 | Labels                         |  15607780 |
|  2011 | Scissors, Rulers and Trimmers  |  12638340 |
|  2011 | Rubber Bands                   |   3090120 |
|  2012 | Office Machines                | 811427140 |
|  2012 | Chairs & Chairmats             | 654168740 |
|  2012 | Telephones and Communication   | 422287514 |
|  2012 | Tables                         | 388993784 |
|  2012 | Binders and Binder Accessories | 363879200 |
|  2012 | Storage & Organization         | 356714140 |
|  2012 | Computer Peripherals           | 308014340 |
|  2012 | Copiers and Fax                | 292489800 |
|  2012 | Appliances                     | 266131100 |
|  2012 | Office Furnishings             | 178927480 |
|  2012 | Bookcases                      | 159984680 |
|  2012 | Paper                          | 126896160 |
|  2012 | Envelopes                      |  58629280 |
|  2012 | Pens & Art Supplies            |  43818480 |
|  2012 | Scissors, Rulers and Trimmers  |  36776400 |
|  2012 | Labels                         |  10007040 |
|  2012 | Rubber Bands                   |   3837880 |

</details>

----

#### Promotion Effectiveness and Efficiency by Years
Pada bagian ini kita akan melakukan analisa terhadap efektifitas dan efisiensi dari promosi yang sudah dilakukan selama ini</br>
Efektifitas dan efisiensi dari promosi yang dilakukan akan dianalisa berdasarkan Burn Rate 
yaitu dengan membandigkan total value promosi yang dikeluarkan terhadap total sales yang diperoleh</br>
DQLab berharap bahwa burn rate tetap berada diangka maskimum 4.5%</br>
</br>
Formula untuk burn rate : (total discount / total sales) * 100</br>
</br>
Buatkan Derived Tables untuk menghitung total sales (sales) dan total discount (promotion_value) berdasarkan tahun(years) 
dan formulasikan persentase burn rate nya (burn_rate_percentage).

```sql
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
```

<details>
<summary markdown="span">OUTPUT :</summary>

| years | sales      | promotion_value | burn_rate_percentage |
|-------|------------|-----------------|----------------------|
|  2009 | 4613872681 |       214330327 |                 4.65 |
|  2010 | 4059100607 |       197506939 |                 4.87 |
|  2011 | 4112036186 |       214611556 |                 5.22 |
|  2012 | 4482983158 |       225867642 |                 5.04 |

</details>

----

#### Promotion Effectiveness and Efficiency by Product Sub Category
Pada bagian ini kita akan melakukan analisa terhadap efektifitas dan efisiensi dari promosi yang sudah dilakukan selama ini seperti pada bagian sebelumnya.</br>
Akan tetapi, ada kolom yang harus ditambahkan, yaitu : product_sub_category dan product_category

```sql
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
```

<details>
<summary markdown="span">OUTPUT :</summary>

| years | product_sub_category           | product_category | sales     | promotion_value | burn_rate_percentage |
|-------|--------------------------------|------------------|-----------|-----------------|----------------------|
|  2012 | Office Machines                | Technology       | 811427140 |        46616695 |                 5.75 |
|  2012 | Chairs & Chairmats             | Furniture        | 654168740 |        26623882 |                 4.07 |
|  2012 | Telephones and Communication   | Technology       | 422287514 |        18800188 |                 4.45 |
|  2012 | Tables                         | Furniture        | 388993784 |        16348689 |                  4.2 |
|  2012 | Binders and Binder Accessories | Office Supplies  | 363879200 |        22338980 |                 6.14 |
|  2012 | Storage & Organization         | Office Supplies  | 356714140 |        18802166 |                 5.27 |
|  2012 | Computer Peripherals           | Technology       | 308014340 |        15333293 |                 4.98 |
|  2012 | Copiers and Fax                | Technology       | 292489800 |        14530870 |                 4.97 |
|  2012 | Appliances                     | Office Supplies  | 266131100 |        14393300 |                 5.41 |
|  2012 | Office Furnishings             | Furniture        | 178927480 |         8233849 |                  4.6 |
|  2012 | Bookcases                      | Furniture        | 159984680 |        10024365 |                 6.27 |
|  2012 | Paper                          | Office Supplies  | 126896160 |         6224694 |                 4.91 |
|  2012 | Envelopes                      | Office Supplies  |  58629280 |         2334321 |                 3.98 |
|  2012 | Pens & Art Supplies            | Office Supplies  |  43818480 |         2343501 |                 5.35 |
|  2012 | Scissors, Rulers and Trimmers  | Office Supplies  |  36776400 |         2349280 |                 6.39 |
|  2012 | Labels                         | Office Supplies  |  10007040 |          452245 |                 4.52 |
|  2012 | Rubber Bands                   | Office Supplies  |   3837880 |          117324 |                 3.06 |

</details>

----

#### Customers Transactions per Year
DQLab Store ingin mengetahui jumlah customer (number_of_customer) yang bertransaksi setiap tahun dari 2009 sampai 2012 (years).

```sql
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
```

<details>
<summary markdown="span">OUTPUT :</summary>

| years | number_of_customer |
|-------|--------------------|
|  2009 |                585 |
|  2010 |                593 |
|  2011 |                581 |
|  2012 |                594 |

</details>
