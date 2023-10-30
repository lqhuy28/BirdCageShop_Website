<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 
    Document   : dashboard
    Created on : Sep 16, 2023, 12:16:34 AM
    Author     : QUANG HUY
--%>

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
        <link rel="stylesheet" href="static/css/dashboard.css">
        <link rel="stylesheet" href="static/css/root.css">
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
                                    <i class="fa-solid fa-network-wired" style="color: #ffffff;"></i>
                                </div>
                                <div class="title">
                                    <a class="nav-link" href="DashboardController"><span>Bảng điều khiển</span></a>
                                </div>
                        </li>
                        <li class="nav-item">
                            <div class="icon-integration">
                                <div class="icon">
                                    <i class="fa fa-solid fa-users" style="color: #ffffff;"></i>
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
                                    <a class="nav-link" href ="ShowProduct.jsp"><span>Quản lí sản phẩm</span></a>
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
                <main class="col-md-10">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="breadcrumb">
                                <a href="dashboard.jsp"><b>Bảng điều khiển</b></a>
                            </div>

                            <div id="clock"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <div class="section-container">
                                <div class="logo-main first-logo">
                                    <i class="fa-solid fa-user fa-2xl" style="color: #22AD56;"></i>
                                </div>
                                <div>
                                    <h4>Tổng khách hàng</h4>
                                    <p><b>${requestScope.countuser} khách hàng</b></p>
                                    <hr>
                                    <p>Tổng số khách hàng được quản lý.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="section-container">
                                <div class="logo-main second-logo">
                                    <i class="fa-solid fa-weight-hanging fa-2xl" style="color: #1D5AAB;"></i>                           
                                </div>
                                <div>
                                    <h4>Tổng sản phẩm</h4>
                                    <p><b>${requestScope.countcage} sản phẩm</b></p>
                                    <hr>
                                    <p>Tổng số sản phẩm được quản lý.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="section-container">
                                <div class="logo-main third-logo">
                                    <i class="fa-solid fa-cart-shopping fa-2xl" style="color: #FE9115;"></i>                            
                                </div>
                                <div>
                                    <h4>Tổng đơn hàng</h4>
                                    <p><b>${requestScope.countorder} đơn hàng</b></p>
                                    <hr>
                                    <p>Tổng số hóa đơn bán hàng trong tháng.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="section-container">
                                <div class="logo-main four-logo">
                                    <i class="fa-solid fa-money-bill fa-2xl" style="color: #ff0000;"></i>
                                </div>
                                <div>
                                    <h4>Tổng doanh thu</h4>
                                    <p><b>${requestScope.countorderprice} VNĐ</b></p>
                                    <hr>
                                    <p>Tổng doanh thu của cửa hàng.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="order">
                            <h3>Đơn hàng hôm nay</h3>
                            <hr>
                            <div>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th class="text-center">Mã đơn hàng</th>
                                            <th class="text-center">Ngày đặt hàng</th>
                                            <th class="text-center">Số điện thoại</th>
                                            <th class="text-center">Địa chỉ</th>
                                            <th class="text-center">Phí Ship</th>
                                            <th class="text-center">Tổng Tiền</th>
                                            <th class="text-center">Tình Trạng</th>
                                            <th class="text-center">Chi tiết</th>
                                        </tr>
                                    </thead>
                                    <% List<Order> listOrder = (List<Order>) request.getAttribute("listOrder");
                                    %>
                                    <tbody>
                                        <%for(Order o : listOrder){%>
                                            <tr>
                                                <td class="text-center text-lg text-medium"><%=o.getOrderID()%></td>
                                                <td class="text-center text-lg text-medium"><%=o.getOrderDate()%></td>   
                                                <td class="text-center text-lg text-medium"><%=o.getPhone()%></td>
                                                <td class="text-center text-lg text-medium"><%=o.getAddress()%></td>
                                                <td class="text-center text-lg text-medium"><%=o.getShipCost()%></td>
                                                <td class="text-center text-lg text-medium"><%=o.getTotal()%></td>
                                                <td class="text-center text-lg text-medium"><%=o.isStatus() ? "Đã thanh toán" : "Chưa thanh toán"%></td>
                                                <td class="text-center text-lg text-medium"><a href="DetailOrder?orderId=<%=o.getOrderID()%>"><i class="fa-solid fa-eye" style="color: red;"></i></a></td>
                                            </tr>

                                        <% } %>
                                    </tbody>
                                </table>    
                            </div>
                        </div>
                    </div>
                    <br>
                </main>
            </div>
        </div>
    </body>
</html>
