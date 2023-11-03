<%-- 
    Document   : orderManager
    Created on : Oct 17, 2023, 12:55:58 AM
    Author     : QUANG HUY
--%>

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
                                <a href="orderManager.jsp"><b>Danh sách đơn hàng</b></a>
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
    </body>
</html>
