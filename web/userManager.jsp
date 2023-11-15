<%-- 
    Document   : userManager
    Created on : Sep 18, 2023, 9:05:10 PM
    Author     : Admin
--%>

<%@page import="dao.UserDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lí người dùng</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="static/css/userManager.css">
        <link rel="stylesheet" href="static/css/root.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body class="fade-in">
        <header>
            <div class="logo">
                <img src="static/img/logoheadb.png">
            </div>

            <div class="login">
                <a class="fas fa-sign-out-alt " href ="MainController?action=Logout"></a>
            </div>
        </header>
        <div class="bodya">
            <div class="row">
                <div class="col-md-2">
                    <aside class=" dashboard__sider" >
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
                                        <a class="nav-link" href="DashboardController"><span>Bảng điều khiển</span></a>
                                    </div>
                            </li>
                            <li class="nav-item">
                                <div class="icon-integration">
                                    <div class="icon">
                                        <i class="fa-solid fa-users" style="color: #ffffff;"></i>
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
                </div>

                <main class="col-md-10">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="breadcrumb">
                                <a href="searchUser"><b>Danh sách người dùng</b></a>
                            </div>
                            <div id="clock"></div>
                        </div>
                    </div>
                    <div class="container">

                        <%
                            String search = request.getParameter("search");
                            if (search == null) {
                                search = "";
                            }
                        %>    

                        <%
                            UserDAO dao = new UserDAO();
                            List<User> listU = (List<User>) request.getAttribute("listU");
                            if (listU == null) {
                                listU = dao.SearchUser("");
                                request.setAttribute("listU", listU);
                            }
                        %>

                        <div class="search-container">
                            <form action="searchUser" method="POST" class="form-inline">
                                <div class="form-group">
                                    <input type="text" value="<%=search%>" placeholder="Tìm kiếm..."  class="form-control" name="search" id="search" />
                                </div>
                                <button type="submit" class="fa fa-solid fa-magnifying-glass" name="action" value="Search"></button>
                            </form>
                        </div>
                        <% if (request.getAttribute("ERROR") != null) {%>
                        <p><%= request.getAttribute("ERROR")%></p>
                        <% } else {%>
                        <% int count = 1;%>
                        <c:set var="listU" value="${requestScope.listU}" />
                        <c:if test="${not empty listU}">
                            <div id="table__paging">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">STT</th>
                                        <th scope="col">Tên đăng nhập</th>
                                        <th scope="col">Tên người dùng</th>
                                        <th scope="col">Số điện thoại</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Địa chỉ</th>
                                        <th scope="col">Chức vụ</th>
                                        <th scope="col">Trạng thái</th>
                                        <th scope="col">Chức năng</th>
                                    </tr>
                                </thead>

                                <c:forEach items="${listU}" var="x">
                                    <tr>
                                        <td><%= count++%></td>
                                        <td>${x.userID}</td>
                                        <td>${x.fullName}</td>
                                        <td>${x.phone}</td>
                                        <td>${x.email}</td>
                                        <td>${x.address}</td>
                                        <td>${x.roleID}</td>
                                        <td>${x.status}</td>             
                                        <td>
                                            <div class="btn-group">
                                                <a href="updateUser?userID=${x.userID}" class="btn btn-success"><i class="fa-solid fa-file-pen"></i></a>
                                                <a href="deleteUser?userID=${x.userID}" class="btn btn-warning"><i class="fa-solid fa-rotate-right"></i></i></a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </table>
                                </div>
                            <nav aria-label="Page navigation">
                                <ul class="pagination justify-content-center">

                                </ul>
                            </nav>
                        </c:if>
                        <% }%>
                    </div>
                </main>
            </div>
        </div>
                    <script>
        $(document).ready(function () {
            var itemsPerPage = 10; // Number of items to display per page
            var $tableContainer = $('#table__paging');
            var $table = $tableContainer.find('table');
            var $pagination = $('.pagination');

            var numRows = $table.find('tbody tr').length;
            var numPages = Math.ceil(numRows / itemsPerPage);

            // Create pagination links
            for (var i = 1; i <= numPages; i++) {
                var $li = $('<li class="page-item"><a class="page-link" href="#">' + i + '</a></li>');
                $li.data('page', i);
                $pagination.append($li);
            }

            // Show the first page and highlight its link
            $table.find('tbody tr:gt(' + (itemsPerPage - 1) + ')').hide();
            $pagination.find('li:first').addClass('active');

            // Handle pagination link click
            $pagination.find('li').click(function () {
                var $this = $(this);
                var page = $this.data('page');

                // Hide and show the appropriate rows
                var firstItem = (page - 1) * itemsPerPage;
                var lastItem = firstItem + itemsPerPage;

                $table.find('tbody tr').hide();
                $table.find('tbody tr:eq(' + (firstItem) + ')').show();
                $table.find('tbody tr:gt(' + (firstItem) + '):lt(' + (itemsPerPage - 1) + ')').show();

                // Highlight the clicked link
                $pagination.find('li').removeClass('active');
                $this.addClass('active');
            });
        });
    </script>
    </body>
</html>
