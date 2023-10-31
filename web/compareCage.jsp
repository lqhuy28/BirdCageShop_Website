<%-- 
    Document   : compareCage
    Created on : Oct 28, 2023, 2:31:51 AM
    Author     : QUANG HUY
--%>

<%@page import="java.util.List"%>
<%@page import="model.CageMaterial"%>
<%@page import="model.ProductDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="static/css/compareCage.css">
        <title>So sánh sản phẩm</title>
    </head>
    <body>
        <%
            ProductDTO product1 = (ProductDTO) request.getAttribute("product1");
            ProductDTO product2 = (ProductDTO) request.getAttribute("product2");
            List<CageMaterial> cm1 = (List<CageMaterial>) request.getAttribute("cageMaterial1");
            List<CageMaterial> cm2 = (List<CageMaterial>) request.getAttribute("cageMaterial2");
        %>
        <h2>So sánh lồng chim</h2>
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <div class="pro-img-details">
                        <img src="<%=product1.getImage()%>" alt="" style="width: 30%;">
                    </div>
                    <h4 class="pro-d-title">
                        <strong><%=product1.getCageName()%></strong>
                    </h4>
                    <!-- Hiển thị thông tin sản phẩm -->
                    <div class="rate-container">
                        <div class="rate-avg">
                            3.9
                        </div>
                        <div class="star-rating">
                            <span>★★★★☆</span>
                        </div>
                        <div>
                            20 đánh giá
                        </div>
                    </div>
                    <div class="m-bot15 detail-price mt-3 ">
                        <span class="amount-old"><%=product1.getPriceOld()%> VNĐ</span>  
                        <span class="pro-price"><%=product1.getPriceNew()%> VNĐ</span>
                    </div> 
                    <p class="mt-2">
                        <strong>Mô tả sản phẩm: </strong>
                    <div><%=product1.getCageDetails()%></div>
                    </p>
                    <h4>Nguyên liệu lồng chim</h4>
                    <!-- Hiển thị nguyên liệu lồng chim từ cageMaterial1 -->
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Nguyên liệu</th>
                                <th>Số lượng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (CageMaterial c : cm1) {
                            %>
                            <tr>
                                <td class="text-center text-lg text-medium"><%=c.getMaterialName()%></td>
                                <td class="text-center text-lg text-medium"><%=c.getQuantity()%></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>

                <div class="col-md-5">
                    <div class="pro-img-details">
                        <img src="<%=product2.getImage()%>" alt="" style="width: 30%;">
                    </div>
                    <h4 class="pro-d-title">
                        <strong><%=product2.getCageName()%></strong>
                    </h4>
                    <!-- Hiển thị thông tin sản phẩm -->
                    <div class="rate-container">
                        <div class="rate-avg">
                            3.9
                        </div>
                        <div class="star-rating">
                            <span>★★★★☆</span>
                        </div>
                        <div>
                            20 đánh giá
                        </div>
                    </div>
                    <div class="m-bot15 detail-price mt-3 ">
                        <span class="amount-old"><%=product2.getPriceOld()%> VNĐ</span>  
                        <span class="pro-price"><%=product2.getPriceNew()%> VNĐ</span>
                    </div> 
                    <p class="mt-2">
                        <strong>Mô tả sản phẩm: </strong>
                    <div><%=product2.getCageDetails()%></div>
                    </p>
                    <h4>Nguyên liệu lồng chim</h4>
                    <!-- Hiển thị nguyên liệu lồng chim từ cageMaterial1 -->
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Nguyên liệu</th>
                                <th>Số lượng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (CageMaterial c : cm2) {
                            %>
                            <tr>
                                <td class="text-center text-lg text-medium"><%=c.getMaterialName()%></td>
                                <td class="text-center text-lg text-medium"><%=c.getQuantity()%></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <form action="MainController" method="GET">
            <input type="submit" value="Homepage" />
        </form>
    </body>
</html>
