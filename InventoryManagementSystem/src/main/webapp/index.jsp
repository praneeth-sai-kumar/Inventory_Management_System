
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
            background-color: #164e70;
            color: white;
            text-align: center;
            padding: 25px 10px;
        }

        .welcome-bar h2 {
            font-size: 26px;
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

        .login-btn {
            display: inline-block;
            background-color: #236b91;
            color: white;
            text-decoration: none;
            padding: 12px 30px;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
        }

        .login-btn:hover {
            background-color: #164e70;
        }

        .about {
            max-width: 650px;
            margin: 30px auto;
            padding: 25px;
            text-align: center;
        }

        .about h3 {
            color: #164e70;
            margin-bottom: 12px;
        }

        .about p {
            color: #555;
            line-height: 1.6;
        }

        footer {
            background-color: #164e70;
            color: white;
            text-align: center;
            padding: 15px;
            margin-top: 50px;
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
    

    <!-- Home Section -->
    <div class="container">
        <h2>Manage Your Inventory Efficiently</h2>

        <p>
            Welcome to the Inventory Management System.
            This application helps organizations manage products,
            monitor stock availability, track stock IN and OUT
            transactions, and maintain inventory records efficiently.
        </p>

        <a href="login.jsp" class="login-btn">Login</a>
    </div>

    <!-- About Section -->
    <div class="about" id="about">
        <h3>About Us</h3>

        <p>
            The Inventory Management System provides a centralized
            platform for managing inventory operations.
            Administrators can manage products, employees, suppliers,
            and reports, while employees can view stock details and
            perform stock IN and OUT operations.
        </p>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2026 Inventory Management System. All Rights Reserved.</p>
    </footer>

</body>
</html>
