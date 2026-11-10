
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product</title>

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
    font-size: 16px;
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
    <a href="searchproduct.jsp">Search Product</a>
    <a href="logout">Logout</a>
</nav>

<div class="container">

    <h1>Edit Product</h1>

    <%
        com.model.Product p = (com.model.Product) request.getAttribute("product");
    %>

    <form action="updateProduct" method="get">

        <label>Product ID</label>
        <input type="number" name="product_id"
            value="<%= p.getProduct_id() %>" readonly>

        <label>Product Name</label>
        <input type="text" name="product_name"
            value="<%= p.getProduct_name() %>" required>

        <label>Category</label>
        <input type="text" name="category"
            value="<%= p.getCategory() %>" required>

        <label>Brand</label>
        <input type="text" name="brand"
            value="<%= p.getBrand() %>">

        <label>Price</label>
        <input type="number" name="price" step="0.01" min="0"
            value="<%= p.getPrice() %>" required>

        <label>Quantity</label>
        <input type="number" name="quantity" min="0"
            value="<%= p.getQuantity() %>" required>

        <label>Supplier</label>
        <input type="text" name="supplier"
            value="<%= p.getSupplier() %>">

        <label>Description</label>
        <textarea name="description" rows="4"><%= p.getDescription() %></textarea>

        <button type="submit">Update Product</button>

    </form>

</div>

</body>
</html>
