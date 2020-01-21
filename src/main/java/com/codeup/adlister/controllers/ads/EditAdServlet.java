package com.codeup.adlister.controllers.ads;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "edit", urlPatterns = "/ads/edit")
public class EditAdServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) {
        try {
            Boolean loggedIn = (Boolean) request.getSession().getAttribute("loggedIn");
            if(loggedIn != null && loggedIn){
                String adId = request.getParameter("adId");
                request.getRequestDispatcher("/WEB-INF/ads/edit.jsp").forward(request, response);
                return;
            }
            else response.sendRedirect("/login");
        } catch(IOException | ServletException ex) {
            System.out.printf("ERROR: %s\n", ex);
        }
    }
}
