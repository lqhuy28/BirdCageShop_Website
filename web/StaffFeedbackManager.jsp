<%@page import="model.FeedBack"%>
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
                                <a href="FeedbackStaffManager"><b>Danh sách đánh giá</b></a>
                            </div>
                            <div id="clock"></div>
                        </div>
                    </div>
                    <div class="container">

                        <div class="error_message">
                            ${requestScope.ERROR}
                        </div>
                        <div class="search-container">
                            <form action="searchUser" method="POST" class="form-inline">
                                <div class="form-group">
                                    <input type="text" value="#" placeholder="Search..."  class="form-control" name="search" id="search" />
                                </div>
                                <button type="submit" class="fa fa-solid fa-magnifying-glass" name="action" value="Search"></button>
                                <% List<FeedBack> listF = (List<FeedBack>) request.getAttribute("listFeedback"); %>
                            </form>
                        </div>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th class="text-center">Tên người dùng</th>
                                    <th class="text-center">Đánh giá</th>
                                    <th class="text-center">Mã người dùng</th>
                                    <th class="text-center">Mã đơn hàng</th>
                                    <th class="text-center">Ngày đánh giá</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (FeedBack f : listF) {
                                %>
                                <tr>
                                    <td class="text-center text-lg text-medium"><%=f.getFullName()%></td>
                                    <td class="text-center text-lg text-medium"><%=f.getRating()%></td>
                                    <td class="text-center text-lg text-medium"><%=f.getUserID()%></td>
                                    <td class="text-center text-lg text-medium"><%=f.getOrderId()%></td>
                                    <td class="text-center text-lg text-medium"><%=f.getFeedbackDate()%></td>   
                                </tr>
                                <% }%>
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
        </div>
    </body>
</html>
