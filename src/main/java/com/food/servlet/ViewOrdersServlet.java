package com.food.servlet;

import java.io.IOException;
import java.util.List;

import com.food.daoimpl.OrderDAOImpl;
import com.food.model.Order;
import com.food.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orders")
public class ViewOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        try {
            OrderDAOImpl orderDAO = new OrderDAOImpl();
            List<Order> orderList = orderDAO.getOrdersByUser(user.getPhone());
            
            req.setAttribute("orderList", orderList);
            
            RequestDispatcher dispatcher = req.getRequestDispatcher("orders.jsp");
            dispatcher.forward(req, resp);
            
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Error loading orders");
        }
    }
}
