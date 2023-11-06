<%-- 
    Document   : updateUser
    Created on : Sep 20, 2023, 2:07:27 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cập nhật người dùng</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="static/css/updateUser.css">
        <link rel="stylesheet" href="static/css/root.css">
    </head>
    <body class="fade-in">
        <header>
            <div class="logo">
                <img src="static/img/logoheadb.png">
            </div>

            <div class="login">
                <a class="fas fa-sign-out-alt " href="MainController?action=Logout"></a>
            </div>
        </header>
        <div class="bodya">
            <div class="row">
                <aside class="col-md-2 dashboard__sider" >
                    <div class="admin">
                        <img src="static/img/admin1.png" width="200px">
                        <div>
                            <p>
                                <b>${sessionScope.LOGIN_USER.fullName}</b>
                                <br>Chào mừng bạn quay trở lại
                            </p>
                        </div>
                    </div>
                    <hr>
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <div class="icon-integration">
                                <div class="icon">
                                    <i class="fa-solid fa-network-wired" style="color: #ffffff;"></i>
                                </div>
                                <div class="title">
                                    <a class="nav-link" href="DashboardController"><span>   Bảng điều khiển</span></a>
                                </div>
                        </li>
                        <li class="nav-item">
                            <div class="icon-integration">
                                <div class="icon">
                                    <i class="fa fa-solid fa-users" style="color: #ffffff;"></i>
                                </div>
                                <div class="title">
                                    <a class="nav-link" href="searchUser"><span>Quản lí khách hàng</span></a>
                                </div>
                            </div>
                        </li>

                        <li class="nav-item">
                            <div class="icon-integration" style="margin-left: 18px;">
                                <div class="icon">
                                    <i class="fa-solid fa-weight-hanging" style="color: #ffffff;"></i>                            
                                </div>

                                <div class="title">
                                    <a class="nav-link" href="load"><span>Quản lí sản phẩm</span></a>
                                </div>
                            </div>
                        </li>

                        <li class="nav-item">
                            <div class="icon-integration">
                                <div class="icon">
                                    <i class="fa-solid fa-cart-shopping" style="color: #ffffff;"></i>                            
                                </div>
                                <div class="title">
                                    <a class="nav-link" href="OrderManager"><span>Quản lí đơn hàng</span></a>
                                </div>
                            </div>
                        </li>

                        <li class="nav-item">
                            <div class="icon-integration">
                                <div class="icon">
                                    <i class="fa-solid fa-comments" style="color: #ffffff;"></i>                            
                                </div>
                                <div class="title">
                                    <a class="nav-link" href="FeedbackManager"><span>Kiểm tra phản hồi</span></a>
                                </div>
                            </div>
                        </li>

                    </ul>
                </aside>

                <main class="col-md-10">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="breadcrumb">
                                <a href="#"><b>Cập nhật thông tin người dùng</b></a>
                            </div>
                            <div id="clock"></div>
                        </div>
                    </div>

                    <div class="container">
                        <form action="updateUser" method="POST">
                            <table>
                                <tr>
                                    <td>Tên đăng nhập</td>
                                    <td>
                                        <input value="${us.userID}" type="text" name="userID" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Tên người dùng</td>
                                    <td>
                                        <input value="${us.fullName}" type="text" name="fullName">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Mật khẩu</td>
                                    <td>
                                        <input value="${us.password}" type="text" name="password">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Số điện thoại</td>
                                    <td><input value="${us.phone}" type="text" name="phone"></td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td><input value="${us.email}" type="email" name="email"></td>
                                </tr>
                                <tr>
                                    <td>Địa chỉ</td>
                                    <td><input value="${us.address}" type="text" name="address"></td>
                                </tr>
                                <tr>
                                    <td>Chức vụ</td>
                                    <td><input value="${us.roleID}" type="text" name="roleID" readonly=""></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><button name="updateUser" type="submit">Cập nhật</button></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </main>
            </div>
        </div>
    </body>
</html>
