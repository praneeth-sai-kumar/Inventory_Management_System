
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Products</title>

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
    width: 95%;
    margin: 40px auto;
    padding: 30px;
    background-color: white;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.12);
    overflow-x: auto;
}

.container h1 {
    text-align: center;
    color: #164e70;
    margin-bottom: 25px;
}

table {
    width: 100%;
    border-collapse: collapse;
    text-align: center;
}

th {
    background-color: #164e70;
    color: white;
    padding: 13px;
}

td {
    padding: 12px;
    border-bottom: 1px solid #ddd;
}

tr:hover {
    background-color: #eef4f8;
}

.edit {
    color: #236b91;
    text-decoration: none;
    font-weight: bold;
}

.delete {
    color: #d32f2f;
    text-decoration: none;
    font-weight: bold;
}

@media (max-width: 600px) {
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

    <h1>Product Details</h1>

    <table>

        <tr>
            <th>ID</th>
            <th>Product Name</th>
            <th>Category</th>
            <th>Brand</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Supplier</th>
            <th>Description</th>
            <th>Action</th>
        </tr>

        <c:forEach items="${productList}" var="p">

            <tr>
                <td>${p.product_id}</td>
                <td>${p.product_name}</td>
                <td>${p.category}</td>
                <td>${p.brand}</td>
                <td>${p.price}</td>
                <td>${p.quantity}</td>
                <td>${p.supplier}</td>
                <td>${p.description}</td>

                <td>
                    <a class="edit" href="editProduct?product_id=${p.product_id}">Edit</a>
                    |
                    <a class="delete" href="deleteProduct?product_id=${p.product_id}">Delete</a>
                </td>
            </tr>

        </c:forEach>

    </table>

</div>

</body>
</html>
