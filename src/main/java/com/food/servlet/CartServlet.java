package com.food.servlet;

import java.io.IOException;

import com.food.model.Cart;
import com.food.model.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");

        Cart cart = (Cart) session.getAttribute("cart");

        if(cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        if("add".equals(action)) {

            int menuId =
                Integer.parseInt(request.getParameter("menuId"));

            int restaurantId =
                Integer.parseInt(request.getParameter("restaurantId"));

            String itemName =
                request.getParameter("itemName");

            double price =
                Double.parseDouble(request.getParameter("price"));

            CartItem item = new CartItem(
                    menuId,
                    restaurantId,
                    itemName,
                    price,
                    1);

            cart.addItem(item);
        }

        else if("plus".equals(action)) {

            int menuId =
                Integer.parseInt(request.getParameter("menuId"));

            CartItem item =
                cart.getItems().get(menuId);

            if(item != null) {

                item.setQuantity(
                    item.getQuantity() + 1);
            }
        }

        else if("minus".equals(action)) {

            int menuId =
                Integer.parseInt(request.getParameter("menuId"));

            CartItem item =
                cart.getItems().get(menuId);

            if(item != null) {

                if(item.getQuantity() > 1) {

                    item.setQuantity(
                        item.getQuantity() - 1);
                }
                else {

                    cart.removeItem(menuId);
                }
            }
        }

        else if("delete".equals(action)) {

            int menuId =
                Integer.parseInt(request.getParameter("menuId"));

            cart.removeItem(menuId);
        }

        session.setAttribute("cart", cart);

        response.sendRedirect("cart.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);
    }

}