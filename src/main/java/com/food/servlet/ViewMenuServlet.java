package com.food.servlet;

import java.io.IOException;
import java.util.List;

import com.food.daoimpl.MenuDAOImpl;
import com.food.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/menu")
public class ViewMenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        if (session.getAttribute("user") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        try {
            MenuDAOImpl dao = new MenuDAOImpl();
            int restaurantId = Integer.parseInt(req.getParameter("id"));

            List<Menu> menuList = dao.getMenuByRestaurant(restaurantId);

            req.setAttribute("menuList", menuList);

            RequestDispatcher r = req.getRequestDispatcher("menu.jsp");
            r.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Error loading menu");
        }
    }
}