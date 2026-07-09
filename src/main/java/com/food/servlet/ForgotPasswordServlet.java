package com.food.servlet;


import java.io.IOException;

import com.food.daoimpl.UserDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/forgotPassword")
public class ForgotPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        String email=req.getParameter("email");
        String password=req.getParameter("password");

        UserDAOImpl dao=new UserDAOImpl();

        if(dao.updatePassword(email,password)) {
            resp.sendRedirect("login.jsp");
        }
        else {
            resp.sendRedirect("forgotPassword.jsp");
        }
    }
}