package com.food.dao;

import java.util.List;

import com.food.model.Order;
import com.food.model.CartItem;

public interface OrderDAO {
    boolean placeOrder(Order order, List<CartItem> cartItems);
    List<Order> getOrdersByUser(String mobile);
}
