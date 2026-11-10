
package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Product;



public class ProductDao {

    private Connection connection = null;

    public void commit() {
        try {
            connection.commit();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void rollback() {
        try {
            connection.rollback();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Save Product
    public boolean saveProduct(Product product) {

        connection = ConnectionManager.getConnection();

        String query = "insert into product(product_name,category,brand,price,quantity,supplier,description) values(?,?,?,?,?,?,?)";

        PreparedStatement statement = null;

        try {
            statement = connection.prepareStatement(query);

            statement.setString(1, product.getProduct_name());
            statement.setString(2, product.getCategory());
            statement.setString(3, product.getBrand());
            statement.setDouble(4, product.getPrice());
            statement.setInt(5, product.getQuantity());
            statement.setString(6, product.getSupplier());
            statement.setString(7, product.getDescription());

            int count = statement.executeUpdate();

            if (count != 0) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Fetch Product By ID
    public Product fetchProduct(int product_id) {

        Product obj = new Product();

        Connection connection = ConnectionManager.getConnection();

        String query = "select * from product where product_id = ?";

        try {
            PreparedStatement statement = connection.prepareStatement(query);

            statement.setInt(1, product_id);

            ResultSet set = statement.executeQuery();

            while (set.next()) {
                obj.setProduct_id(set.getInt(1));
                obj.setProduct_name(set.getString(2));
                obj.setCategory(set.getString(3));
                obj.setBrand(set.getString(4));
                obj.setPrice(set.getDouble(5));
                obj.setQuantity(set.getInt(6));
                obj.setSupplier(set.getString(7));
                obj.setDescription(set.getString(8));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return obj;
    }

    // Fetch All Products
    public List<Product> fetchAllData() {

        List<Product> productList = new ArrayList<Product>();

        Connection connection = ConnectionManager.getConnection();

        String query = "select * from product";

        try {
            PreparedStatement statement = connection.prepareStatement(query);

            ResultSet set = statement.executeQuery();

            while (set.next()) {

                Product obj = new Product();

                obj.setProduct_id(set.getInt(1));
                obj.setProduct_name(set.getString(2));
                obj.setCategory(set.getString(3));
                obj.setBrand(set.getString(4));
                obj.setPrice(set.getDouble(5));
                obj.setQuantity(set.getInt(6));
                obj.setSupplier(set.getString(7));
                obj.setDescription(set.getString(8));

                productList.add(obj);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }

    // Edit Product
    public boolean editProduct(Product product) {

        connection = ConnectionManager.getConnection();

        String query = "update product set product_name = ?, category = ?, brand = ?, price = ?, quantity = ?, supplier = ?, description = ? where product_id = ?";

        PreparedStatement statement = null;

        try {
            statement = connection.prepareStatement(query);

            statement.setString(1, product.getProduct_name());
            statement.setString(2, product.getCategory());
            statement.setString(3, product.getBrand());
            statement.setDouble(4, product.getPrice());
            statement.setInt(5, product.getQuantity());
            statement.setString(6, product.getSupplier());
            statement.setString(7, product.getDescription());
            statement.setInt(8, product.getProduct_id());

            int count = statement.executeUpdate();

            if (count != 0) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Delete Product
    public boolean deleteProduct(int product_id) {

        connection = ConnectionManager.getConnection();

        String query = "delete from product where product_id = ?";

        PreparedStatement statement = null;

        try {
            statement = connection.prepareStatement(query);

            statement.setInt(1, product_id);

            int count = statement.executeUpdate();

            if (count != 0) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}
