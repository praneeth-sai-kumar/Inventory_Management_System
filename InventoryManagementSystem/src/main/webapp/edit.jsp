<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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

.welcome-bar h3 {
    font-size: 26px;
}

nav {
    background-color: #ffffff;
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

.container h2 {
    text-align: center;
    color: #164e70;
    margin-bottom: 15px;
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

button,
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

button:hover,
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

    .welcome-bar h3 {
        font-size: 21px;
    }

    nav {
        gap: 15px;
        flex-wrap: wrap;
    }
}

        }
    </style>
</head>

<body>
	
	<% 
			String email = (String)session.getAttribute("email");
			if(email == null){
				response.sendRedirect("login.jsp");
			}
		%>
    <div class="welcome-bar" >
        <h3>WELCOME TO EMPLOYEE MANAGEMENT SYSTEM</h3>
    </div>

    <nav>
        <a href="admin.jsp">Home</a>
        <a href="findAll">View Employees</a>
        <a href="search.jsp">Search Employee</a>
        <a href="logout">Logout</a>
    </nav>

    <div id="home" class="container">
        <h2>Welcome to <%=session.getAttribute("email")%></h2>
        <form action = 'edituser'>
            <h1 style="text-align: center;">Edit Employee Here</h1>
            
            <% if(request.getAttribute("status") != null){ %>
            		<h1 style="text-align: center;"><%=request.getAttribute("status")%> </h1>
            <%} %>
			<label for="id">Id</label>
			<input type="text" name="id" value = '<%=request.getParameter("id") %>' required readonly/>
			
            <label for="name">Name</label>
            <input type="text" name="name" value = '<%=request.getParameter("name") %>' required />

            <label for="email">Email</label>
            <input type="text" name="email" value = '<%=request.getParameter("email") %>' required/>

            <label for="age">Enter Age</label>
            <input type="text" name="age" value = '<%=request.getParameter("age") %>' required />


			<label>Gender</label>
            <div class="gender">
                <label><input type="radio" name="gender" value="male" required /> Male</label>
                <label><input type="radio" name="gender" value="female" required /> Female</label>
                <label><input type="radio" name="gender" value="others" required /> Others</label>
            </div>

            <label for="mobile">Mobile</label>
            <input type="text" name="mobile" value = '<%=request.getParameter("mobile") %>' pattern="[0-9]{10}" required />


            
            <button type="submit">Update</button>
        </form>
        
    </div>
    

</body>

</html>