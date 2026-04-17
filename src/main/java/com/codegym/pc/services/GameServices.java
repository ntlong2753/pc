package com.codegym.pc.services;

import com.codegym.pc.dao.Database;
import com.codegym.pc.dao.GameDAO;
import com.codegym.pc.entity.Games;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GameServices {
    private static final GameDAO gameDAO = new GameDAO(Database.getConnection());
    public GameServices(){

    }

    public static List<Games> getAllUsers() throws SQLException {
        List<Games> games = new ArrayList<>();
        // 1. Xóa sạch cái list cũ trong RAM đi trước khi nạp dữ liệu mới từ DB
        games.clear();

        ResultSet resultSet = gameDAO.getAllGames();
        while (resultSet.next()) {
            Games game = new Games();

            // 2. PHẢI lấy dữ liệu từ resultSet nạp vào đối tượng games
            game.setId(resultSet.getInt("id"));
            game.setCategory(resultSet.getString("category"));
            game.setName(resultSet.getString("name"));
            game.setDescription(resultSet.getString("description"));
            game.setImage(resultSet.getString("image"));
            game.setPrice(resultSet.getDouble("price"));
            // 3. Sau đó mới add vào list
            games.add(game);
        }
        return games;
    }

    public static void renderPageListGame(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        // truyen list user vao request
        List<Games> users = GameServices.getAllUsers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/WEB-INF/view/admin/home.jsp").forward(request, response);
    }

    public static void renderFormCreateGame(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/admin/create.jsp").forward(request, response);
    }

    private static int currentId = 0;
    public static void createGame(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        Games newGames = new Games();
        currentId++;
        newGames.setId(currentId);
        newGames.setCategory(request.getParameter("category"));
        newGames.setName(request.getParameter("name"));
        newGames.setDescription(request.getParameter("description"));
        newGames.setImage(request.getParameter("image"));
        newGames.setPrice(Double.parseDouble(request.getParameter("price")));

        gameDAO.createGames(
                newGames.getCategory(),
                newGames.getName(),
                newGames.getImage(),
                newGames.getDescription(),
                newGames.getPrice()
        );
    }

    public static void deleteGameById(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String id = request.getParameter("id");
        gameDAO.deleteById(Integer.parseInt(id));
        response.sendRedirect("/admin/home");
    }

    public static void renderFormEditUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        String id = request.getParameter("id");
        // tim user trong db
        ResultSet resultSet = gameDAO.getById(Integer.parseInt(id));

        if (resultSet != null) {
            Games gameEdit = null;
            while (resultSet.next()) {
                gameEdit = new Games();
                gameEdit.setId(resultSet.getInt("id"));
                gameEdit.setCategory(resultSet.getString("category"));
                gameEdit.setName(resultSet.getString("name"));
                gameEdit.setImage(resultSet.getString("image"));
                gameEdit.setPrice(resultSet.getDouble("price"));
                gameEdit.setDescription(resultSet.getString("description"));
            }
            request.setAttribute("admin", gameEdit);
            request.getRequestDispatcher("/WEB-INF/view/admin/edit.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/WEB-INF/view/error/404.jsp").forward(request, response);
        }
    }

    public static void searchUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        String keyword = request.getParameter("keyword");

        List<Games> result = new ArrayList<>();

        ResultSet resultSet = gameDAO.searchName(keyword);

        while (resultSet.next()) {
            Games game = new Games();
            game.setId(resultSet.getInt("id"));
            game.setCategory(resultSet.getString("category"));
            game.setName(resultSet.getString("name"));
            game.setImage(resultSet.getString("image"));
            game.setDescription(resultSet.getString("description"));
            game.setPrice(resultSet.getDouble("price"));

            result.add(game);
        }
        System.out.println(result.size());
        request.setAttribute("users", result);
        request.getRequestDispatcher("/WEB-INF/view/admin/home.jsp").forward(request, response);
    }

    public static void searchUserByCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String category = request.getParameter("category");
        List<Games> result = new ArrayList<>();
        ResultSet resultSet = gameDAO.searchName(category);
        while (resultSet.next()) {
            Games game = new Games();
            game.setId(resultSet.getInt("id"));
            game.setCategory(resultSet.getString("category"));
            game.setName(resultSet.getString("name"));
            game.setImage(resultSet.getString("image"));
            game.setDescription(resultSet.getString("description"));
            game.setPrice(resultSet.getDouble("price"));
            result.add(game);
        }
        System.out.println(result.size());
        request.setAttribute("users", result);
        request.getRequestDispatcher("/WEB-INF/view/admin/home.jsp").forward(request, response);
    }
}
