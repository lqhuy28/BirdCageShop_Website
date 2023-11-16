<%@page import="model.CageMaterial"%>
<%@page import="model.OrderDetail"%>
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
        <link rel="stylesheet" href="static/css/orderDetail.css"/>

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
                                    <a class="nav-link" href ="load"><span>Quản lí sản phẩm</span></a>
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
                                <a href="OrderManager"><b>Danh sách đơn hàng</b></a>
                            </div>
                            <div id="clock"></div>
                        </div>
                    </div>

                    <% List<Order> listOrder = (List<Order>) request.getAttribute("listOrder"); %>
                    <% for (Order o : listOrder) {
                    %>
                    <div class="container">
                        <h3><strong>Chi tiết đơn hàng</strong> </h3>
                        <p>Ngày đặt hàng: <%=o.getOrderDate()%></p>
                        <div class="styles__StyledGroupSection-sc-ri73gr-0 cRRvpz">
                            <div class="styles__StyledSection-sc-ri73gr-1 gQjSfs">
                                <div class="title">Thông tin người nhận</div>
                                <div class="content">
                                    <p class="name">${sessionScope.LOGIN_USER.fullName}</p>
                                    <p class="address"><span>Địa chỉ: </span><%=o.getAddress()%></p>
                                    <p class="phone"><span>Điện thoại: </span><%=o.getPhone()%></p>
                                </div>
                            </div>
                            <div class="styles__StyledSection-sc-ri73gr-1 gQjSfs">
                                <div class="title">Hình thức giao hàng</div>
                                <div class="content">
                                    <span> Giao Tiết Kiệm</span></p>
                                    <p>Được giao bởi BirdCage Shop</p>
                                    <p>Phí khác (Bao gồm phí vận chuyển): <fmt:formatNumber value="<%=o.getShipCost()%>" pattern="###,###"/> VNĐ</p>
                                </div>
                            </div>

                        </div>
                        </br>
                        </br>
                        </tr>
                        <% }%>
                        <% List<OrderDetail> ls = (List<OrderDetail>) request.getAttribute("ls"); %>
                        <table class=" Nbknf ">
                            <thead>
                                <tr>
                                    <th>Sản phẩm</th>
                                    <th>Giá</th>
                                    <th>Số lượng</th>
                                    <th>Giảm giá</th>
                                    <th>Thành tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (OrderDetail o : ls) {
                                        if (o.getCageName().equals("Lồng yêu cầu")) {
                                %> 
                                <tr>
                                    <td>
                                        <div class="product-item"><img
                                                src="https://png.pngtree.com/png-vector/20230822/ourmid/pngtree-outline-birdcage-flat-style-vector-icon-png-image_6843199.png"
                                                alt="">
                                            <div class="product-info"><a class="product-name"
                                                                         href=""><%=o.getCageName()%></a>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="price "><fmt:formatNumber value="<%=(o.getPrice() - 100000 * o.getQuantity()) / o.getQuantity()%>" pattern="###,###"/> VNĐ</td>
                                    <td class="quantity"><%=o.getQuantity()%></td>
                                    <td class="discount-amount">0 VNĐ</td>
                                    <td class="raw-total"><fmt:formatNumber value="<%=o.getPrice() - 100000 * o.getQuantity()%>" pattern="###,###"/> VNĐ</td>
                                </tr>

                            </tbody>
                            <% } else {%>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="product-item"><img
                                                src="<%= o.getImageUrl()%>"
                                                alt="">
                                            <div class="product-info"><a class="product-name"
                                                                         href=""><%=o.getCageName()%></a>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="price "><fmt:formatNumber value="<%=o.getPrice()%>" pattern="###,###"/> VNĐ</td>
                                    <td class="quantity"><%=o.getQuantity()%></td>
                                    <td class="discount-amount">0 VNĐ</td>
                                    <td class="raw-total"><fmt:formatNumber value="<%=o.getPrice() * o.getQuantity()%>" pattern="###,###"/> VNĐ</td>
                                </tr>

                            </tbody>
                            <%    }
                                }%>


                            <% for (Order o : listOrder) {
                            %>
                            <tfoot>
                                <% for (OrderDetail d : ls) {
                                        if (d.getCageName().equals("Lồng yêu cầu")) {
                                %>
                                <tr>
                                    <td colspan="4"><span>Thành tiền</span></td>
                                    <td><fmt:formatNumber value="<%=d.getPrice() - 100000 * d.getQuantity()%>" pattern="###,###"/> VNĐ</td>
                                </tr>
                                <% } else {%>
                                <tr>
                                    <td colspan="4"><span>Thành tiền</span></td>
                                    <td><fmt:formatNumber value="<%=d.getPrice() * d.getQuantity()%>" pattern="###,###"/> VNĐ</td>
                                </tr>
                                <% }
                                    }%>
                                <tr>
                                    <td colspan="4"><span>Phí khác</span></td>
                                    <td><fmt:formatNumber value="<%=o.getShipCost()%>" pattern="###,###"/> VNĐ</td>
                                </tr>

                                <tr>
                                    <td colspan="4"><span>Tổng cộng</span></td>
                                    <td><span class="sum"><fmt:formatNumber value="<%=o.getTotal()%>" pattern="###,###"/> VNĐ</span></td>
                                </tr>

                            </tfoot>
                            <% } %>
                        </table></br>

                    </div>
                    <div class="container">
                        <% for (OrderDetail o : ls) {
                                if (o.getCageName().equals("Lồng yêu cầu")) {
                        %>
                        <% List<CageMaterial> lm = (List<CageMaterial>) request.getAttribute("lm"); %>
                        <div class="mat-tab">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center">Tên nguyên liệu</th>
                                        <th class="text-center">Số lượng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (CageMaterial cm : lm) {
                                    %>
                                    <tr>
                                        <td class="text-center"><%=cm.getMaterialName()%></td>
                                        <td class="text-center"><%=cm.getQuantity()%></td>
                                    </tr>
                                    <% }%>
                                </tbody>
                            </table>
                        </div>
                        <% }
                            }%>
                    </div>

                </main> 
            </div>
        </div>
    </body>
</html>
