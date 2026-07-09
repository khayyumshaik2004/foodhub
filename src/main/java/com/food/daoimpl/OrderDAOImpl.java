package com.food.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.OrderDAO;
import com.food.model.CartItem;
import com.food.model.Order;
import com.food.model.OrderItem;
import com.food.util.DBConnection;

public class OrderDAOImpl implements OrderDAO {

    @Override
    public boolean placeOrder(Order order, List<CartItem> cartItems) {
        boolean isSuccess = false;

        try (Connection con = DBConnection.getConnection()) {
            con.setAutoCommit(false); // Transaction start

            String orderSql = "INSERT INTO orders(customer_name, mobile, address, payment_type, total_amount) VALUES(?,?,?,?,?)";
            try (PreparedStatement orderStmt = con.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS)) {
                
                orderStmt.setString(1, order.getCustomerName());
                orderStmt.setString(2, order.getMobile());
                orderStmt.setString(3, order.getAddress());
                orderStmt.setString(4, order.getPaymentType());
                orderStmt.setDouble(5, order.getTotalAmount());

                int affectedRows = orderStmt.executeUpdate();

                if (affectedRows > 0) {
                    try (ResultSet rs = orderStmt.getGeneratedKeys()) {
                        int orderId = 0;
                        if (rs.next()) {
                            orderId = rs.getInt(1);
                        }

                        // 2. Insert Order Items
                        if (orderId > 0 && cartItems != null && !cartItems.isEmpty()) {
                            String itemSql = "INSERT INTO order_items(order_id, menu_id, item_name, quantity, price) VALUES(?,?,?,?,?)";
                            try (PreparedStatement itemStmt = con.prepareStatement(itemSql)) {
                                for (CartItem item : cartItems) {
                                    itemStmt.setInt(1, orderId);
                                    itemStmt.setInt(2, item.getMenuId());
                                    itemStmt.setString(3, item.getItemName());
                                    itemStmt.setInt(4, item.getQuantity());
                                    itemStmt.setDouble(5, item.getPrice());
                                    itemStmt.addBatch();
                                }
                                itemStmt.executeBatch();
                            }
                        }

                        con.commit(); // Transaction commit
                        isSuccess = true;
                        System.out.println("Order Inserted Successfully, ID: " + orderId);
                    }
                }
            } catch (Exception e) {
                con.rollback(); // Transaction rollback on error
                e.printStackTrace();
            } finally {
                con.setAutoCommit(true);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    @Override
    public List<Order> getOrdersByUser(String mobile) {
        List<Order> orders = new ArrayList<>();
        
        String sql = "SELECT * FROM orders WHERE mobile = ? ORDER BY order_date DESC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            
            pstmt.setString(1, mobile);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setId(rs.getInt("id"));
                    order.setCustomerName(rs.getString("customer_name"));
                    order.setMobile(rs.getString("mobile"));
                    order.setAddress(rs.getString("address"));
                    order.setPaymentType(rs.getString("payment_type"));
                    order.setTotalAmount(rs.getDouble("total_amount"));
                    order.setOrderDate(rs.getTimestamp("order_date"));
                    
                    // Fetch items for this order
                    order.setItems(getOrderItemsByOrderId(order.getId(), con));
                    
                    orders.add(order);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }
    
    private List<OrderItem> getOrderItemsByOrderId(int orderId, Connection con) {
        List<OrderItem> items = new ArrayList<>();
        
        String sql = "SELECT * FROM order_items WHERE order_id = ?";
        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            
            pstmt.setInt(1, orderId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while(rs.next()) {
                    OrderItem item = new OrderItem();
                    item.setId(rs.getInt("id"));
                    item.setOrderId(rs.getInt("order_id"));
                    item.setMenuId(rs.getInt("menu_id"));
                    item.setItemName(rs.getString("item_name"));
                    item.setQuantity(rs.getInt("quantity"));
                    item.setPrice(rs.getDouble("price"));
                    items.add(item);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return items;
    }
}
