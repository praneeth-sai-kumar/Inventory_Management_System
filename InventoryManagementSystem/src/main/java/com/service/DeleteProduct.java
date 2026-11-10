
package com.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ProductDao;

@WebServlet("/deleteProduct")
public class DeleteProduct extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int product_id = Integer.parseInt(request.getParameter("product_id"));

        ProductDao dao = new ProductDao();

        boolean status = dao.deleteProduct(product_id);

        RequestDispatcher dispatcher = request.getRequestDispatcher("findAllProducts");

        if (status) {
            dao.commit();
            dispatcher.forward(request, response);
        } else {
            dao.rollback();
            request.setAttribute("status", "Error in deleting the product");
            dispatcher.forward(request, response);
        }
    }
}
