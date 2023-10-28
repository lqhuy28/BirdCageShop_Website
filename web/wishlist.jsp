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
        <link rel="stylesheet" href="static/css/wishlist.css">
        <link rel="stylesheet" href="static/css/root.css">

    </head>
    <body class="fade-in">
        <div class="cart-wrap">
            <div class="container">
                <div class="row">
                    <div>
                        <%
                            List<Wishlist> wishlist = (List<Wishlist>) session.getAttribute("wishlist");
                        %>
                        <div>Danh sách yêu thích</div>
                        <div>
                            <table border="1">
                                <thead>
                                    <tr>
                                        <th>Tên sản phẩm</th>
                                        <th>Giá</th>
                                        <th>Tình trạng hàng</th>
                                        <th>Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% if (wishlist != null) {
                                            for (Wishlist w : wishlist) {
                                    %>
                                    <tr>
                                        <td>
                                            <div>
                                                <a>
                                                    <div>
                                                        <img src="<%=w.getImage()%>" style="width: 20%" alt="">
                                                    </div>
                                                    <div>
                                                        <%=w.getCageName()%>
                                                    </div>
                                                </a>
                                            </div>
                                        </td>
                                        <td><%=w.getPrice()%></td>
                                        <td><span>Còn hàng</span></td>
                                        <td><a href="#">Thêm vào giỏ hàng</a></td>
                                    </tr>
                                    <% }
                                        }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
