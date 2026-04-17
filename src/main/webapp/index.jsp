<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Game Management System - Welcome</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f8f9fa;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .choice-card {
            transition: transform 0.3s;
            cursor: pointer;
        }
        .choice-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

<div class="container text-center">
    <h1 class="mb-5 fw-bold text-primary">CHÀO MỪNG ĐẾN VỚI HỆ THỐNG QUẢN LÝ GAME</h1>
    <p class="mb-5 text-muted">Vui lòng chọn vai trò của bạn để tiếp tục</p>

    <div class="row justify-content-center">
        <div class="col-md-4 mb-4">
            <div class="card h-100 border-primary choice-card">
                <div class="card-body py-5">
                    <div class="display-3 text-primary mb-3">
                        <i class="bi bi-person-badge"></i> ⚙️
                    </div>
                    <h3 class="card-title">QUẢN TRỊ VIÊN</h3>
                    <p class="card-text text-muted">Thêm, sửa, xóa và quản lý danh mục game.</p>
                    <button class="btn btn-primary mt-3">
                        <a href="auth/admin/login" style="color: white;">Đăng nhập Admin</a>
                    </button>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card h-100 border-success choice-card">
                <div class="card-body py-5">
                    <div class="display-3 text-success mb-3">
                        <i class="bi bi-controller"></i> 🎮
                    </div>
                    <h3 class="card-title">NGƯỜI CHƠI</h3>
                    <p class="card-text text-muted">Xem danh sách và tìm kiếm những tựa game hot.</p>
                    <button class="btn btn-success mt-3">
                        <a href="auth/user/login" style="color: white;">Vào hệ thống</a>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>