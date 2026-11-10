
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("email") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Dashboard</title>

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

.welcome-bar h2 {
    font-size: 26px;
}

nav {
    background-color: #236b91;
    display: flex;
    justify-content: center;
    gap: 40px;
    padding: 15px;
}

nav a {
    color: white;
    text-decoration: none;
    font-size: 17px;
    font-weight: bold;
}

nav a:hover {
    color: #dcecf5;
    text-decoration: underline;
}

.container {
    max-width: 650px;
    margin: 90px auto;
    padding: 40px;
    background-color: white;
    border-radius: 12px;
    text-align: center;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.12);
}

.container h2 {
    color: #164e70;
    margin-bottom: 20px;
    font-size: 27px;
}

.container p {
    color: #444;
    font-size: 17px;
    line-height: 1.7;
    margin-bottom: 25px;
}

.profile-btn {
    display: inline-block;
    background-color: #236b91;
    color: white;
    text-decoration: none;
    padding: 12px 30px;
    border-radius: 6px;
    font-size: 16px;
    font-weight: bold;
}

.profile-btn:hover {
    background-color: #164e70;
}

footer {
    background-color: #164e70;
    color: white;
    text-align: center;
    padding: 15px;
    margin-top: 50px;
}

footer p {
    margin: 0;
}

@media (max-width: 600px) {
    nav {
        gap: 18px;
        flex-wrap: wrap;
    }

    .container {
        margin: 50px 15px;
        padding: 25px;
    }

    .welcome-bar h2 {
        font-size: 21px;
    }
}
</style>
</head>

<body>

<!-- Header -->
<div class="welcome-bar">
    <h2>WELCOME TO INVENTORY MANAGEMENT SYSTEM</h2>
</div>

<!-- Navigation -->
<nav>
    <a href="employee.jsp">Home</a>
     <a href="addproduct.jsp">Add Product</a>
    <a href="findAllProducts">View Products</a>
    <a href="viewprofile">View Profile</a>
    <a href="logout">Logout</a>
</nav>

<!-- Employee Home Section -->
<div class="container">

    <h2>
        Welcome, <%= session.getAttribute("email") %>!
    </h2>

    <p>
        Welcome to your Employee Dashboard.

        You can view your profile, check product availability,
        monitor inventory details, and perform stock IN and OUT
        operations based on your assigned permissions.
    </p>

    <a href="viewprofile" class="profile-btn">View My Profile</a>

</div>

<!-- Footer -->
<footer>
    <p>&copy; 2026 Inventory Management System. All Rights Reserved.</p>
</footer>

</body>
</html>
