# eShopping-platform
CSC 131 repository for our eShopping Platform project

## Project information:
Our project is a shopping website that allows users to manage a shopping cart and place orders. Shoppers are also allowed to login, search and browse products, favorite products, remove or add to the shopping cart, have them provide their address and make payments using a card. Admin access and inventory management will also be supported. For this second iteration of our eShopping Prototype, we are developing the database tier for our platform using SQlite. 

## Database:
The data that the project will store on a secondary storage includes user and admin information, payment information, shopper addresses, products and their details, product quantities, shopping carts, orders and favorite products. This data will be used to manage purchases, process deliveries and payments, take care of inventory management, manage customer and admin accounts and keep track of shopping cart activity

## Tables and Fields

| Table | Fields |
| --- | --- |
| Category | category_id (PK), category_name |
| Item | item_id(PK), sku_num, item_name, expiration, quantity INT, cost FLOAT, category_id(FK) |
| Favorite_Products | shopper_id(PK,FK),item_id(PK,FK) |
| Cart | cart_id(PK), shopper_id(FK) |
| Cart_Item | cart_id(PK, FK), item_id(PK, FK), quantity |
| Orders | order_id(PK), shopper_id(FK), card_id(FK), total, delivery |
| Order_Item | order_id(PK,FK), item_id(PK,FK), quantity, purchase_price |
| Shopper | shopper_id(PK,FK) |
| User | user_id(PK), phone_number, first_name, last_name, email_address, password_hash |
| Admin | admin_id(PK, FK) |
| Address | address_id(PK), shopper_id(FK), city TEXT, street TEXT, zip_code TEXT, state TEXT |
| Card | card_id(PK), shopper_id(FK), card_dig TEXT, type TEXT |




## Represented in NoSQL:
If we chose to use No_SQL, we could use a database such as MongoDB to store our data in a document database. For example, one object we could create would be the shopping cart. Each product in the shopping cart would also be an object. This would allow us to create one document for a cart, which can contain multiple products. The keys could be int item_id, string item_name, int quantity and double cost. An example of values for these keys for the item would be 123, “Apple”, 5, and 3.75. 

## Summary:
For our database project, we chose SQLite, as it is a serverless DBMS that has the ability to run within applications. We decided on this because we wanted to start with a smaller database that would specifically display our category, cart, item, and cart_item tables. We wanted to make this iteration more of a demonstration of what our database will hold by presenting these 4 tables. With this iteration it was a bit difficult to work with our team since we were not able to meet in person and we communicating through Discord, however we were all able to bring up thoughtful pieces to the project and collaborate effectively to ensure that we had the same idea of what we wanted to do for this iteration.

## Individual Reflection:
Hailey: 
Hailey: I helped out my team with examining the ER diagram and the SQL files that they had begun writing. I was able to give thoughtful input to improve and build upon what they had presented to the rest of the group. After careful examination and some of my own expansion we were able to fully update and agree upon a funcitonal ER diagram along with an SQL file that we thought presented what we wanted for this iteration. I utilized interactive SQL learning websites to help me understand how to get a grasp on the language, since I hadn't used it before. I also utilized the Lucid Chart website for the ERD to fully understand what I thought our ERD would need, as well as watching their videos they provided. I will say it was a bit more difficult for me to fully understand the code since this was my first time actually utilizing it. Overall 

Fatema:  For this project iteration, we first began by discussing the pros and cons of using SQL vs. No-SQL and we decided to go for SQL that is easier to implement based on our skill sets and easier to use because it requires minimal configuration. However, my main focus for this project iteration was the UI and advancing the progress on the project. I focused on adding the new pages to the UI, the sign in and the create account page that have user input. I also added a page that will redirect to the home page. For the UI, I believe we only need to add one more page, the shopping cart page, and we can wrap up the UI development since we have 4/5 pages developed already. One of the setbacks during this project iteration was figuring out how to adjust the web pages as window resized and trying to optimize the styling formats in the .css to work for the other three pages. I did not want to rewrite and be redundant with the code in the same file or by creating a separate file. I also laid some groundwork in the .html and .js that will make it easier to tie it to the middle tier. For instance the showLoading function in the .js file. 


Kylie: I started by answering the questions about the database on the google doc. I also used SQLite to help start with creating the tables. The tables were based off of the entities from the ER diagram, and I provided all of the attributes, primary keys and foreign keys within the tables. I then created statements that would insert data within these tables and added select statements to retrieve specific data from the tables. My team members then built upon this code, to finish creating the database. At first, I struggled understanding how to code the relationships between the tables, so this process helped me learn how SQL works and gave me a better understanding on how data will be organized and stored. It also made me understand the relationships between these entities, along with how to connect them using the foreign keys and primary keys. Now I understand how these tables are able to relate to other tables. We decided to use only SQL in this prototype, since everything in the ER diagram worked with clearly structured tables we could create in SQL. 

    
Joe:
I created an initial ER diagram for our application using drawio.The class diagram served as a guide for the attributes. I utilized a helpful article about converting a class diagram to an ER diagram. Careful consideration had to be taken for the cardinality as well. The ER diagram was then improved upon suggestions and review from my team. I also contributed by writing SQL to add a database component to our project. I utilized an online playground to quickly test out SQL statements and created some tables needed for this iteration of the project as well as some sample queries. The tutorials point and geek for geek websites helped with understanding SQLite syntax. Other team members eventually expanded upon the SQL and created the rest of the tables and more queries. I eventually added some more SQL and separated them into different tabs for better organization. The process of using an online playground environment helped me quickly write and test SQL especially by separating the SQL into different tabs that allowed for easier testing of the SQL statements.
