**Readme under the work**

> <h1>Cafeteria Management System</h1>



# Credentials to test the [Website](https://yaswantth-cafeteria-management.herokuapp.com/)

<h3>Owner</h3>
  Email: cafeowner@gmail.com<br>
  Password: owner
  
<h3>Online Customer</h3>
  Email: demo@gmail.com<br>
  Password: USER@demo$4

<h2>About</h2>

This project is online representation of cafe or restaurant. This is a MVP (1.0.0) built using **Ruby on Rails(6)**, **HTML**, **CSS**, and **Postgresql** as the database and finally deployed to heroku.


<h2>Personas</h2>

There are 3 personas:

- Customer
- Billing Clerk
- Owner


<h3>Customer</h3>

> This is a regular customer who visits the website. They can able to place orders, see the status of their active order, and see the history of all the orders they placed.

- Customer can sign up to create a new account. If they are existing users they can sign-in using their email and password.
- Appropriate errors pop up if they try to sign up using an existing user's email, or if they leave the form blank.
- They can see the active menu and menu items and can add items to the cart and place an order.
- They can see their orders staus,history invoices and cart items.



<h3>Cafeteria Billing Clerk</h3>

> Billing clerks can only sign-in and sign-out. They cannot sign-up by themselves. Their accounts can be created only by the owner.

- They can see all the orders and can change the status of the orders.
- Clerk can create orders for offline customers.

<h3>Cafeteria Owner</h3>

> The owner has complete access of the system. They can add and update stock, create invoices, see all reports and so on.

- Nobody can sign-up as an owner. Instead, the live application should come with an owner already created.
- Can create clerks and other owners.
- Owner can manage the menu such as view, create, update, active/inactive a menu category
- Can manage menu items in menu categories such as add, delete and update.
- Can see reports.
- can manage the users.


