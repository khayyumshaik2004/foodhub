package com.food.servlet;



import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/verifyOTP")
public class VerifyOTPServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        String userOTP =
                req.getParameter("otp");

        HttpSession session =
                req.getSession();

        String generatedOTP =
                (String) session.getAttribute("otp");

        if(userOTP.equals(generatedOTP)) {

            resp.sendRedirect("resetPassword.jsp");

        } else {

            resp.getWriter().println(
                    "<script>"
                    + "alert('Invalid OTP');"
                    + "location='verifyOTP.jsp';"
                    + "</script>");
        }
    }
}