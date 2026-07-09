package com.food.servlet;

import java.io.IOException;
import java.util.List;

import com.food.daoimpl.RestaurantDAOImpl;
import com.food.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/restaurants")
public class ViewRestaurantServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        if (session.getAttribute("user") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        RestaurantDAOImpl dao = new RestaurantDAOImpl();
        List<Restaurant> restaurantList = dao.getAllRestaurants();

        req.setAttribute("restaurantList", restaurantList);

        RequestDispatcher r=req.getRequestDispatcher("viewRestaurant.jsp");
        r.forward(req, resp);
    }
}