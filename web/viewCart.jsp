<%-- 
    Document   : viewCart
    Created on : Sep 27, 2023, 12:11:32 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Cart"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
    </head>
    <body>
        <table class="table">
                                <thead>
                                    <tr>
                                        <th>ProductID</th>
                                        <th>ProductName</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        List<Cart> cart = (List<Cart>)session.getAttribute("cart");
                                        for(Cart item: cart){  
                                    %>
                                    <tr>
                                        <td><%= item.getProductID()  %></td>
                                        <td><%= item.getProductName() %></td>
                                        <td><%= item.getPrice() %></td>
                                        <td><%= item.getQuantity() %></td>
                                        <td><%= (item.getPrice() * item.getQuantity()) %></td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                                
    </body>
</html>
