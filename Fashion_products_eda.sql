-- An EDA Project:-
-- A hybrid recommendation system is a recommendation technique that
--  offers a complete and balanced approach by mixing two or more recommendation techniques.
--  It aims to provide more accurate, diverse and personalized recommendations to 
-- users leveraging the strengths of different techniques and providing valuable user experience. 
-- If you want to know how to build a hybrid recommendation system, this article is for you. 
-- In this article, I will take you through building a Hybrid Recommendation System using Python.

-- The first to rename the columns 
alter table fashion_products rename column`ï»¿User_ID` to User_ID

-- These questions are designed to help you explore patterns, identify trends, and gain insights from your fashion_products data.

-- 1. Basic Data Overview & Understanding.
-- Question: How many unique brands are present in the dataset

SELECT 
    COUNT(DISTINCT brand) AS Brands_in_mydataset
FROM
    fashion_products;
    
    --  This dataset has 5 kind of brands
    
-- Question : What are the different categories of the products available ? 
-- How many products are there in each and every category?
SELECT DISTINCT
    category
FROM
    fashion_products; 

-- Insights:   There are three Category in this datasets 'Men's Fashion ,'women's Fashion     ,'kids's Fashion 

SELECT DISTINCT
    category, COUNT(Product_Name)
FROM
    fashion_products
GROUP BY Category;    
         -- Insights: This fashion dataset has women favourable because it has a lot of women products like large in number
  
-- Question : What are the distribution of product by size?
SELECT 
    size, COUNT(Product_Name)
FROM
    fashion_products
GROUP BY size;  
       -- Insights: Size-wise products are same in number (XL=60),(L=62),(S=62)and (M=66)
       
 -- 2. Price & Rating Analysis:
 --   Question:   What are the average price of products per category?
SELECT 
    category, ROUND(AVG(price), 2) AS Avg_price
FROM
    fashion_products
GROUP BY category;
 -- Insights: The Average price category-wise is below 60 of each and every category, here it is
                                                                       -- (Men's Fashion	50.85)
                                                                     -- (Women's Fashion	54.78)
                                                                         -- (Kids' Fashion	58.09)
                                                                         
 -- Question :   Which brands have the  highest average products rating?
SELECT 
    brand, ROUND(AVG(rating), 2) AS avg_rating
FROM
    fashion_products
GROUP BY brand
ORDER BY avg_rating DESC
LIMIT 1;
   --  Insights: The btand Gucci has highest average rating with the 3.26
 
 -- Question: What is the average price of products for each brand?
SELECT 
    brand, ROUND(AVG(price), 2) AS Avg_price_per_brand
FROM
    fashion_products
GROUP BY brand;
    -- insights: The average price per brands are below 60 and here are they
                                           --         Adidas	56.58
                                          --             H&M	49.11
											-- 			Zara	54.93
										  --                Gucci	56.40
                                           --             Nike	56.23
                                           
 -- Questions : Is there any correlation between price and rating ? 
 -- (is there any relation like highere price items are generally rated higher)
SELECT 
    product_id, product_name, brand, price, ROUND(rating, 2)
FROM
    fashion_products
ORDER BY ROUND(rating, 2) DESC
LIMIT 20;
-- Insights: No is there no any correlation between price and rating , 
-- Because i got like the price is low and rating are highere in my datasets.

-- 3. Brand & Category Specific Insights:
   -- Questions : For each brand , what are thier most popular products category (by count)?
SELECT 
    brand, Category, COUNT(*) AS Number_of_products
FROM
    fashion_products
GROUP BY brand , Category
ORDER BY Brand , Number_of_products DESC;
     -- Insights : The brand Adidas is having a lot specific Women's fashion  23 
     
-- What are the top 5 most expensive products in each category ?
SELECT 
    product_name, brand, category, MAX(price) Expensive_products
FROM
    fashion_products
GROUP BY product_name , brand , category
ORDER BY category DESC , Expensive_products DESC
LIMIT 5;
-- Insights : The 5 most expensive products are 
                                  -- Dress	Adidas	Women's Fashion	98
                                   --  Sweater	Gucci	Women's Fashion	98
                                 --  Dress	H&M	Women's Fashion	97
                               --  Jeans	Zara	Women's Fashion	95
                                 --   Dress	Nike	Women's Fashion	93
  
  -- 4. User Bhavior (If user_ID implies distinct users):
  -- Question : How many unique users have intracted with products in each category?
SELECT 
    User_ID, COUNT(Product_ID) AS Number_of_orders
FROM
    fashion_products
GROUP BY User_ID
ORDER BY Number_of_orders DESC;
-- User_ID 98,6,54 and 48 has the highest orders with the number of 6

-- What is the average number of products a user has intracted with ?
SELECT 
    ROUND(AVG(ProductsPerUser),2) AS AverageProductsPerUser
FROM
    (SELECT 
        User_ID, COUNT(*) AS ProductsPerUser
    FROM
        fashion_products
    GROUP BY User_ID) AS UserProductCounts;
    
    -- Insights : Average number of products_per_user is 2.72
    
    
    -- Conclusion:-
-- Through this exploratory data analysis on the Fashion Products dataset,
-- I gained meaningful insights into the overall trends, pricing strategies, 
-- and user interactions with different brands and categories. The analysis 
-- revealed that women’s fashion products dominate the dataset, both in quantity and variety, 
-- followed by men’s and kids’ fashion. Price variations were generally moderate, 
-- with an average price below 60 across all categories, and Gucci emerged as
--  the brand with the highest average rating despite no strong correlation between 
-- price and rating. User engagement analysis highlighted that certain users interact 
-- significantly more with the platform, with an average of 2.72 products per user.

-- This project helped in understanding data distribution, brand-specific strengths, 
-- and user behavior patterns, which can be beneficial for making informed
--  business decisions, designing better recommendations, and improving overall customer experience.

-- Alhamdulillah, this marks the successful completion of my Fashion Products EDA project.

    
 
  