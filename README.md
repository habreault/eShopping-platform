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

## INdividual Reflection:
Hailey: I helped out my team with examining the ER diagram and the SQL files that they had begun writing. I was able to give thoughtful input to improve and build upon what they had presented to the rest of the group. After careful examination and some of my own expansion we were able to fully update and agree upon a funcitonal ER diagram along with an SQL file that we thought presented what we wanted for this iteration. I utilized interactive SQL learning websites to help me understand how to get a grasp on the language, since I hadn't used it before. I also utilized the Lucid Chart website for the ERD to fully understand what I thought our ERD would need, as well as watching their videos they provided. I will say it was a bit more difficult for me to fully understand the code since this was my first time actually utilizing it. Overall 

Fatema:  

Kylie:
    
Joe:
