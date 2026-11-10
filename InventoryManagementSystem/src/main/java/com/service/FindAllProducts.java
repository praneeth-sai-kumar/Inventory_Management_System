
package com.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ProductDao;
import com.model.Product;

@WebServlet("/findAllProducts")
public class FindAllProducts extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDao dao = new ProductDao();

        List<Product> productList = dao.fetchAllData();

        request.setAttribute("productList", productList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("viewproducts.jsp");

        dispatcher.forward(request, response);
    }
}
