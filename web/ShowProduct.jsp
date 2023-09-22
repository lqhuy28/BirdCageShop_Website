<%-- 
    Document   : Show
    Created on : Sep 21, 2023, 5:45:14 PM
    Author     : Acer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="model.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
        </head>
        <body>
            
            <c:set var="listS" value="${requestScope.listS}" />
                        <c:if test="${not empty listS}">
            <table border="1px solid black">
                <tr>
                    <th>ProductID</th>
                    <th>ProductName</th>
                    <th>ProductDetails</th>
                    <th>ProductPrice</th>
                    <th>ProductImage</th>
                    <th>Quantity</th>
                    <th>ProductStatus</th>
                    
                    
                </tr>
            <c:forEach items="${listS}" var="x">
                <tr>
                    <td>${x.productID}</td>
                    <td>${x.productName}</td>
                    <td>${x.productDetails}</td>
                    <td>${x.productPrice}</td>
                    <td>${x.productImage}</td>
                    <td>${x.quantity}</td>
                    <td>${x.productStatus}</td>
                    
                    
                    <td>
                        <a href="update?sid=${x.productID}">update</a>
                        <a href="#" onclick="showMess(${x.productID})">delete</a>
                    </td>
                </tr>
            </c:forEach>

        </table>
                        </c:if>
            <a href="AddProduct.jsp">Create ProductDTO</a>    
    </body>
    <script>
        function showMess(id){
            var option = confirm('Are you sure to delete');
            if(option === true){
                window.location.href = 'delete?sid='+id;
            }
        }
    </script>
</html>
