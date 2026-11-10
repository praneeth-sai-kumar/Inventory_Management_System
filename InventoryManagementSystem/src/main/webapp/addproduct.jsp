
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

body {
    background-color: #eef4f8;
    min-height: 100vh;
}

.welcome-bar {
    background-color: #164e70;
    color: white;
    text-align: center;
    padding: 25px 10px;
}

.welcome-bar h3 {
    font-size: 26px;
}

nav {
    background-color: white;
    display: flex;
    justify-content: center;
    gap: 35px;
    padding: 18px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

nav a {
    color: #1e3a5f;
    text-decoration: none;
    font-weight: bold;
}

nav a:hover {
    color: #2196f3;
    text-decoration: underline;
}

.container {
    max-width: 550px;
    margin: 40px auto;
    padding: 35px;
    background-color: white;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.12);
}

.container h1 {
    text-align: center;
    color: #164e70;
    margin-bottom: 25px;
}

label {
    display: block;
    color: #333;
    font-weight: bold;
    margin: 14px 0 7px;
}

input[type="text"],
input[type="number"],
textarea {
    width: 100%;
    padding: 11px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 15px;
}

textarea {
    resize: vertical;
}

button {
    width: 100%;
    background-color: #236b91;
    color: white;
    padding: 13px;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    font-weight: bold;
    margin-top: 25px;
    cursor: pointer;
}

button:hover {
    background-color: #164e70;
}

.status {
    text-align: center;
    margin-bottom: 15px;
    color: #164e70;
    font-weight: bold;
}

@media (max-width: 600px) {
    .container {
        margin: 30px 15px;
        padding: 25px;
    }

    nav {
        gap: 15px;
        flex-wrap: wrap;
    }
}
</style>

</head>
<body>

<div class="welcome-bar">
    <h3>Inventory Management System</h3>
</div>

<nav>
    <a href="admin.jsp">Home</a>
    <a href="addproduct.jsp">Add Product</a>
    <a href="findAllProducts">View Products</a>
    <a href="logout">Logout</a>
</nav>

<div class="container">

    <h1>Add Product</h1>

    <%
        String msg = request.getParameter("msg");

        if ("success".equals(msg)) {
    %>
        <p class="status">Product Added Successfully!</p>
    <%
        } else if ("error".equals(msg)) {
    %>
        <p class="status">Unable to Add Product!</p>
    <%
        }
    %>

    <form action="saveProduct"  >

        <label>Product Name</label>
        <input type="text" name="product_name" required>

        <label>Category</label>
        <input type="text" name="category" required>

        <label>Brand</label>
        <input type="text" name="brand">

        <label>Price</label>
        <input type="number" name="price" step="0.01" min="0" required>

        <label>Quantity</label>
        <input type="number" name="quantity" min="0" required>

        <label>Supplier</label>
        <input type="text" name="supplier">

        <label>Description</label>
        <textarea name="description" rows="4"></textarea>

        <button type="submit">Save Product</button>

    </form>

</div>

</body>
</html>
