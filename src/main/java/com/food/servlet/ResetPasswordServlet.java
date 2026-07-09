package com.food.servlet;

import java.io.IOException;

import com.food.dao.UserDAO;
import com.food.daoimpl.UserDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/resetPassword")
public class ResetPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        String password =
                req.getParameter("password");

        String confirmPassword =
                req.getParameter("confirmPassword");

        if(!password.equals(confirmPassword)) {

            resp.getWriter().println(
                    "<script>"
                    + "alert('Passwords do not match');"
                    + "history.back();"
                    + "</script>");

            return;
        }

        HttpSession session =
                req.getSession();

        String email =
                (String) session.getAttribute("email");

        UserDAO dao =
                new UserDAOImpl();

        boolean status = dao.resetPassword(email, password);

        if(status) {
            resp.sendRedirect("passwordSuccess.jsp");
        } else {
            resp.sendRedirect("resetPassword.jsp?msg=Failed to reset password");
        }
    }
}