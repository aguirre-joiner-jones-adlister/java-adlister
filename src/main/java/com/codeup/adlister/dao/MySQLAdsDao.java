package com.codeup.adlister.dao;


import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Ad_Category;
import com.mysql.cj.jdbc.Driver;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUsername(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
           String query =  "SELECT a.*, c.name FROM ads as a join ad_category as ac on a.id = ac.ads_id join categories as c on ac.categories_id = c.id";
            stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    public Long insertAdCat(Ad_Category adCat) {
        try {
            String insertQuery = "INSERT INTO ad_category(ads_id, categories_id) VALUES (?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery);
            stmt.setLong(1, adCat.getAdId());
            stmt.setLong(2, adCat.getCategoryId());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }

    @Override
    public Ad getAdById(Long id) {
        Ad found = new Ad();
        try {
            String query = "select * from ads where id = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, String.valueOf(id));

            ResultSet rs = stmt.executeQuery();
            if(rs.next()) {
                found.setId(id);
                found.setUserId(rs.getLong("user_id"));
                found.setTitle(rs.getString("title"));
                found.setDescription(rs.getString("description"));
            }


        } catch( SQLException ex) {
            System.out.printf("ERROR: %s\n", ex);
        }
        return found;
    }

    @Override
    public int editAd(Ad ad) {
        return 0;
    }

    @Override
    public int delete(Long id) {
        return 0;
    }
}
