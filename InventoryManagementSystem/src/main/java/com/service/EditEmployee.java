package com.service;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.EmployeeDAO;
import com.model.Employee;

@WebServlet("/edituser")
public class EditEmployee extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		EmployeeDAO dao = new EmployeeDAO();

		Employee employee = new Employee();

		employee.setId(Integer.parseInt(request.getParameter("id")));
		employee.setName(request.getParameter("name"));
		employee.setEmail(request.getParameter("email"));
		employee.setAge(Integer.parseInt(request.getParameter("age")));
		employee.setGender(request.getParameter("gender"));
		employee.setMobile(request.getParameter("mobile"));
		

		dao.editEmployee(employee);
		dao.commit();

		response.sendRedirect("findAll");
	}

}
