<%@page import="dao.OrderDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 
    Document   : dashboard
    Created on : Sep 16, 2023, 12:16:34 AM
    Author     : QUANG HUY
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="model.Order"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ Admin</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="static/css/orderManager.css">
        <link rel="stylesheet" href="static/css/root.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body class="fade-in">
        <!-- Kiểm tra và hiển thị thông báo thành công nếu có -->
        <c:if test="${not empty sessionScope.SUCCESS_MESSAGE}">
            <div style="color: green;">
                ${sessionScope.SUCCESS_MESSAGE}
            </div>
        </c:if>

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
                                    <i class="fa-solid fa-cart-shopping" style="color: #ffffff;"></i>                            
                                </div>
                                <div class="title">
                                    <a class="nav-link" href="DashboardStaff"><span>Quản lí đơn hàng</span></a>
                                </div>
                            </div>
                        </li>

                        <li class="nav-item">
                            <div class="icon-integration">
                                <div class="icon">
                                    <i class="fa-solid fa-comments" style="color: #ffffff;"></i>                            
                                </div>
                                <div class="title">
                                    <a class="nav-link" href="FeedbackStaffManager"><span>Kiểm tra phản hồi</span></a>
                                </div>
                            </div>
                        </li>

                    </ul>
                </aside>
                <main class="col-md-10">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="breadcrumb">
                                <a href="OrderManager"><b>Danh sách đơn hàng</b></a>
                            </div>
                            <div id="clock"></div>
                        </div>
                    </div>
                    <%
                        String search = request.getParameter("search");
                        if (search == null) {
                            search = "";
                        }
                    %> 
                    <%
                        OrderDAO dao = new OrderDAO();
                        List<Order> listOrder = (List<Order>) request.getAttribute("listOrder");
                        if (listOrder == null) {
                            listOrder = dao.searchOrder("");
                            request.setAttribute("listOrder", listOrder);
                        }
                    %>
                    <div class="container">

                        <div class="error_message">
                            ${requestScope.ERROR}
                        </div>
                        <div class="search-container">
                            <form action="OrderManager" method="POST" class="form-inline">
                                <div class="form-group">
                                    <input type="text" value="<%=search%>" placeholder="Tìm kiếm..."  class="form-control" name="search" id="search" />
                                </div>
                                <button type="submit" class="fa fa-solid fa-magnifying-glass" name="action" value="Search"></button>

                            </form>
                        </div>
                                <div id="table__paging">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th class="text-center">Mã đơn hàng</th>
                                    <th class="text-center">Người dùng</th>
                                    <th class="text-center">Số điện thoại</th>
                                    <th class="text-center">Địa chỉ</th>
                                    <th class="text-center">Ngày đặt hàng</th>
                                    <th class="text-center">Phí Ship</th>
                                    <th class="text-center">Tổng Tiền</th>
                                    <th class="text-center">Trạng thái</th>
                                    <th class="text-center">Chi tiết</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${listOrder}" var="o">
                                    <tr>
                                        <td class="text-center text-lg text-medium">${o.orderID}</td>
                                        <td class="text-center text-lg text-medium">${o.userID}</td>
                                        <td class="text-center text-lg text-medium">${o.phone}</td>
                                        <td class="text-center text-lg text-medium">${o.address}</td>
                                        <td class="text-center text-lg text-medium">${o.orderDate}</td>   
                                        <td class="text-center text-lg text-medium"><fmt:formatNumber value="${o.shipCost}" pattern="###,###"/> VNĐ</td>
                                        <td class="text-center text-lg text-medium"><fmt:formatNumber value="${o.total}" pattern="###,###"/> VNĐ</td>
                                        <td class="text-center text-lg text-medium">${o.status?"Đã duyệt":"Chưa duyệt"}</td> 
                                        <td class="text-center text-lg text-medium">
                                            <a href="DetailOrder?orderId=${o.orderID}" class="round-button"><i class="fa-solid fa-eye" style="color: white;"></i></a>
                                            <a href="UpdateOrderStaff?orderId=${o.orderID}" class="round-button"><i class="fa-solid fa-circle-check" style="color: white;"></i></a>
                                        </td>
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
