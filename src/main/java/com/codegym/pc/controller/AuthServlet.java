package com.codegym.pc.controller;

import com.codegym.pc.services.AuthServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "authServlet", urlPatterns = "/auth/*")
public class AuthServlet extends HttpServlet {
    private AuthServices authServices;
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return;
        }

        switch (pathInfo) {
            case "/user/login":
                // Đường dẫn tính từ thư mục webapp
                request.getRequestDispatcher("/WEB-INF/view/user/login_user.jsp").forward(request, response);
                break;
            case "/user/register":
                request.getRequestDispatcher("/WEB-INF/view/user/register_user.jsp").forward(request, response);
                break;
            case "/admin/login":
                request.getRequestDispatcher("/WEB-INF/view/admin/login.jsp").forward(request, response);
            case "/home/admin":
                request.getRequestDispatcher("/WEB-INF/view/admin/home.jsp").forward(request, response);
            default:
                response.sendRedirect(request.getContextPath() + "");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        System.out.println(pathInfo);

        if (pathInfo == null) {
            pathInfo = "/";
        }
        switch (pathInfo) {
            case "/login":
                authServices.handleLogin(request, response);
                break;
        }
    }
}
