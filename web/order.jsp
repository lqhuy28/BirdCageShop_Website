<%-- 
    Document   : order
    Created on : Oct 18, 2023, 2:10:07 AM
    Author     : HOANGDUC
--%>

<%@page import="java.util.List"%>
<%@page import="model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css">
        <!-- font awesome cnd link -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="static/css/order.css"/>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <% List<Order> listOrder = (List<Order>) request.getAttribute("listOrder"); %>
        <h2>Đơn hàng của bạn</h2>
        <div class="container padding-bottom-3x mb-1">
            <!-- Shopping Cart-->
            <div class="table-responsive shopping-cart">
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
                            <th class="text-center">Chi tiết 2</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Order o : listOrder) {
                        %>
                        <tr>
                            <td class="text-center text-lg text-medium"><%=o.getOrderID()%></td>
                            <td class="text-center text-lg text-medium"><%=o.getOrderDate()%></td>   
                            <td class="text-center text-lg text-medium"><%=o.getPhone()%></td>
                            <td class="text-center text-lg text-medium"><%=o.getAddress()%></td>
                            <td class="text-center text-lg text-medium"><%=o.getShipCost()%></td>
                            <td class="text-center text-lg text-medium"><%=o.getTotal()%></td>
                            <td class="text-center text-lg text-medium"><%=o.isStatus() ? "Đã thanh toán" : "Chưa thanh toán"%></td>
                            <td class="text-center text-lg text-medium"><a href="DetailOrder?orderId=<%=o.getOrderID()%>"><i class="fa-solid fa-eye" style="color: red;"></i></a></td>
                            <td class="text-center text-lg text-medium"><a href="OrderController?orderId=<%=o.getOrderID()%>">Hủy Đơn Hàng</a></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>