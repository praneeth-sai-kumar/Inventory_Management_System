package com.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.EmployeeDAO;
import com.model.Employee;

@WebServlet("/viewprofile")
public class ViewProfile extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		EmployeeDAO dao = new EmployeeDAO();

		HttpSession session = request.getSession(true);

		String email = (String) session.getAttribute("email");

		Employee employee = dao.fetchEmployee(email);

		request.setAttribute("employee", employee);
		RequestDispatcher dispatcher = request.getRequestDispatcher("viewprofile.jsp");
		dispatcher.forward(request, response);

	}

}
