
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Inventory Management System</title>

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
            background-color: #1e3a5f;
            color: white;
            text-align: center;
            padding: 22px;
            font-size: 24px;
        }

        nav {
            background-color: #ffffff;
            display: flex;
            justify-content: center;
            gap: 35px;
            padding: 18px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
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
            max-width: 450px;
            margin: 70px auto;
            background-color: white;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #1e3a5f;
            margin-bottom: 25px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 15px;
            font-weight: bold;
            color: #333;
        }

        input {
            padding: 12px;
            margin-top: 7px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        input:focus {
            outline: none;
            border-color: #2196f3;
        }

        button {
            margin-top: 25px;
            padding: 13px;
            background-color: #1e3a5f;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #2196f3;
        }

        .message {
            background-color: #ffebee;
            color: #c62828;
            padding: 12px;
            border-radius: 6px;
            text-align: center;
            margin-bottom: 15px;
        }

        .about {
            max-width: 700px;
            margin: 30px auto;
            text-align: center;
            color: #555;
            line-height: 1.7;
            padding: 20px;
        }

        footer {
            text-align: center;
            padding: 20px;
            color: #666;
            margin-top: 40px;
        }

        @media(max-width: 600px) {
            nav {
                gap: 15px;
                flex-wrap: wrap;
            }

            .container {
                margin: 40px 15px;
            }
        }
    </style>
</head>

<body>

    <div class="welcome-bar">
        <h3>WELCOME TO INVENTORY MANAGEMENT SYSTEM</h3>
    </div>

    <nav>
        <a href="index.jsp">Home</a>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Registration</a>
        <a href="#about">About Us</a>
    </nav>

    <div class="container">

        <h2>Inventory Management Login</h2>

        <%
            String error = (String) request.getAttribute("error");
            String status = (String) request.getAttribute("status");

            if (error != null) {
        %>
            <div class="message">
                <%= error %>
            </div>
        <%
            } else if (status != null) {
        %>
            <div class="message">
                <%= status %>
            </div>
        <%
            }
        %>

        <form action = 'login'>

            <label for="email">Email</label>

            <input type="email"
                   id="email"
                   name="email"
                   placeholder="Enter your email"
                   required>

            <label for="password">Password</label>

            <input type="password"
                   id="password"
                   name="password"
                   placeholder="Enter your password"
                   required>

            <button type="submit">Login</button>

        </form>

    </div>

    <div class="about" id="about">

        <h2>About Inventory Management System</h2>

        <p>
            Our Inventory Management System helps organizations
            efficiently manage their products, stock entries,
            employees and suppliers.

            Administrators can manage the complete inventory,
            while employees can record stock IN and stock OUT
            transactions.
        </p>

    </div>

    <footer>
        <p>&copy; 2026 Inventory Management System. All Rights Reserved.</p>
    </footer>

</body>
</html>
