package com.codegym.pc.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class GameDAO {
    private Connection connect;

    public GameDAO(Connection connect) {
        this.connect = connect;
    }

    public ResultSet getAllGames() throws SQLException {
        String sql = "SELECT * FROM games";
        Statement statement = connect.createStatement();
        return statement.executeQuery(sql);
    }

    public void createGames (String category, String name, String image, String description, double price) throws SQLException {
        String sql = "INSERT INTO games (category, name, image, description, price) VALUES (" +
                "'" + category + "', " +
                "'" + name + "', " +
                "'" + image + "', " +
                "'" + description + "', " +
                "'" + price + "')";

        Statement statement = connect.prepareStatement(sql);
        statement.executeUpdate(sql);
    }
    public void updateGames (int id, String category, String name, String image, String description, String price) throws SQLException {
        String sql = "INSERT INTO games (id, category, name, image, description, price) VALUES (" +
                "'" + id + "', " +
                "'" + category + "', " +
                "'" + name + "', " +
                "'" + image + "', " +
                "'" + description + "', " +
                "'" + price + "')";

        Statement statement = connect.prepareStatement(sql);
        statement.executeUpdate(sql);
    }

    public void deleteById(int id) throws SQLException {
        String sql = "DELETE FROM games WHERE id = " + id;
        Statement statement = connect.prepareStatement(sql);
        statement.executeUpdate(sql);
    }

    public ResultSet getById(int id) throws SQLException {
        String sql = "SELECT * FROM games WHERE id = " + id;
        Statement statement = connect.prepareStatement(sql);
        return statement.executeQuery(sql);
    }

    public ResultSet searchName(String keyword) throws SQLException {
        String sql = "SELECT * FROM games WHERE game_name LIKE '%" + keyword + "%'";
        Statement statement = connect.prepareStatement(sql);
        return statement.executeQuery(sql);
    }

    public ResultSet searchCategory(String category) throws SQLException {
        String sql = "SELECT * FROM games WHERE game_name LIKE '%" + category + "%'";
        Statement statement = connect.prepareStatement(sql);
        return statement.executeQuery(sql);
    }



}
