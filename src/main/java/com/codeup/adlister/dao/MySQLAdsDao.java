package com.codeup.adlister.dao;




import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Ad_Category;
import com.mysql.cj.jdbc.Driver;

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
        List<Ad> allAds = new ArrayList<>();
        PreparedStatement stmt1 = null;
        PreparedStatement stmt2 = null;
        try {
//           String query =  "SELECT a.*, c.name FROM ads as a join ad_category as ac on a.id = ac.ads_id join categories as c on ac.categories_id = c.id";
            String query1 = "select * from ads";
            stmt1 = connection.prepareStatement(query1);
            ResultSet rs = stmt1.executeQuery();
//            return createAdsFromResults(rs);
            long adId;
            while(rs.next()){
                long id = rs.getLong("id");
                Ad ad = new Ad(
                        rs.getLong("id"),
                        rs.getLong("user_id"),
                        rs.getString("title"),
                        rs.getString("description")
                );

                String query2 = "select c.name from ads as a join ad_category ac on a.id = ac.ads_id " +
                        "join categories c on ac.categories_id = c.id" +
                        " where a.id = ?";
                stmt2 = connection.prepareStatement(query2);
                stmt2.setLong(1, rs.getLong("id"));
                ResultSet rs2 = stmt2.executeQuery();
                while (rs2.next()){
//                    System.out.println(rs2.getString(1));
                    ad.addToCategories(rs2.getString(1));
                }
                allAds.add(ad);

            }
            return allAds;
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad, String[] categories) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            long adId = rs.getLong(1);
            for (String category : categories) {
                long adCatg = 5;
                switch (category){
                    case "clothes" : adCatg = 1; break;
                    case "auto": adCatg = 2; break;
                    case "children": adCatg = 3; break;
                    case "pets": adCatg = 4; break;
                    case "home": adCatg = 6; break;
                    default: adCatg = 5;
                }
                Ad_Category ad_category = new Ad_Category(adId, adCatg);
                insertAdCat(ad_category);
            }
            return adId;
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    public void insertAdCat(Ad_Category adCat) {
        try {
            String insertQuery = "INSERT INTO ad_category(ads_id, categories_id) VALUES (?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery);
            stmt.setLong(1, adCat.getAdId());
            stmt.setLong(2, adCat.getCategoryId());
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new adCat.", e);
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
                String query2 = "select c.name from ads as a join ad_category ac on a.id = ac.ads_id " +
                        "join categories c on ac.categories_id = c.id" +
                        " where a.id = ?";
                PreparedStatement stmt2 = connection.prepareStatement(query2);
                stmt2.setLong(1, id);
                ResultSet rs2 = stmt2.executeQuery();
                while(rs2.next()){
                    found.addToCategories(rs2.getString(1));
                }
            }

        } catch( SQLException ex) {
            System.out.printf("ERROR: %s\n", ex);
        }
        return found;
    }

    @Override
    public void editAd(Ad ad, String[] categories) {
        try {
            delete(ad.getId());
            insert(ad, categories);

        } catch(Exception ex) {
            System.out.printf("ERROR: %s\n", ex);
        }

    }

    @Override
    public int delete(Long id) {
        int numberOfRowsAffected = 0;
        try {
            String deleteQuery = "delete from ads where id = ? ";
            PreparedStatement stmtDelete = connection.prepareStatement(deleteQuery);
            stmtDelete.setLong(1, id);
            numberOfRowsAffected = stmtDelete.executeUpdate();
        } catch(SQLException ex) {
            System.out.printf("ERROR: %s\n", ex);
        }
        return numberOfRowsAffected;
    }

    public static void main(String[] args) {
        Ads adsDao = new MySQLAdsDao(new Config());
        adsDao.delete(1L);
       List<Ad> all = adsDao.all();
        for (Ad ad : all) {
            System.out.println("id: " + ad.getId());
            System.out.println("Name: " + ad.getTitle());

        }

    }
}
