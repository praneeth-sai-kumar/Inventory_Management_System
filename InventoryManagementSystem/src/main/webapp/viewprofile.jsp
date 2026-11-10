
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String email = (String) session.getAttribute("email");

    if (email == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Employee Management System</title>

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
    color: bisque;
    text-decoration: underline;
}

.container {
    max-width: 900px;
    margin: 70px auto;
    padding: 35px;
    background-color: white;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.12);
}

.container h2 {
    color: #164e70;
    text-align: center;
    margin-bottom: 25px;
}

table {
    width: 100%;
    border-collapse: collapse;
    text-align: center;
}

th {
    background-color: #236b91;
    color: white;
    padding: 14px 10px;
}

td {
    padding: 14px 10px;
    border: 1px solid #ddd;
    color: #444;
}

tr:nth-child(even) {
    background-color: #eef4f8;
}

footer {
    background-color: #164e70;
    color: white;
    text-align: center;
    padding: 15px;
    margin-top: 50px;
}

@media (max-width: 700px) {
    .container {
        margin: 40px 15px;
        padding: 15px;
        overflow-x: auto;
    }

    nav {
        gap: 20px;
        flex-wrap: wrap;
    }

    table {
        min-width: 650px;
    }
}
</style>
</head>

<body>

<!-- Header -->
<div class="welcome-bar">
    <h2>WELCOME TO EMPLOYEE MANAGEMENT SYSTEM</h2>
</div>

<!-- Navigation -->
<nav>
    <a href="employee.jsp">Home</a>
    <a href="viewprofile">View Profile</a>
    <a href="logout">Logout</a>
</nav>

<!-- Employee Details -->
<div class="container">

    <h2>Welcome, <%= email %>!</h2>

    <table>
        <tr>
            <th>Email</th>
            <th>Name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Mobile</th>
        </tr>

        <tr>
            <td>${employee.email}</td>
            <td>${employee.name}</td>
            <td>${employee.age}</td>
            <td>${employee.gender}</td>
            <td>${employee.mobile}</td>
        </tr>
    </table>

</div>

<!-- Footer -->
<footer>
    <p>&copy; 2026 Inventory Management System. All Rights Reserved.</p>
</footer>

</body>
</html>
