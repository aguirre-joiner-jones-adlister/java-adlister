package com.codeup.adlister.controllers.ads;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Array;

@WebServlet(name = "edit", urlPatterns = "/ads/edit")
public class EditAdServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) {
        try {
            Boolean loggedIn = (Boolean) request.getSession().getAttribute("loggedIn");
            if(loggedIn != null && loggedIn){
                Long adId = Long.valueOf(request.getParameter("adId"));
                Ad ad = DaoFactory.getAdsDao().getAdById(adId);
                User user = (User)request.getSession().getAttribute("user");
                if(ad.getUserId() ==  user.getId()){
                    request.setAttribute("ad", ad);
                }

                request.getRequestDispatcher("/WEB-INF/ads/edit.jsp").forward(request, response);
                return;
            }
            else response.sendRedirect("/login");
        } catch(IOException | ServletException ex) {
            System.out.printf("ERROR: %s\n", ex);
        }
    }


    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ){
    try {
        long id = Long.parseLong(request.getParameter("id"));
        long userId = Long.parseLong(request.getParameter("userId"));
        String title = request.getParameter("title")== null ? "" : request.getParameter("title");
        String description = request.getParameter("description") == null ? "" : request.getParameter("description");
        String[] categories = request.getParameterValues("category") == null ? new String[] {"miscellaneous"} : request.getParameterValues("category");

        boolean inValid =
             Long.toString(id).equals("") || Long.toString(userId).equals("") ||
                 title.equals("") ||
                description.equals("") ;
        if(!inValid){
            Ad ad = new Ad(id, userId, title, description);
            DaoFactory.getAdsDao().editAd(ad, categories);
            response.sendRedirect("/profile");
            return;
        }
        response.sendRedirect("/ads/edit?alert=true&adId="+id);
        return;


    } catch(IOException ex) {
        System.out.printf("ERROR: %s\n", ex);
    }
    }
}
