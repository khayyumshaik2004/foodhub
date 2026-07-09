package com.food.servlet;



import java.io.IOException;
import java.util.Random;

import com.food.util.EmailUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/sendOTP")
public class SendOTPServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");

        Random random = new Random();

        int otp = 100000 + random.nextInt(900000);

        HttpSession session = req.getSession();

        session.setAttribute("otp", String.valueOf(otp));
        session.setAttribute("email", email);

        boolean status =
                EmailUtil.sendOTP(email,
                        String.valueOf(otp));

        if(status) {
            resp.sendRedirect("verifyOTP.jsp");
        } else {
            resp.getWriter().println("OTP Sending Failed");
        }
    }
}