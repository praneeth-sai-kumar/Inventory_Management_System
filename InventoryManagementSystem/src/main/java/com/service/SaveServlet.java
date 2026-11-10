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

@WebServlet("/save")
public class SaveServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		EmployeeDAO dao = new EmployeeDAO();

		Employee employee = new Employee();

		employee.setName(request.getParameter("name"));
		employee.setEmail(request.getParameter("email"));
		employee.setPassword(request.getParameter("password"));
		employee.setAge(Integer.parseInt(request.getParameter("age")));
		employee.setGender(request.getParameter("gender"));
		employee.setMobile(request.getParameter("mobile"));
		
		
		boolean status = dao.saveEmployee(employee);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
		
		if(status) {
			dao.commit();
			request.setAttribute("status", "Registered successfully....");
			dispatcher.forward(request, response);
		}else {
			dao.rollback();
			request.setAttribute("status", "Error in registering the employee");
			dispatcher.forward(request, response);
		}

	}

}
