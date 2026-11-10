package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Employee;

public class EmployeeDAO {
	private Connection connection = null;
	
	
	
	public void commit() {
		try {
			connection.commit();
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void rollback() {

		try {
			connection.rollback();
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}


	public boolean saveEmployee(Employee employee) {

		connection = ConnectionManager.getConnection();

		String query = "insert into employee(name,email,password,age,gender,mobile) values(?,?,?,?,?,?)";

		PreparedStatement statement = null;

		try {
			statement = connection.prepareStatement(query);

			statement.setString(1, employee.getName());
			statement.setString(2, employee.getEmail());
			statement.setString(3, employee.getPassword());
			statement.setInt(4, employee.getAge());
			statement.setString(5, employee.getGender());
			statement.setString(6, employee.getMobile());
			

			int count = statement.executeUpdate();

			if (count != 0) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}
	
	
	
	public boolean checkLogin(String email, String password) {
		Connection connection = ConnectionManager.getConnection();
		String query = "select count(*) from employee where email = ? and password = ?";
		PreparedStatement statement = null;

		try {
			statement = connection.prepareStatement(query);
			statement.setString(1, email);
			statement.setString(2, password);
			ResultSet set = statement.executeQuery();
			int count = 0;

			if (set.next()) {
				count = set.getInt(1);
			}

			if (count == 1) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;

	}
	
	
	public Employee fetchEmployee(String email) {

		Employee obj = new Employee();
		Connection connection = ConnectionManager.getConnection();
		String query = "select * from employee where email = ?";

		try {
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, email);
			ResultSet set = statement.executeQuery();

			while (set.next()) {
				obj.setId(set.getInt(1));
				obj.setName(set.getString(2));
				obj.setEmail(set.getString(3));
				obj.setPassword(set.getString(4));
				obj.setAge(set.getInt(5));
				obj.setGender(set.getString(6));
				obj.setMobile(set.getString(7));
				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return obj;

	}
	
	public List<Employee> fetchAllData() {

		List<Employee> empList = new ArrayList<Employee>();
		Connection connection = ConnectionManager.getConnection();
		String query = "select * from employee";

		try {
			PreparedStatement statement = connection.prepareStatement(query);
			ResultSet set = statement.executeQuery();

			while (set.next()) {
				Employee obj = new Employee();
				obj.setId(set.getInt(1));
				obj.setName(set.getString(2));
				obj.setEmail(set.getString(3));
				obj.setPassword(set.getString(4));
				obj.setAge(set.getInt(5));
				obj.setGender(set.getString(6));
				obj.setMobile(set.getString(7));
				
				empList.add(obj);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return empList;
	}

	
	public boolean editEmployee(Employee employee) {

		connection = ConnectionManager.getConnection();

		String query = "update employee set name =?, email = ?, age = ?, gender = ?, mobile = ? where id =?";

		PreparedStatement statement = null;

		try {
			statement = connection.prepareStatement(query);

			statement.setString(1, employee.getName());
			statement.setString(2, employee.getEmail());
			statement.setInt(3, employee.getAge());
			statement.setString(4, employee.getGender());
			statement.setString(5, employee.getMobile());
			
			statement.setInt(6, employee.getId());

			int count = statement.executeUpdate();

			if (count != 0) {
				return true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;

	}
	
	
	public boolean deleteEmployee(int id) {

		connection = ConnectionManager.getConnection();

		String query = "delete from employee where id =?";

		PreparedStatement statement = null;

		try {
			statement = connection.prepareStatement(query);
			statement.setInt(1, id);

			int count = statement.executeUpdate();

			if (count != 0) {
				return true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;

	}

}
