package com.codeup.adlister.controllers.users;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.exceptions.AllExceptions;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String passwordConfirmation = request.getParameter("confirm_password");
            String avatar = request.getParameter("avatar");
            String image = !avatar.equals("") ? avatar : "https://media.giphy.com/media/IiuJwbb5uyrSg/giphy.gif";

            // validate input
            boolean inputHasErrors = username.isEmpty()
                    || email.isEmpty()
                    || password.isEmpty()
                    || (! password.equals(passwordConfirmation));

            if (inputHasErrors) {
                response.sendRedirect("/register");
                return;
            }
            List<User> all = DaoFactory.getUsersDao().all();
            for (User user : all) {
                if(user.getUsername().toLowerCase().equals(username.toLowerCase())){
                    response.sendRedirect("/register?alert=true&message=Username_Already_Exists");
                    return;
                }


            }

            // create and save a new user
            User user = new User(username, email, password, image);
            DaoFactory.getUsersDao().insert(user);
            response.sendRedirect("/login");
        } catch(IOException  ex) {
            ex.printStackTrace();

        }
    }
}
