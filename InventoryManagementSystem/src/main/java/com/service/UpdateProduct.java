
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

@WebServlet("/updateProduct")
public class UpdateProduct extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDao dao = new ProductDao();

        Product product = new Product();

        product.setProduct_id(Integer.parseInt(request.getParameter("product_id")));
        product.setProduct_name(request.getParameter("product_name"));
        product.setCategory(request.getParameter("category"));
        product.setBrand(request.getParameter("brand"));
        product.setPrice(Double.parseDouble(request.getParameter("price")));
        product.setQuantity(Integer.parseInt(request.getParameter("quantity")));
        product.setSupplier(request.getParameter("supplier"));
        product.setDescription(request.getParameter("description"));

        boolean status = dao.editProduct(product);

        RequestDispatcher dispatcher = request.getRequestDispatcher("findAllProducts");

        if (status) {
            dao.commit();
            dispatcher.forward(request, response);
        } else {
            dao.rollback();
            request.setAttribute("status", "Error in updating the product");
            request.getRequestDispatcher("editproduct.jsp").forward(request, response);
        }
    }
}
