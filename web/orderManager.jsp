<%-- 
    Document   : orderManager
    Created on : Oct 17, 2023, 12:55:58 AM
    Author     : QUANG HUY
--%>

<%@page import="dao.OrderDAO"%>
<%@page import="model.Order"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý đơn hàng</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="static/css/orderManager.css">
        <link rel="stylesheet" href="static/css/root.css">
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
                                        <a class="nav-link" href="dashboard.jsp"><span>Bảng điều khiển</span></a>
                                    </div>
                            </li>
                            <li class="nav-item">
                                <div class="icon-integration">
                                    <div class="icon">
                                        <i class="fa-solid fa-users" style="color: #ffffff;"></i>
                                    </div>
                                    <div class="title">
                                        <a class="nav-link" href="userManager.jsp"><span>Quản lí khách hàng</span></a>
                                    </div>
                                </div>
                            </li>

                            <li class="nav-item">
                                <div class="icon-integration" style="margin-left: 18px;">
                                    <div class="icon">
                                        <i class="fa-solid fa-weight-hanging" style="color: #ffffff;"></i>                            
                                    </div>

                                    <div class="title">
                                        <a class="nav-link" href="ShowProduct.jsp"><span>Quản lí sản phẩm</span></a>
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
                                        <a class="nav-link" href="#"><span>Kiểm tra phản hồi</span></a>
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
                                <a href="OrderManager"><b>Danh sách đơn hàng</b></a>
                            </div>
                            <div id="clock"></div>
                        </div>
                    </div>
                    <%
            String search = request.getParameter("search");
            if(search == null){
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
                                    <input type="text" value="<%=search%>" placeholder="Search..."  class="form-control" name="search" id="search" />
                                </div>
                                <button type="submit" class="fa fa-solid fa-magnifying-glass" name="action" value="Search"></button>

                            </form>
                        </div>
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
                                    <td class="text-center text-lg text-medium">${o.shipCost}</td>
                                    <td class="text-center text-lg text-medium">${o.total}</td>
                                    <td class="text-center text-lg text-medium"><a href="#" class="round-button"><i class="fa-solid fa-eye" style="color: white;"></i></a></td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                         <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                </ul>
                            </nav>
                    </div>
                </main>
            </div>
    </body>
</html>
