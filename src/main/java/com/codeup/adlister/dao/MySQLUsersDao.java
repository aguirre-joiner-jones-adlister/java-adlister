package com.codeup.adlister.dao;



import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import javax.servlet.ServletException;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

public class MySQLUsersDao implements Users {
    private Connection connection;

    public MySQLUsersDao(Config config) {
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
    public ArrayList<User> all() {
        PreparedStatement statement = null;
        ArrayList<User> allUsers = new ArrayList<>();
        String query = "SELECT * FROM users";
        try {
            statement = connection.prepareStatement(query);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                allUsers.add(new User(
                        rs.getLong("id"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("avatar")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allUsers;
    }

    @Override
    public User findByUsername(String username) {
        String query = "SELECT * FROM users WHERE username = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, username);
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by username", e);
        }
    }

    @Override
    public int deleteUser(long id) {
        int rowsAffected = 0;
        String query = "DELETE FROM users WHERE id = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, id);
            rowsAffected = stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowsAffected;
    }

    @Override
    public Long insert(User user) {
        long idForNewUser = 0L;
        String query = "INSERT INTO users( username, email, password, avatar) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getAvatar());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            idForNewUser = rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating new user", e);
        }
        return idForNewUser;
    }

    private User extractUser(ResultSet rs) throws SQLException {
        if (!rs.next()) {
            return null;
        }
        return new User(
            rs.getLong("id"),
            rs.getString("username"),
            rs.getString("email"),
            rs.getString("password"),
            rs.getString("avatar")
        );
    }

    @Override
    public int updateUser(User user) {
        int numberOfRowsEffected = 0;
        try {
            String query = "update users set username = ?, email = ?, avatar = ? where id = ?";

            PreparedStatement stmt = connection.prepareStatement(query);

            stmt.setString(1,user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getAvatar());
            stmt.setString(4, Long.toString(user.getId()));

            numberOfRowsEffected = stmt.executeUpdate();
        } catch( SQLException ex) {
            System.out.printf("ERROR: %s\n", ex);
        }
        return numberOfRowsEffected;
    }






    //w: main

    public static void main(String[] args) {
        User newUser = new User(
                1,
                "TESTING123",
                "amber@mail.com",
                "aj",
                "http://localhost:8080/update"
        );
        DaoFactory.getUsersDao().updateUser(newUser);


        ArrayList<User> all = DaoFactory.getUsersDao().all();
        for (User user : all) {
            System.out.println(user);
        }


    }

}
