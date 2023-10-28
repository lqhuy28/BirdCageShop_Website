<%-- 
    Document   : order
    Created on : Oct 18, 2023, 2:10:07 AM
    Author     : HOANGDUC
--%>

<%@page import="model.CageMaterial"%>
<%@page import="model.OrderDetail"%>
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
    <style>
        .mat-tab-title h5 {
            font-weight: bold;
            padding-bottom: 10px;
        }
        .mat-tab thead {
            background-color: #f5f5f5;
        }
    </style>
    <body>
        <jsp:include page="header.jsp" />
        <% List<OrderDetail> ls = (List<OrderDetail>) request.getAttribute("ls"); %>
        <h2>Đơn hàng của bạn</h2>
        <div class="container padding-bottom-3x mb-1">
            <!-- Shopping Cart-->
            <div class="table-responsive shopping-cart">
                <table class="table">
                    <thead>
                        <tr>
                            <th class="text-center">Item</th>
                            <th class="text-center">Cage Name</th>
                            <th class="text-center">Quantity</th>
                            <th class="text-center">Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (OrderDetail o : ls) {
                        %>
                        <tr>
                            <td class="text-center text-lg text-medium"><img src="<%= o.getImageUrl()%>" alt="Product"></td>
                            <td class="text-center text-lg text-medium"><%=o.getCageName()%></td>
                            <td class="text-center text-lg text-medium"><%=o.getQuantity()%></td>
                            <td class="text-center text-lg text-medium"><%=o.getPrice()%></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
            <% for (OrderDetail o : ls) {
                if(o.getCageName().equals("Lồng yêu cầu")){
            %>
            <% List<CageMaterial> lm = (List<CageMaterial>) request.getAttribute("lm"); %>
            <div class="mat-tab">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Tên nguyên liệu</th>
                            <th>Số lượng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (CageMaterial cm : lm) {
                        %>
                        <tr>
                            <td><%=cm.getMaterialName()%></td>
                            <td><%=cm.getQuantity()%></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
            <% } } %>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>