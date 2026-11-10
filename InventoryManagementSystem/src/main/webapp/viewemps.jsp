
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Inventory Management System</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

body {
    background: #eef4f8;
    min-height: 100vh;
    padding-top: 150px;
}

/* Header */

.welcome-bar {
    position: fixed;
    top: 0;
    width: 100%;
    text-align: center;
    padding: 18px 0;
    font-size: 24px;
    font-weight: bold;
    color: white;
    background: #164e70;
    z-index: 1000;
}

.welcome-bar:hover {
    color: #cceeff;
}

/* Navigation */

nav {
    position: fixed;
    top: 60px;
    width: 100%;
    display: flex;
    justify-content: center;
    gap: 30px;
    padding: 15px 0;
    z-index: 999;
    background: #164e70;
}

nav a {
    color: white;
    text-decoration: none;
    font-weight: bold;
    font-size: 18px;
    cursor: pointer;
}

nav a:hover {
    text-decoration: underline;
    color: #cceeff;
}

/* Main Container */

.container,
.section-content,
.home-content {
    max-width: 1100px;
    margin: 30px auto;
    background: white;
    padding: 30px;
    border-radius: 12px;
    border: none;
    display: block;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.home-content:hover {
    text-decoration: none;
    color: #164e70;
}

/* Form Styling */

form {
    display: flex;
    flex-direction: column;
}

label {
    margin-top: 12px;
    font-weight: bold;
    color: #164e70;
}

input,
select,
textarea {
    padding: 10px;
    margin-top: 5px;
    border: 1px solid #aaa;
    border-radius: 5px;
}

.gender {
    display: flex;
    justify-content: space-around;
    margin-top: 5px;
}

.gender label {
    font-weight: normal;
}

/* Buttons */

button {
    margin-top: 20px;
    padding: 12px;
    background-color: #236b91;
    color: white;
    border: none;
    border-radius: 25px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #164e70;
}

/* Employee Heading */

h2 {
    text-align: center;
    font-size: 24px;
    font-weight: bold;
    color: #164e70;
    margin-bottom: 20px;
}

/* Employee Table */

table {
    width: 100%;
    margin-top: 25px;
    border-collapse: collapse;
    background: white;
    text-align: center;
}

th {
    background: #236b91;
    color: white;
    padding: 13px 10px;
}

td {
    padding: 12px 10px;
    border: 1px solid #ddd;
    color: #333;
}

tr:nth-child(even) {
    background: #f2f7fa;
}

tr:hover {
    background: #e2eff6;
}

/* Edit and Delete Links */

td a {
    color: #236b91;
    font-weight: bold;
    text-decoration: none;
}

td a:hover {
    color: #164e70;
    text-decoration: underline;
}

/* Footer */

footer {
    background: #164e70;
    color: white;
    text-align: center;
    padding: 15px;
    margin-top: 50px;
}

</style>

</head>

<body>

<%
    String email = (String)session.getAttribute("email");

    if(email == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<div class="welcome-bar">
    <h3>WELCOME TO INVENTORY MANAGEMENT SYSTEM</h3>
</div>

<nav>
    <a href="admin.jsp">Home</a>
    <a href="findAll">View Employees</a>
    <a href="search.jsp">Search Employee</a>
    <a href="logout">Logout</a>
</nav>

<div id="home" class="container">

    <h2>Welcome to <%=session.getAttribute("email")%></h2>

    <h2>Employee Details</h2>

    <table border='1'>

        <tr>
            <th>Id</th>
            <th>Email</th>
            <th>Name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Mobile</th>
            
            <th>Edit</th>
            <th>Delete</th>
        </tr>

        <c:forEach items="${empList}" var="employee">

            <tr>

                <td>${employee.id}</td>

                <td>${employee.email}</td>

                <td>${employee.name}</td>

                <td>${employee.age}</td>

                <td>${employee.gender}</td>

                <td>${employee.mobile}</td>

                
                <td>
                    <a href='edit.jsp?id=${employee.id}&email=${employee.email}&name=${employee.name}&age=${employee.age}&mobile=${employee.mobile}'>Edit</a>
                </td>

                <td>
                    <a href='delete?id=${employee.id}'>Delete</a>
                </td>

            </tr>

        </c:forEach>

    </table>

</div>

<footer>
    <p>Inventory Management System | Admin Dashboard</p>
</footer>

</body>

</html>
