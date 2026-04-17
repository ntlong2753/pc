<%--
  Created by IntelliJ IDEA.
  User: ntlong
  Date: 17/04/2026
  Time: 01:45 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Thêm Game Mới - Admin Dashboard</title>

  <!-- Google Fonts: Poppins cho UI hiện đại -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

  <style>
    body {
      background-color: #f8f9fa;
      font-family: 'Poppins', sans-serif;
      color: #2c3e50;
    }

    .form-container {
      margin-top: 50px;
      margin-bottom: 50px;
      background: #ffffff;
      padding: 40px;
      border-radius: 16px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
      max-width: 700px;
      margin-left: auto;
      margin-right: auto;
    }

    .page-title {
      font-weight: 600;
      color: #1e293b;
      margin-bottom: 30px;
      text-align: center;
      position: relative;
      padding-bottom: 15px;
    }

    .page-title::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 60px;
      height: 4px;
      background: #198754;
      border-radius: 2px;
    }

    .form-label {
      font-weight: 500;
      color: #475569;
      margin-bottom: 8px;
    }

    .input-group-text {
      background-color: #f8fafc;
      border-right: none;
      color: #64748b;
    }

    .form-control, .form-select {
      border-left: none;
      padding: 12px 15px;
      border-color: #dee2e6;
    }

    .form-control:focus, .form-select:focus {
      box-shadow: none;
      border-color: #198754;
    }

    .input-group:focus-within .input-group-text,
    .input-group:focus-within .form-control {
      border-color: #198754;
      box-shadow: 0 0 0 0.25rem rgba(25, 135, 84, 0.25);
    }

    /* Style riêng cho phần upload ảnh */
    input[type="file"]::file-selector-button {
      background-color: #e2e8f0;
      color: #475569;
      border: none;
      padding: 8px 16px;
      border-radius: 6px;
      margin-right: 15px;
      transition: all 0.2s;
      font-weight: 500;
    }

    input[type="file"]::file-selector-button:hover {
      background-color: #cbd5e1;
      cursor: pointer;
    }

    .image-preview-wrapper {
      border: 2px dashed #cbd5e1;
      border-radius: 12px;
      padding: 15px;
      text-align: center;
      background-color: #f8fafc;
      transition: all 0.3s;
    }

    .image-preview-wrapper img {
      max-height: 250px;
      border-radius: 8px;
      object-fit: cover;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    .btn-action {
      padding: 12px 30px;
      font-weight: 500;
      border-radius: 8px;
      transition: all 0.3s;
    }

    .btn-save {
      background-color: #198754;
      color: white;
      border: none;
    }

    .btn-save:hover {
      background-color: #157347;
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(25, 135, 84, 0.3);
    }

    .btn-cancel {
      background-color: #e2e8f0;
      color: #475569;
      border: none;
    }

    .btn-cancel:hover {
      background-color: #cbd5e1;
      color: #1e293b;
    }
  </style>
</head>
<body>

<div class="container">
  <div class="form-container">
    <h2 class="page-title"><i class="bi bi-controller me-2"></i>Thêm Game Mới</h2>

    <!-- QUAN TRỌNG: Thêm enctype="multipart/form-data" để upload file -->
    <form action="${pageContext.request.contextPath}/admin/create" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>

      <!-- Tên Game -->
      <div class="mb-4">
        <label for="gameName" class="form-label">Tên Trò Chơi</label>
        <div class="input-group">
          <span class="input-group-text"><i class="bi bi-joystick"></i></span>
          <input type="text" class="form-control" id="gameName" name="gameName" placeholder="Nhập tên game..." required>
          <div class="invalid-feedback">Vui lòng nhập tên game.</div>
        </div>
      </div>

      <div class="row">
        <!-- Thể loại -->
        <div class="col-md-6 mb-4">
          <label for="categoryId" class="form-label">Thể Loại</label>
          <div class="input-group">
            <span class="input-group-text"><i class="bi bi-tags"></i></span>
            <select class="form-select" id="categoryId" name="categoryId" required>
              <option value="" selected disabled>-- Chọn thể loại --</option>
              <option value="1">MOBA</option>
              <option value="2">RPG</option>
              <option value="3">Sports</option>
              <option value="4">FPS</option>
              <option value="5">Adventure</option>
            </select>
            <div class="invalid-feedback">Vui lòng chọn thể loại.</div>
          </div>
        </div>

        <!-- Giá -->
        <div class="col-md-6 mb-4">
          <label for="price" class="form-label">Giá Tiền (VNĐ)</label>
          <div class="input-group">
            <span class="input-group-text"><i class="bi bi-cash-coin"></i></span>
            <input type="number" class="form-control" id="price" name="price" placeholder="0" min="0" step="1000" required>
            <div class="invalid-feedback">Vui lòng nhập giá hợp lệ.</div>
          </div>
        </div>
      </div>

      <!-- Upload Hình Ảnh -->
      <div class="mb-4">
        <label for="gameImage" class="form-label">Hình Ảnh Poster (Tải lên từ máy tính)</label>
        <div class="input-group mb-3">
          <span class="input-group-text"><i class="bi bi-image"></i></span>
          <!-- input type="file" với accept="image/*" để chỉ cho phép chọn file ảnh -->
          <input type="file" class="form-control" id="gameImage" name="gameImage" accept="image/*" required onchange="previewImage(event)">
          <div class="invalid-feedback">Vui lòng chọn hình ảnh cho game.</div>
        </div>

        <!-- Khu vực hiển thị trước hình ảnh -->
        <div id="imagePreviewContainer" class="image-preview-wrapper d-none mt-2">
          <p class="text-muted small mb-2"><i class="bi bi-eye"></i> Xem trước hình ảnh:</p>
          <img id="imagePreview" src="#" alt="Preview" class="img-fluid">
        </div>
      </div>

      <!-- Mô tả -->
      <div class="mb-4">
        <label for="description" class="form-label">Mô Tả Chi Tiết</label>
        <div class="input-group">
          <span class="input-group-text align-items-start pt-3"><i class="bi bi-card-text"></i></span>
          <textarea class="form-control" id="description" name="description" rows="4" placeholder="Nhập mô tả ngắn gọn về game..." required></textarea>
          <div class="invalid-feedback">Vui lòng nhập mô tả.</div>
        </div>
      </div>

      <!-- Nút bấm -->
      <div class="d-flex justify-content-end gap-3 mt-5">
        <a href="${pageContext.request.contextPath}/auth/admin/home" class="btn btn-cancel btn-action text-decoration-none">
          <i class="bi bi-arrow-left me-1"></i> Quay lại
        </a>
        <button type="submit" class="btn btn-save btn-action">
          <i class="bi bi-floppy me-1"></i> Lưu thông tin
        </button>
      </div>
    </form>
  </div>
</div>

<!-- Script xử lý xem trước ảnh và validate -->
<script>
  // Hàm hiển thị xem trước ảnh (Image Preview)
  function previewImage(event) {
    const input = event.target;
    const previewContainer = document.getElementById('imagePreviewContainer');
    const previewImage = document.getElementById('imagePreview');

    if (input.files && input.files[0]) {
      const reader = new FileReader();
      reader.onload = function(e) {
        previewImage.src = e.target.result;
        previewContainer.classList.remove('d-none'); // Hiển thị khung preview
      }
      reader.readAsDataURL(input.files[0]);
    } else {
      previewContainer.classList.add('d-none'); // Ẩn khung preview nếu hủy chọn
      previewImage.src = '#';
    }
  }

  // Bootstrap Form Validation
  (function () {
    'use strict'
    var forms = document.querySelectorAll('.needs-validation')
    Array.prototype.slice.call(forms).forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }
        form.classList.add('was-validated')
      }, false)
    })
  })()
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>