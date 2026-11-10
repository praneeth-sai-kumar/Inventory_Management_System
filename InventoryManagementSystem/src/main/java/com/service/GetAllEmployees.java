package com.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.EmployeeDAO;
import com.model.Employee;

@WebServlet("/findAll")
public class GetAllEmployees extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		EmployeeDAO dao = new EmployeeDAO();

		List<Employee> empList = dao.fetchAllData();
		
		request.setAttribute("empList", empList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("viewemps.jsp");
		dispatcher.forward(request, response);
	}

}
