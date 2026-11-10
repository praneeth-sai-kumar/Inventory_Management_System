
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

@WebServlet("/saveProduct")
public class SaveProduct extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDao dao = new ProductDao();

        Product product = new Product();

        product.setProduct_name(request.getParameter("product_name"));
        product.setCategory(request.getParameter("category"));
        product.setBrand(request.getParameter("brand"));
        product.setPrice(Double.parseDouble(request.getParameter("price")));
        product.setQuantity(Integer.parseInt(request.getParameter("quantity")));
        product.setSupplier(request.getParameter("supplier"));
        product.setDescription(request.getParameter("description"));

        boolean status = dao.saveProduct(product);

        RequestDispatcher dispatcher = request.getRequestDispatcher("addproduct.jsp");

        if (status) {
            dao.commit();
            request.setAttribute("status", "Product added successfully....");
            dispatcher.forward(request, response);
        } else {
            dao.rollback();
            request.setAttribute("status", "Error in adding the product");
            dispatcher.forward(request, response);
        }
    }
}
