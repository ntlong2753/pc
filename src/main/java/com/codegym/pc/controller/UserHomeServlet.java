package com.codegym.pc.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "homeServlet", urlPatterns = {"/user/home"})
public class UserHomeServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Đã chạy vào UserHomeServlet thành công!");
        request.getRequestDispatcher("/WEB-INF/view/user/home_user.jsp").forward(request, response);
    }
}
