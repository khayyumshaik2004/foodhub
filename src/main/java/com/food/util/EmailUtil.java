package com.food.util;



import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;

public class EmailUtil {

    public static boolean sendOTP(String toEmail, String otp) {

        final String fromEmail = "223h1a0536@klmcew.ac.in";
        final String appPassword = "wnwm huoh rrnc fpuu";

        Properties props = new Properties();

        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props,
                new Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(fromEmail, appPassword);
                    }
                });

        try {

            Message message = new MimeMessage(session);

            message.setFrom(new InternetAddress(fromEmail));

            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(toEmail));

            message.setSubject("Foodie Hub Password Reset OTP");

            message.setText(
                    "Hello,\n\n"
                    + "Your OTP for password reset is: "
                    + otp
                    + "\n\nValid for 5 minutes.");

            Transport.send(message);

            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}