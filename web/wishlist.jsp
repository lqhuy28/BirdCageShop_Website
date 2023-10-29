<%-- 
    Document   : wishlist
    Created on : Sep 24, 2023, 5:33:51 PM
    Author     : QUANG HUY
--%>

<%@page import="model.Wishlist"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sản phẩm yêu thích</title>
        <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css">
        <!-- font awesome cnd link -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <!-- css link -->
        <link rel="stylesheet" href="static/css/wishlist.css">
        <link rel="stylesheet" href="static/css/root.css">

    </head>
    <body class="fade-in">
        <jsp:include page="header.jsp"/>

        <div>
            <%
                List<Wishlist> wishlist = (List<Wishlist>) session.getAttribute("wishlist");
            %>
            <div class="container mt-3">
                <h2>Danh sách yêu thích </h2>
                <% if (wishlist == null) { %>
                <div class="cart__container">
                    Danh sách yêu thích trống
                </div>
                <% } %>
            </div>
            <% if (wishlist != null) { %>
            <div class="padding-bottom-3x my-3 container cart__container" >
                <!-- Shopping Cart-->
                <div class="table-responsive shopping-cart">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Sản phẩm</th>
                                <th class="text-center">Đơn giá</th>
                                <th class="text-center">Tình trạng </th>
                                <th class="text-center">Chức năng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (wishlist != null) {
                                    for (Wishlist w : wishlist) {
                            %>
                            <tr>
                                <td>
                                    <div class="product-item">
                                        <a class="product-thumb" href="#"><img src="<%= w.getImage()%>" alt="Product"></a>
                                        <div class="product-info">
                                            <h4 class="product-title"><a href="#"><%= w.getCageName()%></a></h4><span><em>Mã: </em><%= w.getCageId()%></span>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-center text-lg text-medium"><%=w.getPrice()%></td>
                                <td class="text-center text-lg text-medium"><span>Còn hàng</span></td>
                                <td class="text-center">
                                    <a class="remove-from-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                </td>                            
                            </tr>
                            <% }
                                    }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <% }%>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
