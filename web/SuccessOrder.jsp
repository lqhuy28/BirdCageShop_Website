<%-- 
    Document   : Show
    Created on : Sep 21, 2023, 5:45:14 PM
    Author     : Acer
--%>

<%@page import="dao.ProductDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="model.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> <title>JSP Page</title>
    </head>

    <body style="background-color: #D1F2EB;">
        <div style="max-width: 600px;
             margin: 0 auto;
             text-align: center;
             padding: 20px;">
            <h1 style="font-size: 36px;">Đặt hàng thành công!</h1>

            <p style="font-size: 18px;">
                Cảm ơn quý khách đã đặt hàng! <br>
                Đơn hàng của quý khách sẽ được chúng tôi xử lý trong thời gian sớm nhất.
            </p>
            <form action="MainController" method="GET">
                <input type="submit" value="Homepage" />
            </form>
        </div>
    </body>
</html>
