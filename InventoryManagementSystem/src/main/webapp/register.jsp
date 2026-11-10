
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Registration</title>

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

.container {
    max-width: 550px;
    margin: 45px auto;
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
input[type="email"],
input[type="password"] {
    width: 100%;
    padding: 11px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 15px;
}

.gender {
    display: flex;
    gap: 20px;
    flex-wrap: wrap;
    margin-top: 10px;
}

.gender label {
    display: flex;
    align-items: center;
    gap: 6px;
    font-weight: normal;
    margin: 0;
}

.gender input {
    accent-color: #236b91;
}

.register-btn {
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

.register-btn:hover {
    background-color: #164e70;
}

.status {
    text-align: center;
    margin-bottom: 15px;
    color: #164e70;
    font-weight: bold;
}

.back-link {
    text-align: center;
    margin-top: 20px;
}

.back-link a {
    color: #236b91;
    text-decoration: none;
}

footer {
    background-color: #164e70;
    color: white;
    text-align: center;
    padding: 15px;
    margin-top: 40px;
}

@media (max-width: 600px) {
    .container {
        margin: 30px 15px;
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

<!-- Registration Form -->
<div class="container">

    <h1>Employee Registration</h1>

    <% if(request.getAttribute("status") != null) { %>
        <div class="status">
            <%= request.getAttribute("status") %>
        </div>
    <% } %>

    <form action='save' >

        <label for="name">Name</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password"
                required>

        <label for="age">Enter Age</label>
        <input type="text" id="age" name="age"
               required>

        <label>Gender</label>
        <div class="gender">
            <label>
                <input type="radio" name="gender"
                       value="male" required> Male
            </label>

            <label>
                <input type="radio" name="gender"
                       value="female"> Female
            </label>

            <label>
                <input type="radio" name="gender"
                       value="others"> Others
            </label>
        </div>

        <label for="mobile">Mobile</label>
        <input type="text" id="mobile" name="mobile"
                required>

        <button type="submit" class="register-btn">
            Register
        </button>

    </form>

    <div class="back-link">
        <a href="login.jsp">Already registered? Login here</a>
    </div>

</div>

<!-- Footer -->
<footer>
    <p>&copy; 2026 Inventory Management System. All Rights Reserved.</p>
</footer>

</body>
</html>
