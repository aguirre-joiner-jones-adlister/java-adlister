package com.codeup.adlister.dao;



import com.codeup.adlister.models.Ad_Category;
import com.mysql.cj.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLAdsCategoryDao  implements AdCategory{
    private Connection connection = null;

    public MySQLAdsCategoryDao(Config config) {
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
    public Long create(Ad_Category ad_category) {
        return null;
    }

    @Override
    public int update(Ad_Category ad_category) {
        return 0;
    }
}
