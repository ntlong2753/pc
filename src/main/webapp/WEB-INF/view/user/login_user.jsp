<%--
  Created by IntelliJ IDEA.
  User: ntlong
  Date: 16/04/2026
  Time: 01:35 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String errorMessage = (String) request.getAttribute("errorMessage");
%>
<html>
<head>
  <title>Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
<div class="container">
  <br> <br> <br>
  <h2 class="text-center" style="margin-top: 30px;">Đăng nhập vào hệ thống</h2>
  <br>
  <form action="${pageContext.request.contextPath}/auth/login" method="post" class="form-signin" style="max-width: 400px; margin: 0 auto;">
    <% if (errorMessage != null) { %>
    <div class="alert alert-danger text-center" role="alert">
      <%= errorMessage %>
    </div>
    <% } %>

    <div class="form-floating mb-3">
      <input type="text" class="form-control" id="username" name="username" placeholder="Tên đăng nhập" required>
      <label for="username">Tên đăng nhập</label>
    </div>

    <div class="form-floating mb-3">
      <input type="password" class="form-control" id="password" name="password" placeholder="Mật khẩu" required>
      <label for="password">Mật khẩu</label>
    </div>

    <button class="btn btn-primary w-100" type="submit"
            style="background-color: #0866ff; border: none; padding: 10px; font-weight: bold;">Đăng nhập</button>


    <div class="text-center mt-3">
      <span>Bạn chưa có tài khoản? </span>
      <a href="/auth/user/register" style="text-decoration: none; font-weight: bold;">Tạo tài khoản</a>
    </div>

    <div class="text-center mt-3">
      <a href="/" style="text-decoration: none; font-weight: bold;">Quay lại trang chủ chọn vai trò</a>
    </div>
  </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

</body>
</html>