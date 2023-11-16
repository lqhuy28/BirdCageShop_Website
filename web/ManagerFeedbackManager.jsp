<%-- 
    Document   : orderManager
    Created on : Oct 17, 2023, 12:55:58 AM
    Author     : QUANG HUY
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.FeedBackDAO"%>
<%@page import="model.FeedBack"%>
<%@page import="model.Order"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kiểm tra phản hồi</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="static/css/orderManager.css">
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
                                <div class="icon-integration" style="margin-left: 18px;">
                                    <div class="icon">
                                        <i class="fa-solid fa-weight-hanging" style="color: #ffffff;"></i>                            
                                    </div>

                                    <div class="title">
                                        <a class="nav-link" href ="DashboardManager"><span>Quản lí sản phẩm</span></a>
                                    </div>
                                </div>
                            </li>

                            <li class="nav-item">
                                <div class="icon-integration">
                                    <div class="icon">
                                        <i class="fa-solid fa-cart-shopping" style="color: #ffffff;"></i>                            
                                    </div>
                                    <div class="title">
                                        <a class="nav-link" href="ManagerOrderManager"><span>Quản lí đơn hàng</span></a>
                                    </div>
                                </div>
                            </li>

                            <li class="nav-item">
                                <div class="icon-integration">
                                    <div class="icon">
                                        <i class="fa-solid fa-comments" style="color: #ffffff;"></i>                            
                                    </div>
                                    <div class="title">
                                        <a class="nav-link" href="FeedbackManagerManager"><span>Kiểm tra phản hồi</span></a>
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
                                <a href="FeedbackManager"><b>Danh sách phản hồi</b></a>
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
                            FeedBackDAO dao = new FeedBackDAO();
                            List<FeedBack> listU = (List<FeedBack>) request.getAttribute("listF");
                            if (listU == null) {
                                listU = dao.searchFeedback("");
                                request.setAttribute("listF", listU);
                            }
                        %>
                        <div class="search-container">
                            <form action="SearchFeedbackManager" method="POST" class="form-inline">
                                <div class="form-group">
                                    <input type="text" value="<%=search%>" placeholder="Tìm kiếm..."  class="form-control" name="search" id="search" />
                                </div>
                                <button type="submit" class="fa fa-solid fa-magnifying-glass" name="action" value="Search"></button>
                            </form>
                        </div>
                        <% if (request.getAttribute("ERROR") != null) {%>
                        <p><%= request.getAttribute("ERROR")%></p>
                        <% } else {%>
                        <div id="table__paging">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="text-center">Mã người dùng</th>
                                        <th class="text-center">Tên người dùng</th>
                                        <th class="text-center">Mã đơn hàng</th>
                                        <th class="text-center">Ngày đánh giá</th>
                                        <th class="text-center">Đánh giá</th>
                                        <th class="text-center">Bình luận</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listF}" var="x">
                                        <tr>
                                            <td class="text-center text-lg text-medium">${x.userID}</td>
                                            <td class="text-center text-lg text-medium">${x.fullName}</td>
                                            <td class="text-center text-lg text-medium">${x.orderId}</td>
                                            <td class="text-center text-lg text-medium">${x.feedbackDate}</td> 
                                            <td class="text-center text-lg text-medium">${x.rating}</td>
                                            <td class="text-center text-lg text-medium">${x.comment}</td>   
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center">

                            </ul>
                        </nav>
                    </div>
                    <% }%>
                </main>
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
