package com.food.servlet;


import java.io.IOException;

import com.food.dao.UserDAO;
import com.food.daoimpl.UserDAOImpl;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        String name=req.getParameter("name");
        String email=req.getParameter("email");
        String password=req.getParameter("password");
        String gender=req.getParameter("gender");
        String phone=req.getParameter("phone");

        User user=new User(
                name,email,password,gender,phone);

        UserDAO dao=new UserDAOImpl();

        if(dao.registerUser(user)) {
            resp.sendRedirect("login.jsp");
        }
        else {
            resp.sendRedirect("signup.jsp");
        }
    }
}