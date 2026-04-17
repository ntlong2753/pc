<%--
  Created by IntelliJ IDEA.
  User: ntlong
  Date: 17/04/2026
  Time: 08:09 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard - Game Management</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }

    .table-container {
      margin-top: 50px;
      background: white;
      padding: 30px;
      border-radius: 10px;
      shadow: 0 0 15px rgba(0,0,0,0.1);
    }

    .table thead {
      background-color: #212529;
      color: white;
    }

    .btn-create {
      background-color: #198754;
      color: white; border: none;
    }

    .btn-create:hover {
      background-color: #157347;
      color: white; }
  </style>
</head>
<body>

<div class="container">
  <div class="table-container shadow-sm">
    <h1 class="text-center mb-4 fw-bold" style="color: #2c3e50;">Game List</h1>

    <div class="d-flex justify-content-between mb-3">
      <div class="d-flex align-items-center">
        <a href="${pageContext.request.contextPath}/admin/create" class="btn btn-create px-4 me-3">Create</a>

        <form action="admin-home" method="get" id="filterForm">
          <select name="categoryId" class="form-select" onchange="document.getElementById('filterForm').submit()">
            <option value="0">-- Tất cả thể loại --</option>
            <c:forEach var="cat" items="${categories}">
              <option value="${cat.id}" ${param.categoryId == cat.id ? 'selected' : ''}>
                  ${cat.categoryName}
              </option>
            </c:forEach>
          </select>
        </form>
      </div>

      <form class="d-flex w-25" action="searchGame" method="get">
        <input class="form-control me-2" type="search" name="keyword" placeholder="Tìm kiếm...">
        <button class="btn btn-primary" type="submit">Search</button>
      </form>
    </div>

    <table class="table table-bordered table-hover text-center align-middle">
      <thead>
      <tr>
        <th>ID</th>
        <th>Category ID</th>
        <th>Game Name</th>
        <th>Image</th>
        <th>Description</th>
        <th>Price</th>
        <th>Action</th>
      </tr>
      </thead>
      <tr>
        <td>1</td>
        <td>MOBA</td>
        <td>Liên Minh Huyền Thoại</td>
        <td>
          <img src="path/to/your/image.jpg" alt="Game Image"
               style="width: 80px; height: auto; border-radius: 5px; object-fit: cover;">
        </td>
        <td>Game chiến thuật đồng đội</td>
        <td>0.00</td>
        <td>
          <a href="edit?id=3" class="btn btn-sm btn-primary me-1">Edit</a>
          <button class="btn btn-sm btn-danger" onclick="confirmDelete(3)">Delete</button>
        </td>
      </tr>
      <tbody>
      <tr>
        <td>1</td>
        <td>MOBA</td>
        <td>Liên Minh Huyền Thoại</td>
        <td>
          <img src="path/to/your/image.jpg" alt="Game Image"
               style="width: 80px; height: auto; border-radius: 5px; object-fit: cover;">
        </td>
        <td>Game chiến thuật đồng đội</td>
        <td>0.00</td>
        <td>
          <a href="edit?id=3" class="btn btn-sm btn-primary me-1">Edit</a>
          <button class="btn btn-sm btn-danger" onclick="confirmDelete(3)">Delete</button>
        </td>
      </tr>

      <tr>
        <td>1</td>
        <td>MOBA</td>
        <td>Liên Minh Huyền Thoại</td>
        <td>
          <img src="path/to/your/image.jpg" alt="Game Image"
               style="width: 80px; height: auto; border-radius: 5px; object-fit: cover;">
        </td>
        <td>Game chiến thuật đồng đội</td>
        <td>0.00</td>
        <td>
          <a href="edit?id=3" class="btn btn-sm btn-primary me-1">Edit</a>
          <button class="btn btn-sm btn-danger" onclick="confirmDelete(3)">Delete</button>
        </td>
      </tr>
      <tr>
        <td>1</td>
        <td>MOBA</td>
        <td>Liên Minh Huyền Thoại</td>
        <td>
          <img src="path/to/your/image.jpg" alt="Game Image"
               style="width: 80px; height: auto; border-radius: 5px; object-fit: cover;">
        </td>
        <td>Game chiến thuật đồng đội</td>
        <td>0.00</td>
        <td>
          <a href="edit?id=3" class="btn btn-sm btn-primary me-1">Edit</a>
          <button class="btn btn-sm btn-danger" onclick="confirmDelete(3)">Delete</button>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
</div>

<script>
  function confirmDelete(id) {
    if (confirm("Bạn có chắc chắn muốn xóa game có ID: " + id + " không?")) {
      window.location.href = "deleteGame?id=" + id;
    }
  }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
