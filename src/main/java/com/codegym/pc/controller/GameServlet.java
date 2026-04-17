package com.codegym.pc.controller;

import com.codegym.pc.services.GameServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "userServlet", urlPatterns = "/admin/*")
public class GameServlet extends HttpServlet {
    private GameServices gameServices;



    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        System.out.println(pathInfo);
        if (pathInfo == null) {
            pathInfo = "/";
        }
        switch (pathInfo) {
            case "/":
                try {
                    gameServices.renderPageListGame(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "/create":
                gameServices.renderFormCreateGame(request, response);
                break;
            case "/delete":
                try {
                    gameServices.deleteGameById(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;

            case "/edit":
                try {
                    gameServices.renderFormEditUser(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "/search":
                try {
                    gameServices.searchUser(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


}
