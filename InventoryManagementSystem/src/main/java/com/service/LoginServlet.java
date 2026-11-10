package com.service;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dao.EmployeeDAO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		EmployeeDAO dao = new EmployeeDAO();

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		RequestDispatcher dispatcher = null;
		HttpSession session = request.getSession(true);

		if (email.equals("admin@codegnan.com") && password.equals("admin@49")) {
			session.setAttribute("email", email);
			dispatcher = request.getRequestDispatcher("admin.jsp");
			dispatcher.forward(request, response);
		} else {
			boolean status = dao.checkLogin(email, password);

			if (status) {
				session.setAttribute("email", email);
				dispatcher = request.getRequestDispatcher("employee.jsp");
				dispatcher.forward(request, response);
			} else {
				request.setAttribute("status", "Invalid Login Credentials");
				dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
			}

		}
	}

}
