package com.food.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.food.daoimpl.OrderDAOImpl;
import com.food.model.Cart;
import com.food.model.CartItem;
import com.food.model.Order;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String customerName = request.getParameter("customerName");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String payment = request.getParameter("payment");
        double total = Double.parseDouble(request.getParameter("totalAmount"));

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart != null && !cart.getItems().isEmpty()) {
            Order order = new Order(customerName, mobile, address, payment, total);
            List<CartItem> cartItems = new ArrayList<>(cart.getItems().values());

            OrderDAOImpl orderDAO = new OrderDAOImpl();
            boolean success = orderDAO.placeOrder(order, cartItems);

            if (success) {
                // CLEAR CART
                session.removeAttribute("cart");
                // SEND DATA TO SUCCESS PAGE
                request.setAttribute("customerName", customerName);
                request.setAttribute("mobile", mobile);
                request.setAttribute("address", address);
                request.setAttribute("payment", payment);
                request.setAttribute("total", total);

                request.getRequestDispatcher("orderSuccess.jsp").forward(request, response);
                return;
            } else {
                System.out.println("Order placement failed.");
                response.sendRedirect("Checkout.jsp?error=failed");
                return;
            }
        }
        
        response.sendRedirect("cart.jsp");
    }
}