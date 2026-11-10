
package com.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ProductDao;
import com.model.Product;

@WebServlet("/editProduct")
public class EditProduct extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int product_id = Integer.parseInt(request.getParameter("product_id"));

        ProductDao dao = new ProductDao();

        Product product = dao.fetchProduct(product_id);

        request.setAttribute("product", product);

        RequestDispatcher dispatcher = request.getRequestDispatcher("editproduct.jsp");

        dispatcher.forward(request, response);
    }
}
